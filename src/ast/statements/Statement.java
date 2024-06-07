package ast.statements;

import ast.declarations.DeclarationSpecifier;
import ast.declarations.ExternalDeclaration;
import ast.declarations.FunctionDefinition;
import semantics.TypeEnvironment;

public interface Statement extends ExternalDeclaration {
    DeclarationSpecifier verifySemantics(TypeEnvironment globalEnv, TypeEnvironment localEnv, FunctionDefinition function);
    boolean alwaysReturns();
}
