package ast.expr;

import ast.declarations.DeclarationSpecifier;
import ast.types.Type;
import codegen.BasicBlock;
import codegen.values.Source;
import semantics.TypeEnvironment;

public class CastExpression implements Expression {

    private Type type;
    private Expression casted;

    public CastExpression(Type type, Expression casted) {
        this.type = type;
        this.casted = casted;
    }


    @Override
    public DeclarationSpecifier verifySemantics(TypeEnvironment globalEnv, TypeEnvironment localEnv) {
        casted.verifySemantics(globalEnv, localEnv);
        return new DeclarationSpecifier(type,
                DeclarationSpecifier.StorageClass.NONE,
                DeclarationSpecifier.TypeQualifier.NONE);
    }

    @Override
    public Source codegen(BasicBlock block, TypeEnvironment globalEnv, TypeEnvironment localEnv) {
        throw new RuntimeException("Not Implemented");
    }
}
