package codegen.instruction.riscv;

import codegen.instruction.Instruction;
import codegen.values.Register;

import java.util.List;

public abstract class RiscInstruction extends Instruction {

    protected RiscInstruction(List<Register> results, List<Register> rvalues) {
        super(results, rvalues);
    }
}
