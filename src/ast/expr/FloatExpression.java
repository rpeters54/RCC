package ast.expr;

import ast.declarations.DeclarationSpecifier;
import ast.types.FloatingType;
import ast.types.PointerType;
import ast.types.Type;
import codegen.BasicBlock;
import codegen.ControlFlowGraph;
import codegen.TranslationUnit;
import codegen.instruction.llvm.AllocaInstruction;
import codegen.instruction.llvm.LoadInstruction;
import codegen.instruction.llvm.StoreInstruction;

import codegen.values.Literal;
import codegen.values.Register;
import codegen.values.Source;
import ast.TypeEnvironment;

public class FloatExpression implements Expression {
    private final int lineNum;
    private final String value;

    public FloatExpression(int lineNum, String value) {
        this.lineNum = lineNum;
        this.value = value;
    }

    @Override
    public DeclarationSpecifier verifySemantics(TypeEnvironment globalEnv, TypeEnvironment localEnv) {
        return new DeclarationSpecifier(new FloatingType(), Type.StorageClass.NONE, Type.TypeQualifier.NONE);
    }

    @Override
    public Source codegen(TranslationUnit unit, ControlFlowGraph cfg, BasicBlock block) {
        Register allocaResult = Register.LLVM_Register(new PointerType(new FloatingType()));
        Register loadResult = Register.LLVM_Register(new FloatingType());
        Literal floatValue =  new Literal(value, new FloatingType());

        block.addInstruction(new AllocaInstruction(allocaResult));
        block.addInstruction(new StoreInstruction(floatValue, allocaResult.clone()));
        block.addInstruction(new LoadInstruction(loadResult, allocaResult.clone()));
        return loadResult.clone();
    }
}