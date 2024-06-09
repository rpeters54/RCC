package ast.expr;

import ast.declarations.DeclarationSpecifier;
import ast.types.IntegerType;
import codegen.BasicBlock;
import codegen.values.Literal;
import codegen.values.Source;
import semantics.TypeEnvironment;

public class IntegerExpression implements Expression {
    private final int lineNum;
    private final String value;

    public IntegerExpression(int lineNum, String value) {
        this.lineNum = lineNum;
        this.value = value;
    }

    @Override
    public DeclarationSpecifier verifySemantics(TypeEnvironment globalEnv, TypeEnvironment localEnv) {
        return new DeclarationSpecifier(new IntegerType(value, Integer.BYTES*8, true),
                DeclarationSpecifier.StorageClass.NONE, DeclarationSpecifier.TypeQualifier.NONE);
    }

    @Override
    public Source codegen(BasicBlock block, TypeEnvironment globalEnv, TypeEnvironment localEnv) {
        return new Literal(value, new IntegerType(value, Integer.BYTES*8, true));
    }
}
