package codegen.instruction.llvm;

import codegen.instruction.Instruction;
import codegen.instruction.riscv.LoadRisc;
import codegen.values.Register;

import java.util.Arrays;
import java.util.List;

public class LoadLLVM extends LLVMInstruction implements Critical {

    public LoadLLVM(Register result, Register location) {
        super(Arrays.asList(result), Arrays.asList(location));
    }

    @Override
    public String toString() {
        return String.format("%s = load %s, %s %s",
                result(), result().type(),
                rvalue(0).type(), rvalue(0));
    }

    @Override
    public List<Instruction> toRisc(List<Register> localResults, List<Register> localRvalues) {
        return List.of(new LoadRisc(localResults.getFirst(), localRvalues.getFirst()));
    }
}