package codegen.instruction.llvm;

import codegen.instruction.Instruction;
import codegen.values.Register;
import codegen.values.Source;

import java.util.Arrays;

public class LoadInstruction extends Instruction implements CriticalInstruction {

    public LoadInstruction(Register result, Source location) {
        super(Arch.LLVM, Arrays.asList(result), Arrays.asList(location));
    }

    @Override
    public String toString() {
        return String.format("%s = load %s, %s %s",
                result(), result().type(),
                source(0).type(), source(0));
    }
}