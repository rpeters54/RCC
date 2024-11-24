package codegen.instruction.riscv;

import codegen.values.Register;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class DataAllocRisc extends RiscInstruction {

    private final String label;
    private final long size;

    public DataAllocRisc(String label, long size) {
        super(new ArrayList<>(), new ArrayList<>());
        this.label = label;
        this.size = size;
    }

    @Override
    public String toString() {
        return label+":\n\t.zero " + size;
    }
}
