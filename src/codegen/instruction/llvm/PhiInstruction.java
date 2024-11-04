package codegen.instruction.llvm;

import codegen.instruction.Instruction;
import codegen.values.Register;
import codegen.values.Source;

import java.util.*;

public class PhiInstruction extends Instruction {

    private final List<String> labels;

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

    /**
     * Clears and refills the labels and sources list of a phi node
     * Used to mend temporary phis that were placed at the start of an unsealed block.
     * @param labels List of new block labels
     * @param sources List of new sources
     */
    public void refresh(List<String> labels, List<Source> sources) {
        this.labels.clear();
        this.sources().clear();

        this.labels.addAll(labels);
        sources().addAll(sources);
    }

    /**
     * If all sources are the same, collapse the node to one source
     * Used when pruning redundant phis
     */
    public Source collapse() {
        Set<Source> sourceSet = new HashSet<>(sources());
        if (sourceSet.size() == 1) {
            Source first = sources().getFirst();
            String label = labels.getFirst();

            // clear the source and label list
            sources().clear();
            labels.clear();

            // add the remaining source and label
            sources().add(first);
            labels.add(label);

            return first;
        } else {
            return null;
        }
    }

    @Override
    public String toString() {
        String start = String.format("%s = phi %s ", result(), result().type());
        StringBuilder builder = new StringBuilder(start);
        for (int i = 0; i < sources().size(); i++) {
            String memberString = String.format("[%s, %%l%s], ",
                    source(i),
                    labels.get(i));
            builder.append(memberString);
        }
        builder.delete(builder.length()-2, builder.length());
        return builder.toString();
    }
}
