package ast.statements;

import ast.declarations.DeclarationSpecifier;
import ast.declarations.FunctionDefinition;
import ast.expr.Expression;
import ast.types.PrimitiveType;
import codegen.BasicBlock;
import ast.TypeEnvironment;
import codegen.ControlFlowGraph;
import codegen.TranslationUnit;

import java.util.List;

public class WhileStatement implements Statement {
    private final int lineNum;
    private final List<Expression> guardList;
    private final Statement body;

    public WhileStatement(int lineNum, List<Expression> guardList, Statement body) {
        this.lineNum = lineNum;
        this.guardList = guardList;
        this.body = body;
    }

    @Override
    public DeclarationSpecifier verifySemantics(TypeEnvironment globalEnv, TypeEnvironment localEnv, FunctionDefinition function) {
        DeclarationSpecifier specifier = new DeclarationSpecifier();
        for (Expression guard : guardList) {
            specifier = guard.verifySemantics(globalEnv, localEnv);
        }
        if (!(specifier.getType() instanceof PrimitiveType))
            throw new RuntimeException("WhileStatement::verifySemantics: Final expression in guardList is not a valid type");

        return body.verifySemantics(globalEnv, localEnv, function);
    }

    @Override
    public boolean alwaysReturns() {
        return body.alwaysReturns();
    }

    @Override
    public BasicBlock codegen(TranslationUnit unit, ControlFlowGraph cfg, BasicBlock block) {
        throw new RuntimeException("Not implemented yet");
    }
}

