package ast.expr;

import ast.declarations.DeclarationSpecifier;
import ast.types.*;
import codegen.BasicBlock;
import codegen.ControlFlowGraph;
import codegen.TranslationUnit;
import codegen.values.Source;
import ast.TypeEnvironment;

public class AssignmentExpression extends Expression {
    private final LValue left;
    private final Expression right;


    public AssignmentExpression(int lineNum, LValue left, Expression right) {
        super(lineNum);
        this.left = left;
        this.right = right;
    }


    @Override
    public DeclarationSpecifier verifySemantics(TypeEnvironment globalEnv, TypeEnvironment localEnv, TypeEnvironment.StorageLocation location) {
        DeclarationSpecifier leftDecl = left.verifySemantics(globalEnv, localEnv, TypeEnvironment.StorageLocation.REGISTER);
        DeclarationSpecifier rightDecl = right.verifySemantics(globalEnv, localEnv, TypeEnvironment.StorageLocation.REGISTER);

        if (leftDecl.getQualifier() == Type.TypeQualifier.CONST) {
            throw new RuntimeException("AssignmentExpression::verifySemantics: can't assign to a constant");
        }


        Type result;
        // if the types are primitive and non-equal, cast to the type being assigned to
        if (!(leftDecl.getType() instanceof PrimitiveType) || !(rightDecl.getType() instanceof PrimitiveType)) {
            if (!leftDecl.getType().equals(rightDecl.getType())) {
                throw new RuntimeException("AssignmentExpression::verifySemantics: left and right types do not match");
            }
            result = leftDecl.getType().clone();
        } else if ((leftDecl.getType() instanceof PointerType) || (rightDecl.getType() instanceof PointerType)){
            switch (leftDecl.getType()) {
                case PointerType lpt -> result = lpt.clone();
                case IntegerType lit ->  result = rightDecl.getType().clone();
                default ->  throw new RuntimeException("AssignmentExpression::verifySemantics: " +
                        "can't apply implicit conversion to float and pointer");
            }
        } else {
            result = PrimitiveType.implicitConversion(
                    (NumberType) leftDecl.getType(),
                    (NumberType) rightDecl.getType()
            );
        }

        return new DeclarationSpecifier(result);
    }



    @Override
    public Source codegen(TranslationUnit unit, ControlFlowGraph cfg, BasicBlock block) {
        Source rightSource = right.codegen(unit, cfg, block);
        return left.processLValue(unit, cfg, block, rightSource);
    }
}
