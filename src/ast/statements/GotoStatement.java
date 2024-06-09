package ast.statements;

import ast.declarations.DeclarationSpecifier;
import ast.declarations.FunctionDefinition;
import codegen.BasicBlock;
import semantics.TypeEnvironment;

import java.util.List;

public class GotoStatement implements Statement {
    private final int lineNum;
    private final String label;

    public GotoStatement(int lineNum, String label) {
        this.lineNum = lineNum;
        this.label = label;
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
    public void codegen(List<BasicBlock> blocks, TypeEnvironment globalEnv, TypeEnvironment localEnv) {
        throw new RuntimeException("Not implemented yet");
    }
}
