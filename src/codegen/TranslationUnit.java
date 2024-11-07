package codegen;

import ast.TypeEnvironment;
import ast.types.StructType;
import ast.types.UnionType;
import codegen.instruction.Instruction;
import codegen.instruction.llvm.FunctionDeclaration;
import codegen.values.Register;
import org.jgrapht.Graph;
import org.jgrapht.graph.DefaultEdge;

import javax.naming.ldap.Control;
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
                    case FunctionDeclaration fd -> {
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


    public void constantPropagation() {
        for (ControlFlowGraph cfg : controlFlowGraphs) {
            cfg.constantPropagation();
        }
    }

    public void deadCodeElimination() {
        for (ControlFlowGraph cfg : controlFlowGraphs) {
            cfg.deadCodeElimination();
            cfg.hoistBranches();
        }
    }


    /*
    Register Allocation Functions
     */

    public void allocateRegisters() {
        for (ControlFlowGraph cfg : this.getControlFlowGraphs()) {
            Map<BasicBlock, Set<Register>> liveout = cfg.computeLiveRange();
            Graph<Register, DefaultEdge> iGraph = cfg.buildInterferenceGraph(liveout);
        }
    }
}
