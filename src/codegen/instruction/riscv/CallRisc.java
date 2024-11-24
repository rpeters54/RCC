package codegen.instruction.riscv;

import codegen.values.Register;

import java.util.ArrayList;
import java.util.Arrays;

public class CallRisc extends RiscInstruction {

    private final String name;

    public CallRisc(String name) {
        super(new ArrayList<>(Register.TemporaryRiscRegisters()), new ArrayList<>(Register.TemporaryRiscRegisters()));
        this.name = name;
    }

    @Override
    public String toString() {
        return String.format("call %s", name);
    }
}
