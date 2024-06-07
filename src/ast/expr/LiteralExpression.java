package ast.expr;

import ast.declarations.DeclarationSpecifier;
import ast.types.IntegerType;
import ast.types.PointerType;
import semantics.TypeEnvironment;

public class LiteralExpression implements Expression{
    private final int lineNum;
    private final String id;

    public LiteralExpression(int lineNum, String id)
    {
        this.lineNum = lineNum;
        this.id = id;
    }

    @Override
    public DeclarationSpecifier verifySemantics(TypeEnvironment globalEnv, TypeEnvironment localEnv) {
        return new DeclarationSpecifier(new PointerType(new IntegerType(null, 8, true)),
                DeclarationSpecifier.StorageClass.NONE, DeclarationSpecifier.TypeQualifier.NONE);
    }
}