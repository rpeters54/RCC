package codegen.instruction.llvm;

import ast.types.Type;
import codegen.instruction.Instruction;
import codegen.instruction.riscv.DataAllocRisc;
import codegen.instruction.riscv.StringAllocRisc;
import codegen.values.Register;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

public class GlobalVariableLLVM extends LLVMInstruction implements Global {

    private final Type variableType;
    private final String name;

    public GlobalVariableLLVM(Register result, String name, Type type) {
        super(Arrays.asList(result), Arrays.asList());
        variableType = type;
        this.name = name;
    }

    @Override
    public String toString() {
        return String.format("%s = global %s zeroinitializer", result(), variableType);
    }

    @Override
    public List<Instruction> toRisc(List<Register> localResults, List<Register> localRvalues) {
        throw new RuntimeException("Can't generate instructions for global header");
    }

    @Override
    public List<Instruction> genHeader(Map<Register, String> globalLabelMap) {
        globalLabelMap.put(result(), name);
        return List.of(new DataAllocRisc(name, variableType.sizeof()));
    }
}
