package ast.declarations;

import ast.statements.Statement;

import java.util.List;

public class FunctionDefinition implements ExternalDeclaration {
    private Declaration declaration;
    private Statement body;

    public FunctionDefinition(Declaration declaration, Statement body) {
        this.declaration = declaration;
        this.body = body;
    }

    public Declaration getDeclaration() {
        return declaration;
    }

    public Statement getBody() {
        return body;
    }
}
