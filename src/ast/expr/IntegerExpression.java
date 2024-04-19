package ast.expr;

public class IntegerExpression implements Expression {
    private final int lineNum;
    private final String value;

    public IntegerExpression(int lineNum, String value) {
        this.lineNum = lineNum;
        this.value = value;
    }
}
