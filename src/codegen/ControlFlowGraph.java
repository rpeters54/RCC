package codegen;

import ast.TypeEnvironment;
import ast.declarations.Declaration;
import ast.declarations.DeclarationSpecifier;
import ast.declarations.FunctionDefinition;
import ast.types.FunctionType;
import ast.types.Type;
import codegen.instruction.Instruction;
import codegen.instruction.llvm.BinaryInstruction;
import codegen.instruction.llvm.PhiInstruction;
import codegen.instruction.llvm.ReturnInstruction;
import codegen.instruction.riscv.BinaryImmInstruction;
import codegen.values.Register;
import codegen.values.Source;
import org.antlr.v4.runtime.misc.Pair;
import org.jgrapht.Graph;
import org.jgrapht.graph.DefaultDirectedGraph;
import org.jgrapht.graph.DefaultEdge;
import org.jgrapht.graph.DefaultUndirectedGraph;


import java.io.BufferedWriter;
import java.io.IOException;
import java.util.*;
import java.util.stream.Collectors;

/**
 * Represents the Control Flow Graph of a Function
 */

public class ControlFlowGraph {

    // Directed Graph representing the CFG
    private final Graph<BasicBlock, DefaultEdge> graph;
    // List of the blocks within the CFG stored in topological order
    private final List<BasicBlock> topologicalList;
    // Type environment populated during 'verifySemantics' that contains
    // the type information for all locally defined values
    private final TypeEnvironment localEnvironment;

    // function definition corresponding to the CFG
    private final FunctionDefinition definition;
    // enum that tracks what type of instructions IR / RISC are contained
    // inside the CFG
    private final Register.Arch arch;

    // List of registers associated with the parameter variables
    private final List<Register> parameters;

    // Data for handling return values if they exist
    private Optional<PhiInstruction> returnPhi;
    private final BasicBlock returnBlock;

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

    public boolean addBlockOutOfOrder(BasicBlock basicBlock) {
        return graph.addVertex(basicBlock);
    }

