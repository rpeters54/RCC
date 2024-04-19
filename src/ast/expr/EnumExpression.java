package ast.expr;

public class EnumExpression implements Expression{
    private final int lineNum;
    private final String id;

    public EnumExpression(int lineNum, String id)
    {
        this.lineNum = lineNum;
        this.id = id;
    }
}