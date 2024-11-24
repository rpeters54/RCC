package ast.expr;

import codegen.BasicBlock;
import codegen.ControlFlowGraph;
import codegen.TranslationUnit;
import codegen.values.Register;

public abstract class LValue extends Expression {

    public LValue(int lineNum) {
        super(lineNum);
    }

    public abstract Register processLValue(TranslationUnit unit, ControlFlowGraph cfg, BasicBlock block, Register right);
}
