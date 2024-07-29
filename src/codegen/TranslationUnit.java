package codegen;

import ast.TypeEnvironment;
import codegen.values.Register;
import org.jgrapht.Graph;
import org.jgrapht.graph.DefaultEdge;

import java.io.*;
import java.util.*;

public class TranslationUnit {

    private final BasicBlock globalBlock;
    private final TypeEnvironment globalTypeEnvironment;
    private final List<ControlFlowGraph> controlFlowGraphs;

    public TranslationUnit(TypeEnvironment globalTypeEnvironment) {
        this.globalBlock = new BasicBlock();
        this.globalTypeEnvironment = globalTypeEnvironment;
        this.controlFlowGraphs = new ArrayList<>();
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
        controlFlowGraphs.add(controlFlowGraph);
    }

    /*
    Output Functions
     */

    public void printInstructions() {
        globalBlock.printGlobalData();
        for (ControlFlowGraph controlFlowGraph : controlFlowGraphs) {
            controlFlowGraph.printInstructions();
        }
    }

    public void generateDotFile(String filePath) {
        try(BufferedWriter out=new BufferedWriter(new OutputStreamWriter(new FileOutputStream("g.dot")))){
            out.write("digraph G {\n");

        } catch (IOException e) {
            throw new RuntimeException(e);
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
