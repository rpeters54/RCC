package ast.statements;

import ast.expr.Expression;

import java.util.List;

public class ConditionalStatement implements Statement {
    private final int lineNum;
    private final List<Expression> guardList;
    private final Statement thenBlock;
    private final Statement elseBlock;

    public ConditionalStatement(int lineNum,
                                List<Expression> guardList,
                                Statement thenBlock,
                                Statement elseBlock) {
        this.lineNum = lineNum;
        this.guardList = guardList;
        this.thenBlock = thenBlock;
        this.elseBlock = elseBlock;
    }
}
