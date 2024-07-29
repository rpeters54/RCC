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

    public Type getReturnType() {
        return ((FunctionType) declaration.getDeclSpec().getType()).getReturnType().clone();
    }

    public List<Pair<String, Type>> getParameters() {
        assert declaration.getDeclSpec().getType() instanceof FunctionType;
        FunctionType functionType = (FunctionType) declaration.getDeclSpec().getType();
        List<Pair<String, Type>> parameters = new ArrayList<>();
        for (Declaration param : functionType.getInputTypes()) {
            parameters.add(new Pair<>(param.getName(), param.getDeclSpec().getType().clone()));
        }
        return parameters;
    }

    @Override
    public String toString() {
        return "FunctionDefinition{" +
                "declaration=" + declaration +
                ", body=" + body +
                ", localEnv=" + localEnv +
                '}';
    }


}
