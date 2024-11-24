package codegen.instruction.riscv;

import codegen.values.Register;

import java.util.ArrayList;
import java.util.Arrays;

public class LoadAddressRisc extends RiscInstruction {

    private final String name;

    public LoadAddressRisc(Register result, String name) {
        super(Arrays.asList(result), new ArrayList<>());
        this.name = name;
    }

    @Override
    public String toString() {
        return String.format("la %s, %s", result(), name);
    }
}
