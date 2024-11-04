package codegen;

import codegen.instruction.Instruction;
import codegen.instruction.llvm.ConditionalBranchInstruction;
import codegen.instruction.llvm.PhiInstruction;
import codegen.instruction.llvm.ReturnInstruction;
import codegen.instruction.llvm.UnconditionalBranchInstruction;
import codegen.values.Register;
import codegen.values.Source;

import java.util.*;

public class BasicBlock {

    private static long BASIC_BLOCK_COUNT = 0;

    private final List<Instruction> instructions;
    private final Map<String, Source> blockEnv;
    private final String label;

    public BasicBlock() {
        this.instructions = new LinkedList<>();
        this.blockEnv = new HashMap<>();
        this.label = ""+BASIC_BLOCK_COUNT++;
    }

    public BasicBlock(BasicBlock parent) {
        this.instructions = new LinkedList<>();
        this.blockEnv = new HashMap<>(parent.blockEnv);
        this.label = ""+BASIC_BLOCK_COUNT++;
    }

    /*
    Getters and Setters
     */

    public static void ResetCount() {
        BASIC_BLOCK_COUNT = 0;
    }

    public void addBinding(String name, Source source) {
        blockEnv.put(name, source);
    }

    public Source getBinding(String name) {
         return blockEnv.get(name);
    }

    public void dropBinding(String name) {
        blockEnv.remove(name);
    }

    public Map<String, Source> getBindings() {
        return Collections.unmodifiableMap(blockEnv);
    }

    public void addInstruction(Instruction instruction) {
        this.instructions.add(instruction);
    }

    public void dropInstruction(int i) {
        this.instructions.remove(i);
    }

    public List<Instruction> getAllInstructions() {
        return Collections.unmodifiableList(instructions);
    }

    public List<Instruction> getMutableInstructions() {
        return instructions;
    }

    public String getLabel() {
        return label;
    }

    public boolean endsWithJump() {
        return !instructions.isEmpty() &&
                (instructions.getLast() instanceof ReturnInstruction
                || instructions.getLast() instanceof UnconditionalBranchInstruction
                || instructions.getLast() instanceof ConditionalBranchInstruction);
    }

    /*
    Output Functions
     */


    public List<String> sprintInstructions() {
        List<String> lines = new ArrayList<>();
        lines.add("l"+label+":");
        for (Instruction instruction : instructions) {
            lines.add("    "+instruction);
        }
        return lines;
    }

    public Set<Register> liveout(Map<BasicBlock, Set<Register>> livemap, Set<BasicBlock> children) {

        Set<Register> liveset = new HashSet<>();

        for (BasicBlock child : children) {
            Set<Register> genSet = new HashSet<>();
            Set<Register> killSet = new HashSet<>();
            Set<Register> outSet = new HashSet<>();

            Set<Register> temp = livemap.get(child);
            if (temp != null) {
                outSet.addAll(temp);
            }

            //TODO: Add check for globals when implemented
            for (Instruction inst : child.instructions) {
                for (Source source : inst.sources()) {
                    // if the source is a register and not in the killset, add it
                    if (source instanceof Register && !killSet.contains(source))
                        genSet.add((Register) source);
                }
                // if the result register is not stored by default, add it to the kill set
                killSet.addAll(inst.results());
            }

            outSet.removeAll(killSet);
            genSet.addAll(outSet);
            liveset.addAll(genSet);
        }
        return liveset;
    }
}

