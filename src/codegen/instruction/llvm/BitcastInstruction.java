package codegen.instruction.llvm;

import codegen.instruction.Instruction;
import codegen.values.Register;
import codegen.values.Source;

import java.util.Arrays;

public class BitcastInstruction extends Instruction {

    public BitcastInstruction(Register result, Source operand) {
        super(Arch.LLVM, Arrays.asList(result), Arrays.asList(operand));
    }

    @Override
    public String toString() {
        return String.format("%s = bitcast %s %s to %s",
                result(), source(0).type(),
                source(0), result().type());
    }
}
