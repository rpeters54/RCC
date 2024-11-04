package ast.statements;

import ast.declarations.DeclarationSpecifier;
import ast.declarations.FunctionDefinition;
import codegen.BasicBlock;
import ast.TypeEnvironment;
import codegen.ControlFlowGraph;
import codegen.EscapeTuple;
import codegen.TranslationUnit;
import codegen.instruction.llvm.UnconditionalBranchInstruction;

public class BreakStatement extends Statement {

    public BreakStatement(int lineNum) {
        super(lineNum);
    }

    @Override
    public DeclarationSpecifier verifySemantics(TypeEnvironment globalEnv, TypeEnvironment localEnv, FunctionDefinition function) {
        return new DeclarationSpecifier();
    }

    @Override
    public boolean alwaysReturns() {
        return false;
    }

    @Override
    public BasicBlock codegen(TranslationUnit unit, ControlFlowGraph cfg, BasicBlock block, EscapeTuple esc) {
        if (esc.breakPresent()) {
            UnconditionalBranchInstruction toBreak = new UnconditionalBranchInstruction(esc.breakBlock().getLabel());
            block.addInstruction(toBreak);
            cfg.addEdge(block, esc.breakBlock());
            return block;
        } else {
            throw new RuntimeException("ContinueStatement::codegen: continue statement can't be present outside a loop");
        }
    }
}

