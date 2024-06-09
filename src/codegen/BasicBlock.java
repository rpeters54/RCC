package codegen;

import codegen.instruction.Instruction;
import codegen.values.Source;

import java.util.*;

public class BasicBlock {

    private final List<Instruction> instructions;
    private final Map<String, Source> blockEnv;
    private final List<BasicBlock> parents;
    private final List<BasicBlock> children;

    public BasicBlock() {
        this.instructions = new LinkedList<>();
        this.blockEnv = new HashMap<>();
        this.parents = new ArrayList<>();
        this.children = new ArrayList<>();
    }

    public void addBinding(String name, Source source) {
        blockEnv.put(name, source);
    }

    public Source getBinding(String name) {
         Source retval = blockEnv.get(name);
         if (retval == null) {
             throw new RuntimeException("BasicBlock::getBinding: Binding " + name + " not found");
         }
         return retval;
    }

    public void addInstruction(Instruction instruction) {
        this.instructions.add(instruction);
    }

    public void dropInstruction(int i) {
        this.instructions.remove(i);
    }

    public List<Instruction> getAllInstructions() {
        return instructions;
    }
}
