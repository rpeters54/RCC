package codegen.instruction.llvm;

import codegen.instruction.Instruction;
import codegen.values.Source;

import java.util.Arrays;

public class StoreInstruction extends Instruction {

    public StoreInstruction(Source value, Source dest) {
        super(Arch.LLVM, Arrays.asList(), Arrays.asList(value, dest));
    }

    @Override
    public String toString() {
        return String.format("store %s %s, %s %s",
                getSource(0).type(), getSource(0),
                getSource(1).type(), getSource(1));
    }
}
