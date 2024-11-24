package codegen.instruction.llvm;

import codegen.instruction.Instruction;
import codegen.instruction.riscv.LoadAddressRisc;
import codegen.values.Register;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public abstract class LLVMInstruction extends Instruction {

    protected LLVMInstruction(List<Register> results, List<Register> sources) {
        super(results, sources);
    }

    public List<Instruction> toRiscWithGlobals(Map<Register, String> globalRegToLabelMap) {
        List<Instruction> risc = new ArrayList<>();
        List<Register> rvalues = new ArrayList<>(rvalues());
        List<Register> results = new ArrayList<>(results());
        for (int i = 0; i < rvalues.size(); i++) {
            Register rvalue = rvalues.get(i);
            if (rvalue.global()) {
                Register localTemp = Register.LLVM_Register(rvalue.type());
                String name = globalRegToLabelMap.get(rvalue);
                risc.add(new LoadAddressRisc(localTemp, name));
                rvalues.set(i, localTemp);
            }
        }
        for (int i = 0; i < results.size(); i++) {
            Register result = results.get(i);
            if (result.global()) {
                Register localTemp = Register.LLVM_Register(result.type());
                String name = globalRegToLabelMap.get(result);
                risc.add(new LoadAddressRisc(localTemp, name));
                rvalues.set(i, localTemp);
            }
        }
        risc.addAll(toRisc(results, rvalues));
        return risc;
    }

    public abstract List<Instruction> toRisc(List<Register> localResults, List<Register> localRvalues);
}
