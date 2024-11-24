package ast.expr;

import ast.declarations.DeclarationSpecifier;
import ast.types.IntegerType;
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

public class IntegerExpression extends Expression {
    private final long value;
    private final IntegerType.Width size;
    private final boolean signed;

    public IntegerExpression(int lineNum, long value) {
        super(lineNum);
        this.value = value;
        this.size = IntegerType.Width.LONG;
        signed = true;
    }

    public IntegerExpression(int lineNum, long value, IntegerType it) {
        super(lineNum);
        this.value = value;
        this.size = it.size();
        this.signed = it.signed();
    }

    public long getValue() {
        return value;
    }

    @Override
    public DeclarationSpecifier verifySemantics(TypeEnvironment globalEnv, TypeEnvironment localEnv, TypeEnvironment.StorageLocation location) {
        return new DeclarationSpecifier(new IntegerType(), Type.StorageClass.NONE, Type.TypeQualifier.NONE);
    }

    @Override
    public Register codegen(TranslationUnit unit, ControlFlowGraph cfg, BasicBlock block) {
        Register allocaResult = Register.LLVM_Register(new PointerType(new IntegerType(size, signed)));
        Register loadResult = Register.LLVM_Register(new IntegerType(size, signed));
        Literal intValue =  new Literal(Long.toString(value), new IntegerType(size, signed));
        block.addInstruction(new LoadLiteralLLVM(intValue, loadResult.clone(), allocaResult));
        return loadResult;
    }
}
