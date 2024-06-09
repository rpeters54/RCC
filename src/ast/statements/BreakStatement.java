package ast.statements;

import ast.declarations.DeclarationSpecifier;
import ast.declarations.FunctionDefinition;
import codegen.BasicBlock;
import semantics.TypeEnvironment;

import java.util.List;

public class BreakStatement implements Statement {
    private int lineNum;

    public BreakStatement(int lineNum) {
        this.lineNum = lineNum;
    }

    @Override
    public DeclarationSpecifier verifySemantics(TypeEnvironment globalEnv, TypeEnvironment localEnv, FunctionDefinition function) {
        return new DeclarationSpecifier();
    }

    @Override
    public boolean alwaysReturns() {
        return false;
    }

    @Override
    public void codegen(List<BasicBlock> blocks, TypeEnvironment globalEnv, TypeEnvironment localEnv) {
        throw new RuntimeException("Not implemented yet");
    }
}

