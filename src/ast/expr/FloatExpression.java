package ast.expr;

import ast.declarations.DeclarationSpecifier;
import ast.types.FloatingType;
import ast.types.PointerType;
import ast.types.Type;
import codegen.BasicBlock;
import codegen.ControlFlowGraph;
import codegen.TranslationUnit;
import codegen.instruction.llvm.AllocaLLVM;
import codegen.instruction.llvm.LoadLLVM;

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
        Register allocaResult = Register.LLVM_Register(new PointerType(new FloatingType(size)));
        Register loadResult = Register.LLVM_Register(new FloatingType(size));
        Literal floatValue =  new Literal(Double.toString(value), new FloatingType(size));

        block.addInstruction(new LoadLiteralLLVM(floatValue, loadResult.clone(), allocaResult));
        return loadResult;
    }
}