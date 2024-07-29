package ast.statements;

import ast.declarations.DeclarationSpecifier;
import ast.declarations.FunctionDefinition;
import ast.expr.Expression;
import ast.types.IntegerType;
import codegen.BasicBlock;
import ast.TypeEnvironment;
import codegen.ControlFlowGraph;
import codegen.TranslationUnit;

import java.util.List;

public class CaseStatement implements Statement {
    private final int lineNum;
    private final List<Expression> expressionList;
    private final Statement statement;

    public CaseStatement(int lineNum, List<Expression> expressionList, Statement statement) {
        this.lineNum = lineNum;
        this.expressionList = expressionList;
        this.statement = statement;
    }

    @Override
    public DeclarationSpecifier verifySemantics(TypeEnvironment globalEnv, TypeEnvironment localEnv, FunctionDefinition function) {
        DeclarationSpecifier specifier = new DeclarationSpecifier();
        for (Expression exp : expressionList) {
            specifier = exp.verifySemantics(globalEnv, localEnv);
        }
        if (!(specifier.getType() instanceof IntegerType))
            throw new RuntimeException("CaseStatement::verifySemantics: Case must be of IntegerType");

        return statement.verifySemantics(globalEnv, localEnv, function);
    }

    @Override
    public boolean alwaysReturns() {
        return statement.alwaysReturns();
    }

    @Override
    public BasicBlock codegen(TranslationUnit unit, ControlFlowGraph cfg, BasicBlock block) {
        throw new RuntimeException("Not implemented yet");
    }
}
