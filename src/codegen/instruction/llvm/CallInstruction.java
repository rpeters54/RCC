package codegen.instruction.llvm;

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

    public CallInstruction(List<Source> arguments, String name) {
        super(Arch.LLVM, Arrays.asList(), arguments);
        this.name = name;
    }

    @Override
    public String toString() {
        StringBuilder builder = new StringBuilder();
        if (results().isEmpty()) {
            builder.append(String.format("call void @%s(", name));
        } else {
            builder.append(String.format("%s = call %s @%s(", result(), result().type(), name));
        }
        for (Source source : sources()) {
            builder.append(String.format("%s %s, ", source.type(), source));
        }
        if (!sources().isEmpty()) {
            builder.delete(builder.length() - 2, builder.length());
        }
        builder.append(")");
        return builder.toString();
    }
}
