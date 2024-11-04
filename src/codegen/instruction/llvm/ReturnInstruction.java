package codegen.instruction.llvm;

import codegen.instruction.Instruction;
import codegen.values.Source;

import java.util.Arrays;

public class ReturnInstruction extends Instruction {

    public ReturnInstruction() {
        super(Arch.LLVM, Arrays.asList(), Arrays.asList());
    }

    public ReturnInstruction(Source value) {
        super(Arch.LLVM, Arrays.asList(), Arrays.asList(value));
    }

    public String toString() {
        if (sources().isEmpty()) {
            return "ret void";
        }
        return String.format("ret %s %s", source(0).type(), source(0));
    }
}
