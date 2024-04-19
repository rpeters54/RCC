package ast.statements;

import ast.expr.Expression;

import java.util.List;

public class CaseStatement implements Statement {
    private final int lineNum;
    private final List<Expression> expressionList;
    private final Statement statement;

    public CaseStatement(int lineNum,
                         List<Expression> expressionList,
                         Statement statement) {
        this.lineNum = lineNum;
        this.expressionList = expressionList;
        this.statement = statement;
    }
}
