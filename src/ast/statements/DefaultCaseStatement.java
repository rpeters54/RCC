package ast.statements;


import ast.declarations.DeclarationSpecifier;
import ast.declarations.FunctionDefinition;
import codegen.BasicBlock;
import ast.TypeEnvironment;
import codegen.ControlFlowGraph;
import codegen.TranslationUnit;

public class DefaultCaseStatement implements Statement {

    private int lineNum;
    private Statement body;

    public DefaultCaseStatement(int lineNum, Statement body) {
        this.lineNum = lineNum;
        this.body = body;
    }

    @Override
    public DeclarationSpecifier verifySemantics(TypeEnvironment globalEnv, TypeEnvironment localEnv, FunctionDefinition function) {
        return body.verifySemantics(globalEnv, localEnv, function);
    }

    @Override
    public boolean alwaysReturns() {
        return false;
    }

    @Override
    public BasicBlock codegen(TranslationUnit unit, ControlFlowGraph cfg, BasicBlock block) {
        throw new RuntimeException("Not implemented yet");
    }
}
