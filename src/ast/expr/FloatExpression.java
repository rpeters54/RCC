package ast.expr;

public class FloatingExpression implements Expression {
    private int lineNum;
    private String value;

    public FloatingExpression(int lineNum, String value) {
        this.lineNum = lineNum;
        this.value = value;
    }
}