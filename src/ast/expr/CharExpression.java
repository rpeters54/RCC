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
    public Source codegen(TranslationUnit unit, ControlFlowGraph cfg, BasicBlock block) {
        Register allocaResult = Register.LLVM_Register(new PointerType(new IntegerType()));
        Register loadResult = Register.LLVM_Register(new IntegerType(IntegerType.Width.CHAR, true));
        String numified = Integer.toString(id.charAt(1));
        Literal charValue =  new Literal(numified, new IntegerType(IntegerType.Width.CHAR, true));

        block.addInstruction(new AllocaInstruction(allocaResult));
        block.addInstruction(new StoreInstruction(charValue, allocaResult.clone()));
        block.addInstruction(new LoadInstruction(loadResult, allocaResult.clone()));
        return loadResult.clone();
    }
}