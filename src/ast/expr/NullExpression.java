package ast.expr;

import ast.TypeEnvironment;
import ast.declarations.DeclarationSpecifier;
import ast.types.PointerType;
import ast.types.VoidType;
import codegen.BasicBlock;
import codegen.ControlFlowGraph;
import codegen.TranslationUnit;
import codegen.instruction.llvm.AllocaLLVM;
import codegen.instruction.llvm.LoadLLVM;
import codegen.instruction.llvm.LoadLiteralLLVM;
import codegen.values.Literal;
import codegen.values.Register;

public class NullExpression extends Expression {

    public NullExpression(int lineNum) {
        super(lineNum);
    }

    @Override
    public DeclarationSpecifier verifySemantics(TypeEnvironment globalEnv, TypeEnvironment localEnv, TypeEnvironment.StorageLocation location) {
        return new DeclarationSpecifier(new PointerType(new VoidType()));
    }

    @Override
    public Register codegen(TranslationUnit unit, ControlFlowGraph cfg, BasicBlock block) {
        Register allocaResult = Register.LLVM_Register(new PointerType(new PointerType(new VoidType())));
        Register loadResult = Register.LLVM_Register(new PointerType(new VoidType()));
        Literal nullValue =  new Literal("null", new PointerType(new VoidType()));

        block.addInstruction(new LoadLiteralLLVM(nullValue, loadResult.clone(), allocaResult));
        return loadResult;
    }


}