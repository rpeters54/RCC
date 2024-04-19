package parser;

import ast.Declaration;
import ast.FunctionDefinition;

public class ASTExternalDeclarationVisitor extends CBaseVisitor<Object> {
    @Override
    public Object visitExternalDeclaration(CParser.ExternalDeclarationContext ctx) {
        if (ctx.declaration() != null) {
            return visit(ctx.declaration());
        }
        if (ctx.functionDefinition() !=  null) {
            return visit(ctx.functionDefinition());
        }
        throw new IllegalArgumentException("Illegal ExternalDeclaration");
    }

    @Override
    public Object visitFunctionDefinition(CParser.FunctionDefinitionContext ctx) {
        return new FunctionDefinition(

        );
    }
    @Override
    public Object visitDeclaration(CParser.DeclarationContext ctx) {
        return new Declaration(

        );
    }
}
