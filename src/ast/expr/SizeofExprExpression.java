package ast.expr;

import ast.declarations.DeclarationSpecifier;
import ast.types.IntegerType;
import ast.types.Type;
import codegen.BasicBlock;
import codegen.ControlFlowGraph;
import codegen.TranslationUnit;
import codegen.values.Source;
import ast.TypeEnvironment;

public class SizeofExprExpression implements Expression {
    private final Expression operand;

    public SizeofExprExpression(Expression operand) {
        this.operand = operand;
    }

    @Override
    public DeclarationSpecifier verifySemantics(TypeEnvironment globalEnv, TypeEnvironment localEnv) {
        operand.verifySemantics(globalEnv, localEnv);
        return new DeclarationSpecifier(new IntegerType(),
                Type.StorageClass.NONE,
                Type.TypeQualifier.NONE);
    }

    @Override
    public Source codegen(TranslationUnit unit, ControlFlowGraph cfg, BasicBlock block) {
        throw new RuntimeException("Not Implemented");
    }
}