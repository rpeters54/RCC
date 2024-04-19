package ast.expr;

import ast.types.Type;

public class SizeofExprExpression implements Expression {
    private final Expression operand;

    public SizeofExprExpression(Expression operand) {
        this.operand = operand;
    }
}