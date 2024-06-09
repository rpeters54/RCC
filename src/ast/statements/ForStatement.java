package ast.statements;

import ast.declarations.DeclarationSpecifier;
import ast.declarations.FunctionDefinition;
import ast.expr.Expression;
import ast.types.PrimitiveType;
import codegen.BasicBlock;
import semantics.TypeEnvironment;

import java.util.List;

public class ForStatement implements Statement {
    private final int lineNum;
    private final List<Expression> initList;
    private final List<Expression> guardList;
    private final List<Expression> stepList;
    private final Statement body;

    public ForStatement(int lineNum, List<Expression> initList, List<Expression> guardList,
                        List<Expression> stepList, Statement body) {
        this.lineNum = lineNum;
        this.initList = initList;
        this.guardList = guardList;
        this.stepList = stepList;
        this.body = body;
    }

    public DeclarationSpecifier verifySemantics(TypeEnvironment globalEnv, TypeEnvironment localEnv, FunctionDefinition function) {
        for (Expression init : initList) {
            init.verifySemantics(globalEnv, localEnv);
        }

        DeclarationSpecifier specifier = new DeclarationSpecifier();
        for (Expression guard : guardList) {
            specifier = guard.verifySemantics(globalEnv, localEnv);
        }
        if (!(specifier.getType() instanceof PrimitiveType))
            throw new RuntimeException("ForStatement::verifySemantics: Final expression in guardList is not a valid type");

        for (Expression step : stepList) {
            step.verifySemantics(globalEnv, localEnv);
        }

        return body.verifySemantics(globalEnv, localEnv, function);
    }

    @Override
    public boolean alwaysReturns() {
        return body.alwaysReturns();
    }

    @Override
    public void codegen(List<BasicBlock> blocks, TypeEnvironment globalEnv, TypeEnvironment localEnv) {
        throw new RuntimeException("Not implemented yet");
    }
}
