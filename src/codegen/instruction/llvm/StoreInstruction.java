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
                source(0).type(), source(0),
                source(1).type(), source(1));
    }
}
