package ast.expr;

import ast.declarations.DeclarationSpecifier;
import ast.types.*;
import codegen.BasicBlock;
import codegen.ControlFlowGraph;
import codegen.TranslationUnit;
import codegen.values.Literal;
import codegen.values.Source;
import ast.TypeEnvironment;

public class SizeofTypeExpression extends Expression {
    private final Type type;

    public SizeofTypeExpression(int lineNum, Type type) {
        super(lineNum);
        this.type = type;
    }

    @Override
    public DeclarationSpecifier verifySemantics(TypeEnvironment globalEnv, TypeEnvironment localEnv, TypeEnvironment.StorageLocation location) {
        return new DeclarationSpecifier(new IntegerType(),
                Type.StorageClass.NONE,
                Type.TypeQualifier.NONE);
    }

    @Override
    public Source codegen(TranslationUnit unit, ControlFlowGraph cfg, BasicBlock block) {
        long size = type.sizeof();
        if (size <= 0) {
            switch (type) {
                case StructType st -> {
                    size = unit.getGlobalTypeEnvironment().getStruct(st.name()).sizeof();
                }
                case UnionType ut -> {
                    size = unit.getGlobalTypeEnvironment().getUnion(ut.name()).sizeof();
                }
                case null, default -> {
                    throw new RuntimeException("SizeofTypeExpression::codegen: value can not have size of zero at: "
                    + lineNum());
                }
            }
        }
        return new Literal(Long.toString(size), new IntegerType(IntegerType.Width.LONG, true));
    }
}
