package ast.expr;

import ast.declarations.DeclarationSpecifier;
import ast.types.NumberType;
import ast.types.PrimitiveType;
import codegen.BasicBlock;
import codegen.ControlFlowGraph;
import codegen.TranslationUnit;
import codegen.values.Source;
import ast.TypeEnvironment;

public class ConditionalExpression extends Expression {
    private final Expression guard;
    private final Expression then;
    private final Expression other;

    public ConditionalExpression(int lineNum, Expression guard,
                                  Expression then, Expression other) {
        super(lineNum);
        this.guard = guard;
        this.then = then;
        this.other = other;
    }

    @Override
    public DeclarationSpecifier verifySemantics(TypeEnvironment globalEnv, TypeEnvironment localEnv, TypeEnvironment.StorageLocation location) {
        DeclarationSpecifier guardSpec = guard.verifySemantics(globalEnv, localEnv, TypeEnvironment.StorageLocation.REGISTER);
        DeclarationSpecifier thenSpec = then.verifySemantics(globalEnv, localEnv, TypeEnvironment.StorageLocation.REGISTER);
        DeclarationSpecifier otherSpec = other.verifySemantics(globalEnv, localEnv, TypeEnvironment.StorageLocation.REGISTER);

        if (!(guardSpec.getType() instanceof PrimitiveType))
            throw new RuntimeException("ConditionalExpression::verifySemantics: guard must be a primitive type");

        DeclarationSpecifier result = new DeclarationSpecifier();
        if (thenSpec.getType() instanceof NumberType || otherSpec.getType() instanceof NumberType) {
            result.setType(PrimitiveType.implicitConversion(
                    (NumberType) thenSpec.getType(),
                    (NumberType) otherSpec.getType()
            ));
            return result;
        } else if (thenSpec.getType().equals(otherSpec.getType())) {
            return thenSpec;
        } else {
            throw new RuntimeException("ConditionalExpression::verifySemantics: cases have conflicting types");
        }
    }

    @Override
    public Source codegen(TranslationUnit unit, ControlFlowGraph cfg, BasicBlock block) {
        throw new RuntimeException("Not Implemented");
    }
}
