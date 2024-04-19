package ast.statements;

public class ContinueStatement implements Statement {
    private int lineNum;

    public ContinueStatement(int lineNum) {
        this.lineNum = lineNum;
    }
}
