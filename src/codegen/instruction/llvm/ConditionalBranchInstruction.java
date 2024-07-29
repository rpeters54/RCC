package codegen.instruction.llvm;

import codegen.instruction.Instruction;
import codegen.values.Source;

import java.util.Arrays;

public class ConditionalBranchInstruction extends Instruction {

    private final String ifTrue;
    private final String ifFalse;

    public ConditionalBranchInstruction(Source condition, String ifTrue, String ifFalse) {
        super(Arch.LLVM, Arrays.asList(), Arrays.asList(condition));
        this.ifTrue = ifTrue;
        this.ifFalse = ifFalse;
    }

    public String toString() {
        return String.format("br i1 %s, label %%l%s, label %%l%s", getSource(0), ifTrue, ifFalse);
    }
}
