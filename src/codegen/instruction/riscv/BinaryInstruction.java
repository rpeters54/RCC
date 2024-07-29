package codegen.instruction.riscv;

import ast.expr.BinaryExpression;
import codegen.instruction.Instruction;
import codegen.values.Register;

import java.util.Arrays;

public class BinaryInstruction extends Instruction {

    private final BinaryExpression.Operator op;

    public BinaryInstruction(Register result, BinaryExpression.Operator op, Register op1, Register op2) {
        super(Arch.RISCV, Arrays.asList(result), Arrays.asList(op1, op2));
        this.op = op;
    }

    @Override
    public String toString() {
        String opString = switch(op) {
            case PLUS -> "add";
            case MINUS -> "sub";
            case TIMES -> "mul";
            case DIVIDE -> "div";
            case B_XOR -> "xor";
            case B_AND -> "and";
            case B_OR -> "or";
            case SR -> "srl";
            case SL -> "sll";
            default -> throw new RuntimeException("BinaryImmInstruction::toString: No Instruction exists with " + op);
        };
        return String.format("%s %s, %s, %s", opString, getResult(), getSource(0), getSource(1));
    }
}
