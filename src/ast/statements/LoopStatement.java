package ast.statements;

import ast.TypeEnvironment;
import ast.declarations.DeclarationSpecifier;
import ast.declarations.FunctionDefinition;
import ast.expr.BinaryExpression;
import ast.expr.Expression;
import ast.types.IntegerType;
import ast.types.PrimitiveType;
import codegen.BasicBlock;
import codegen.ControlFlowGraph;
import codegen.EscapeTuple;
import codegen.TranslationUnit;
import codegen.instruction.llvm.ComparatorInstruction;
import codegen.instruction.llvm.ConditionalBranchInstruction;
import codegen.instruction.llvm.PhiInstruction;
import codegen.instruction.llvm.UnconditionalBranchInstruction;
import codegen.values.Literal;
import codegen.values.Register;
import codegen.values.Source;
import org.antlr.v4.runtime.misc.Pair;

import java.util.*;

public abstract class LoopStatement extends Statement {

    private final List<Expression> guardList;
    private final Statement body;

    public LoopStatement(int lineNum, List<Expression> guardList, Statement body) {
        super(lineNum);
        this.guardList = guardList;
        this.body = body;
    }

    @Override
    public DeclarationSpecifier verifySemantics(TypeEnvironment globalEnv, TypeEnvironment localEnv, FunctionDefinition function) {
        DeclarationSpecifier specifier = new DeclarationSpecifier();
        for (Expression guard : guardList) {
            specifier = guard.verifySemantics(globalEnv, localEnv, TypeEnvironment.StorageLocation.REGISTER);
        }
        if (!(specifier.getType() instanceof PrimitiveType))
            throw new RuntimeException("WhileStatement::verifySemantics: Final expression in guardList is not a valid type");

        return body.verifySemantics(globalEnv, localEnv, function);
    }

    @Override
    public boolean alwaysReturns() {
        return body.alwaysReturns();
    }



    protected BasicBlock generateLoop(TranslationUnit unit, ControlFlowGraph cfg, BasicBlock block,
                                   Optional<List<Expression>> initList, Optional<List<Expression>> stepList,
                                      boolean unconditionalEntrance) {
        // create the interior basic block
        BasicBlock innerBlock = new BasicBlock();
        cfg.addBlock(innerBlock);
        cfg.addEdge(block, innerBlock);

        // generate epilogue block (where continues jump to)
        BasicBlock epilogueBlock = new BasicBlock();
        cfg.addBlockOutOfOrder(epilogueBlock);

        // generate the exit block
        BasicBlock outerBlock = new BasicBlock();
        cfg.addBlockOutOfOrder(outerBlock);

        // track the locations that a continue or break could jump to
        EscapeTuple escapeTuple = new EscapeTuple(outerBlock, epilogueBlock);

        // create a constant 'zero' for comparisons
        Literal zero = new Literal("0", new IntegerType());

        // handle the branch into the loop
        if (unconditionalEntrance) {
            // add an unconditional branch into the inner block (for do-loops)
            UnconditionalBranchInstruction enterBranch = new UnconditionalBranchInstruction(innerBlock.getLabel());
            block.addInstruction(enterBranch);
        } else {
            // only add edge from starting block to outer block if the inner block could be skipped
            cfg.addEdge(block, outerBlock);

            // add any initializations if present (for for-loops)
            initList.ifPresent( list ->
                    list.forEach(exp -> exp.codegen(unit,cfg,block))
            );

            // evaluate the guard expressions
            List<Source> values = guardList.stream()
                    .map(exp -> exp.codegen(unit,cfg,block))
                    .toList();

            // generate the conditional branch into the while loop
            Register enterValue = Register.LLVM_Register(new IntegerType(IntegerType.Width.BOOL, true));
            ComparatorInstruction enterCond = new ComparatorInstruction(enterValue, BinaryExpression.Operator.NE, values.getLast(), zero.clone());
            ConditionalBranchInstruction enterBranch = new ConditionalBranchInstruction(enterValue.clone(), innerBlock.getLabel(), outerBlock.getLabel());

            // add the comparison and conditional branch to the current block
            block.addInstruction(enterCond);
            block.addInstruction(enterBranch);
        }

        // generate temporary phis at the start of the inner and epilogue block
        cfg.generatePhis(innerBlock);

        // keep track of the names bound to each phi
        List<PhiInstruction> emptyPhis = innerBlock.getAllInstructions().stream()
                .filter(inst -> inst instanceof PhiInstruction)
                .map(inst -> (PhiInstruction) inst)
                .toList();

        List<String> names = new ArrayList<>();
        Set<Map.Entry<String, Source>> entries = innerBlock.getBindings().entrySet();

        emptyPhis.forEach(phi -> {
            for (Map.Entry<String, Source> entry : entries) {
                if (phi.result().equals(entry.getValue())){
                    names.add(entry.getKey());
                    break;
                }
            }
        });

        // evaluate the inner block
        BasicBlock endOfInnerBlock = body.codegen(unit, cfg, innerBlock, escapeTuple);

        // generate conditional branch at the end of the innerBlock
        if (!endOfInnerBlock.endsWithJump()) {
            // add connection from end of inner block to the epilogue
            // connect epilogue to the start of the loop and outer block
            cfg.addEdge(endOfInnerBlock, epilogueBlock);
            cfg.addEdge(epilogueBlock, outerBlock);
            cfg.addEdge(epilogueBlock, innerBlock);

            // add the epilogue block empty phis
            cfg.generatePhis(epilogueBlock);

            // add branch from inner to epilogue block
            UnconditionalBranchInstruction innerToEpilogue = new UnconditionalBranchInstruction(epilogueBlock.getLabel());
            endOfInnerBlock.addInstruction(innerToEpilogue);

            // evaluate the step expressions if they exist
            stepList.ifPresent(list ->
                    list.forEach(exp -> exp.codegen(unit,cfg,epilogueBlock))
            );

            // re-evaluate the guard expressions
            List<Source> exitValues = guardList.stream()
                    .map(exp -> exp.codegen(unit,cfg,epilogueBlock))
                    .toList();

            Register exitValue = Register.LLVM_Register(new IntegerType(IntegerType.Width.BOOL, true));
            ComparatorInstruction exitCond = new ComparatorInstruction(exitValue, BinaryExpression.Operator.NE, exitValues.getLast(), zero);
            ConditionalBranchInstruction exitBranch = new ConditionalBranchInstruction(exitValue.clone(), innerBlock.getLabel(), outerBlock.getLabel());

            // add the comparison and conditional branch to the current block
            epilogueBlock.addInstruction(exitCond);
            epilogueBlock.addInstruction(exitBranch);
        } else {
            outerBlock = endOfInnerBlock;
        }

        // add the epilogue and outer block to the topological list
        cfg.addBlockToTopologicalList(epilogueBlock);
        cfg.addBlockToTopologicalList(outerBlock);

        // fill the temporary phis
        for (int i = 0; i < names.size(); i++) {
            String name = names.get(i);
            PhiInstruction phi = emptyPhis.get(i);
            Pair<List<String>, List<Source>> labelSourcePairs = cfg.findPreviousDefinitions(innerBlock, name);
            phi.refresh(labelSourcePairs.a, labelSourcePairs.b);
        }

        // generate phis for the block outside the loop
        cfg.generatePhis(outerBlock);
        return outerBlock;
    }

}
