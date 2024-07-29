package codegen.instruction.llvm;

import ast.types.CompoundType;
import codegen.instruction.Instruction;
import codegen.values.Register;

import java.util.Arrays;

public class AllocaInstruction extends Instruction {

    public AllocaInstruction(Register location) {
        super(Arch.LLVM, Arrays.asList(location), Arrays.asList());
    }

    @Override
    public String toString() {

        String deref = switch (getResult().type()) {
            case CompoundType compound -> compound.getBase().toString();
            case null, default -> throw new RuntimeException("AllocaInstruction::toString: invalid location, must be CompoundType");
        };

        return String.format("%s = alloca %s", getResult(), deref);
    }
}