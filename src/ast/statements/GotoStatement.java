package ast.statements;

public class GotoStatement implements Statement {
    private final int lineNum;
    private final String label;

    public GotoStatement(int lineNum, String label) {
        this.lineNum = lineNum;
        this.label = label;
    }
}
