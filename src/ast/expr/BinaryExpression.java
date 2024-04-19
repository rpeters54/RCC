package ast.expr;

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
}