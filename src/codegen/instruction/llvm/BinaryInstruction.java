package codegen.instruction.llvm;

import ast.expr.BinaryExpression;
import ast.types.FloatingType;
import ast.types.IntegerType;

import codegen.instruction.Instruction;
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
        switch (getResult().type()) {
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
                    default -> throw new RuntimeException("BinaryImmInstruction::toString: No Integer " +
                            "Instruction exists with " + op);
                };
            }
            case FloatingType f -> {
                opString = switch(op) {
                    case PLUS -> "fadd";
                    case MINUS -> "fsub";
                    case TIMES -> "fmul";
                    case DIVIDE -> "fdiv";
                    default -> throw new RuntimeException("BinaryImmInstruction::toString: No Floating Point " +
                            "Instruction exists with " + op);
                };
            }
            default -> throw new RuntimeException("BinaryImmInstruction::toString: No " +
                    "Instruction exists with " + op);
        }
        return String.format("%s = %s %s %s, %s",
                getResult(), opString, getSource(0).type(),
                getSource(0), getSource(1));
    }
}
