package ast.statements;

import ast.declarations.DeclarationSpecifier;
import ast.declarations.FunctionDefinition;
import ast.expr.BinaryExpression;
import ast.expr.Expression;
import ast.types.IntegerType;
import ast.types.PrimitiveType;
import codegen.BasicBlock;
import ast.TypeEnvironment;
import codegen.ControlFlowGraph;
import codegen.EscapeTuple;
import codegen.TranslationUnit;
import codegen.instruction.llvm.ComparatorLLVM;
import codegen.instruction.llvm.ConditionalBranchLLVM;
import codegen.instruction.llvm.UnconditionalBranchLLVM;
import codegen.values.Literal;
import codegen.values.Register;
import codegen.values.Source;

import java.util.List;

public class ConditionalStatement extends Statement {
    private final List<Expression> guardList;
    private final Statement thenCase;
    private final Statement elseCase;

    public ConditionalStatement(int lineNum, List<Expression> guardList, Statement thenCase, Statement elseCase) {
        super(lineNum);
        this.guardList = guardList;
        this.thenCase = thenCase;
        this.elseCase = elseCase;
    }

    @Override
    public DeclarationSpecifier verifySemantics(TypeEnvironment globalEnv, TypeEnvironment localEnv, FunctionDefinition function) {
        DeclarationSpecifier specifier = new DeclarationSpecifier();
        for (Expression guard : guardList) {
            specifier = guard.verifySemantics(globalEnv, localEnv, TypeEnvironment.StorageLocation.REGISTER);
        }
        if (!(specifier.getType() instanceof PrimitiveType))
            throw new RuntimeException(String.format(
                    "ConditionalStatement::verifySemantics: On line %d, Final expression in guardList is not a valid type", lineNum()
            ));

        specifier = thenCase.verifySemantics(globalEnv, localEnv, function);
        if (elseCase != null)
            specifier = elseCase.verifySemantics(globalEnv, localEnv, function);
        return specifier;
    }

    @Override
    public boolean alwaysReturns() {
        boolean thenReturn = thenCase.alwaysReturns();
        if (elseCase == null) {
            return thenReturn;
        } else {
            boolean elseReturn = elseCase.alwaysReturns();
            return thenReturn && elseReturn;
        }
    }

    @Override
    public BasicBlock codegen(TranslationUnit unit, ControlFlowGraph cfg, BasicBlock block, EscapeTuple esc) {
        // construct all blocks
        BasicBlock thenBlock = new BasicBlock(block);
        BasicBlock elseBlock = new BasicBlock(block);

        // add all blocks to the cfg
        cfg.addBlock(thenBlock);
        cfg.addBlock(elseBlock);


        // add all edges between the blocks
        cfg.addEdge(block, thenBlock);
        cfg.addEdge(block, elseBlock);

        // generate code for all guards
        List<Register> guards = guardList.stream()
                .map(guard -> guard.codegen(unit, cfg, block))
                .toList();

        Register zero = Literal.nill(guards.getLast().type(), unit, cfg, block);
        Register result = Register.LLVM_Register(new IntegerType(IntegerType.Width.BOOL, true));
        ComparatorLLVM comp = new ComparatorLLVM(result.clone(), BinaryExpression.Operator.NE,
                guards.getLast(), zero);
        block.addInstruction(comp);

        // add conditional branch instruction
        block.addInstruction(new ConditionalBranchLLVM(
                result,
                thenBlock.getLabel(),
                elseBlock.getLabel()
        ));

        // traverse the branches
        BasicBlock endOfThenBlock = thenCase.codegen(unit, cfg, thenBlock, esc);
        BasicBlock endOfElseBlock;
        if (elseCase != null) {
            endOfElseBlock = elseCase.codegen(unit, cfg, elseBlock, esc);
        } else {
            endOfElseBlock = elseBlock;
        }

        if (!endOfThenBlock.endsWithJump() && !endOfElseBlock.endsWithJump()) {
            // build the after if statement block
            BasicBlock afterBlock = new BasicBlock();
            cfg.addBlock(afterBlock);
            cfg.addEdge(endOfThenBlock, afterBlock);
            cfg.addEdge(endOfElseBlock, afterBlock);

            endOfThenBlock.addInstruction(new UnconditionalBranchLLVM(afterBlock.getLabel()));
            endOfElseBlock.addInstruction(new UnconditionalBranchLLVM(afterBlock.getLabel()));

            // add phi instructions
            cfg.generatePhis(afterBlock);

            return afterBlock;
        } else if (!endOfThenBlock.endsWithJump() && endOfElseBlock.endsWithJump()) {
            BasicBlock afterBlock = new BasicBlock(endOfThenBlock);
            cfg.addBlock(afterBlock);

            cfg.addEdge(endOfThenBlock, afterBlock);
            endOfThenBlock.addInstruction(new UnconditionalBranchLLVM(afterBlock.getLabel()));

            return afterBlock;
        } else if (endOfThenBlock.endsWithJump() && !endOfElseBlock.endsWithJump()) {
            BasicBlock afterBlock = new BasicBlock(endOfElseBlock);
            cfg.addBlock(afterBlock);

            cfg.addEdge(endOfElseBlock, afterBlock);
            endOfElseBlock.addInstruction(new UnconditionalBranchLLVM(afterBlock.getLabel()));

            return afterBlock;
        } else {
            return endOfThenBlock;
        }
    }
}
