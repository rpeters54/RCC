package ast.declarations;

import ast.statements.Statement;
import semantics.TypeEnvironment;

import java.util.List;

public class FunctionDefinition implements ExternalDeclaration {
    private Declaration declaration;
    private Statement body;
    private TypeEnvironment localEnv;

    public FunctionDefinition(Declaration declaration, Statement body) {
        this.declaration = declaration;
        this.body = body;
        this.localEnv = new TypeEnvironment();
    }

    public Declaration getDeclaration() {
        return declaration;
    }

    public Statement getBody() {
        return body;
    }

    public TypeEnvironment getLocalEnv() {
        return localEnv;
    }
}
