package codegen.instruction.riscv;

import codegen.instruction.Jump;

import java.util.ArrayList;
import java.util.List;

public class JumpRisc extends RiscInstruction implements Jump {

    private final String label;

    public JumpRisc(String label) {
        super(new ArrayList<>(), new ArrayList<>());
        this.label = label;
    }

    public String getLabel() {
        return label;
    }

    @Override
    public String toString() {
        return String.format("j l%s", label);
    }
}
