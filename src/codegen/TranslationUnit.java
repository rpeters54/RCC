package codegen;

import ast.TypeEnvironment;
import ast.types.StructType;
import ast.types.UnionType;
import codegen.instruction.Instruction;
import codegen.instruction.llvm.FunctionDeclarationLLVM;
import codegen.instruction.llvm.Global;
import codegen.instruction.llvm.LLVMInstruction;
import codegen.values.Register;

import java.io.*;
import java.util.*;

public class TranslationUnit {

    private final BasicBlock globalBlock;
    private final TypeEnvironment globalTypeEnvironment;
    private final List<ControlFlowGraph> controlFlowGraphs;
    private final List<String> functionNames;

    public TranslationUnit(TypeEnvironment globalTypeEnvironment) {
        this.globalBlock = new BasicBlock();
        this.globalTypeEnvironment = globalTypeEnvironment;
        this.controlFlowGraphs = new ArrayList<>();
        this.functionNames = new ArrayList<>();
    }

    public TranslationUnit() {
        this.globalBlock = new BasicBlock();
        this.globalTypeEnvironment = new TypeEnvironment();
        this.controlFlowGraphs = new ArrayList<>();
        this.functionNames = new ArrayList<>();
    }

    public BasicBlock getGlobalBlock() {
        return globalBlock;
    }

    public TypeEnvironment getGlobalTypeEnvironment() {
        return globalTypeEnvironment;
    }

    public List<ControlFlowGraph> getControlFlowGraphs() {
        return Collections.unmodifiableList(controlFlowGraphs);
    }

    public void addControlFlowGraph(ControlFlowGraph controlFlowGraph) {
        functionNames.add(controlFlowGraph.getDefinition().declaration().name());
        controlFlowGraphs.add(controlFlowGraph);
    }

    /*
    Output Functions
     */

    public void generateLLFile(String filePath) {
        try(BufferedWriter out=new BufferedWriter(new OutputStreamWriter(new FileOutputStream(filePath)))){
            for (StructType struct : globalTypeEnvironment.getStructs()) {
                out.write(struct.header());
                out.newLine();
            }
            for (UnionType union : globalTypeEnvironment.getUnions()) {
                out.write(union.header());
                out.newLine();
            }
            for (Instruction inst : globalBlock.getAllInstructions()) {
                switch (inst) {
                    case FunctionDeclarationLLVM fd -> {
                        if (!functionNames.contains(fd.name())) {
                            out.write(inst.toString());
                        }
                    }
                    case null -> throw new RuntimeException("null instruction");
                    default -> out.write(inst.toString());
                }
                out.newLine();
            }
            for (ControlFlowGraph controlFlowGraph : controlFlowGraphs) {
                for (String line : controlFlowGraph.sprintInstructions()) {
                    out.write(line);
                    out.newLine();
                }
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public void generateRiscFile(String filePath) {
        try(BufferedWriter out=new BufferedWriter(new OutputStreamWriter(new FileOutputStream(filePath)))){
            out.write(".section .text\n");
            for (ControlFlowGraph controlFlowGraph : controlFlowGraphs) {
                for (String line : controlFlowGraph.sprintInstructions()) {
                    out.write(line);
                    out.newLine();
                }
            }
            out.write(".section .data\n");
            for (Instruction inst : globalBlock.getAllInstructions()) {
                out.write(inst.toString());
                out.newLine();
            }

        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public void generateDotFile(String filePath) {
        try(BufferedWriter out=new BufferedWriter(new OutputStreamWriter(new FileOutputStream(filePath)))){
            out.write("digraph G {\n");
            out.write(String.format(
               "node [shape=box]\n"
            ));
            for (ControlFlowGraph controlFlowGraph : controlFlowGraphs) {
                controlFlowGraph.generateDotFile(out);
            }
            out.write("}\n");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public void pruneRedundantPhis() {
        for (ControlFlowGraph cfg : controlFlowGraphs) {
            cfg.pruneRedundantPhis();
        }
    }


//    public void constantPropagation() {
//        for (ControlFlowGraph cfg : controlFlowGraphs) {
//            cfg.constantPropagation();
//        }
//    }

    public void deadCodeElimination() {
        for (ControlFlowGraph cfg : controlFlowGraphs) {
            cfg.deadCodeElimination();
            cfg.hoistBranches();
        }
    }

    public void bubbleAllocas() {
        for (ControlFlowGraph cfg : controlFlowGraphs) {
            ControlFlowGraph.bubbleAllocas(cfg);
        }
    }


    /*
    Register Allocation Functions
     */

    /**
     * Takes a well-formed translation unit containing LLVM instructions and converts
     * all instructions to their RISCV64 equivalents.
     */
    public TranslationUnit toRisc() {
        TranslationUnit result = new TranslationUnit();
        List<Instruction> riscGlobals = result.getGlobalBlock().getMutableInstructions();
        Map<Register, String> globalLabelMap = new HashMap<>();
        for (Instruction instruction : globalBlock.getAllInstructions()) {
            if (Objects.requireNonNull(instruction) instanceof Global ll) {
                riscGlobals.addAll(ll.genHeader(globalLabelMap));
            } else {
                throw new IllegalStateException("invalid instruction type");
            }
        }
        for (ControlFlowGraph cfg : controlFlowGraphs) {
            ControlFlowGraph risc = ControlFlowGraph.generatePseudoRisc(cfg, globalLabelMap);
            ControlFlowGraph.allocateRegisters(risc);
            result.addControlFlowGraph(risc);
        }
        return result;
    }

}
