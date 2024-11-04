package ast.statements;

import ast.declarations.DeclarationSpecifier;
import ast.declarations.FunctionDefinition;
import codegen.BasicBlock;
import ast.TypeEnvironment;
import codegen.ControlFlowGraph;
import codegen.EscapeTuple;
import codegen.TranslationUnit;
import codegen.instruction.llvm.UnconditionalBranchInstruction;

public class ContinueStatement extends Statement {

    public ContinueStatement(int lineNum) {
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
        if (esc.continuePresent()) {
            UnconditionalBranchInstruction toCont = new UnconditionalBranchInstruction(esc.continueBlock().getLabel());
            block.addInstruction(toCont);
            cfg.addEdge(block, esc.continueBlock());
            return block;
        } else {
            throw new RuntimeException("ContinueStatement::codegen: continue statement can't be present outside a loop");
        }
    }
}
