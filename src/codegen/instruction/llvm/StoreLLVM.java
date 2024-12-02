package codegen.instruction.llvm;

import codegen.instruction.Instruction;
import codegen.instruction.riscv.StoreRisc;
import codegen.values.Register;

import java.util.Arrays;
import java.util.List;

public class StoreLLVM extends LLVMInstruction implements Critical {

    public StoreLLVM(Register value, Register dest) {
        super(Arrays.asList(), Arrays.asList(value, dest));
    }

    @Override
    public String toString() {
        return String.format("store %s %s, %s %s",
                rvalue(0).type(), rvalue(0),
                rvalue(1).type(), rvalue(1));
    }

    @Override
    public List<Instruction> toRisc(List<Register> localResults, List<Register> localRvalues) {
        return List.of(new StoreRisc(localRvalues.get(0).clone(), localRvalues.get(1).clone(), localRvalues.get(0).type()));
    }
}
