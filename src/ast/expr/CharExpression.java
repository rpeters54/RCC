package ast.expr;

public class CharExpression implements Expression{
    private final int lineNum;
    private final char id;

    public CharExpression(int lineNum, char id)
    {
        this.lineNum = lineNum;
        this.id = id;
    }
}