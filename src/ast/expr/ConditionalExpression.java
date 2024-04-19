package ast.expr;

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
}
