package ast.expr;

import ast.declarations.DeclarationSpecifier;
import ast.types.IntegerType;
import ast.types.Type;
import semantics.TypeEnvironment;

public class SizeofTypeExpression implements Expression {
    private final Type type;

    public SizeofTypeExpression(Type type) {
        this.type = type;
    }


    @Override
    public DeclarationSpecifier verifySemantics(TypeEnvironment globalEnv, TypeEnvironment localEnv) {
        return new DeclarationSpecifier(new IntegerType(),
                DeclarationSpecifier.StorageClass.NONE,
                DeclarationSpecifier.TypeQualifier.NONE);
    }
}
