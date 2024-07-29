package codegen.instruction.riscv;

import ast.expr.BinaryExpression;
import codegen.instruction.Instruction;
import codegen.values.Literal;
import codegen.values.Register;

import java.util.Arrays;

public class BinaryImmInstruction extends Instruction {
    private final BinaryExpression.Operator op;

    public BinaryImmInstruction(Register result, BinaryExpression.Operator op, Register op1, Literal imm) {
        super(Arch.RISCV, Arrays.asList(result), Arrays.asList(op1, imm));
        this.op = op;
    }

    @Override
    public String toString() {
        String opString = switch(op) {
            case PLUS -> "addi";
            case B_XOR -> "xori";
            case B_AND -> "andi";
            case B_OR -> "ori";
            case SR -> "srli";
            case SL -> "slli";
            default -> throw new RuntimeException("BinaryImmInstruction::toString: No Instruction exists with " + op);
        };
        return String.format("%s %s, %s, %s", opString, getResult(), getSource(0), getSource(1));
    }

    public static boolean validOp(BinaryExpression.Operator op) {
        return switch(op) {
            case PLUS, B_XOR, B_AND, B_OR, SR, SL -> true;
            default -> false;
        };
    }
}
