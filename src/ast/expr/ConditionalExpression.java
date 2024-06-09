package ast.expr;

import ast.declarations.DeclarationSpecifier;
import ast.types.PrimitiveType;
import codegen.BasicBlock;
import codegen.values.Source;
import semantics.TypeEnvironment;

public class ConditionalExpression implements Expression {
    private final int lineNum;
    private final Expression guard;
    private final Expression then;
    private final Expression other;

    public ConditionalExpression(int lineNum, Expression guard,
                                  Expression then, Expression other) {
        this.lineNum = lineNum;
        this.guard = guard;
        this.then = then;
        this.other = other;
    }

    @Override
    public DeclarationSpecifier verifySemantics(TypeEnvironment globalEnv, TypeEnvironment localEnv) {
        DeclarationSpecifier guardSpec = guard.verifySemantics(globalEnv, localEnv);
        DeclarationSpecifier thenSpec = then.verifySemantics(globalEnv, localEnv);
        DeclarationSpecifier otherSpec = other.verifySemantics(globalEnv, localEnv);

        if (!(guardSpec.getType() instanceof PrimitiveType))
            throw new RuntimeException("ConditionalExpression::verifySemantics: guard must be a primitive type");

        DeclarationSpecifier result = new DeclarationSpecifier();
        if (thenSpec.getType() instanceof PrimitiveType || otherSpec.getType() instanceof PrimitiveType) {
            result.setType(BinaryExpression.promoteType(thenSpec.getType(), otherSpec.getType()));
            return result;
        } else if (thenSpec.getType().equals(otherSpec.getType())) {
            return thenSpec;
        } else {
            throw new RuntimeException("ConditionalExpression::verifySemantics: cases have conflicting types");
        }
    }

    @Override
    public Source codegen(BasicBlock block, TypeEnvironment globalEnv, TypeEnvironment localEnv) {
        throw new RuntimeException("Not Implemented");
    }
}
