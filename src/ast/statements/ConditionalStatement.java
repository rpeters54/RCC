package ast.statements;

import ast.declarations.DeclarationSpecifier;
import ast.declarations.FunctionDefinition;
import ast.expr.Expression;
import ast.types.PrimitiveType;
import codegen.BasicBlock;
import ast.TypeEnvironment;
import codegen.ControlFlowGraph;
import codegen.TranslationUnit;
import codegen.instruction.llvm.ConditionalBranchInstruction;
import codegen.instruction.llvm.PhiInstruction;
import codegen.instruction.llvm.UnconditionalBranchInstruction;
import codegen.values.Source;

import java.util.List;

public class ConditionalStatement implements Statement {
    private final int lineNum;
    private final List<Expression> guardList;
    private final Statement thenCase;
    private final Statement elseCase;

    public ConditionalStatement(int lineNum, List<Expression> guardList, Statement thenCase, Statement elseCase) {
        this.lineNum = lineNum;
        this.guardList = guardList;
        this.thenCase = thenCase;
        this.elseCase = elseCase;
    }

    @Override
    public DeclarationSpecifier verifySemantics(TypeEnvironment globalEnv, TypeEnvironment localEnv, FunctionDefinition function) {
        DeclarationSpecifier specifier = new DeclarationSpecifier();
        for (Expression guard : guardList) {
            specifier = guard.verifySemantics(globalEnv, localEnv);
        }
        if (!(specifier.getType() instanceof PrimitiveType))
            throw new RuntimeException("ConditionalStatement::verifySemantics: Final expression in guardList is not a valid type");

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
    public BasicBlock codegen(TranslationUnit unit, ControlFlowGraph cfg, BasicBlock block) {
        // construct all blocks
        BasicBlock thenBlock = new BasicBlock();
        BasicBlock elseBlock = new BasicBlock();

        // add all blocks to the cfg
        cfg.addBlock(thenBlock);
        cfg.addBlock(elseBlock);


        // add all edges between the blocks
        cfg.addEdge(block, thenBlock);
        cfg.addEdge(block, elseBlock);

        // generate code for all guards
        List<Source> guards = guardList.stream()
                .map(guard -> guard.codegen(unit, cfg, block))
                .toList();

        // add conditional branch instruction
        block.addInstruction(new ConditionalBranchInstruction(
                guards.getFirst(),
                thenBlock.getLabel(),
                elseBlock.getLabel()
        ));

        // traverse the branches
        BasicBlock endOfThenBlock = thenCase.codegen(unit, cfg, thenBlock);
        BasicBlock endOfElseBlock;
        if (elseCase != null) {
            endOfElseBlock = elseCase.codegen(unit, cfg, elseBlock);
        } else {
            endOfElseBlock = elseBlock;
        }

        if (!endOfThenBlock.endsWithJump() || !endOfElseBlock.endsWithJump()) {
            // build the after if statement block
            BasicBlock afterBlock = new BasicBlock();
            cfg.addBlock(afterBlock);
            cfg.addEdge(endOfThenBlock, afterBlock);
            cfg.addEdge(endOfElseBlock, afterBlock);

            if (!endOfThenBlock.endsWithJump())
                endOfThenBlock.addInstruction(new UnconditionalBranchInstruction(afterBlock.getLabel()));
            if (!endOfElseBlock.endsWithJump())
                endOfElseBlock.addInstruction(new UnconditionalBranchInstruction(afterBlock.getLabel()));

            // add phi instructions
            cfg.generatePhis(afterBlock);

            return afterBlock;
        }

        return endOfThenBlock;
    }
}
