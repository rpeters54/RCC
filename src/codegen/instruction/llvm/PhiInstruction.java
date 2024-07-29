package codegen.instruction.llvm;

import codegen.instruction.Instruction;
import codegen.values.Register;
import codegen.values.Source;
import org.antlr.v4.runtime.misc.Pair;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class PhiInstruction extends Instruction {

    private List<String> labels;

    public PhiInstruction() {
        super(Arch.LLVM, new ArrayList<>(), new ArrayList<>());
        this.labels = new ArrayList<>();
    }

    public PhiInstruction(Register result, List<String> labels, List<Source> sources) {
        super(Arch.LLVM, Arrays.asList(result), sources);
        this.labels = labels;
    }

    public void addLabel(String label) {
        labels.add(label);
    }

    @Override
    public String toString() {
        String start = String.format("%s = phi %s ", getResult(), getResult().type());
        StringBuilder builder = new StringBuilder(start);
        for (int i = 0; i < getSources().size(); i++) {
            String memberString = String.format("[%s, %%l%s], ",
                    getSource(i),
                    labels.get(i));
            builder.append(memberString);
        }
        builder.delete(builder.length()-2, builder.length());
        return builder.toString();
    }
}
