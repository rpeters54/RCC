package ast.expr;

import ast.declarations.DeclarationSpecifier;
import semantics.TypeEnvironment;

public class AssignmentExpression implements Expression {
    private final int lineNum;
    private final Expression left;
    private final Expression right;


    public AssignmentExpression(int lineNum, Expression left, Expression right) {
        this.lineNum = lineNum;
        this.left = left;
        this.right = right;
    }


    @Override
    public DeclarationSpecifier verifySemantics(TypeEnvironment globalEnv, TypeEnvironment localEnv) {
        DeclarationSpecifier leftDecl = left.verifySemantics(globalEnv, localEnv);
        DeclarationSpecifier rightDecl = right.verifySemantics(globalEnv, localEnv);

        if (leftDecl.getQualifier() == DeclarationSpecifier.TypeQualifier.CONST) {
            throw new RuntimeException("AssignmentExpression::verifySemantics: can't assign to a constant");
        }

        // test to see if the types being operated on are compatible
        // (if they aren't, promoteType will throw an error
        BinaryExpression.promoteType(leftDecl.getType(), rightDecl.getType());

        return leftDecl;
    }
}
