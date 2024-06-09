package ast.expr;

import ast.declarations.DeclarationSpecifier;
import ast.types.*;
import codegen.BasicBlock;
import codegen.values.Register;
import codegen.values.Source;
import semantics.TypeEnvironment;

public class PrefixExpression implements LValue {

    private final int lineNum;
    private final Operator operator;
    private final Expression operand;

    private PrefixExpression(int lineNum, Operator operator, Expression operand) {
        this.lineNum = lineNum;
        this.operator = operator;
        this.operand = operand;
    }

    public static PrefixExpression create(int lineNum, String opStr,
                                         Expression operand) {
        return switch (opStr) {
            case REF_OPERATOR -> new PrefixExpression(lineNum, PrefixExpression.Operator.REF, operand);
            case POINTER_OPERATOR -> new PrefixExpression(lineNum, PrefixExpression.Operator.POINTER, operand);
            case POS_OPERATOR -> new PrefixExpression(lineNum, PrefixExpression.Operator.POS, operand);
            case MINUS_OPERATOR -> new PrefixExpression(lineNum, PrefixExpression.Operator.MINUS, operand);
            case INV_OPERATOR -> new PrefixExpression(lineNum, PrefixExpression.Operator.INV, operand);
            case NOT_OPERATOR -> new PrefixExpression(lineNum, PrefixExpression.Operator.NOT, operand);
            default -> throw new RuntimeException("PrefixExpression::create: invalid operator: " + opStr);
        };
    }

    private static final String REF_OPERATOR = "&";
    private static final String POINTER_OPERATOR = "*";
    private static final String POS_OPERATOR = "+";
    private static final String MINUS_OPERATOR = "-";
    private static final String INV_OPERATOR = "~";
    private static final String NOT_OPERATOR = "!";


    public enum Operator {
        REF, POINTER, POS, MINUS, INV, NOT
    }

    @Override
    public DeclarationSpecifier verifySemantics(TypeEnvironment globalEnv, TypeEnvironment localEnv) {
        DeclarationSpecifier opDeclSpec = operand.verifySemantics(globalEnv,localEnv);
        switch (operator) {
            case REF -> {
                return new DeclarationSpecifier(new PointerType(opDeclSpec.getType()),
                        opDeclSpec.getStorage(), opDeclSpec.getQualifier());
            }
            case POINTER -> {
                if (!(opDeclSpec.getType() instanceof CompoundType))
                    throw new RuntimeException("PrefixExpression::verifySemantics: Can't dereference a non-pointer/array");
                Type baseType = ((CompoundType) opDeclSpec.getType()).getBase();
                return new DeclarationSpecifier(baseType, opDeclSpec.getStorage(),opDeclSpec.getQualifier());
            }
            case POS, MINUS, INV, NOT -> {
                if (!(opDeclSpec.getType() instanceof PrimitiveType))
                    throw new RuntimeException("PrefixExpression::verifySemantics: Can't use +/-/!/~ on a non-primitive");
                return opDeclSpec;
            }
            default -> throw new RuntimeException("PrefixExpression::verifySemantics: Invalid Operator");
        }
    }

    @Override
    public Source codegen(BasicBlock block, TypeEnvironment globalEnv, TypeEnvironment localEnv) {
        throw new RuntimeException("Not Implemented");
    }

    @Override
    public Register getLValue(BasicBlock block) {
        throw new RuntimeException("Not Implemented");
    }
}