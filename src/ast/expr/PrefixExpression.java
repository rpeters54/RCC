package ast.expr;

public class PrefixExpression implements Expression {

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
            default -> throw new IllegalArgumentException();
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
}