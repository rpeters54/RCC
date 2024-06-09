package ast.expr;

import ast.declarations.DeclarationSpecifier;
import codegen.BasicBlock;
import codegen.values.Source;
import semantics.TypeEnvironment;

public interface Expression {
    DeclarationSpecifier verifySemantics(TypeEnvironment globalEnv, TypeEnvironment localEnv);
    Source codegen(BasicBlock block, TypeEnvironment globalEnv, TypeEnvironment localEnv);
}
