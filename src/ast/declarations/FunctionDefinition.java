package ast.declarations;

import ast.statements.Statement;
import ast.TypeEnvironment;
import ast.types.FunctionType;
import ast.types.Type;
import org.antlr.v4.runtime.misc.Pair;

import java.util.ArrayList;
import java.util.List;

public class FunctionDefinition implements ExternalDeclaration {
    private final Declaration declaration;
    private final Statement body;
    private final TypeEnvironment localEnv;

    /**
     * AST node that represents a C Function Definition
     * Note: most of the important information (return type/input types)
     * is contained in the declaration field
     * @param declaration The function declaration that defines the functions' signature
     * @param body The body of the function, containing the statements that would execute if run
     */
    public FunctionDefinition(Declaration declaration, Statement body) {
        this.declaration = declaration;
        this.body = body;
        this.localEnv = new TypeEnvironment();
    }

    public Declaration declaration() {
        return declaration;
    }

    public Statement body() {
        return body;
    }

    public TypeEnvironment localEnv() {
        return localEnv;
    }

    public Type returnType() {
        return ((FunctionType) declaration.declSpec().getType()).returnType();
    }

    public void setType(FunctionType type) {
        declaration.declSpec().setType(type);
    }

    public void setDeclSpec(DeclarationSpecifier declSpec) {
        declaration.setDeclSpec(declSpec);
    }

    public List<Declaration> parameters() {
        assert declaration.declSpec().getType() instanceof FunctionType;
        FunctionType functionType = (FunctionType) declaration.declSpec().getType();
        return functionType.inputTypes();
    }

    @Override
    public String toString() {
        FunctionType functionType = (FunctionType) declaration.declSpec().getType();
        StringBuilder result = new StringBuilder("FunctionDefinition{\n"
                + "    declaration=" + declaration + ",\n"
                + "    body=" + body + ",\n"
                + "    localEnv=" + localEnv + ",\n");
        for (Declaration decl : functionType.inputTypes()) {
            result.append(decl).append("\n");
        };
        result.append("}");
        return result.toString();
    }


}
