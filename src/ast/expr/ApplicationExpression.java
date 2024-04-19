package ast.expr;

import java.util.List;

public class ApplicationExpression implements Expression {
    private final int lineNum;
    private final Expression func;
    private final List<Expression> args ;

    public ApplicationExpression(int lineNum, Expression func, List<Expression> args) {
        this.lineNum = lineNum;
        this.func = func;
        this.args = args;
    }
}
