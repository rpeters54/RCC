package codegen.instruction.riscv;

import codegen.values.Register;

import java.util.ArrayList;

public class UseAllRisc extends RiscInstruction {

    public UseAllRisc() {
        super(new ArrayList<>(), new ArrayList<>());
        rvalues().addAll(Register.IntRiscRegisters());
        rvalues().addAll(Register.FloatRiscRegisters());
        rvalues().add(Register.RiscSp());
        rvalues().add(Register.RiscFp());
        rvalues().add(Register.RiscRa());
    }

    @Override
    public String toString() {
        return "";
    }
}
