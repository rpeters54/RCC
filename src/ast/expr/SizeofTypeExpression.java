package ast.expr;

import ast.types.Type;

public class SizeofTypeExpression implements Expression {
    private final Type type;

    public SizeofTypeExpression(Type type) {
        this.type = type;
    }
}
