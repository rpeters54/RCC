package codegen.instruction.riscv;


import codegen.instruction.Jump;

import java.util.ArrayList;
import java.util.List;

public class ReturnRisc extends RiscInstruction implements Jump {

    public ReturnRisc() {
        super(new ArrayList<>(), new ArrayList<>());
    }

    @Override
    public String toString() {
        return "ret";
    }
}
