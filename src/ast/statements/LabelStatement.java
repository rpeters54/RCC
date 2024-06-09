package ast.statements;

import ast.declarations.DeclarationSpecifier;
import ast.declarations.FunctionDefinition;
import codegen.BasicBlock;
import semantics.TypeEnvironment;

import java.util.List;

public class LabelStatement implements Statement {
    private final int lineNum;
    private final String label;
    private final Statement statement;

    public LabelStatement(int lineNum, String label, Statement statement) {
        this.lineNum = lineNum;
        this.label = label;
        this.statement = statement;
    }

    @Override
    public DeclarationSpecifier verifySemantics(TypeEnvironment globalEnv, TypeEnvironment localEnv, FunctionDefinition function) {
        return statement.verifySemantics(globalEnv, localEnv, function);
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
