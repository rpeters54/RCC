package ast.statements;

import ast.declarations.DeclarationSpecifier;
import ast.declarations.ExternalDeclaration;
import ast.declarations.FunctionDefinition;
import codegen.BasicBlock;
import semantics.TypeEnvironment;

import java.util.List;

public interface Statement extends ExternalDeclaration {
    DeclarationSpecifier verifySemantics(TypeEnvironment globalEnv, TypeEnvironment localEnv, FunctionDefinition function);
    boolean alwaysReturns();
    void codegen(List<BasicBlock> blocks, TypeEnvironment globalEnv, TypeEnvironment localEnv);
}
