package codegen.instruction.llvm;

import ast.types.CompoundType;
import ast.types.Type;
import codegen.instruction.Instruction;
import codegen.values.Register;
import codegen.values.Source;

import java.util.Arrays;
import java.util.List;

public class CallInstruction extends Instruction {

    private final String name;

    public CallInstruction(Register result, List<Source> arguments, String name) {
        super(Arch.LLVM, Arrays.asList(result), arguments);
        this.name = name;
    }

    @Override
    public String toString() {
        StringBuilder builder = new StringBuilder();
        builder.append(String.format("%s = call %s @%s(", getResult(), getResult().type(), name));
        for (Source source : getSources()) {
            builder.append(String.format("%s %s, ", source.type(), source));
        }
        if (!getSources().isEmpty()) {
            builder.delete(builder.length() - 2, builder.length());
        }
        builder.append(")");
        return builder.toString();
    }
}
