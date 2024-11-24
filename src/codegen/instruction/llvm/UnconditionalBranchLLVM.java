package codegen.instruction.llvm;

import codegen.instruction.Instruction;
import codegen.instruction.Jump;
import codegen.instruction.riscv.JumpRisc;
import codegen.values.Register;

import java.util.Arrays;
import java.util.List;

public class UnconditionalBranchLLVM extends LLVMInstruction implements Jump {
    private String label;

    public UnconditionalBranchLLVM(String label) {
        super(Arrays.asList(), Arrays.asList());
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

    @Override
    public List<Instruction> toRisc(List<Register> localResults, List<Register> localRvalues) {
        return List.of(new JumpRisc(label));
    }

}
