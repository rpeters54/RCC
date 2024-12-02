package ast.expr;

import ast.declarations.DeclarationSpecifier;
import ast.types.PrimitiveType;
import ast.types.Type;
import codegen.BasicBlock;
import codegen.ControlFlowGraph;
import codegen.TranslationUnit;
import codegen.instruction.llvm.ConversionLLVM;
import codegen.values.Register;
import codegen.values.Source;
import ast.TypeEnvironment;

public class CastExpression extends Expression {

    private Type type;
    private final Expression casted;

    public CastExpression(int lineNum, Type type, Expression casted) {
        super(lineNum);
        this.type = type;
        this.casted = casted;
    }


    @Override
    public DeclarationSpecifier verifySemantics(TypeEnvironment globalEnv, TypeEnvironment localEnv, TypeEnvironment.StorageLocation location) {
        type = globalEnv.expandDeclaration(new DeclarationSpecifier(type)).getType();
        casted.verifySemantics(globalEnv, localEnv, TypeEnvironment.StorageLocation.REGISTER);
        if (!(type instanceof PrimitiveType)) {
            throw new RuntimeException("Cast expression expects a primitive type");
        }

        return new DeclarationSpecifier(type,
                Type.StorageClass.NONE,
                Type.TypeQualifier.NONE);
    }

    @Override
    public Register codegen(TranslationUnit unit, ControlFlowGraph cfg, BasicBlock block) {
        Register castedReg = casted.codegen(unit, cfg, block);
        assert type instanceof PrimitiveType;
        ConversionLLVM conv = ConversionLLVM.make(castedReg, (PrimitiveType) type);
        block.addInstruction(conv);
        return conv.result().clone();
    }
}
