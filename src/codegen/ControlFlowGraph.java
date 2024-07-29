package codegen;

import ast.TypeEnvironment;
import ast.declarations.Declaration;
import ast.declarations.DeclarationSpecifier;
import ast.declarations.FunctionDefinition;
import ast.types.FunctionType;
import ast.types.Type;
import codegen.instruction.Instruction;
import codegen.instruction.llvm.PhiInstruction;
import codegen.instruction.llvm.ReturnInstruction;
import codegen.instruction.llvm.UnconditionalBranchInstruction;
import codegen.values.Register;
import codegen.values.Source;
import org.antlr.v4.runtime.misc.Pair;
import org.jgrapht.Graph;
import org.jgrapht.graph.DefaultDirectedGraph;
import org.jgrapht.graph.DefaultEdge;
import org.jgrapht.graph.DefaultUndirectedGraph;


import java.io.BufferedWriter;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.util.*;
import java.util.stream.Collectors;

/**
 * Represents the Control Flow Graph of a Function
 */

public class ControlFlowGraph {

    private final Graph<BasicBlock, DefaultEdge> graph;
    private final List<BasicBlock> topologicalList;
    private final TypeEnvironment localEnvironment;
    private final FunctionDefinition definition;
    private final Register.Arch arch;

    private final List<Register> parameters;

    private Optional<PhiInstruction> returnPhi;
    private BasicBlock returnBlock;

    public ControlFlowGraph(TypeEnvironment localEnvironment, FunctionDefinition definition) {
        this.graph = new DefaultDirectedGraph<>(DefaultEdge.class);
        this.topologicalList = new ArrayList<>();
        this.localEnvironment = localEnvironment;
        this.definition = definition;
        this.arch = Register.Arch.LLVM;

        this.parameters = new ArrayList<>();

        this.returnPhi = Optional.empty();
        this.returnBlock = new BasicBlock();
        graph.addVertex(returnBlock);
    }

    public boolean addBlock(BasicBlock basicBlock) {
        topologicalList.add(basicBlock);
        return graph.addVertex(basicBlock);
    }

    public boolean removeBlock(BasicBlock basicBlock) {
        topologicalList.remove(basicBlock);
        return graph.removeVertex(basicBlock);
    }

    public Optional<Set<BasicBlock>> blockSuccessors(BasicBlock basicBlock) {
        if (!graph.containsVertex(basicBlock)) {
            return Optional.empty();
        }

        return Optional.of(
                graph.outgoingEdgesOf(basicBlock).stream()
                        .map(graph::getEdgeTarget)
                        .collect(Collectors.toUnmodifiableSet())
        );
    }

    public Optional<Set<BasicBlock>> blockPredecessors(BasicBlock basicBlock) {
        if (!graph.containsVertex(basicBlock)) {
            return Optional.empty();
        }

        return Optional.of(
                graph.incomingEdgesOf(basicBlock).stream()
                        .map(graph::getEdgeSource)
                        .collect(Collectors.toUnmodifiableSet())
        );
    }

    public boolean addEdge(BasicBlock from, BasicBlock to) {
        DefaultEdge e = graph.addEdge(from, to);
        return e != null;
    }

    public List<BasicBlock> getTopologicalList() {
        return Collections.unmodifiableList(topologicalList);
    }

    public TypeEnvironment getLocalEnvironment() {
        return localEnvironment;
    }

    /*
    Handling Parameters
     */

    public void addParameter(Register param) {
        parameters.add(param);
    }


    /*
    Handling Return Values and Blocks
     */

    public Optional<PhiInstruction> getReturnPhi() {
        return returnPhi;
    }

    public void addReturnValue(String label, Source value) {
        if (returnPhi.isPresent()) {
            PhiInstruction instruction = returnPhi.get();
            instruction.addSource(value);
            instruction.addLabel(label);
        } else {
            PhiInstruction instruction = new PhiInstruction();
            instruction.addSource(value);
            instruction.addLabel(label);
            returnPhi = Optional.of(instruction);
        }
    }

    public void declareReturnRegister(Register result) {
        if (returnPhi.isPresent()) {
            PhiInstruction instruction = returnPhi.get();
            instruction.addResult(result);
        } else {
            PhiInstruction instruction = new PhiInstruction();
            instruction.addResult(result);
            returnPhi = Optional.of(instruction);
        }
    }

    public String getReturnLabel() {
        return returnBlock.getLabel();
    }

    public void linkReturnBlock(BasicBlock block) {
        addEdge(block, returnBlock);
    }

    public void placeReturnBlock() {
        returnPhi.ifPresentOrElse(
                phiInstruction -> {
                    returnBlock.addInstruction(phiInstruction);
                    returnBlock.addInstruction(new ReturnInstruction(phiInstruction.getResult().clone()));
                },
                () -> {
                    returnBlock.addInstruction(new ReturnInstruction());
                });
        topologicalList.add(returnBlock);
    }

    /*
    Output Functions
     */

