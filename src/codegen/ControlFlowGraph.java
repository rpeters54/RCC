package codegen;

import ast.TypeEnvironment;
import ast.declarations.Declaration;
import ast.declarations.DeclarationSpecifier;
import ast.declarations.FunctionDefinition;
import ast.types.*;
import codegen.instruction.Instruction;
import codegen.instruction.Jump;
import codegen.instruction.llvm.*;
import codegen.instruction.riscv.*;
import codegen.values.Register;
import org.antlr.v4.runtime.misc.Pair;
import org.jgrapht.Graph;
import org.jgrapht.Graphs;
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
    // record that tracks what type of instructions IR / RISC are contained
    Arch code;


    private interface Arch {}
    private static class LLVM implements Arch {
        private final List<Register> parameters;
        private Optional<PhiLLVM> returnPhi;
        private final BasicBlock returnBlock;

        private LLVM(List<Register> parameters, Optional<PhiLLVM> returnPhi, BasicBlock returnBlock) {
            this.parameters = parameters;
            this.returnPhi = returnPhi;
            this.returnBlock = returnBlock;
        }
    }
    private static class RISC implements Arch {
        private long stackOffset;
        private final List<BinaryImmRisc> stackIncDec;

        private RISC(long stackOffset) {
            this.stackOffset = stackOffset;
            this.stackIncDec = new ArrayList<>();
        }
    }

    public ControlFlowGraph(TypeEnvironment localEnvironment, FunctionDefinition definition) {
        this.graph = new DefaultDirectedGraph<>(DefaultEdge.class);
        this.topologicalList = new ArrayList<>();
        this.localEnvironment = localEnvironment;
        this.definition = definition;

        BasicBlock returnBlock = new BasicBlock();
        this.code = new LLVM(new ArrayList<>(), Optional.empty(), returnBlock);
        graph.addVertex(returnBlock);
    }

    public ControlFlowGraph(FunctionDefinition definition) {
        this.graph = new DefaultDirectedGraph<>(DefaultEdge.class);
        this.topologicalList = new ArrayList<>();
        this.localEnvironment = new TypeEnvironment();
        this.definition = definition;

        this.code = new RISC(DEFAULT_SP_OFFSET);
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

    public void removeEdge(BasicBlock from, BasicBlock to) {
        DefaultEdge e = graph.removeEdge(from, to);
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
        switch (code) {
            case LLVM ll -> ll.parameters.add(param);
            case null, default -> {}
        }
    }


    /*
    Handling Return Values and Blocks
     */

    public Optional<PhiLLVM> getReturnPhi() {
        switch (code) {
            case LLVM ll -> { return ll.returnPhi; }
            case null, default -> { return Optional.empty(); }
        }
    }

    public void addReturnValue(String label, Register value) {
        switch (code) {
            case LLVM ll -> {
                if (ll.returnPhi.isPresent()) {
                    PhiLLVM instruction = ll.returnPhi.get();
                    instruction.addValue(label, value);
                } else {
                    PhiLLVM instruction = new PhiLLVM();
                    instruction.addValue(label, value);
                    ll.returnPhi = Optional.of(instruction);
                }
            }
            case null, default -> {}
        }
    }

    public void declareReturnRegister(Register result) {
        switch (code) {
            case LLVM ll -> {
                if (ll.returnPhi.isPresent()) {
                    PhiLLVM instruction = ll.returnPhi.get();
                    instruction.addResult(result);
                } else {
                    PhiLLVM instruction = new PhiLLVM();
                    instruction.addResult(result);
                    ll.returnPhi = Optional.of(instruction);
                }
            }
            case null, default -> {}
        }
    }

    public String getReturnLabel() {
        switch (code) {
            case LLVM ll -> {
                return ll.returnBlock.getLabel();
            }
            case null, default -> {return "nill";}
        }
    }

    public void linkReturnBlock(BasicBlock block) {
        switch (code) {
            case LLVM ll -> {
                addEdge(block, ll.returnBlock);
            }
            case null, default -> {}
        }
    }

    public void placeReturnBlock() {
        switch (code) {
            case LLVM ll -> {
                ll.returnPhi.ifPresentOrElse(
                        phiInstruction -> {
                            ll.returnBlock.addInstruction(phiInstruction);
                            ll.returnBlock.addInstruction(new ReturnLLVM(phiInstruction.result().clone()));
                        },
                        () -> {
                            ll.returnBlock.addInstruction(new ReturnLLVM());
                        });
                topologicalList.add(ll.returnBlock);
            }
            case null, default -> {}
        }
    }

    /*
    Output Functions
     */

    public List<String> sprintInstructions() {
        Type type = definition.declaration().declSpec().getType();
        assert type instanceof FunctionType;

        String header = "";
        String close = "";
        switch(code) {
            case LLVM ll -> {
                StringBuilder sb = new StringBuilder();
                sb.append(String.format("define %s @%s(", ((FunctionType) type).returnType(),
                        definition.declaration().name()));
                List<Type> inputTypes = ((FunctionType) type).inputTypes().stream()
                        .map(Declaration::declSpec)
                        .map(DeclarationSpecifier::getType)
                        .toList();
                for (Register param : ll.parameters) {
                    sb.append(String.format("%s %s, ", param.type(), param));
                }
                if (!inputTypes.isEmpty()) {
                    sb.delete(sb.length() - 2, sb.length());
                }
                sb.append(") {");
                header = sb.toString();

                close = "}";
            }
            case RISC rc -> {
                header = String.format(".globl %s\n%s:", definition.declaration().name(), definition.declaration().name());
            }
            default -> throw new RuntimeException("Not implemented yet");
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
        List<PhiLLVM> phis = new ArrayList<>();
        for (String key : keyList) {
            Pair<List<String>, List<Register>> definitions = findPreviousDefinitions(start, key);
            TypeEnvironment.StorageLocation location = localEnvironment.getLocation(key);
            assert location != null;

            switch (location) {
                case REGISTER -> {
                    Type regType = definitions.b.getFirst().type();
                    Register result = Register.LLVM_Register(regType);
                    phis.add(new PhiLLVM(result, definitions.a, definitions.b));
                    regKeyList.add(key);
                }
                case STACK -> {
                    Register value = definitions.b.getFirst().clone();
                    start.addBinding(key, value);
                }
            }
        }

        for (int i = 0; i < phis.size(); i++) {
            PhiLLVM phi = phis.get(i);
            String name = regKeyList.get(i);
            start.addBinding(name, phi.result().clone());
            start.addInstruction(phi);
        }
    }


    /**
     * Given a starting block and the name of a value, find all definitions of corresponding to that
     * name the reach the starting block. This function is used by generatePhis to populate phi nodes
     *
     * @param start The starting basic block
     * @param name  The value whose reaching definitions are being searched for
     * @return A tuple of lists, with the first containing all the basic block labels and the second containing
     * all values.
     */
    public Pair<List<String>, List<Register>> findPreviousDefinitions(BasicBlock start, String name) {
        Set<BasicBlock> visited = new HashSet<>();
        return findPreviousDefinitionsHelper(start, name, visited);
    }

    public Pair<List<String>, List<Register>> findPreviousDefinitionsHelper(BasicBlock start, String name, Set<BasicBlock> visited) {

        if (!graph.containsVertex(start)) {
            throw new RuntimeException("ControlFlowGraph::findPreviousDefinitions: called with a non existent block");
        }

        // get the starting block's predecessors
        Set<BasicBlock> predecessors = blockPredecessors(start);

        Pair<List<String>, List<Register>> result = new Pair<>(new ArrayList<>(), new ArrayList<>());
        for (BasicBlock predecessor : predecessors) {
            if (!visited.contains(predecessor)) {
                visited.add(predecessor);
                Register value = predecessor.getBinding(name);
                if (value == null) {
                    Pair<List<String>, List<Register>> inner = findPreviousDefinitionsHelper(predecessor, name, visited);
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
                inst.rvalues().stream()
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
                    case PhiLLVM phi -> {
                        Register singularity = phi.collapse();
                        Register phiResult = phi.result();
                        if (singularity != null) {
                            removedPhis.add(phi);
                            List<Instruction> usesOfPhiResult = uses.get(phiResult);
                            if (usesOfPhiResult == null) {
                                continue;
                            }
                            for (Instruction useOfPhiResult : usesOfPhiResult) {
                                int index = useOfPhiResult.rvalues().indexOf(phiResult);
                                useOfPhiResult.setRvalue(index, singularity);
                            }
                        }
                    }
                    case null, default -> {}
                }
            }
            block.getMutableInstructions().removeAll(removedPhis);
        }
    }

//    public void constantPropagation() {
//        Map<Register, List<Instruction>> uses = uses();
//
//        for (BasicBlock block : topologicalList) {
//            List<Instruction> removed = new ArrayList<>();
//            for (Instruction inst : block.getAllInstructions()) {
//                switch (inst) {
//                    case BinaryLLVM bin -> {
//                        Source singularity = bin.collapse();
//                        Register result = bin.result();
//                        if (singularity != null) {
//                            removed.add(bin);
//                            List<Instruction> usesOfResult = uses.get(result);
//                            if (usesOfResult == null) {
//                                continue;
//                            }
//                            for (Instruction useOfResult : usesOfResult) {
//                                int index = useOfResult.rvalues().indexOf(result);
//                                useOfResult.rvalues().set(index, singularity);
//                            }
//                        }
//                    }
//                    case null, default -> {}
//                }
//            }
//            block.getMutableInstructions().removeAll(removed);
//        }
//    }


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
                if (inst instanceof Jump) {
                    blockJumpMap.put(block, inst);
                }
                if (inst instanceof Critical) {
                    workset.add(inst);
                }
            }
        }

        // get the return instruction and add it to the workset
        BasicBlock exitBlock = topologicalList.getLast();
        List<ReturnLLVM> rets = exitBlock.getAllInstructions()
                .stream()
                .filter(item -> item instanceof ReturnLLVM)
                .map(item -> (ReturnLLVM) item)
                .toList();
        workset.add(rets.getLast());


        while (!workset.isEmpty()) {
            // drop the value from the workset
            Optional<Instruction> optNext = workset.stream().findFirst();
            Instruction next = optNext.get();
            workset.remove(next);
            criticalInst.add(next);

            // mark values used as sources for the critical instruction as critical
            next.rvalues().stream()
                    .filter(item -> item instanceof Register)
                    .map(item -> (Register) item)
                    .filter(defs::containsKey)
                    .map(defs::get)
                    .filter(inst -> !criticalInst.contains(inst))
                    .filter(inst -> !workset.contains(inst))
                    .forEach(workset::add);


            // branches used by phi sources are marked critical
            if (next instanceof PhiLLVM phi) {
                phi.labels().stream()
                        .map(labelToBlockMap::get)
                        .map(BasicBlock::getAllInstructions)
                        .map(List::getLast)
                        .filter(inst -> inst instanceof Jump)
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
                } else if (inst instanceof Jump) {
                    BasicBlock jumpBlock = computeNearestPostDominator(block, liveBlocks);
                    clearSuccessors(block);
                    addEdge(block, jumpBlock);
                    UnconditionalBranchLLVM uncond = new UnconditionalBranchLLVM(jumpBlock.getLabel());
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
                case ConditionalBranchLLVM cond -> {
                    if (cond.ifTrue().equals(cond.ifFalse())) {
                        allInst.removeLast();
                        UnconditionalBranchLLVM uncond = new UnconditionalBranchLLVM(cond.ifTrue());
                        hoistUnconditional(labelToBlockMap, block, uncond);
                    }
                }
                case UnconditionalBranchLLVM uncond -> {
                    allInst.removeLast();
                    hoistUnconditional(labelToBlockMap, block, uncond);
                }
                case ReturnLLVM ret -> {}
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
                                   UnconditionalBranchLLVM uncond) {
        Set<BasicBlock> predecessors = blockPredecessors(current);
        BasicBlock successor = labelToBlockMap.get(uncond.label());
        assert successor != null;

        if (current.getAllInstructions().isEmpty()) {
            // check if any of the phi instructions reference any of the predecessor blocks
            Set<String> predecessorLabelSet = predecessors.stream()
                    .map(BasicBlock::getLabel)
                    .collect(Collectors.toSet());
            List<PhiLLVM> phis = successor.getAllInstructions().stream()
                    .filter(item -> item instanceof PhiLLVM)
                    .map(item -> (PhiLLVM) item)
                    .toList();
            Set<String> successorLabelSet = phis.stream()
                    .map(PhiLLVM::labels)
                    .flatMap(List::stream)
                    .collect(Collectors.toSet());
            successorLabelSet.retainAll(predecessorLabelSet);

            // successor depends on parents of current, current may be vital
            if (!successorLabelSet.isEmpty()) {
                current.addInstruction(uncond);
                return;
            }

            // reset all phi labels to include the updated predecessors
            for (PhiLLVM phi : phis) {
                List<PhiLLVM.PhiTuple> fixedPhis = phi.mutableValues().stream()
                        .flatMap(item -> item.label().equals(current.getLabel())
                                ? predecessorLabelSet.stream()
                                .map(label -> new PhiLLVM.PhiTuple(label, item.register().clone()))
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
                    case ConditionalBranchLLVM c -> {
                        if (c.ifTrue().equals(current.getLabel())) {
                            c.setIfTrue(successor.getLabel());
                        }
                        if (c.ifFalse().equals(current.getLabel())) {
                            c.setIfFalse(successor.getLabel());
                        }
                    }
                    case UnconditionalBranchLLVM u -> {
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
                List<PhiLLVM> phis = successorSuccessor.getAllInstructions().stream()
                        .filter(item -> item instanceof PhiLLVM)
                        .map(item -> (PhiLLVM) item)
                        .toList();
                for (PhiLLVM phi : phis) {
                    List<PhiLLVM.PhiTuple> fixedPhis = phi.mutableValues().stream()
                            .map(item -> item.label().equals(successor.getLabel())
                                    ? new PhiLLVM.PhiTuple(current.getLabel(), item.register().clone())
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
     * Takes a well-formed cfg containing LLVM instructions and converts
     * all instructions to their RISCV64 equivalents.
     * Preserves LLVM infinite register space
     */
    public static ControlFlowGraph generatePseudoRisc(ControlFlowGraph llvmSource,
                                                      Map<Register, String> globalLabelMap) {
        ControlFlowGraph riscDest = new ControlFlowGraph(llvmSource.definition);
        Map<String, BasicBlock> labelToBlock = new HashMap<>();
        Map<String, Integer> labelToIndex = new HashMap<>();
        // add blocks and translations
        for (BasicBlock block : llvmSource.topologicalList) {
            List<Instruction> pseudoRisc = new ArrayList<>();
            for (Instruction inst : block.getAllInstructions()) {
                if (inst instanceof LLVMInstruction ll) {
                    pseudoRisc.addAll(ll.toRiscWithGlobals(globalLabelMap));
                } else {
                    throw new RuntimeException("CFG should only contain LLVM instructions");
                }
            }
            BasicBlock copy = new BasicBlock(pseudoRisc, block.getLabel());
            riscDest.addBlock(copy);
            labelToBlock.put(block.getLabel(), copy);
            labelToIndex.put(block.getLabel(), riscDest.getTopologicalList().size());
        }
        // add edges to new cfg
        for (DefaultEdge edge : llvmSource.graph.edgeSet()) {
            BasicBlock to = labelToBlock.get(llvmSource.graph.getEdgeTarget(edge).getLabel());
            BasicBlock from = labelToBlock.get(llvmSource.graph.getEdgeSource(edge).getLabel());
            riscDest.addEdge(from, to);
        }
        // add movs from argument registers
        argMoves(llvmSource, riscDest);
        // move allocas to top for stack manipulation
        bubbleAllocas(riscDest);
        // replace phi instructions with explicit moves
        destroySSA(riscDest, labelToIndex, labelToBlock);
        // compute stack offset
        computeStackOffset(riscDest);

        // return the translated graph
        return riscDest;
    }


    /**
     * determine a mapping from the infinite LLVM register space
     * to the RISCV register space and apply it to the cfg
     */
    public static void allocateRegisters(ControlFlowGraph cfg) {
        // determine the live range of each register
        Map<BasicBlock, Set<Register>> liveout = computeLiveRange(cfg);
        // construct an interference graph
        Graph<Register, DefaultEdge> iGraph = buildInterferenceGraph(cfg, liveout);
        // determine a coloring that preserves liveness
        RegAllocData data = colorGraph(cfg, iGraph);
        // apply the coloring to the cfg
        applyColoring(cfg, data);
    }



    /**
     * add moves from risc registers to llvm arguments
     */
    private static void argMoves(ControlFlowGraph source, ControlFlowGraph cfg) {
        BasicBlock entrance = cfg.getTopologicalList().getFirst();
        int intRegCount = 0;
        int floatRegCount = 0;
        assert source.code instanceof LLVM;
        LLVM llmetadata = (LLVM) source.code;
        for (Register param : llmetadata.parameters) {
            List<Instruction> moves = switch (param.type()) {
                case IntegerType it -> BinaryRisc.Mov(param.clone(), Register.RiscIntArg(intRegCount++));
                case PointerType it -> BinaryRisc.Mov(param.clone(), Register.RiscIntArg(intRegCount++));
                case FloatingType ft -> BinaryRisc.FMov(param.clone(), Register.RiscFloatArg(floatRegCount++));
                default -> throw new RuntimeException("invalid param type");
            };
            List<Instruction> inst = entrance.getMutableInstructions();
            for (Instruction move : moves) {
                inst.addFirst(move);
            }
        }
    }

    /**
     * Moves all allocas to the top to make stack construction more straightforward
     */
    public static void bubbleAllocas(ControlFlowGraph cfg) {
        List<Instruction> allocas = new ArrayList<>();
        for (BasicBlock block : cfg.topologicalList) {
            List<Instruction> instructions = new ArrayList<>();
            for (Instruction instruction : block.getAllInstructions()) {
                if (Objects.requireNonNull(instruction) instanceof AllocaLLVM
                || Objects.requireNonNull(instruction) instanceof LoadLiteralLLVM) {
                    allocas.add(instruction);
                } else {
                    instructions.add(instruction);
                }
            }
            block.getMutableInstructions().clear();
            block.getMutableInstructions().addAll(instructions);
        }
        BasicBlock first = cfg.topologicalList.getFirst();
        allocas.addAll(first.getAllInstructions());
        first.getMutableInstructions().clear();
        first.getMutableInstructions().addAll(allocas);
    }

    /**
     * collapse phi instructions into explicit moves and add
     * intermediate blocks between back edges
     */
    private static void destroySSA(ControlFlowGraph cfg,
                                   Map<String, Integer> labelToIndex,
                                   Map<String, BasicBlock> labelToBlock) {

        List<BasicBlock> blockBuffer = new ArrayList<>();
        // for each block
        for (BasicBlock block : cfg.topologicalList) {
            // create a map that tracks move instructions in each block
            Map<String, List<Instruction>> labelToMoveList = new HashMap<>();
            Map<String, String> blockToInterMap = new HashMap<>();
            Set<BasicBlock> parents = cfg.blockPredecessors(block);

            // add intermediate blocks that break backedges
            for (BasicBlock parent : parents) {
                if (labelToIndex.get(parent.getLabel()) >= labelToIndex.get(block.getLabel())) {
                    BasicBlock intermediate = new BasicBlock(parent.getLabel()+".inter");
                    intermediate.addInstruction(new JumpRisc(block.getLabel()));
                    cfg.graph.addVertex(intermediate);
                    cfg.addEdge(parent, intermediate);
                    cfg.addEdge(intermediate, block);
                    cfg.removeEdge(parent, block);
                    blockBuffer.add(intermediate);
                    Stack<Instruction> swap = new Stack<>();
                    while (!parent.getMutableInstructions().isEmpty()
                            && parent.getMutableInstructions().getLast() instanceof Jump) {
                        Jump last = (Jump) parent.getMutableInstructions().removeLast();
                        switch(last) {
                            case JumpRisc jmp -> {
                                if (jmp.getLabel().equals(block.getLabel())) {
                                    swap.add(new JumpRisc(intermediate.getLabel()));
                                } else {
                                    swap.add(jmp);
                                }
                            }
                            case BranchRisc br -> {
                                if (br.getTrueLabel().equals(block.getLabel())) {
                                    swap.add(new BranchRisc(
                                            br.rvalue(0), br.rvalue(1), br.getBt(), intermediate.getLabel()
                                    ));
                                } else {
                                    swap.add(br);
                                }
                            }
                            default -> throw new IllegalStateException("invalid jump instruction");
                        }
                    }
                    while(!swap.isEmpty()) {
                        parent.getMutableInstructions().addLast(swap.pop());
                    }
                    blockToInterMap.put(parent.getLabel(), intermediate.getLabel());
                    labelToBlock.put(intermediate.getLabel(), intermediate);
                }
            }

            // and block to the list of blocks
            blockBuffer.add(block);

            // populate the move instruction map
            List<PhiLLVM> phis = block.getAllInstructions().stream()
                    .filter(item -> item instanceof PhiLLVM)
                    .map(item -> (PhiLLVM) item).toList();

            // generate moves for each phi instruction
            phis.forEach(phi -> phi.mutableValues().forEach(phiTuple -> {
                        String parentLabel = phiTuple.label();
                        if (blockToInterMap.containsKey(parentLabel)) {
                            parentLabel = blockToInterMap.get(parentLabel);
                        }
                        if (!labelToMoveList.containsKey(parentLabel)) {
                            labelToMoveList.put(parentLabel, new ArrayList<>());
                        }
                        labelToMoveList.get(parentLabel).addAll(BinaryRisc.AnyMov(
                                phi.result().clone(), phiTuple.register().clone())
                        );
                    }));
            // remove all phis from the instruction list
            block.getMutableInstructions().removeAll(phis);

            // for each group of moves associated with a parent block
            for (Map.Entry<String, List<Instruction>> labelToMoveEntry : labelToMoveList.entrySet()) {
                // handle register swaps that llvm treats as simultaneous
                Set<Register> results = labelToMoveEntry.getValue().stream()
                        .map(Instruction::result)
                        .collect(Collectors.toSet());
                List<Instruction> flattenedMoves = new ArrayList<>();
                Map<Register, Register> temporaryMap = new HashMap<>();
                for (Instruction move : labelToMoveEntry.getValue()) {
                    for (Register source : move.rvalues()) {
                        if (results.contains(source)) {
                            results.remove(source);
                            Register temporary = Register.LLVM_Register(source.type());
                            temporaryMap.put(source, temporary);
                            flattenedMoves.addAll(BinaryRisc.AnyMov(
                                    temporary.clone(), source.clone()
                            ));
                        }
                    }
                }
                // replace values that needed temporary moves with the new temporary register
                Set<Register> overwrittenSources = temporaryMap.keySet();
                for (Instruction move : labelToMoveEntry.getValue()) {
                    for (int index = 0; index < move.rvalues().size(); index++) {
                        Register source = move.rvalue(index);
                        if (overwrittenSources.contains(source)) {
                            move.setRvalue(index, temporaryMap.get(source).clone());
                        }
                    }
                }
                // add all the moves to the parent's instruction list before any branch instructions
                flattenedMoves.addAll(labelToMoveEntry.getValue());
                BasicBlock parent = labelToBlock.get(labelToMoveEntry.getKey());
                Stack<Instruction> swapSpace = new Stack<>();
                List<Instruction> parentInst = parent.getMutableInstructions();
                while (!parentInst.isEmpty() && parentInst.getLast() instanceof Jump) {
                    swapSpace.add(parentInst.removeLast());
                }
                parentInst.addAll(flattenedMoves);
                while(!swapSpace.empty()) {
                    parentInst.add(swapSpace.pop());
                }
            }
        }
        // refresh the list of blocks to contain the new intermediate blocks
        cfg.topologicalList.clear();
        cfg.topologicalList.addAll(blockBuffer);
    }

    private static final long DEFAULT_SP_OFFSET = 25 * 8; // # Saved Registers * Size of Each
    /**
     * with allocas in the first block, determine the offset of all items in the stack
     * this value will have to be added to during register allocation spillage
     */
    private static void computeStackOffset(ControlFlowGraph cfg) {
        long totalOffset = DEFAULT_SP_OFFSET;
        Map<Register, Long> stackOffsets = new HashMap<>();
        BasicBlock start = cfg.topologicalList.getFirst();
        BasicBlock last = cfg.topologicalList.getLast();


        // pull allocas out of the starting block
        List<AllocaLLVM> allocas = start.getAllInstructions().stream()
                .filter(item -> item instanceof AllocaLLVM)
                .map(item -> (AllocaLLVM) item)
                .toList();
        start.getMutableInstructions().removeAll(allocas);

        // add associations between allocas and offsets to map
        for (AllocaLLVM alloc : allocas) {
            stackOffsets.put(alloc.result(), totalOffset);
            assert alloc.result().type() instanceof PointerType;
            totalOffset += ((PointerType)alloc.result().type()).base().sizeof();
        }

        // update all loads to use the stack offset
        for (Instruction inst : start.getAllInstructions()) {
            switch (inst) {
                case StoreRisc st -> {
                    if (stackOffsets.containsKey(st.rvalue(1))) {
                        st.setOffset(stackOffsets.get(st.rvalue(1)));
                        st.setRvalue(1, Register.RiscFp());
                    }
                }
                case LoadRisc ld -> {
                    if (stackOffsets.containsKey(ld.rvalue(0))) {
                        ld.setOffset(stackOffsets.get(ld.rvalue(0)));
                        ld.setRvalue(0, Register.RiscFp());
                    }
                }
                default -> {}
            }
        }

        // generate and place default stack
        List<Instruction> defaultStack = StoreRisc.generateDefaultStack(totalOffset);
        List<Instruction> cleanUp = LoadRisc.collapseDefaultStack(totalOffset);
        start.getMutableInstructions().addAll(0, defaultStack);



        List<Instruction> lastInst = last.getMutableInstructions();
        Stack<Instruction> temp = new Stack<>();
        while (!lastInst.isEmpty() && lastInst.getLast() instanceof Jump) {
            temp.add(lastInst.removeLast());
        }
        lastInst.addAll(cleanUp);
        while(!temp.isEmpty()) {
            lastInst.add(temp.pop());
        }

        assert cfg.code instanceof RISC;
        RISC riscmetadata = (RISC) cfg.code;
        riscmetadata.stackIncDec.add((BinaryImmRisc)defaultStack.getFirst());
        riscmetadata.stackIncDec.add((BinaryImmRisc)cleanUp.getLast());
        riscmetadata.stackOffset = totalOffset;
    }

    /**
     * Grow the stack to accommodate a spilled register
     * @param cfg
     * @param spilled
     * @return
     */
    private static long growStack(ControlFlowGraph cfg, Register spilled) {
        assert cfg.code instanceof RISC;
        RISC riscmetadata = (RISC) cfg.code;
        riscmetadata.stackOffset += spilled.type().sizeof();
        return riscmetadata.stackOffset;
    }

    private static final long STACK_DIVISIBILITY = 16;

    /**
     * Finalize the stack by
     * @param cfg
     */
    private static void capStack(ControlFlowGraph cfg) {
        assert cfg.code instanceof RISC;
        RISC riscmetadata = (RISC) cfg.code;
        riscmetadata.stackOffset += riscmetadata.stackOffset % STACK_DIVISIBILITY;
        riscmetadata.stackIncDec.getFirst().setImmAsLong(-riscmetadata.stackOffset);
        riscmetadata.stackIncDec.getLast().setImmAsLong(riscmetadata.stackOffset);
    }


    /**
     * For each BasicBlock in a program, compute the pseudo registers that are live
     * at the end of the basic block
     * @return Map[BasicBlock, Set[Register]] that associates BasicBlocks with their respective live register set
     */
    private static Map<BasicBlock, Set<Register>> computeLiveRange(ControlFlowGraph cfg) {
        boolean changed = true;
        Map<BasicBlock, Set<Register>> liveOutMap = new HashMap<>();
        while (changed) {
            changed = false;
            for (int i = cfg.topologicalList.size()-1; i >= 0; i--) {
                BasicBlock current = cfg.topologicalList.get(i);
                Set<Register> currentSet = liveOutMap.get(current);
                Set<Register> newSet = current.liveout(liveOutMap, cfg.blockSuccessors(current));
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
    private static Graph<Register, DefaultEdge> buildInterferenceGraph(ControlFlowGraph cfg, Map<BasicBlock, Set<Register>> livemap) {
        // construct the base graph
        Graph<Register, DefaultEdge> iGraph = new DefaultUndirectedGraph<>(DefaultEdge.class);

        for (BasicBlock block : cfg.getTopologicalList()) {
            Set<Register> liveset = livemap.get(block);
            // for each instruction in the block, from bottom to top
            for (int i = block.getAllInstructions().size()-1; i >= 0; i--) {
                Instruction instruction = block.getAllInstructions().get(i);

                // collect the instruction's source and result registers
                List<Register> results = instruction.results();
                List<Register> sources = instruction.rvalues();

                // add an interference edge between the current live values and the result
                for (Register result : results) {

                    if (!iGraph.containsVertex(result)) {
                        iGraph.addVertex(result);
                    }

                    for (Register liveReg : liveset) {
                        if (!iGraph.containsVertex(liveReg)) {
                            iGraph.addVertex(liveReg);
                        }
                        if (!liveReg.equals(result)) {
                            iGraph.addEdge(result, liveReg);
                        }
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

    private record SpillTuple(Register left, Register right) {}
    private record RegAllocData(Map<Register, Register> regMap,
                                Map<Register, Long> spillMap,
                                Set<Register> usedSaved,
                                SpillTuple intRegs,
                                SpillTuple floatRegs) {}
    private static RegAllocData colorGraph(ControlFlowGraph cfg, Graph<Register, DefaultEdge> iGraph) {
        //initialize register map to map all riscs to themselves
        Map<Register, Register> regMap = new HashMap<>();
        Set<Register> usedSaved = new HashSet<>();
        List<Register> intRegs = Register.IntRiscRegisters();
        List<Register> floatRegs = Register.FloatRiscRegisters();
        // allocated two registers for handling spilled values of both types
        // easier than recomputing liverange and coloring for every spilled value
        Register sp = Register.RiscSp();
        Register zero = Register.RiscZero();
        Register ra = Register.RiscRa();
        Register fp = Register.RiscFp();
        regMap.put(sp, sp);
        regMap.put(zero, zero);
        regMap.put(ra, ra);
        regMap.put(fp, fp);
        intRegs.forEach(reg -> regMap.put(reg, reg));
        floatRegs.forEach(reg -> regMap.put(reg, reg));
        SpillTuple intSpillRegs = new SpillTuple(intRegs.removeFirst(), intRegs.removeFirst());
        SpillTuple floatSpillRegs = new SpillTuple(floatRegs.removeFirst(), floatRegs.removeFirst());

        // create a shallow copy of the interference graph
        Graph<Register, DefaultEdge> temp = new DefaultUndirectedGraph<>(DefaultEdge.class);
        Graphs.addGraph(temp, iGraph);
        Stack<Register> ordering = new Stack<>();
        // push registers without color constraints onto the stack first
        while (!temp.vertexSet().isEmpty()) {
            boolean pruned = false;
            for (Register reg : temp.vertexSet()) {
                if (temp.inDegreeOf(reg) == 0) {
                    ordering.push(reg);
                    temp.removeVertex(reg);
                    pruned = true;
                    break;
                }
            }
            if (!pruned) {
                temp.vertexSet().stream().findFirst().ifPresent(
                        reg -> {
                            ordering.push(reg);
                            temp.removeVertex(reg);
                        }
                );
            }
        }

        Map<Register, Long> spillMap = new HashMap<>();

        intRegs.forEach(temp::addVertex);
        floatRegs.forEach(temp::addVertex);

        while (!ordering.isEmpty()) {

            // add vertex and all relevant interference edges
            Register reg = ordering.pop();
            temp.addVertex(reg);
            Set<DefaultEdge> alreadyPresent = temp.edgesOf(reg);
            Set<DefaultEdge> edges = new HashSet<>(iGraph.edgesOf(reg));
            edges.removeAll(alreadyPresent);
            for (DefaultEdge edge : edges) {
                Register target = iGraph.getEdgeTarget(edge);
                Register source = iGraph.getEdgeSource(edge);
                if (!target.equals(reg) && temp.containsVertex(target)) {
                    temp.addEdge(reg, target);
                }
                if (!source.equals(reg) && temp.containsVertex(source)) {
                    temp.addEdge(source, reg);
                }
            }

            // collect set of taken colors from neighbors
            Set<Register> reserved = new HashSet<>();
            for (DefaultEdge edge : temp.edgesOf(reg)) {
                Register target = iGraph.getEdgeTarget(edge);
                Register source = iGraph.getEdgeSource(edge);
                if (!target.equals(reg)) {
                    reserved.add(regMap.get(target));
                }
                if (!source.equals(reg)) {
                    reserved.add(regMap.get(source));
                }
            }

            // select the correct color group based on register type
            List<Register> colors;
            switch (reg.type()) {
                case IntegerType it -> colors = intRegs;
                case FloatingType it -> colors = floatRegs;
                case PointerType it -> colors = intRegs;
                case null, default -> throw new IllegalStateException("Unexpected type: " + reg.type());
            }


            // try to color the register
            if (!regMap.containsKey(reg)) {
                for (Register color : colors) {
                    if (!reserved.contains(color)) {
                        regMap.put(reg, color);
                        usedSaved.add(color);
                        break;
                    }
                }
            }

            // if the register cant be colored, spill it and remove it from the graph
            if (!regMap.containsKey(reg)) {
                temp.removeVertex(reg);
                long offset = growStack(cfg, reg);
                spillMap.put(reg, offset);
            }
        }

        // keep track of the saved registers used to reduce the number of registers
        // pushed/popped on the stack in the prologue and epilogue
        usedSaved.retainAll(Register.SavedRiscRegisters());

        capStack(cfg);
        return new RegAllocData(regMap, spillMap, usedSaved, intSpillRegs, floatSpillRegs);
    }

    /**
     * After determining a valid mapping and set of spilled registers
     * Map LLVM to Risc registers and add the necessary load and stores for spills

     */

    private enum SpillSourceSelect {LEFT, RIGHT, INVALID}
    private enum SpillResultSelect {ONLY, INVALID}
    private static void applyColoring(ControlFlowGraph cfg, RegAllocData data) {
        Map<Register, Register> regMap = data.regMap;
        Map<Register, Long> spillMap = data.spillMap;
        SpillTuple intTuple = data.intRegs;
        SpillTuple floatTuple = data.floatRegs;

        for (BasicBlock block : cfg.topologicalList) {
            List<Instruction> translation = new ArrayList<>();
            for (Instruction inst : block.getAllInstructions()) {
                SpillSourceSelect sourceSelect = SpillSourceSelect.LEFT;
                SpillResultSelect resultSelect = SpillResultSelect.ONLY;
                // map the rvalues
                for (int i = 0; i < inst.rvalues().size(); i++) {
                    Register rvalue = inst.rvalue(i);
                    if (regMap.containsKey(rvalue)) {
                        inst.setRvalue(i, regMap.get(rvalue));
                    } else if (spillMap.containsKey(rvalue)) {
                        long offset = spillMap.get(rvalue);
                        SpillTuple tuple = switch (rvalue.type()) {
                            case IntegerType it -> intTuple;
                            case FloatingType it -> floatTuple;
                            case PointerType it -> intTuple;
                            default -> throw new IllegalStateException("Unexpected type: " + rvalue.type());
                        };
                        Register spillReg;
                        switch (sourceSelect) {
                            case LEFT -> {
                                sourceSelect = SpillSourceSelect.RIGHT;
                                spillReg = tuple.left;
                            }
                            case RIGHT -> {
                                sourceSelect = SpillSourceSelect.INVALID;
                                spillReg = tuple.right;
                            }
                            case null, default -> throw new IllegalStateException("Can't handle > 2 rvalue spills");
                        }
                        inst.setRvalue(i, spillReg);
                        translation.add(new LoadRisc(spillReg, Register.RiscFp(), offset));
                    } else {
                        throw new RuntimeException("Register not in regMap or spillMap" + rvalue);
                    }
                }

                // add the instruction
                translation.add(inst);
                for (int i = 0; i < inst.results().size(); i++) {
                    Register result = inst.results().get(i);
                    if (regMap.containsKey(result)) {
                        inst.setResult(i, regMap.get(result));
                    } else if (spillMap.containsKey(result)) {
                        long offset = spillMap.get(result);
                        SpillTuple tuple = switch (result.type()) {
                            case IntegerType it -> intTuple;
                            case FloatingType it -> floatTuple;
                            case PointerType it -> intTuple;
                            default -> throw new IllegalStateException("Unexpected type: " + result.type());
                        };
                        Register spillReg;
                        switch (resultSelect) {
                            case ONLY -> {
                                spillReg = tuple.left;
                                resultSelect = SpillResultSelect.INVALID;
                            }
                            default -> {
                                System.out.println("Spilled reg" + result);
                                throw new IllegalStateException("Can't handle > 1 spills per instruction result");
                            }
                        }
                        inst.setResult(i, spillReg);
                        translation.add(new StoreRisc(spillReg, Register.RiscFp(), offset));
                    } else {
                        throw new RuntimeException("Register not in regMap or spillMap" + result);
                    }
                }
            }
            block.getMutableInstructions().clear();
            block.getMutableInstructions().addAll(translation);
        }
    }
}


