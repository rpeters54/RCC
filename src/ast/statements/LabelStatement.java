package ast.statements;

public class LabelStatement implements Statement {
    private final int lineNum;
    private final String label;
    private final Statement statement;

    public LabelStatement(int lineNum, String label, Statement statement) {
        this.lineNum = lineNum;
        this.label = label;
        this.statement = statement;
    }
}
