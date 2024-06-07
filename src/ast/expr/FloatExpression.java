package ast.expr;

import ast.declarations.DeclarationSpecifier;
import ast.types.FloatingType;
import ast.types.IntegerType;
import semantics.TypeEnvironment;

public class FloatExpression implements Expression {
    private final int lineNum;
    private final String value;

    public FloatExpression(int lineNum, String value) {
        this.lineNum = lineNum;
        this.value = value;
    }

    @Override
    public DeclarationSpecifier verifySemantics(TypeEnvironment globalEnv, TypeEnvironment localEnv) {
        return new DeclarationSpecifier(new FloatingType(value, Float.BYTES*8, true),
                DeclarationSpecifier.StorageClass.NONE, DeclarationSpecifier.TypeQualifier.NONE);
    }
}