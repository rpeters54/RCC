package ast.statements;

import ast.declarations.Declaration;
import ast.declarations.DeclarationSpecifier;
import ast.declarations.FunctionDefinition;
import semantics.TypeEnvironment;

import java.util.List;

public class CompoundStatement implements Statement {
    private int lineNum;
    private List<Declaration> declarations;
    private List<Statement> statements;

    public CompoundStatement(int lineNum, List<Declaration> declarations, List<Statement> statements) {
        this.lineNum = lineNum;
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
        TypeEnvironment inner = localEnv.duplicate();
        for (Declaration declaration : declarations) {
            DeclarationSpecifier updated = inner.stripDefinedTypes(declaration.getDeclSpec());
            if (updated == null)
                updated = globalEnv.stripDefinedTypes(declaration.getDeclSpec());
            if (updated == null)
                throw new RuntimeException("CompoundStatement::verifySemantics: can resolve defined type");
            inner.update(declaration);
        }
        DeclarationSpecifier specifier = new DeclarationSpecifier();
        for (Statement statement : statements) {
            specifier = statement.verifySemantics(globalEnv, inner, function);
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
}
