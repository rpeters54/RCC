package codegen.instruction.llvm;

import ast.types.Type;
import codegen.instruction.Instruction;
import codegen.instruction.riscv.DataAllocRisc;
import codegen.instruction.riscv.StringAllocRisc;
import codegen.values.Literal;
import codegen.values.Register;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

public class GlobalVariableLLVM extends LLVMInstruction implements Global {

    private final Type variableType;
    private final String name;
    private final Literal value;

    public GlobalVariableLLVM(Register result, String name, Type type) {
        super(Arrays.asList(result), Arrays.asList());
        variableType = type;
        this.name = name;
        this.value = null;
    }

    public GlobalVariableLLVM(Register result, String name, Type type, Literal value) {
        super(Arrays.asList(result), Arrays.asList());
        variableType = type;
        this.name = name;
        this.value = value;
    }

    @Override
    public String toString() {
        if (value == null) {
            return String.format("%s = global %s zeroinitializer", result(), variableType);
        } else {
            return String.format("%s = global %s %s", result(), variableType, value);
        }
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
