package ast.expr;

import ast.declarations.DeclarationSpecifier;
import codegen.BasicBlock;
import codegen.values.Source;
import semantics.TypeEnvironment;

public class EnumExpression implements Expression{
    private final int lineNum;
    private final String id;

    public EnumExpression(int lineNum, String id)
    {
        this.lineNum = lineNum;
        this.id = id;
    }

    @Override
    public DeclarationSpecifier verifySemantics(TypeEnvironment globalEnv, TypeEnvironment localEnv) {
        throw new RuntimeException("I think this may never be hit, let me know if it is Java");
    }

    @Override
    public Source codegen(BasicBlock block, TypeEnvironment globalEnv, TypeEnvironment localEnv) {
        throw new RuntimeException("Not Implemented");
    }
}