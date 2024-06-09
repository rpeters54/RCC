package ast.expr;

import ast.declarations.DeclarationSpecifier;
import ast.types.Type;
import codegen.BasicBlock;
import codegen.values.Source;
import semantics.TypeEnvironment;

import java.util.Objects;

public class AssignmentExpression implements Expression {
    private final int lineNum;
    private final LValue left;
    private final Expression right;


    public AssignmentExpression(int lineNum, LValue left, Expression right) {
        this.lineNum = lineNum;
        this.left = left;
        this.right = right;
    }


    @Override
    public DeclarationSpecifier verifySemantics(TypeEnvironment globalEnv, TypeEnvironment localEnv) {
        DeclarationSpecifier leftDecl = left.verifySemantics(globalEnv, localEnv);
        DeclarationSpecifier rightDecl = right.verifySemantics(globalEnv, localEnv);

        if (leftDecl.getQualifier() == DeclarationSpecifier.TypeQualifier.CONST) {
            throw new RuntimeException("AssignmentExpression::verifySemantics: can't assign to a constant");
        }

        // test to see if the types being operated on are compatible
        // (if they aren't, promoteType will throw an error
        BinaryExpression.promoteType(leftDecl.getType(), rightDecl.getType());

        return leftDecl;
    }

    @Override
    public Source codegen(BasicBlock block, TypeEnvironment globalEnv, TypeEnvironment localEnv) {
        Source rightSource = right.codegen(block, globalEnv, localEnv);

        Source result;
        if (Objects.requireNonNull(left) instanceof IdentifierExpression idExp) {
            DeclarationSpecifier specifier = localEnv.getBinding(idExp.getId());
            if (specifier == null)
                specifier = globalEnv.getBinding(idExp.getId());
            if (specifier == null)
                throw new RuntimeException("AssignmentExpression::codegen: Unbound Identifier " + idExp.getId());

            result = rightSource.copy(specifier.getType());
            block.addBinding(idExp.getId(), rightSource);
        } else {
            //Register leftRegister = left.getLValue(block);
            throw new RuntimeException("not implemented");
        }
        return result;
    }
}
