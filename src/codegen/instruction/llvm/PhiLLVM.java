package codegen.instruction.llvm;

import codegen.instruction.Instruction;
import codegen.values.Register;

import java.util.*;

public class PhiLLVM extends LLVMInstruction {

    public record PhiTuple(String label, Register register) {}

    private final List<PhiTuple> values;

    public PhiLLVM() {
        super(new ArrayList<>(), new ArrayList<>());
        this.values = new ArrayList<>();
    }

    public PhiLLVM(Register result, List<String> labels, List<Register> registers) {
        super(Arrays.asList(result), new ArrayList<>());
        values = new ArrayList<>();
        for (int i = 0; i < labels.size(); i++) {
            values.add(new PhiTuple(labels.get(i), registers.get(i)));
        }
    }

    public List<PhiTuple> mutableValues() {
        return values;
    }

    public List<String> labels() {
        return values.stream().map(PhiTuple::label).toList();
    }

    @Override
    public List<Register> rvalues() {
        return values.stream().map(PhiTuple::register).toList();
    }

    @Override
    public Register rvalue(int i) {
        return values.get(i).register;
    }

    @Override
    public void addRValue(Register register) {
        values.add(new PhiTuple("label", register));
    }

    @Override
    public void setRvalue(int index, Register register) {
        values.set(index, new PhiTuple(values.get(index).label,register ));
    }

    public void addValue(String label, Register register) {
        values.add(new PhiTuple(label, register));
    }


    /**
     * Clears and refills the labels and sources list of a phi node
     * Used to mend temporary phis that were placed at the start of an unsealed block.
     * @param labels List of new block labels
     * @param registers List of new registers
     */
    public void refresh(List<String> labels, List<Register> registers) {
        values.clear();
        for (int i = 0; i < labels.size(); i++) {
            values.add(new PhiTuple(labels.get(i),registers.get(i)));
        }
    }

    /**
     * If all sources are the same, collapse the node to one source
     * Used when pruning redundant phis
     */
    public Register collapse() {
        Set<PhiTuple> tupleSet = new HashSet<>(values);
        if (tupleSet.size() == 1) {
            PhiTuple tuple = values.getFirst();

            // clear the source and label list
            values.clear();

            // add the remaining source and label

            values.add(tuple);

            return tuple.register;
        } else {
            return null;
        }
    }

    @Override
    public String toString() {
        String start = String.format("%s = phi %s ", result(), result().type());
        StringBuilder builder = new StringBuilder(start);
        for (int i = 0; i < rvalues().size(); i++) {
            String memberString = String.format("[%s, %%l%s], ",
                    values.get(i).register,
                    values.get(i).label);
            builder.append(memberString);
        }
        builder.delete(builder.length()-2, builder.length());
        return builder.toString();
    }

    @Override
    public List<Instruction> toRisc(List<Register> localResults, List<Register> localRvalues) {
        return List.of(this);
    }
}
