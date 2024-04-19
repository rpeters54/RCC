package parser;

import ast.statements.LabelStatement;
import ast.statements.Statement;

import javax.swing.plaf.nimbus.State;

public class ASTStatementVisitor extends CBaseVisitor<Statement> {

    @Override
    public Statement visitLabelStatement(CParser.LabelStatementContext ctx) {
        return new LabelStatement(
                ctx.start.getLine(),
                ctx.Identifier().getText(),
                visit(ctx.statement())
        );
    }

    @Override
    public Statement visitCaseStatement(CParser.CaseStatementContext ctx) {
        //TODO
        return null;
    }
}
