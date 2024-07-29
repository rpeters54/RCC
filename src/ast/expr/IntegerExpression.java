package ast.expr;

import ast.declarations.DeclarationSpecifier;
import ast.types.IntegerType;
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

public class IntegerExpression implements Expression {
    private final int lineNum;
    private final String value;

    public IntegerExpression(int lineNum, String value) {
        this.lineNum = lineNum;
        this.value = value;
    }

    @Override
    public DeclarationSpecifier verifySemantics(TypeEnvironment globalEnv, TypeEnvironment localEnv) {
        return new DeclarationSpecifier(new IntegerType(), Type.StorageClass.NONE, Type.TypeQualifier.NONE);
    }

    @Override
    public Source codegen(TranslationUnit unit, ControlFlowGraph cfg, BasicBlock block) {
        Register allocaResult = Register.LLVM_Register(new PointerType(new IntegerType()));
        Register loadResult = Register.LLVM_Register(new IntegerType());
        Literal intValue =  new Literal(value, new IntegerType());

        block.addInstruction(new AllocaInstruction(allocaResult));
        block.addInstruction(new StoreInstruction(intValue, allocaResult.clone()));
        block.addInstruction(new LoadInstruction(loadResult, allocaResult.clone()));
        return loadResult.clone();
    }
}
