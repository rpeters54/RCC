package codegen.instruction.llvm;

import codegen.instruction.Instruction;
import codegen.values.Register;
import codegen.values.Source;

import java.util.Arrays;

public class UnconditionalBranchInstruction extends Instruction implements JumpInstruction {
    private String label;

    public UnconditionalBranchInstruction(String label) {
        super(Instruction.Arch.LLVM, Arrays.asList(), Arrays.asList());
        this.label = label;
    }

    public String label() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public String toString() {
        return String.format("br label %%l%s", label);
    }
}
