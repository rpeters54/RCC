package ast.expr;

import ast.TypeEnvironment;
import ast.declarations.DeclarationSpecifier;
import ast.types.PointerType;
import ast.types.VoidType;
import codegen.BasicBlock;
import codegen.ControlFlowGraph;
import codegen.TranslationUnit;
import codegen.values.Literal;
import codegen.values.Source;

public class NullExpression extends Expression {

    public NullExpression(int lineNum) {
        super(lineNum);
    }

    @Override
    public DeclarationSpecifier verifySemantics(TypeEnvironment globalEnv, TypeEnvironment localEnv, TypeEnvironment.StorageLocation location) {
        return new DeclarationSpecifier(new PointerType(new VoidType()));
    }

    @Override
    public Source codegen(TranslationUnit unit, ControlFlowGraph cfg, BasicBlock block) {
        return new Literal("null", new PointerType(new VoidType()));
    }


}