    public boolean addBlockToTopologicalList(BasicBlock basicBlock) {
        if (graph.containsVertex(basicBlock) && !topologicalList.contains(basicBlock)) {
            topologicalList.add(basicBlock);
            return true;
        }
        return false;
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

    public FunctionDefinition getDefinition() {
        return definition;
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
                    returnBlock.addInstruction(new ReturnInstruction(phiInstruction.result().clone()));
                },
                () -> {
                    returnBlock.addInstruction(new ReturnInstruction());
                });
        topologicalList.add(returnBlock);
    }

    /*
    Output Functions
     */

    public List<String> sprintInstructions() {
        Type type = definition.declaration().declSpec().getType();
        assert type instanceof FunctionType;

        String header = "N/A";
        String close = "N/A";
        switch(arch) {
            case LLVM -> {
                StringBuilder sb = new StringBuilder();
                sb.append(String.format("define %s @%s(", ((FunctionType) type).returnType(),
                        definition.declaration().name()));
                List<Type> inputTypes = ((FunctionType) type).inputTypes().stream()
                        .map(Declaration::declSpec)
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

        List<String> lines = new ArrayList<>();
        lines.add(header);
        for (BasicBlock block : topologicalList) {
            lines.addAll(block.sprintInstructions());
        }
        lines.add(close);
        return lines;
    }

    public void generateDotFile(BufferedWriter writer) throws IOException {
        for (BasicBlock block : topologicalList) {
            List<String> lines = block.sprintInstructions();
            writer.write("l"+block.getLabel()+" [label=\"");
            for (String line : lines) {
                writer.write(line+"\\l");
            }
            writer.write("\\l\"]\n");
        }
        for (DefaultEdge edge : graph.edgeSet()) {
            BasicBlock source = graph.getEdgeSource(edge);
            BasicBlock target = graph.getEdgeTarget(edge);
            writer.write(String.format("%s -> %s\n", "l"+source.getLabel(), "l"+target.getLabel()));
        }
    }

    /*
    Basic Block Traversal
     */

    /**
     * Given a basic block with 1 or more predecessors, this function generates all necessary phi nodes
     * and places them in the block.
     * @param start The block whose phi nodes are being generated
     */
    public void generatePhis(BasicBlock start) {
        // ensure the block is part of the cfg
        if (!graph.containsVertex(start)) {
            throw new RuntimeException("ControlFlowGraph::generatePhis: called with a non existent block");
        }

        // get the starting block's predecessors
        Optional<Set<BasicBlock>> optPredecessors = this.blockPredecessors(start);
        Set<BasicBlock> predecessors;
        if (optPredecessors.isPresent()) {
            predecessors = optPredecessors.get();
        } else {
            throw new RuntimeException("ControlFlowGraph::generatePhis: starting block has no predecessors");
        }

        // generate phis for each unique binding defined in a predecessor
        Set<String> keySet = new HashSet<>();
        for (BasicBlock predecessor : predecessors) {
            keySet.addAll(predecessor.getBindings().keySet());
        }


        List<String> keyList = new ArrayList<>(keySet);
        List<String> regKeyList = new ArrayList<>();
        List<PhiInstruction> phis = new ArrayList<>();
        for (String key : keyList) {
            Pair<List<String>, List<Source>> definitions = findPreviousDefinitions(start, key);
            TypeEnvironment.StorageLocation location = localEnvironment.getLocation(key);
            assert location != null;

            switch (location) {
                case REGISTER -> {
                    Type regType = definitions.b.getFirst().type();
                    Register result = Register.LLVM_Register(regType.clone());
                    phis.add(new PhiInstruction(result, definitions.a, definitions.b));
                    regKeyList.add(key);
                }
                case STACK -> {
                    Source value = definitions.b.getFirst().clone();
                    start.addBinding(key, value);
                }
            }
        }

        for (int i = 0; i < phis.size(); i++) {
            PhiInstruction phi = phis.get(i);
            String name = regKeyList.get(i);
            start.addBinding(name, phi.result().clone());
            start.addInstruction(phi);
        }
    }


    /**
     * Given a starting block and the name of a value, find all definitions of corresponding to that
     * name the reach the starting block. This function is used by generatePhis to populate phi nodes
     * @param start The starting basic block
     * @param name The value whose reaching definitions are being searched for
     * @return A tuple of lists, with the first containing all the basic block labels and the second containing
     * all values.
     */
    public Pair<List<String>, List<Source>> findPreviousDefinitions(BasicBlock start, String name) {
        Set<BasicBlock> visited = new HashSet<>();
        return findPreviousDefinitionsHelper(start, name, visited);
    }

    public Pair<List<String>, List<Source>> findPreviousDefinitionsHelper(BasicBlock start, String name, Set<BasicBlock> visited) {

        if (!graph.containsVertex(start)) {
            throw new RuntimeException("ControlFlowGraph::findPreviousDefinitions: called with a non existent block");
        }

        // get the starting block's predecessors
        Optional<Set<BasicBlock>> optPredecessors = this.blockPredecessors(start);
        Set<BasicBlock> predecessors;
        if (optPredecessors.isPresent()) {
            predecessors = optPredecessors.get();
        } else {
            throw new RuntimeException("ControlFlowGraph::findPreviousDefinitions: starting block has no predecessors");
        }

        Pair<List<String>, List<Source>> result = new Pair<>(new ArrayList<>(), new ArrayList<>());
        for (BasicBlock predecessor : predecessors) {
            if (!visited.contains(predecessor)) {
                visited.add(predecessor);
                Source value = predecessor.getBinding(name);
                if (value == null) {
                    Pair<List<String>, List<Source>> inner = findPreviousDefinitionsHelper(predecessor, name, visited);
                    for (int i = 0; i < inner.a.size(); i++) {
                        result.a.add(predecessor.getLabel());
                    }
                    result.b.addAll(inner.b);
                } else {
                    result.a.add(predecessor.getLabel());
                    result.b.add(value.clone());
                }
            }
        }

        return result;
    }


    public Map<Source, List<Instruction>> uses() {
        Map<Source, List<Instruction>> uses = new HashMap<>();
        for (BasicBlock block : topologicalList) {
            for (Instruction inst : block.getAllInstructions()) {
                inst.sources().stream()
                        .filter(item -> item instanceof Register)
                        .map(item -> (Register) item)
                        .forEach( reg -> {
                            if (!uses.containsKey(reg)) {
                                uses.put(reg.clone(), new ArrayList<>());
                            }
                            uses.get(reg).add(inst);
                        });
            }
        }
        return uses;
    }

    public Map<Source, List<Instruction>> defs() {
        Map<Source, List<Instruction>> defs = new HashMap<>();
        for (BasicBlock block : topologicalList) {
            for (Instruction inst : block.getAllInstructions()) {
                for (Source source : inst.results()) {
                    if (!defs.containsKey(source)) {
                        defs.put(source.clone(), new ArrayList<>());
                    }
                    defs.get(source).add(inst);
                }
            }
        }
        return defs;
    }

    public void pruneRedundantPhis() {
        Map<Source, List<Instruction>> uses = uses();

        for (BasicBlock block : topologicalList) {
            List<Instruction> removedPhis = new ArrayList<>();
            for (Instruction inst : block.getAllInstructions()) {
                switch (inst) {
                    case PhiInstruction phi -> {
                        Source singularity = phi.collapse();
                        Register phiResult = phi.result();
                        if (singularity != null) {
                            removedPhis.add(phi);
                            List<Instruction> usesOfPhiResult = uses.get(phiResult);
                            if (usesOfPhiResult == null) {
                                continue;
                            }
                            for (Instruction useOfPhiResult : usesOfPhiResult) {
                                int index = useOfPhiResult.sources().indexOf(phiResult);
                                useOfPhiResult.sources().set(index, singularity);
                            }
                        }
                    }
                    case null, default -> {}
                }
            }
            block.getMutableInstructions().removeAll(removedPhis);
        }
    }

    public void constantPropagation() {
        Map<Source, List<Instruction>> uses = uses();

        for (BasicBlock block : topologicalList) {
            List<Instruction> removed = new ArrayList<>();
            for (Instruction inst : block.getAllInstructions()) {
                switch (inst) {
                    case BinaryInstruction bin -> {
                        Source singularity = bin.collapse();
                        Register result = bin.result();
                        if (singularity != null) {
                            removed.add(bin);
                            List<Instruction> usesOfResult = uses.get(result);
                            if (usesOfResult == null) {
                                continue;
                            }
                            for (Instruction useOfResult : usesOfResult) {
                                int index = useOfResult.sources().indexOf(result);
                                useOfResult.sources().set(index, singularity);
                            }
                        }
                    }
                    case null, default -> {}
                }
            }
            block.getMutableInstructions().removeAll(removed);
        }
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
                List<Register> results = instruction.results();
                List<Register> sources = instruction.sources().stream()
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


