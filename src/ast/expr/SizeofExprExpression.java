package ast.expr;

import ast.declarations.DeclarationSpecifier;
import ast.types.IntegerType;
import ast.types.Type;
import codegen.BasicBlock;
import codegen.ControlFlowGraph;
import codegen.TranslationUnit;
import codegen.values.Register;
import ast.TypeEnvironment;

public class SizeofExprExpression extends Expression {
    private final Expression operand;

    public SizeofExprExpression(int lineNum, Expression operand) {
        super(lineNum);
        this.operand = operand;
    }

    @Override
    public DeclarationSpecifier verifySemantics(TypeEnvironment globalEnv, TypeEnvironment localEnv, TypeEnvironment.StorageLocation location) {
        operand.verifySemantics(globalEnv, localEnv, TypeEnvironment.StorageLocation.REGISTER);
        return new DeclarationSpecifier(new IntegerType(),
                Type.StorageClass.NONE,
                Type.TypeQualifier.NONE);
    }

    @Override
    public Register codegen(TranslationUnit unit, ControlFlowGraph cfg, BasicBlock block) {
        throw new RuntimeException("Not Implemented");
    }
}