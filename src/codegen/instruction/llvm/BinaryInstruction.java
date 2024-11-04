package codegen.instruction.llvm;

import ast.expr.BinaryExpression;
import ast.types.FloatingType;
import ast.types.IntegerType;

import codegen.instruction.Instruction;
import codegen.values.Literal;
import codegen.values.Register;
import codegen.values.Source;

import java.util.Arrays;

public class BinaryInstruction extends Instruction {

    private final BinaryExpression.Operator op;

    public BinaryInstruction(Register result, BinaryExpression.Operator op, Source op1, Source op2) {
        super(Arch.LLVM, Arrays.asList(result), Arrays.asList(op1, op2));
        this.op = op;
    }

    @Override
    public String toString() {
        String opString;
        switch (result().type()) {
            case IntegerType i -> {
                opString = switch(op) {
                    case PLUS -> "add";
                    case MINUS -> "sub";
                    case TIMES -> "mul";
                    case DIVIDE -> "sdiv";
                    case B_XOR -> "xor";
                    case B_AND -> "and";
                    case B_OR -> "or";
                    case SR -> "lshr";
                    case SL -> "shl";
                    case MODULO -> "srem";
                    default -> throw new RuntimeException("BinaryInstruction::toString: No Integer " +
                            "Instruction exists with " + op);
                };
            }
            case FloatingType f -> {
                opString = switch(op) {
                    case PLUS -> "fadd";
                    case MINUS -> "fsub";
                    case TIMES -> "fmul";
                    case DIVIDE -> "fdiv";
                    default -> throw new RuntimeException("BinaryInstruction::toString: No Floating Point " +
                            "Instruction exists with " + op);
                };
            }
            default -> throw new RuntimeException("BinaryInstruction::toString: No " +
                    "Instruction exists with " + op);
        }
        return String.format("%s = %s %s %s, %s",
                result(), opString, source(0).type(),
                source(0), source(1));
    }

    public Source collapse() {
        Source leftSource = source(0);
        Source rightSource = source(1);

        if (!(leftSource instanceof Literal leftLiteral) || !(rightSource instanceof Literal rightLiteral)) {
            return null;
        }

        String result;
        switch (leftLiteral.type()) {
            case IntegerType _ -> {
                long left = Long.parseLong(leftLiteral.toString());
                long right = Long.parseLong(rightLiteral.toString());
                switch (op) {
                    case PLUS -> result = String.format("%d", left + right);
                    case MINUS -> result = String.format("%d", left - right);
                    case TIMES -> result = String.format("%d", left * right);
                    case DIVIDE -> result = String.format("%d", left / right);
                    case B_XOR -> result = String.format("%d", left ^ right);
                    case B_AND -> result = String.format("%d", left & right);
                    case B_OR -> result = String.format("%d", left | right);
                    case SR -> result = String.format("%d", left >> right);
                    case SL -> result = String.format("%d", left << right);
                    case MODULO -> result = String.format("%d", left % right);
                    case null, default -> throw new RuntimeException("BinaryInstruction::collapse: " +
                            "Undefined Operand");
                }
            }
            case FloatingType _ -> {
                double left = Double.parseDouble(leftLiteral.toString());
                double right = Double.parseDouble(rightLiteral.toString());
                switch (op) {
                    case PLUS -> result = String.format("%f", left + right);
                    case MINUS -> result = String.format("%f", left - right);
                    case TIMES -> result = String.format("%f", left * right);
                    case DIVIDE -> result = String.format("%f", left / right);
                    case null, default -> throw new RuntimeException("BinaryInstruction::collapse: " +
                            "Undefined Operand");
                }
            }
            case null, default -> throw new RuntimeException("BinaryInstruction::collapse: No " +
                    "Instruction exists with " + op);
        }

        return new Literal(result, leftLiteral.type().clone());
    }

}
