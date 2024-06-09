package ast.expr;

import codegen.BasicBlock;
import codegen.values.Register;

import java.util.Optional;

public interface LValue extends Expression {
    Register getLValue(BasicBlock block);
}
