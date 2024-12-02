package ast.expr;

import ast.declarations.DeclarationSpecifier;
import ast.types.FloatingType;
import ast.types.PointerType;
import ast.types.Type;
import codegen.BasicBlock;
import codegen.ControlFlowGraph;
import codegen.TranslationUnit;

import codegen.instruction.llvm.LoadLiteralLLVM;
import codegen.values.Literal;
import codegen.values.Register;
import ast.TypeEnvironment;

public class FloatExpression extends Expression {

    private final double value;
    private FloatingType.Width size;

    public FloatExpression(int lineNum, double value) {
        super(lineNum);
        this.value = value;
        this.size = FloatingType.Width.DOUBLE;
    }

    public FloatExpression(int lineNum, double value, FloatingType ft) {
        super(lineNum);
        this.value = value;
        this.size = ft.size();
    }

    @Override
    public DeclarationSpecifier verifySemantics(TypeEnvironment globalEnv, TypeEnvironment localEnv, TypeEnvironment.StorageLocation location) {
        return new DeclarationSpecifier(new FloatingType(), Type.StorageClass.NONE, Type.TypeQualifier.NONE);
    }

    @Override
    public Register codegen(TranslationUnit unit, ControlFlowGraph cfg, BasicBlock block) {
        Register loadResult = Register.LLVM_Register(new FloatingType(size));

        Literal floatValue = switch (size) {
            case FLOAT -> new Literal(Float.toString((float)value), new FloatingType(size));
            case DOUBLE -> new Literal(Double.toString(value), new FloatingType(size));
        };

        block.addInstruction(new LoadLiteralLLVM(floatValue, loadResult.clone()));
        return loadResult;
    }
}