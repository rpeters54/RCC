package ast.statements;

import ast.declarations.DeclarationSpecifier;
import ast.declarations.FunctionDefinition;
import ast.expr.Expression;
import codegen.BasicBlock;
import semantics.TypeEnvironment;

import java.util.List;

public class ExpressionStatement implements Statement {
    private final int lineNum;
    private final List<Expression> expressionList;

    public ExpressionStatement(int lineNum, List<Expression> expressionList) {
        this.lineNum = lineNum;
        this.expressionList = expressionList;
    }

    @Override
    public DeclarationSpecifier verifySemantics(TypeEnvironment globalEnv, TypeEnvironment localEnv, FunctionDefinition function) {
        DeclarationSpecifier specifier = new DeclarationSpecifier();
        for (Expression exp : expressionList) {
            specifier = exp.verifySemantics(globalEnv, localEnv);
        }
        return specifier;
    }

    @Override
    public boolean alwaysReturns() {
        return false;
    }

    @Override
    public void codegen(List<BasicBlock> blocks, TypeEnvironment globalEnv, TypeEnvironment localEnv) {
        BasicBlock currentBlock = blocks.getLast();
        for (Expression exp : expressionList) {
            exp.codegen(currentBlock, globalEnv, localEnv);
        }
    }
}
