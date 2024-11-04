package ast.statements;

import ast.declarations.Declaration;
import ast.declarations.DeclarationSpecifier;
import ast.declarations.FunctionDefinition;
import codegen.BasicBlock;
import ast.TypeEnvironment;
import codegen.ControlFlowGraph;
import codegen.EscapeTuple;
import codegen.TranslationUnit;

import java.util.List;

public class CompoundStatement extends Statement {
    private final List<Declaration> declarations;
    private final List<Statement> statements;

    public CompoundStatement(int lineNum, List<Declaration> declarations, List<Statement> statements) {
        super(lineNum);
        this.declarations = declarations;
        this.statements = statements;
    }

    public List<Declaration> getDeclarations() {
        return declarations;
    }

    public List<Statement> getStatements() {
        return statements;
    }


    @Override
    public DeclarationSpecifier verifySemantics(TypeEnvironment globalEnv, TypeEnvironment localEnv, FunctionDefinition function) {
        // for each declaration, replace any type aliases with the actual types
        for (Declaration declaration : declarations) {
            DeclarationSpecifier expandedSpecifier = globalEnv.expandDeclaration(declaration);
            localEnv.addBinding(declaration.name(), expandedSpecifier);
        }
        DeclarationSpecifier specifier = new DeclarationSpecifier();
        for (Statement statement : statements) {
            specifier = statement.verifySemantics(globalEnv, localEnv, function);
        }
        return specifier;
    }

    @Override
    public boolean alwaysReturns() {
        for (Statement statement : statements) {
            if (statement.alwaysReturns())
                return true;
        }
        return false;
    }

    @Override
    public BasicBlock codegen(TranslationUnit unit, ControlFlowGraph cfg, BasicBlock block, EscapeTuple esc) {
        // add all declarations to the block environment
        // assign them 'nill' if they were not initialized by the programmer
        for (Declaration declaration : declarations) {
            cfg.getLocalEnvironment().addCompoundDeclarations(declaration, unit, cfg, block);
        }
        // walk through the statements
        BasicBlock current = block;
        for (Statement statement : statements) {
            current = statement.codegen(unit, cfg, current, esc);
        }
        return current;
    }
}
