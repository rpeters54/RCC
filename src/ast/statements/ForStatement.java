package ast.statements;

import ast.expr.Expression;

import java.util.List;

public class ForStatement implements Statement {
    private final int lineNum;
    private final List<Expression> setterList;
    private final List<Expression> guardList;
    private final List<Expression> stepList;
    private final Statement body;

    public ForStatement(int lineNum,
                        List<Expression> setterList,
                          List<Expression> guardList,
                          List<Expression> stepList,
                          Statement body) {
        this.lineNum = lineNum;
        this.setterList = setterList;
        this.guardList = guardList;
        this.stepList = stepList;
        this.body = body;
    }
}
