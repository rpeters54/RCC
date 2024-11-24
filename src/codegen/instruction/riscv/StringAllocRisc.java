package codegen.instruction.riscv;

import java.util.ArrayList;
import java.util.List;

public class StringAllocRisc extends RiscInstruction {

    private final String label;
    private final String value;

    public StringAllocRisc(String label, String value) {
        super(new ArrayList<>(), new ArrayList<>());
        this.label = label;
        this.value = value;
    }

    @Override
    public String toString() {
        return label+":\n\t.asciz " + value;
    }
}
