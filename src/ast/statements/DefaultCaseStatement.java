package ast.statements;


import ast.declarations.DeclarationSpecifier;
import ast.declarations.FunctionDefinition;
import semantics.TypeEnvironment;

public class DefaultCaseStatement implements Statement {

    private int lineNum;
    private Statement body;

    public DefaultCaseStatement(int lineNum, Statement body) {
        this.lineNum = lineNum;
        this.body = body;
    }

    @Override
    public DeclarationSpecifier verifySemantics(TypeEnvironment globalEnv, TypeEnvironment localEnv, FunctionDefinition function) {
        return body.verifySemantics(globalEnv, localEnv, function);
    }

    @Override
    public boolean alwaysReturns() {
        return false;
    }
}
