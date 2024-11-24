package ast.expr;

import ast.declarations.DeclarationSpecifier;
import ast.types.IntegerType;
import ast.types.PointerType;
import ast.types.Type;
import codegen.BasicBlock;
import codegen.ControlFlowGraph;
import codegen.TranslationUnit;
import codegen.instruction.llvm.StringLiteralLLVM;
import codegen.values.Register;
import ast.TypeEnvironment;

public class LiteralExpression extends Expression {
    private final String id;

    public LiteralExpression(int lineNum, String id) {
        super(lineNum);
        this.id = id.replace("\"", "");
    }

    @Override
    public DeclarationSpecifier verifySemantics(TypeEnvironment globalEnv, TypeEnvironment localEnv, TypeEnvironment.StorageLocation location) {
        return new DeclarationSpecifier(new PointerType(new IntegerType(IntegerType.Width.CHAR, true)),
                Type.StorageClass.NONE, Type.TypeQualifier.NONE);
    }

    @Override
    public Register codegen(TranslationUnit unit, ControlFlowGraph cfg, BasicBlock block) {
        Register globalPointer = Register.Global(new PointerType(new IntegerType(IntegerType.Width.CHAR, true)));
        StringLiteralLLVM literal = new StringLiteralLLVM(globalPointer, id);
        unit.getGlobalBlock().addInstruction(literal);
        return globalPointer;
    }
}