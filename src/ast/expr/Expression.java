package ast.expr;

import ast.declarations.DeclarationSpecifier;
import semantics.TypeEnvironment;

public interface Expression {
    DeclarationSpecifier verifySemantics(TypeEnvironment globalEnv, TypeEnvironment localEnv);

}
