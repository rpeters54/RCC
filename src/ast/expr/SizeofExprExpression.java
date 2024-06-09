package ast.expr;

import ast.declarations.DeclarationSpecifier;
import ast.types.IntegerType;
import codegen.BasicBlock;
import codegen.values.Source;
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

    @Override
    public Source codegen(BasicBlock block, TypeEnvironment globalEnv, TypeEnvironment localEnv) {
        throw new RuntimeException("Not Implemented");
    }
}