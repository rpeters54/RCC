package codegen.instruction;

import codegen.values.Register;
import codegen.values.Source;

import java.util.List;

public abstract class Instruction {

    private final Arch arch;
    private final List<Register> results;
    private final List<Source> sources;

    protected Instruction(Arch arch, List<Register> results, List<Source> sources) {
        this.arch = arch;
        this.results = results;
        this.sources = sources;
    }

    public List<Register> getResults() {
        return results;
    }

    public Register getResult() {
        if (!results.isEmpty()) {
            return results.getFirst();
        } else {
            throw new RuntimeException("Instruction::getResult: Can't get result from empty list");
        }
    }

    public void addResult(Register result) {
        results.add(result);
    }

    public List<Source> getSources() {
        return sources;
    }

    public Source getSource(int i) {
        return sources.get(i);
    }

    public void addSource(Source source) {
        sources.add(source);
    }

    protected enum Arch {
        LLVM, RISCV
    }
}
