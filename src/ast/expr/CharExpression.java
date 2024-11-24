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

public class CharExpression extends Expression{
    private final String id;

    public CharExpression(int lineNum, String id) {
        super(lineNum);
        this.id = id;
    }

    @Override
    public DeclarationSpecifier verifySemantics(TypeEnvironment globalEnv, TypeEnvironment localEnv, TypeEnvironment.StorageLocation location) {
        return new DeclarationSpecifier(new IntegerType(IntegerType.Width.CHAR, true),
                Type.StorageClass.NONE, Type.TypeQualifier.NONE);
    }

    @Override
    public Register codegen(TranslationUnit unit, ControlFlowGraph cfg, BasicBlock block) {
        Register allocaResult = Register.LLVM_Register(new PointerType(new IntegerType()));
        Register loadResult = Register.LLVM_Register(new IntegerType(IntegerType.Width.CHAR, true));
        String numified = Integer.toString(id.charAt(1));
        Literal charValue =  new Literal(numified, new IntegerType(IntegerType.Width.CHAR, true));

        block.addInstruction(new LoadLiteralLLVM(charValue, loadResult.clone(), allocaResult));
        return loadResult;
    }
}