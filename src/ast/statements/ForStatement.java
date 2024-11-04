package ast.statements;

import ast.declarations.DeclarationSpecifier;
import ast.declarations.FunctionDefinition;
import ast.expr.Expression;
import codegen.BasicBlock;
import ast.TypeEnvironment;
import codegen.ControlFlowGraph;
import codegen.EscapeTuple;
import codegen.TranslationUnit;

import java.util.*;

public class ForStatement extends LoopStatement {

    private final List<Expression> initList;
    private final List<Expression> stepList;

    public ForStatement(int lineNum, List<Expression> initList, List<Expression> guardList,
                        List<Expression> stepList, Statement body) {
        super(lineNum, guardList, body);
        this.initList = initList;
        this.stepList = stepList;
    }

    public DeclarationSpecifier verifySemantics(TypeEnvironment globalEnv, TypeEnvironment localEnv, FunctionDefinition function) {
        for (Expression init : initList) {
            init.verifySemantics(globalEnv, localEnv, TypeEnvironment.StorageLocation.REGISTER);
        }
        for (Expression step : stepList) {
            step.verifySemantics(globalEnv, localEnv, TypeEnvironment.StorageLocation.REGISTER);
        }

        return super.verifySemantics(globalEnv, localEnv, function);
    }

    @Override
    public BasicBlock codegen(TranslationUnit unit, ControlFlowGraph cfg, BasicBlock block, EscapeTuple esc) {
        return generateLoop(unit, cfg, block, Optional.of(initList), Optional.of(stepList), false);
    }
}
