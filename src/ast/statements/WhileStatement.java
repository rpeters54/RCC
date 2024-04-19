package ast.statements;

import ast.expr.Expression;

import java.util.List;

public class WhileStatement implements Statement {
    private final int lineNum;
    private final List<Expression> guardList;
    private final Statement body;

    public WhileStatement(int lineNum,
                          List<Expression> guardList,
                           Statement body) {
        this.lineNum = lineNum;
        this.guardList = guardList;
        this.body = body;
    }
}

