package ast.expr;

import ast.declarations.DeclarationSpecifier;
import ast.types.Type;
import codegen.BasicBlock;
import codegen.ControlFlowGraph;
import codegen.TranslationUnit;
import codegen.instruction.llvm.BitcastInstruction;
import codegen.values.Register;
import codegen.values.Source;
import ast.TypeEnvironment;

public class CastExpression implements Expression {

    private Type type;
    private Expression casted;

    public CastExpression(Type type, Expression casted) {
        this.type = type;
        this.casted = casted;
    }


    @Override
    public DeclarationSpecifier verifySemantics(TypeEnvironment globalEnv, TypeEnvironment localEnv) {
        casted.verifySemantics(globalEnv, localEnv);
        return new DeclarationSpecifier(type,
                Type.StorageClass.NONE,
                Type.TypeQualifier.NONE);
    }

    @Override
    public Source codegen(TranslationUnit unit, ControlFlowGraph cfg, BasicBlock block) {
        throw new RuntimeException("not implemented yet");
    }
}
