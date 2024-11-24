package codegen.instruction;

import codegen.values.Register;

import java.util.Collections;
import java.util.List;
import java.util.Map;

public abstract class Instruction {

    private final List<Register> results;
    private final List<Register> rvalues;

    protected Instruction(List<Register> results, List<Register> rvalues) {
        this.results = results;
        this.rvalues = rvalues;
    }

    public List<Register> results() {
        return Collections.unmodifiableList(results);
    }

    public Register result() {
        if (!results.isEmpty()) {
            return results.getFirst();
        } else {
            throw new RuntimeException("Instruction::getResult: Can't get result from empty list");
        }
    }

    public void setResult(int index, Register result) {
        results.set(index, result);
    }

    public void addResult(Register result) {
        results.add(result);
    }

    public List<Register> rvalues() {
        return Collections.unmodifiableList(rvalues);
    }

    public Register rvalue(int i) {
        return rvalues.get(i);
    }

    public void addRValue(Register register) {
        rvalues.add(register);
    }

    public void setRvalue(int index, Register register) {
        rvalues.set(index, register);
    }

    protected enum Arch {
        LLVM, RISCV
    }
}
