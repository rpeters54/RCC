package codegen.instruction.riscv;

import ast.expr.BinaryExpression;
import codegen.instruction.Instruction;
import codegen.values.Literal;
import codegen.values.Register;

import java.util.Arrays;

public class LoadImmInstruction extends Instruction {

    public LoadImmInstruction(Register result, Literal literal) {
        super(Arch.RISCV, Arrays.asList(result), Arrays.asList(literal));
    }

    @Override
    public String toString() {
        return String.format("li %s, %s", getResult(), getSource(0));
    }
}
