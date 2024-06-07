package ast.statements;

import ast.declarations.DeclarationSpecifier;
import ast.declarations.FunctionDefinition;
import semantics.TypeEnvironment;

public class BreakStatement implements Statement {
    private int lineNum;

    public BreakStatement(int lineNum) {
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

