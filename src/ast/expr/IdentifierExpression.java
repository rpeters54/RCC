package ast.expr;

import ast.declarations.DeclarationSpecifier;
import codegen.BasicBlock;
import codegen.ControlFlowGraph;
import codegen.TranslationUnit;
import codegen.values.Register;
import codegen.values.Source;
import ast.TypeEnvironment;
import org.antlr.v4.runtime.misc.Pair;

public class IdentifierExpression implements LValue {
    private final int lineNum;
    private final String id;

    public IdentifierExpression(int lineNum, String id) {
        this.lineNum = lineNum;
        this.id = id;
    }

    public String getId() {
        return id;
    }

    @Override
    public DeclarationSpecifier verifySemantics(TypeEnvironment globalEnv, TypeEnvironment localEnv) {
        DeclarationSpecifier defn = localEnv.getBinding(id);
        if (defn == null)
            defn = globalEnv.getBinding(id);
        if (defn == null)
            throw new RuntimeException("IdentifierExpression::verifySemantics: '" + id + "' not included in local " +
                    "or global environment");
        return defn;
    }

    @Override
    public Source codegen(TranslationUnit unit, ControlFlowGraph cfg, BasicBlock block) {
        Source value = block.getBinding(id);
        if (value == null) {
            Pair<String, Source> pair = cfg.findPreviousDefinitions(block, id);
            if (pair != null) {
                value = pair.b;
            }
        }
        if (value == null) {
            value = unit.getGlobalBlock().getBinding(id);
        }
        if (value == null) {
            throw new RuntimeException(String.format("IdentifierExpression::codegen: " +
                    "failed to find binding %s in any environment", id));
        }
        return value;
    }

    @Override
    public Register getLValue(BasicBlock block) {
        throw new RuntimeException("IdentifierExpression::getLValue: should never be called");
    }
}
