package ast.statements;

import ast.expr.Expression;
import codegen.BasicBlock;
import codegen.ControlFlowGraph;
import codegen.EscapeTuple;
import codegen.TranslationUnit;

import java.util.*;

public class WhileStatement extends LoopStatement {

    public WhileStatement(int lineNum, List<Expression> guardList, Statement body) {
        super(lineNum, guardList, body);
    }

    @Override
    public BasicBlock codegen(TranslationUnit unit, ControlFlowGraph cfg, BasicBlock block, EscapeTuple esc) {
        return generateLoop(unit, cfg, block, Optional.empty(), Optional.empty(), false);
    }

//    public void other {
//        // create the interior basic block
//        BasicBlock innerBlock = new BasicBlock();
//        cfg.addBlock(innerBlock);
//        cfg.addEdge(block, innerBlock);
//
//        // evaluate the guard expressions
//        List<Source> values = guardList.stream()
//                .map(exp -> exp.codegen(unit,cfg,block))
//                .toList();
//
//        // generate temporary phis at the start of the inner block
//        cfg.generatePhis(innerBlock);
//
//        // keep track of the names bound to each phi
//        List<PhiInstruction> emptyPhis = innerBlock.getAllInstructions().stream()
//                .filter(inst -> inst instanceof PhiInstruction)
//                .map(inst -> (PhiInstruction) inst)
//                .toList();
//
//        List<String> names = new ArrayList<>();
//        Set<Map.Entry<String, Source>> entries = innerBlock.getBindings().entrySet();
//
//        emptyPhis.forEach(phi -> {
//            for (Map.Entry<String, Source> entry : entries) {
//                if (phi.result().equals(entry.getValue())){
//                    names.add(entry.getKey());
//                    break;
//                }
//            }
//        });
//
//        // evaluate the inner block
//        BasicBlock endOfInnerBlock = body.codegen(unit, cfg, innerBlock);
//
//        // generate the exit block
//        BasicBlock outerBlock = new BasicBlock();
//        cfg.addBlock(outerBlock);
//        cfg.addEdge(block, outerBlock);
//
//        // generate the conditional branch into the while loop
//        Literal zero = new Literal("0", new IntegerType());
//        Register enterValue = Register.LLVM_Register(new IntegerType(IntegerType.Width.BOOL, true));
//        ComparatorInstruction enterCond = new ComparatorInstruction(enterValue, BinaryExpression.Operator.NE, values.getFirst(), zero.clone());
//        ConditionalBranchInstruction enterBranch = new ConditionalBranchInstruction(enterValue.clone(), innerBlock.getLabel(), outerBlock.getLabel());
//
//        // add the comparison and conditional branch to the current block
//        block.addInstruction(enterCond);
//        block.addInstruction(enterBranch);
//
//        // generate conditional branch at the end of the innerBlock
//        if (!endOfInnerBlock.endsWithJump()) {
//            // add connection from end of inner block to start of inner block and outer block
//            cfg.addEdge(endOfInnerBlock, innerBlock);
//            cfg.addEdge(endOfInnerBlock, outerBlock);
//
//            // re-evaluate the guard expressions
//            List<Source> exitValues = guardList.stream()
//                    .map(exp -> exp.codegen(unit,cfg,endOfInnerBlock))
//                    .toList();
//
//            Register exitValue = Register.LLVM_Register(new IntegerType(IntegerType.Width.BOOL, true));
//            ComparatorInstruction exitCond = new ComparatorInstruction(exitValue, BinaryExpression.Operator.NE, exitValues.getFirst(), zero);
//            ConditionalBranchInstruction exitBranch = new ConditionalBranchInstruction(exitValue.clone(), innerBlock.getLabel(), outerBlock.getLabel());
//
//            // add the comparison and conditional branch to the current block
//            endOfInnerBlock.addInstruction(exitCond);
//            endOfInnerBlock.addInstruction(exitBranch);
//        }
//
//        // fill the temporary phis
//        for (int i = 0; i < names.size(); i++) {
//            String name = names.get(i);
//            PhiInstruction phi = emptyPhis.get(i);
//            Pair<List<String>, List<Source>> labelSourcePairs = cfg.findPreviousDefinitions(innerBlock, name);
//            phi.refresh(labelSourcePairs.a, labelSourcePairs.b);
//        }
//
//        // generate phis for the block outside of the loop
//        cfg.generatePhis(outerBlock);
//        return outerBlock;
//    }
}

