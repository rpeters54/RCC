package ast.expr;

import ast.declarations.DeclarationSpecifier;
import ast.types.IntegerType;
import ast.types.PointerType;
import ast.types.Type;
import codegen.BasicBlock;
import codegen.ControlFlowGraph;
import codegen.TranslationUnit;
import codegen.instruction.llvm.StringLiteral;
import codegen.values.Register;
import codegen.values.Source;
import ast.TypeEnvironment;

public class LiteralExpression implements Expression{
    private final int lineNum;
    private final String id;

    public LiteralExpression(int lineNum, String id)
    {
        this.lineNum = lineNum;
        this.id = id.replace("\"", "");
    }

    @Override
    public DeclarationSpecifier verifySemantics(TypeEnvironment globalEnv, TypeEnvironment localEnv) {
        return new DeclarationSpecifier(new PointerType(new IntegerType(IntegerType.Width.CHAR, true)),
                Type.StorageClass.NONE, Type.TypeQualifier.NONE);
    }

    @Override
    public Source codegen(TranslationUnit unit, ControlFlowGraph cfg, BasicBlock block) {
        Register globalPointer = Register.Global(new PointerType(new IntegerType(IntegerType.Width.CHAR, true)));
        StringLiteral literal = new StringLiteral(globalPointer, id);
        unit.getGlobalBlock().addInstruction(literal);
        return globalPointer;
    }
}