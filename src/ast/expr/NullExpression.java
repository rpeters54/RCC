package ast.expr;

import ast.TypeEnvironment;
import ast.declarations.DeclarationSpecifier;
import ast.types.PointerType;
import ast.types.VoidType;
import codegen.BasicBlock;
import codegen.ControlFlowGraph;
import codegen.TranslationUnit;
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
        Register loadResult = Register.LLVM_Register(new PointerType(new VoidType()));
        Literal nullValue =  new Literal("0", new PointerType(new VoidType()));

        block.addInstruction(new LoadLiteralLLVM(nullValue, loadResult.clone()));
        return loadResult;
    }


}
