package ast.expr;

import ast.declarations.Declaration;
import ast.declarations.DeclarationSpecifier;
import ast.types.*;
import semantics.TypeEnvironment;

import java.nio.channels.Pipe;

public class BinaryExpression implements ast.expr.Expression {
    private final int lineNum;
    private final Operator operator;
    private final Expression left;
    private final Expression right;

    private BinaryExpression(int lineNum, Operator operator,
                             Expression left, Expression right) {
        this.lineNum = lineNum;
        this.operator = operator;
        this.left = left;
        this.right = right;
    }

    public static BinaryExpression create(int lineNum, String opStr,
                                          Expression left, Expression right) {
        return switch (opStr) {
            case TIMES_OPERATOR -> new BinaryExpression(lineNum, Operator.TIMES, left, right);
            case DIVIDE_OPERATOR -> new BinaryExpression(lineNum, Operator.DIVIDE, left, right);
            case MODULO_OPERATOR -> new BinaryExpression(lineNum, Operator.MODULO, left, right);
            case PLUS_OPERATOR -> new BinaryExpression(lineNum, Operator.PLUS, left, right);
            case MINUS_OPERATOR -> new BinaryExpression(lineNum, Operator.MINUS, left, right);
            case SHIFT_LEFT_OPERATOR -> new BinaryExpression(lineNum, Operator.SL, left, right);
            case SHIFT_RIGHT_OPERATOR -> new BinaryExpression(lineNum, Operator.SR, left, right);
            case LT_OPERATOR -> new BinaryExpression(lineNum, Operator.LT, left, right);
            case LE_OPERATOR -> new BinaryExpression(lineNum, Operator.LE, left, right);
            case GT_OPERATOR -> new BinaryExpression(lineNum, Operator.GT, left, right);
            case GE_OPERATOR -> new BinaryExpression(lineNum, Operator.GE, left, right);
            case EQ_OPERATOR -> new BinaryExpression(lineNum, Operator.EQ, left, right);
            case NE_OPERATOR -> new BinaryExpression(lineNum, Operator.NE, left, right);
            case BITWISE_AND_OPERATOR -> new BinaryExpression(lineNum, Operator.B_AND, left, right);
            case BITWISE_XOR_OPERATOR -> new BinaryExpression(lineNum, Operator.B_XOR, left, right);
            case BITWISE_OR_OPERATOR -> new BinaryExpression(lineNum, Operator.B_OR, left, right);
            case LOGICAL_AND_OPERATOR -> new BinaryExpression(lineNum, Operator.L_AND, left, right);
            case LOGICAL_OR_OPERATOR -> new BinaryExpression(lineNum, Operator.L_OR, left, right);
            default -> throw new IllegalArgumentException();
        };
    }

    private static final String TIMES_OPERATOR = "*";
    private static final String DIVIDE_OPERATOR = "/";
    private static final String MODULO_OPERATOR = "%";
    private static final String PLUS_OPERATOR = "+";
    private static final String MINUS_OPERATOR = "-";
    private static final String SHIFT_LEFT_OPERATOR = "<<";
    private static final String SHIFT_RIGHT_OPERATOR = ">>";
    private static final String LT_OPERATOR = "<";
    private static final String GT_OPERATOR = ">";
    private static final String LE_OPERATOR = "<=";
    private static final String GE_OPERATOR = ">=";
    private static final String EQ_OPERATOR = "==";
    private static final String NE_OPERATOR = "!=";
    private static final String BITWISE_AND_OPERATOR = "&";
    private static final String BITWISE_XOR_OPERATOR = "^";
    private static final String BITWISE_OR_OPERATOR = "|";
    private static final String LOGICAL_AND_OPERATOR = "&&";
    private static final String LOGICAL_OR_OPERATOR = "||";


    public enum Operator {
        TIMES, DIVIDE, MODULO, PLUS, MINUS, SL, SR, LT, GT, LE, GE, EQ, NE, B_AND, B_XOR, B_OR, L_AND, L_OR
    }

    @Override
    public DeclarationSpecifier verifySemantics(TypeEnvironment globalEnv, TypeEnvironment localEnv) {
        DeclarationSpecifier leftDecl = left.verifySemantics(globalEnv, localEnv);
        DeclarationSpecifier rightDecl = right.verifySemantics(globalEnv, localEnv);

        DeclarationSpecifier result = new DeclarationSpecifier();
        switch (operator) {
            case TIMES, DIVIDE, PLUS, MINUS -> {
                result.setType(promoteType(leftDecl.getType(), rightDecl.getType()));
            }
            case MODULO, SL, SR, B_AND, B_XOR, B_OR -> {
                if (leftDecl.getType() instanceof FloatingType || rightDecl.getType() instanceof FloatingType) {
                    throw new RuntimeException("BinaryExpression::verifySemantics: can apply " +
                            "bitwise operators on floating point numbers");
                }
                result.setType(promoteType(leftDecl.getType(), rightDecl.getType()));
            }
            case LT, GT, LE, GE, EQ, NE, L_AND, L_OR -> {
                // run promoteType to ensure the operation is valid, but discard the type
                promoteType(leftDecl.getType(), rightDecl.getType());
                result.setType(new IntegerType());
            }
            case null, default -> {
                throw new RuntimeException("BinaryExpression::verifySemantics: undefined operator");
            }
        }
        return result;
    }


    /**
     * Resolve the output type of an operation involving two primitive types:
     * [arrays, pointers, integers, or floats]
     * @param left the left operand
     * @param right the right operand
     * @return the resulting type of the operation
     */
    public static PrimitiveType promoteType(Type left, Type right) {
        if (!(left instanceof PrimitiveType) || !(right instanceof PrimitiveType)) {
            throw new RuntimeException("TypeHandler::promoteType: Can't have an operation with non-primitive types");
        } else if (left instanceof FloatingType || right instanceof FloatingType) {
            if (left instanceof CompoundType || right instanceof CompoundType) {
                throw new RuntimeException("TypeHandler::promoteType: Can't have an operation with float and a pointer/array");
            }
            NumberType result = new FloatingType();
            result.setBits(Math.max(((NumberType)left).getBits(), ((NumberType)right).getBits()));
            return result;
        } else if (left instanceof PointerType || right instanceof PointerType) {
            if (left instanceof PointerType && right instanceof PointerType) {
                if (((PointerType) left).getBase().equals(((PointerType) right).getBase())) {
                    return (PointerType) left;
                } else {
                    throw new RuntimeException("TypeHandler::promoteType: Can't have an operation with two dissimilar pointers");
                }
            } else if (left instanceof IntegerType || right instanceof IntegerType) {
                return left instanceof PointerType ? (PointerType) left : (PointerType) right;
            } else {
                throw new RuntimeException("TypeHandler::promoteType: Can't have an operation with a pointer/array");
            }
        } else if (left instanceof ArrayType || right instanceof ArrayType) {
            if (left instanceof ArrayType && right instanceof ArrayType) {
                if (((ArrayType) left).getBase().equals(((ArrayType) right).getBase())) {
                    return (ArrayType) left;
                } else {
                    throw new RuntimeException("TypeHandler::promoteType: Can't have an operation with two dissimilar arrays");
                }
            } else {
                return left instanceof ArrayType ? (ArrayType) left : (ArrayType) right;
            }
        } else {
            NumberType result = new IntegerType();
            result.setBits(Math.max(((NumberType)left).getBits(), ((NumberType)right).getBits()));
            return result;
        }
    }

}