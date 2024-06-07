package ast.expr;

import ast.declarations.DeclarationSpecifier;
import ast.types.IntegerType;
import ast.types.Type;
import semantics.TypeEnvironment;

public class SizeofExprExpression implements Expression {
    private final Expression operand;

    public SizeofExprExpression(Expression operand) {
        this.operand = operand;
    }

    @Override
    public DeclarationSpecifier verifySemantics(TypeEnvironment globalEnv, TypeEnvironment localEnv) {
        operand.verifySemantics(globalEnv, localEnv);
        return new DeclarationSpecifier(new IntegerType(),
                DeclarationSpecifier.StorageClass.NONE,
                DeclarationSpecifier.TypeQualifier.NONE);
    }
}