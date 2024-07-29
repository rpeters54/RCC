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
        if (getSources().isEmpty()) {
            return "ret";
        }
        return String.format("ret %s %s", getSource(0).type(), getSource(0));
    }
}
