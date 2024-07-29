package ast.statements;

import ast.declarations.DeclarationSpecifier;
import ast.declarations.FunctionDefinition;
import codegen.BasicBlock;
import ast.TypeEnvironment;
import codegen.ControlFlowGraph;
import codegen.TranslationUnit;

public interface Statement {
    DeclarationSpecifier verifySemantics(TypeEnvironment globalEnv, TypeEnvironment localEnv, FunctionDefinition function);
    boolean alwaysReturns();
    BasicBlock codegen(TranslationUnit unit, ControlFlowGraph cfg, BasicBlock block);
}
