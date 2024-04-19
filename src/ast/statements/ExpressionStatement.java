package ast.statements;

import ast.expr.Expression;

import java.util.List;

public class ExpressionStatement implements Statement {
    private final int lineNum;
    private final List<Expression> expressionList;

    public ExpressionStatement(int lineNum,
                               List<Expression> expressionList) {
        this.lineNum = lineNum;
        this.expressionList = expressionList;
    }
}
