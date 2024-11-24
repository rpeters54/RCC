package codegen.instruction.llvm;

import ast.types.PointerType;
import codegen.instruction.Instruction;
import codegen.values.Register;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class AllocaLLVM extends LLVMInstruction {

    public AllocaLLVM(Register location) {
        super(Arrays.asList(location), new ArrayList<>());
    }

    @Override
    public String toString() {

        String deref = switch (result().type()) {
            case PointerType pt -> pt.base().toString();
            case null, default -> throw new RuntimeException("AllocaInstruction::toString: invalid location, must be CompoundType");
        };

        return String.format("%s = alloca %s", result(), deref);
    }

    @Override
    public List<Instruction> toRisc(List<Register> localResults, List<Register> localRvalues) {
        return List.of(this);
    }
}