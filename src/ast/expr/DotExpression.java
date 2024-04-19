package ast.expr;

public class DotExpression implements Expression {
    private final int lineNum;
    private final Expression operand;
    private final String member;

    public DotExpression(int lineNum, Expression operand, String member) {
        this.lineNum = lineNum;
        this.operand = operand;
        this.member = member;
    }
}
