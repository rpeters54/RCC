package codegen.instruction.riscv;

import ast.expr.BinaryExpression;
import codegen.instruction.Instruction;
import codegen.values.Register;

import java.util.Arrays;

public class BinaryInstruction extends Instruction {

    BinaryExpression.Operator op;

    public BinaryInstruction(Register result, BinaryExpression.Operator op, Register op1, Register op2) {
        super(Arch.RISCV, Arrays.asList(result), Arrays.asList(op1, op2));
        this.op = op;
    }

    @Override
    public String toString() {
        switch(op) {
            case PLUS -> {return String.format("add %s, %s, %s", getResult(), getSource(0), getSource(1));}
            case MINUS -> {return String.format("sub %s, %s, %s", getResult(), getSource(0), getSource(1));}
            case TIMES -> {return String.format("mul %s, %s, %s", getResult(), getSource(0), getSource(1));}
            case DIVIDE -> {return String.format("div %s, %s, %s", getResult(), getSource(0), getSource(1));}
            default -> throw new RuntimeException("Not Implemented: " + op);
        }
    }
}
