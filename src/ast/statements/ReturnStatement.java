package ast.statements;

import ast.expr.Expression;
import java.util.List;

public class ReturnStatement implements Statement {
    private final int lineNum;
    private final List<Expression> retVal;

    public ReturnStatement(int lineNum, List<Expression> retVal) {
        this.lineNum = lineNum;
        this.retVal = retVal;
    }
}
