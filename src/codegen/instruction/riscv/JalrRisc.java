package codegen.instruction.riscv;

import codegen.values.Register;

import java.util.ArrayList;
import java.util.Arrays;

public class JalrRisc extends RiscInstruction {


    public JalrRisc(Register ptr) {
        super(new ArrayList<>(Register.TemporaryRiscRegisters()), new ArrayList<>(Register.TemporaryRiscRegisters()));
        addRValue(ptr);
    }

    @Override
    public String toString() {
        return String.format("jalr %s", rvalues().getLast());
    }
}
