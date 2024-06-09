package ast.expr;

import ast.declarations.DeclarationSpecifier;
import ast.types.IntegerType;
import codegen.BasicBlock;
import codegen.values.Source;
import semantics.TypeEnvironment;

public class CharExpression implements Expression{
    private final int lineNum;
    private final char id;

    public CharExpression(int lineNum, char id)
    {
        this.lineNum = lineNum;
        this.id = id;
    }

    @Override
    public DeclarationSpecifier verifySemantics(TypeEnvironment globalEnv, TypeEnvironment localEnv) {
        return new DeclarationSpecifier(new IntegerType(Character.toString(id), 8, true),
                DeclarationSpecifier.StorageClass.NONE, DeclarationSpecifier.TypeQualifier.NONE);
    }

    @Override
    public Source codegen(BasicBlock block, TypeEnvironment globalEnv, TypeEnvironment localEnv) {
        throw new RuntimeException("Not Implemented");
    }
}