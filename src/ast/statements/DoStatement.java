package ast.statements;

import ast.expr.Expression;
import codegen.BasicBlock;
import codegen.ControlFlowGraph;
import codegen.EscapeTuple;
import codegen.TranslationUnit;

import java.util.List;
import java.util.Optional;

public class DoStatement extends LoopStatement {

    public DoStatement(int lineNum, List<Expression> guardList, Statement body) {
        super(lineNum, guardList, body);
    }

    @Override
    public BasicBlock codegen(TranslationUnit unit, ControlFlowGraph cfg, BasicBlock block, EscapeTuple esc) {
        return generateLoop(unit, cfg, block, Optional.empty(), Optional.empty(), true);
    }
}
