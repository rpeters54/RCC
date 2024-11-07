package codegen.instruction.llvm;

import codegen.instruction.Instruction;
import codegen.values.Register;
import codegen.values.Source;

import java.util.*;

public class PhiInstruction extends Instruction {

    public record PhiTuple(String label, Source source) {}

    private final List<PhiTuple> values;

    public PhiInstruction() {
        super(Arch.LLVM, new ArrayList<>(), new ArrayList<>());
        this.values = new ArrayList<>();
    }

    public PhiInstruction(Register result, List<String> labels, List<Source> sources) {
        super(Arch.LLVM, Arrays.asList(result), new ArrayList<>());
        values = new ArrayList<>();
        for (int i = 0; i < labels.size(); i++) {
            values.add(new PhiTuple(labels.get(i),sources.get(i)));
        }
    }

    public List<PhiTuple> mutableValues() {
        return values;
    }

    public List<String> labels() {
        return values.stream().map(PhiTuple::label).toList();
    }

    @Override
    public List<Source> sources() {
        return values.stream().map(PhiTuple::source).toList();
    }

    @Override
    public Source source(int i) {
        return values.get(i).source;
    }

    @Override
    public void addSource(Source source) {
        values.add(new PhiTuple("label",source));
    }

    @Override
    public void setSource(int index, Source source) {
        values.set(index, new PhiTuple(values.get(index).label ,source));
    }

    public void addValue(String label, Source source) {
        values.add(new PhiTuple(label,source));
    }


    /**
     * Clears and refills the labels and sources list of a phi node
     * Used to mend temporary phis that were placed at the start of an unsealed block.
     * @param labels List of new block labels
     * @param sources List of new sources
     */
    public void refresh(List<String> labels, List<Source> sources) {
        values.clear();
        for (int i = 0; i < labels.size(); i++) {
            values.add(new PhiTuple(labels.get(i),sources.get(i)));
        }
    }

    /**
     * If all sources are the same, collapse the node to one source
     * Used when pruning redundant phis
     */
    public Source collapse() {
        Set<PhiTuple> tupleSet = new HashSet<>(values);
        if (tupleSet.size() == 1) {
            PhiTuple tuple = values.getFirst();

            // clear the source and label list
            values.clear();

            // add the remaining source and label

            values.add(tuple);

            return tuple.source;
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
                    values.get(i).source,
                    values.get(i).label);
            builder.append(memberString);
        }
        builder.delete(builder.length()-2, builder.length());
        return builder.toString();
    }
}
