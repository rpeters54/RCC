package ast.expr;

public class AssignmentExpression implements Expression {
    private final int lineNum;
    private final Expression left;
    private final Expression right;

    public AssignmentExpression(int lineNum, Expression left,
                             Expression right) {
        this.lineNum = lineNum;
        this.left = left;
        this.right = right;
    }
}
