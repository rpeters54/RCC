package codegen.instruction.llvm;

import codegen.instruction.Instruction;
import codegen.values.Register;
import codegen.values.Source;

import java.util.Arrays;

public class LoadInstruction extends Instruction {

    public LoadInstruction(Register result, Source location) {
        super(Arch.LLVM, Arrays.asList(result), Arrays.asList(location));
    }

    @Override
    public String toString() {
        return String.format("%s = load %s, %s %s",
                getResult(), getResult().type(),
                getSource(0).type(), getSource(0));
    }
}