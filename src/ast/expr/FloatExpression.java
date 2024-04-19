package ast.expr;

public class FloatExpression implements Expression {
    private final int lineNum;
    private final String value;

    public FloatExpression(int lineNum, String value) {
        this.lineNum = lineNum;
        this.value = value;
    }
}