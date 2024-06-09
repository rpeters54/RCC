package ast.expr;

import ast.declarations.DeclarationSpecifier;
import codegen.BasicBlock;
import codegen.values.Register;
import codegen.values.Source;
import semantics.TypeEnvironment;

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
    public Source codegen(BasicBlock block, TypeEnvironment globalEnv, TypeEnvironment localEnv) {
        return block.getBinding(id);
    }

    @Override
    public Register getLValue(BasicBlock block) {
        throw new RuntimeException("IdentifierExpression::getLValue: should never be called");
    }
}
