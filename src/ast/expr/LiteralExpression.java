package ast.expr;

public class LiteralExpression implements Expression{
    private final int lineNum;
    private final String id;

    public LiteralExpression(int lineNum, String id)
    {
        this.lineNum = lineNum;
        this.id = id;
    }
}