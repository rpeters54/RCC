package ast.expr;

import ast.declarations.DeclarationSpecifier;
import ast.types.DefinedType;
import ast.types.Type;
import semantics.TypeEnvironment;

public class IdentifierExpression implements Expression{
    private final int lineNum;
    private final String id;

    public IdentifierExpression(int lineNum, String id)
    {
        this.lineNum = lineNum;
        this.id = id;
    }

    @Override
    public DeclarationSpecifier verifySemantics(TypeEnvironment globalEnv, TypeEnvironment localEnv) {
        DeclarationSpecifier defn = localEnv.getVariable(id);
        if (defn == null)
            defn = globalEnv.getVariable(id);
        if (defn == null)
            throw new RuntimeException("IdentifierExpression::verifySemantics: '" + id + "' not included in local " +
                    "or global environment");
        return defn;
    }
}
