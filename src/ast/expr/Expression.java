package ast.expr;

import ast.declarations.DeclarationSpecifier;
import codegen.BasicBlock;
import codegen.ControlFlowGraph;
import codegen.TranslationUnit;
import codegen.values.Source;
import ast.TypeEnvironment;

public interface Expression {
    DeclarationSpecifier verifySemantics(TypeEnvironment globalEnv, TypeEnvironment localEnv);
    Source codegen(TranslationUnit unit, ControlFlowGraph cfg, BasicBlock block);
}
