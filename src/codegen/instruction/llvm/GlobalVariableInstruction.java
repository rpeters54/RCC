package codegen.instruction.llvm;

import ast.types.Type;
import codegen.instruction.Instruction;
import codegen.values.Register;
import codegen.values.Source;

import java.util.Arrays;
import java.util.List;

public class GlobalVariableInstruction extends Instruction {

    private final Type variableType;

    public GlobalVariableInstruction(Register result, Type type) {
        super(Arch.LLVM, Arrays.asList(result), Arrays.asList());
        variableType = type;
    }

    @Override
    public String toString() {
        return String.format("%s = global %s zeroinitializer", result(), variableType);
    }
}
