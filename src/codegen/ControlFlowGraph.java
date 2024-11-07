package codegen;

import ast.TypeEnvironment;
import ast.declarations.Declaration;
import ast.declarations.DeclarationSpecifier;
import ast.declarations.FunctionDefinition;
import ast.types.FunctionType;
import ast.types.Type;
import codegen.instruction.Instruction;
import codegen.instruction.llvm.*;
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
import java.util.stream.Stream;

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
//        System.out.println("Removed: " + basicBlock.getLabel());
        topologicalList.remove(basicBlock);
        return graph.removeVertex(basicBlock);
    }

    public Set<BasicBlock> blockSuccessors(BasicBlock basicBlock) {
        if (!graph.containsVertex(basicBlock)) {
            return new HashSet<>();
        }

        return graph.outgoingEdgesOf(basicBlock).stream()
                .map(graph::getEdgeTarget)
                .collect(Collectors.toUnmodifiableSet());

    }

    public void clearSuccessors(BasicBlock block) {
        if (graph.containsVertex(block)) {
            Set<DefaultEdge> edges = new HashSet<>(graph.outgoingEdgesOf(block));
            edges.forEach(graph::removeEdge);
        }
    }

    public Set<BasicBlock> blockPredecessors(BasicBlock basicBlock) {
        if (!graph.containsVertex(basicBlock)) {
            return new HashSet<>();
        }

        return graph.incomingEdgesOf(basicBlock).stream()
                .map(graph::getEdgeSource)
                .collect(Collectors.toUnmodifiableSet());
    }

    public void clearPredecessors(BasicBlock block) {
        if (graph.containsVertex(block)) {
            Set<DefaultEdge> edges = new HashSet<>(graph.incomingEdgesOf(block));
            edges.forEach(graph::removeEdge);
        }
    }

    public boolean addEdge(BasicBlock from, BasicBlock to) {
//        System.out.println("Adding edge: " + from.getLabel() + " -> " + to.getLabel());
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
            instruction.addValue(label, value);
        } else {
            PhiInstruction instruction = new PhiInstruction();
            instruction.addValue(label, value);
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
        Set<BasicBlock> predecessors = blockPredecessors(start);

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
        Set<BasicBlock> predecessors = blockPredecessors(start);

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


    public Map<Register, List<Instruction>> uses() {
        Map<Register, List<Instruction>> uses = new HashMap<>();
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

    public Map<Register, Instruction> defs() {
        Map<Register, Instruction> defs = new HashMap<>();
        for (BasicBlock block : topologicalList) {
            for (Instruction inst : block.getAllInstructions()) {
                for (Register result : inst.results()) {
                    defs.put(result, inst);
                }
            }
        }
        return defs;
    }

    public void pruneRedundantPhis() {
        Map<Register, List<Instruction>> uses = uses();

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
                                useOfPhiResult.setSource(index, singularity);
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
        Map<Register, List<Instruction>> uses = uses();

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


    /**
     * Eliminates instructions that are proven to have no effect on
     * program state or the output
     * Note: requires a call to pruneRedundantPhis beforehand for correctness
     */
    public void deadCodeElimination() {
        // associations between labels and block pointers
        Map<String, BasicBlock> labelToBlockMap = new HashMap<>();
        for (BasicBlock block : topologicalList) {
            labelToBlockMap.put(block.getLabel(), block);
        }

        // get all uses registers
        Map<Register, Instruction> defs = defs();

        Set<BasicBlock> liveBlocks = new HashSet<>();
        Set<Instruction> criticalInst = new HashSet<>();
        Set<Instruction> workset  = new HashSet<>();

        // map instructions to blocks and blocks to jump instructions
        Map<Instruction, BasicBlock> instBlockMap = new HashMap<>();
        Map<BasicBlock, Instruction> blockJumpMap = new HashMap<>();
        for (BasicBlock block : topologicalList) {
            for (Instruction inst : block.getAllInstructions()) {
                instBlockMap.put(inst, block);
                if (inst instanceof JumpInstruction) {
                    blockJumpMap.put(block, inst);
                }
                if (inst instanceof CriticalInstruction) {
                    workset.add(inst);
                }
            }
        }

        // get the return instruction and add it to the workset
        BasicBlock exitBlock = topologicalList.getLast();
        List<ReturnInstruction> rets = exitBlock.getAllInstructions()
                .stream()
                .filter(item -> item instanceof ReturnInstruction)
                .map(item -> (ReturnInstruction) item)
                .toList();
        workset.add(rets.getLast());


        while (!workset.isEmpty()) {
            // drop the value from the workset
            Optional<Instruction> optNext = workset.stream().findFirst();
            Instruction next = optNext.get();
            workset.remove(next);
            criticalInst.add(next);

            // mark values used as sources for the critical instruction as critical
            next.sources().stream()
                    .filter(item -> item instanceof Register)
                    .map(item -> (Register) item)
                    .filter(defs::containsKey)
                    .map(defs::get)
                    .filter(inst -> !criticalInst.contains(inst))
                    .filter(inst -> !workset.contains(inst))
                    .forEach(workset::add);


            // branches used by phi sources are marked critical
            if (next instanceof PhiInstruction phi) {
                phi.labels().stream()
                        .map(labelToBlockMap::get)
                        .map(BasicBlock::getAllInstructions)
                        .map(List::getLast)
                        .filter(inst -> inst instanceof JumpInstruction)
                        .filter(inst -> !criticalInst.contains(inst))
                        .filter(inst -> !workset.contains(inst))
                        .forEach(workset::add);
            }


            // mark the current block critical if it hasn't been yet
            BasicBlock currentBlock = instBlockMap.get(next);
            liveBlocks.add(currentBlock);


            // mark jump instructions from reverse dominance frontier critical
            Set<BasicBlock> rdf = computeReverseDominanceFrontier(currentBlock);
            // also mark jump instructions from the current block critical
            rdf.add(currentBlock);
            rdf.stream().filter(blockJumpMap::containsKey).forEach( block -> {
                Instruction jmp = blockJumpMap.get(block);
                blockJumpMap.remove(block);
                workset.add(jmp);
            });
        }

        // filter out dead instructions and prune jumps
        for (BasicBlock block : topologicalList) {
            List<Instruction> filteredInstructions = new ArrayList<>();
            for (Instruction inst : block.getAllInstructions()) {
                if (criticalInst.contains(inst)) {
                    filteredInstructions.add(inst);
                } else if (inst instanceof JumpInstruction) {
                    BasicBlock jumpBlock = computeNearestPostDominator(block, liveBlocks);
                    clearSuccessors(block);
                    addEdge(block, jumpBlock);
                    UnconditionalBranchInstruction uncond = new UnconditionalBranchInstruction(jumpBlock.getLabel());
                    filteredInstructions.add(uncond);
                }
            }
            block.getMutableInstructions().clear();
            block.getMutableInstructions().addAll(filteredInstructions);
        }

    }

    /**
     * Cleans up the remaining branches after aggressive dead code elimination
     */
    public void hoistBranches() {
        Map<String, BasicBlock> labelToBlockMap = new HashMap<>();
        for (BasicBlock block : topologicalList) {
            labelToBlockMap.put(block.getLabel(), block);
        }

        // clear out the dead blocks that aren't used as paths by live blocks
        List<BasicBlock> allBlocks = new ArrayList<>(topologicalList);
        for (BasicBlock block : allBlocks) {
            List<Instruction> allInst = block.getMutableInstructions();
            Instruction last = allInst.getLast();

            switch(last) {
                case ConditionalBranchInstruction cond -> {
                    if (cond.ifTrue().equals(cond.ifFalse())) {
                        allInst.removeLast();
                        UnconditionalBranchInstruction uncond = new UnconditionalBranchInstruction(cond.ifTrue());
                        hoistUnconditional(labelToBlockMap, block, uncond);
                    }
                }
                case UnconditionalBranchInstruction uncond -> {
                    allInst.removeLast();
                    hoistUnconditional(labelToBlockMap, block, uncond);
                }
                case ReturnInstruction ret -> {}
                case null, default -> throw new RuntimeException("ControlFlowGraph::hoistBranches: " +
                        "block has invalid final instruction");
            }
        }
    }

    /**
     * helper method for hoist branches that handles unconditional branches
     * @param labelToBlockMap
     * @param current
     * @param uncond
     */
    private void hoistUnconditional(Map<String,BasicBlock> labelToBlockMap,
                                   BasicBlock current,
                                   UnconditionalBranchInstruction uncond) {
        Set<BasicBlock> predecessors = blockPredecessors(current);
        BasicBlock successor = labelToBlockMap.get(uncond.label());
        assert successor != null;

        if (current.getAllInstructions().isEmpty()) {
            // check if any of the phi instructions reference any of the predecessor blocks
            Set<String> predecessorLabelSet = predecessors.stream()
                    .map(BasicBlock::getLabel)
                    .collect(Collectors.toSet());
            List<PhiInstruction> phis = successor.getAllInstructions().stream()
                    .filter(item -> item instanceof PhiInstruction)
                    .map(item -> (PhiInstruction) item)
                    .toList();
            Set<String> successorLabelSet = phis.stream()
                    .map(PhiInstruction::labels)
                    .flatMap(List::stream)
                    .collect(Collectors.toSet());
            successorLabelSet.retainAll(predecessorLabelSet);

            // successor depends on parents of current, current may be vital
            if (!successorLabelSet.isEmpty()) {
                current.addInstruction(uncond);
                return;
            }

            // reset all phi labels to include the updated predecessors
            for (PhiInstruction phi : phis) {
                List<PhiInstruction.PhiTuple> fixedPhis = phi.mutableValues().stream()
                        .flatMap(item -> item.label().equals(current.getLabel())
                                ? predecessorLabelSet.stream()
                                .map(label -> new PhiInstruction.PhiTuple(label, item.source().clone()))
                                : Stream.of(item)
                        ).toList();
                phi.mutableValues().clear();
                phi.mutableValues().addAll(fixedPhis);
            }

            // prune the current block
            clearPredecessors(current);
            clearSuccessors(current);
            removeBlock(current);

            for (BasicBlock predecessor : predecessors) {
                Instruction last = predecessor.getAllInstructions().getLast();
                switch (last) {
                    case ConditionalBranchInstruction c -> {
                        if (c.ifTrue().equals(current.getLabel())) {
                            c.setIfTrue(successor.getLabel());
                        }
                        if (c.ifFalse().equals(current.getLabel())) {
                            c.setIfFalse(successor.getLabel());
                        }
                    }
                    case UnconditionalBranchInstruction u -> {
                        if (u.label().equals(current.getLabel())) {
                            u.setLabel(successor.getLabel());
                        }
                    }
                    case null, default -> {
                        throw new RuntimeException("hoistUnconditional: block ends with non-jump");
                    }
                }
                addEdge(predecessor, successor);
            }

        } else if (blockPredecessors(successor).size() == 1) {
            // update the current block to contain all of the successor
            List<Instruction> currentInst = current.getMutableInstructions();
            clearSuccessors(current);
            Set<BasicBlock> successorSuccessors = blockSuccessors(successor);
            currentInst.addAll(successor.getAllInstructions());

            // remove the successor
            clearPredecessors(successor);
            clearSuccessors(successor);
            removeBlock(successor);

            for (BasicBlock successorSuccessor : successorSuccessors) {
                // add an edge between current and each of successor's successors
                addEdge(current, successorSuccessor);
                // update all phis to use the label of the current block
                List<PhiInstruction> phis = successorSuccessor.getAllInstructions().stream()
                        .filter(item -> item instanceof PhiInstruction)
                        .map(item -> (PhiInstruction) item)
                        .toList();
                for (PhiInstruction phi : phis) {
                    List<PhiInstruction.PhiTuple> fixedPhis = phi.mutableValues().stream()
                            .map(item -> item.label().equals(successor.getLabel())
                                    ? new PhiInstruction.PhiTuple(current.getLabel(), item.source().clone())
                                    : item
                            ).toList();
                    phi.mutableValues().clear();
                    phi.mutableValues().addAll(fixedPhis);
                }
            }
        } else {
            current.addInstruction(uncond);
        }
    }

    /**
     * compute the reverse dominance frontier of a given basic block
     * returns a list of basic blocks that define it
     */
    public Set<BasicBlock> computeReverseDominanceFrontier(BasicBlock block) {
        Set<BasicBlock> visitedSet = new HashSet<>();

        Set<BasicBlock> frontier = new HashSet<>();

        for (BasicBlock parent : blockPredecessors(block)) {
            frontier.addAll(computeRDFHelper(parent, block, visitedSet));
        }
        return frontier;
    }

    public Set<BasicBlock> computeRDFHelper(BasicBlock start, BasicBlock guard, Set<BasicBlock> visitedSet) {
        // create a new reverse dominance frontier list
        Set<BasicBlock> frontier = new HashSet<>();

        // check if already visited
        // if not, mark as visited and continue
        if (visitedSet.contains(start))
            return frontier;
        visitedSet.add(start);

        // if the current block has a path to the end, it is a part of the frontier
        // its parents will not be, just return it
        if (pathToEnd(start, guard)) {
            frontier.add(start);
            return frontier;
        }

        // if the current block is not part of the frontier, its parents might be
        // build the frontier list by recursing
        for (BasicBlock parent : blockPredecessors(start)) {
            frontier.addAll(computeRDFHelper(parent, guard, visitedSet));
        }

        return frontier;
    }


    /**
     * Finds the nearest post-dominator to 'this'
     */
    private BasicBlock computeNearestPostDominator(BasicBlock block, Set<BasicBlock> liveBlocks) {

        Set<BasicBlock> visitedSet = new HashSet<>();
        Set<BasicBlock> successors = blockSuccessors(block);
        Queue<BasicBlock> blockQueue = new ArrayDeque<>(successors);

        // mark current block as visited
        visitedSet.add(block);

        while (!blockQueue.isEmpty()) {
            BasicBlock current = blockQueue.poll();
            // if the block has been visited, ignore it
            if (visitedSet.contains(current))
                continue;

            // mark the block as visited
            visitedSet.add(current);

            // if 'this' has a path to the end that does not
            // pass through block it is not post-dominated
            boolean unobstructed = pathToEnd(block, current);
            // if the block post-dominates 'this' and is
            // not set to be removed, add it
            if (!unobstructed && liveBlocks.contains(current)) {
                return current;
            }

            // otherwise, add the block's children
            blockQueue.addAll(blockSuccessors(current));
        }
        // ideally this should never be reached as the epilogue
        // postdominates all blocks by default
        throw new RuntimeException("Should have found post dominator");
    }

    /**
     * Determines whether there exists a path to the epilogue
     * from 'this' that does not contain 'guard'
     * returns a boolean given this result
     */
    private boolean pathToEnd(BasicBlock start, BasicBlock guard) {
        Set<BasicBlock> visitedSet = new HashSet<>();
        Set<BasicBlock> successors = blockSuccessors(start);
        boolean check = false;
        for (BasicBlock child : successors) {
            check |= pathToEndHelper(child, guard, visitedSet);
        }
        return check;
    }

    private boolean pathToEndHelper(BasicBlock start, BasicBlock guard, Set<BasicBlock> visitedSet) {
        // avoid loops by checking if the block has been visited
        if (visitedSet.contains(start))
            return false;

        // mark current block as visited
        visitedSet.add(start);

        // hit the guard, return false
        if (start.equals(guard)) {
            return false;
        }

        // reached the end, return true;
        Set<BasicBlock> successors = blockSuccessors(start);
        if (successors.isEmpty()) {
            return true;
        }

        // if not at the end or the guard, recurse
        boolean retVal = false;
        for (BasicBlock child : successors) {
            retVal |= pathToEndHelper(child, guard, visitedSet);
        }
        return retVal;
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
                Set<Register> newSet = current.liveout(liveOutMap, blockSuccessors(current));
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


