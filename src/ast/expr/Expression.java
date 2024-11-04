package ast.expr;

import ast.declarations.DeclarationSpecifier;
import codegen.BasicBlock;
import codegen.ControlFlowGraph;
import codegen.TranslationUnit;
import codegen.values.Source;
import ast.TypeEnvironment;

public abstract class Expression {

    private final int lineNum;

    public Expression(int lineNum) {
        this.lineNum = lineNum;
    }

    public int lineNum() {
        return lineNum;
    }


    public abstract DeclarationSpecifier verifySemantics(TypeEnvironment globalEnv,
                                                         TypeEnvironment localEnv,
                                                         TypeEnvironment.StorageLocation location);
    public abstract Source codegen(TranslationUnit unit, ControlFlowGraph cfg, BasicBlock block);
}