    public void printInstructions() {
        Type type = definition.getDeclaration().getDeclSpec().getType();
        assert type instanceof FunctionType;

        String header = "N/A";
        String close = "N/A";
        switch(arch) {
            case LLVM -> {
                StringBuilder sb = new StringBuilder();
                sb.append(String.format("define %s @%s(", ((FunctionType) type).getReturnType(),
                        definition.getDeclaration().getName()));
                List<Type> inputTypes = ((FunctionType) type).getInputTypes().stream()
                        .map(Declaration::getDeclSpec)
                        .map(DeclarationSpecifier::getType)
                        .toList();
                for (Register param : parameters) {
                    sb.append(String.format("%s %s, ", param.type(), param));
                }
                if (!inputTypes.isEmpty()) {
                    sb.delete(sb.length() - 2, sb.length());
                }
                sb.append(") {");
                header = sb.toString();

                close = "}";
            }
            case RISC -> {
                throw new RuntimeException("Not implemented yet");
            }
        }

        System.out.println(header);
        for (BasicBlock block : topologicalList) {
            block.printInstructions();
        }
        System.out.println(close);
    }

    public void generateDotFile(String filePath) {
        try(BufferedWriter out=new BufferedWriter(new OutputStreamWriter(new FileOutputStream("g.dot")))){

            for (BasicBlock block : topologicalList) {
                block.printInstructions();
            }

        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    /*
    Basic Block Traversal
     */

    public void generatePhis(BasicBlock start) {
        if (!graph.containsVertex(start)) {
            throw new RuntimeException("ControlFlowGraph::generatePhis: called with a non existent block");
        }

        Set<BasicBlock> predecessors = this.blockPredecessors(start).get();
        Set<String> keySet = new HashSet<>();
        for (BasicBlock predecessor : predecessors) {
            keySet.addAll(predecessor.getBindings().keySet());
        }

        List<String> keyList = new ArrayList<>(keySet);
        List<PhiInstruction> phis = new ArrayList<>();
        for (String key : keyList) {
            List<String> labels = new ArrayList<>();
            List<Source> sources = new ArrayList<>();
            for (BasicBlock predecessor : predecessors) {
                Pair<String, Source> pair = findPreviousDefinitions(predecessor, key);
                labels.add(pair.a);
                sources.add(pair.b);
            }
            Type regType = sources.getFirst().type();
            Register result = Register.LLVM_Register(regType.clone());
            phis.add(new PhiInstruction(result, labels, sources));
        }

        for (int i = 0; i < phis.size(); i++) {
            PhiInstruction phi = phis.get(i);
            String name = keyList.get(i);
            start.addBinding(name, phi.getResult().clone());
            start.addInstruction(phi);
        }
    }

    public Pair<String, Source> findPreviousDefinitions(BasicBlock start, String name) {
        if (!graph.containsVertex(start)) {
            throw new RuntimeException("ControlFlowGraph::findPreviousDefinitions: called with a non existent block");
        }

        Source bound = start.getBinding(name);
        if (bound == null) {
            for (BasicBlock predecessor : this.blockPredecessors(start).get()) {
                Pair<String, Source> pair = findPreviousDefinitions(predecessor, name);
                if (pair != null) {
                    bound = pair.b;
                    break;
                }
            }
        }

        return new Pair<>(start.getLabel(), bound);
    }


    /*
    Register Allocation Functions
     */

    /**
     * For each BasicBlock in a program, compute the pseudo registers that are live
     * at the end of the basic block
     * @return Map[BasicBlock, Set[Register]] that associates BasicBlocks with their respective live register set
     */
    public Map<BasicBlock, Set<Register>> computeLiveRange() {
        boolean changed = true;
        Map<BasicBlock, Set<Register>> liveOutMap = new HashMap<>();
        while (changed) {
            changed = false;
            for (int i = topologicalList.size()-1; i >= 0; i--) {
                BasicBlock current = topologicalList.get(i);
                Set<Register> currentSet = liveOutMap.get(current);
                Set<Register> newSet = current.liveout(liveOutMap, blockSuccessors(current).get());
                if (!newSet.equals(currentSet)) {
                    liveOutMap.put(current, newSet);
                    changed = true;
                }
            }
        }
        return liveOutMap;
    }

    /**
     * Constructs an interference graph, where each node is a pseudo-register
     * and edges between the nodes represent concurrent use
     * @param livemap Map[BasicBlock, Set[Register]] that associates BasicBlocks with their respective live register set
     * @return Graph[Register] that contains all pseudo-register nodes and the conflict edges between them
     */
    public Graph<Register, DefaultEdge> buildInterferenceGraph(Map<BasicBlock, Set<Register>> livemap) {
        // construct the base graph
        Graph<Register, DefaultEdge> iGraph = new DefaultUndirectedGraph<>(DefaultEdge.class);

        for (BasicBlock block : this.getTopologicalList()) {
            Set<Register> liveset = livemap.get(block);
            // for each instruction in the block, from bottom to top
            for (int i = block.getAllInstructions().size()-1; i >= 0; i--) {
                Instruction instruction = block.getAllInstructions().get(i);

                // collect the instruction's source and result registers
                List<Register> results = instruction.getResults();
                List<Register> sources = instruction.getSources().stream()
                        .filter(item -> item instanceof Register)
                        .map(item -> (Register) item)
                        .toList();

                // add an interference edge between the current live values and the result
                for (Register result : results) {
                    iGraph.addVertex(result);
                    for (Register liveReg : liveset) {
                        iGraph.addVertex(liveReg);
                        if (!liveReg.equals(result))
                            iGraph.addEdge(result, liveReg);
                    }
                }
                // remove all the current result registers from the live set
                results.forEach(liveset::remove);
                // add all sources to the live set
                liveset.addAll(sources);
            }
        }
        return iGraph;
    }

}
