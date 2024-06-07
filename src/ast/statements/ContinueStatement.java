package ast.statements;

import ast.declarations.DeclarationSpecifier;
import ast.declarations.FunctionDefinition;
import semantics.TypeEnvironment;

public class ContinueStatement implements Statement {
    private int lineNum;

    public ContinueStatement(int lineNum) {
        this.lineNum = lineNum;
    }

    @Override
    public DeclarationSpecifier verifySemantics(TypeEnvironment globalEnv, TypeEnvironment localEnv, FunctionDefinition function) {
        return new DeclarationSpecifier();
    }

    @Override
    public boolean alwaysReturns() {
        return false;
    }
}
