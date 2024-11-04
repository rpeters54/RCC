package ast.expr;

import codegen.BasicBlock;
import codegen.ControlFlowGraph;
import codegen.TranslationUnit;
import codegen.values.Register;
import codegen.values.Source;

public abstract class LValue extends Expression {

    public LValue(int lineNum) {
        super(lineNum);
    }

    public abstract Source processLValue(TranslationUnit unit, ControlFlowGraph cfg, BasicBlock block, Source right);
}
