package ast.expr;

public class IdentifierExpression implements Expression{
    private final int lineNum;
    private final String id;

    public IdentifierExpression(int lineNum, String id)
    {
        this.lineNum = lineNum;
        this.id = id;
    }
}
