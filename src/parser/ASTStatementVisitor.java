package parser;

import ast.declarations.Declaration;

import ast.expr.Expression;
import ast.statements.*;
import ast.types.ArrayType;
import ast.types.CompoundType;
import ast.types.DefinedType;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;

import java.util.ArrayList;
import java.util.List;

public class ASTStatementVisitor extends CBaseVisitor<Statement> {

    private final ASTVisitor baseVisitor;
    private final ASTExpressionVisitor exprVisitor;

    public ASTStatementVisitor(ASTVisitor baseVisitor, ASTExpressionVisitor exprVisitor) {
        this.baseVisitor = baseVisitor;
        this.exprVisitor = exprVisitor;
    }

    /*
     * Labeled Statements
     */

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
        List<Expression> guardList = exprVisitor.parseExpressionList(ctx.constantExpressionList().expressionList());
        Statement body = visit(ctx.statement());
        return new CaseStatement(ctx.start.getLine(), guardList, body);
    }

    @Override
    public Statement visitDefaultCaseStatement(CParser.DefaultCaseStatementContext ctx) {
        Statement body = visit(ctx.statement());
        return new DefaultCaseStatement(ctx.start.getLine(), body);
    }

    /*
     * Expression Statements
     */

    @Override
    public Statement visitExpressionStatement(CParser.ExpressionStatementContext ctx) {
        int lineNum = ctx.start.getLine();
        List<Expression> exprList = new ArrayList<>();
        if (ctx.expressionList() != null)
            exprList = exprVisitor.parseExpressionList(ctx.expressionList());
        return new ExpressionStatement(lineNum, exprList);
    }


    /*
     * Compound Statement
     */

    @Override
    public Statement visitCompoundStatement(CParser.CompoundStatementContext ctx) {
        List<Declaration> declList = new ArrayList<>();
        List<Statement> statementList = new ArrayList<>();
        boolean barrier = false;


        for (CParser.DeclStatementContext dlctx : ctx.declStatement()) {
            Object obj = baseVisitor.visitDeclStatement(dlctx);

            switch (obj) {
                case List<?> items -> {
                    if (!items.isEmpty()
                            && items.getFirst() instanceof Declaration) {
                        List<Declaration> decls = (List<Declaration>) items;

                        DefinedType defType = switch (decls.getFirst().declSpec().getType()) {
                            case DefinedType dt -> dt;
                            case CompoundType ct when ct.base() instanceof DefinedType dt -> dt;
                            case null, default -> null;
                        };

                        if (defType != null) {
                            if (!baseVisitor.typeNames.contains(defType.getName())) {
                                String datum = dlctx.getText();
                                CLexer lexer = new CLexer(CharStreams.fromString(datum));
                                CParser parser = new CParser(new CommonTokenStream(lexer));
                                CParser.StatementContext stmtctx = parser.statement();
                                Statement stmt = visitStatement(stmtctx);
                                statementList.add(stmt);
                                barrier = true;
                                continue;
                            }
                        }

                        if (!barrier) {
                            declList.addAll(decls);
                        } else {
                            throw new RuntimeException("ASTStatementVisitor::visitCompoundStatement: " +
                                    "mixed declaration at: " + dlctx.getStart().getLine());
                        }

                    } else {
                        throw new RuntimeException("ASTStatementVisitor::visitCompoundStatement: " +
                                "malformed declaration list at: " + dlctx.getStart().getLine());
                    }
                }
                case Statement stmt -> {
                    barrier = true;
                    statementList.add(stmt);
                }
                case null, default -> {
                    throw new RuntimeException("ASTStatementVisitor::visitCompoundStatement: malformed statement " +
                            "or declaration at: " + dlctx.getStart().getLine());
                }
            }

        }
//        for (CParser.DeclarationContext dlctx : ctx.declaration()) {
//            Object obj = baseVisitor.visitDeclaration(dlctx);
//            if (!(obj instanceof List)) {
//                throw new RuntimeException("visitSpecifierQualifierList: Expected Declaration Specifier List");
//            }
//            if (((List<?>) obj).size() > 0) {
//                if (!(((List<?>) obj).get(0) instanceof Declaration)) {
//                    throw new RuntimeException("visitSpecifierQualifierList: Expected Declaration Specifier List");
//                }
//            }
//            List<Declaration> innerList = (List<Declaration>) obj;
//            declList.addAll(innerList);
//        }
//        for (CParser.StatementContext stctx : ctx.statement()) {
//            Statement stmt = visit(stctx);
//            statementList.add(stmt);
//        }
        return new CompoundStatement(ctx.start.getLine(), declList, statementList);
    }

    /*
     * Selection Statements
     */

    @Override
    public Statement visitIfSolo(CParser.IfSoloContext ctx) {
        Statement thenStatement = visit(ctx.thenBlock);
        List<Expression> expressionList = exprVisitor.parseExpressionList(ctx.expressionList());
        return new ConditionalStatement(ctx.start.getLine(), expressionList, thenStatement, null);
    }

    @Override
    public Statement visitIfElse(CParser.IfElseContext ctx) {
        Statement thenStatement = visit(ctx.thenBlock);
        Statement elseStatement = visit(ctx.elseBlock);
        List<Expression> expressionList = exprVisitor.parseExpressionList(ctx.expressionList());
        return new ConditionalStatement(ctx.start.getLine(), expressionList, thenStatement, elseStatement);
    }

    @Override
    public Statement visitSwitch(CParser.SwitchContext ctx) {
        List<Expression> guardList = exprVisitor.parseExpressionList(ctx.expressionList());
        Statement body = visit(ctx.statement());
        return new SwitchStatement(ctx.start.getLine(), guardList, body);
    }

    /*
     * Iteration Statements
     */

    @Override
    public Statement visitWhile(CParser.WhileContext ctx) {
        List<Expression> guardList = exprVisitor.parseExpressionList(ctx.guard);
        Statement body = visit(ctx.body);
        return new WhileStatement(ctx.start.getLine(), guardList, body);
    }

    @Override
    public Statement visitDo(CParser.DoContext ctx) {
        List<Expression> guardList = exprVisitor.parseExpressionList(ctx.guard);
        Statement body = visit(ctx.body);
        return new DoStatement(ctx.start.getLine(), guardList, body);
    }

    @Override
    public Statement visitFor(CParser.ForContext ctx) {
        List<Expression> initList = exprVisitor.parseExpressionList(ctx.init);
        List<Expression> guardList = exprVisitor.parseExpressionList(ctx.guard);
        List<Expression> stepList = exprVisitor.parseExpressionList(ctx.step);
        Statement body = visit(ctx.body);
        return new ForStatement(ctx.start.getLine(), initList, guardList, stepList, body);
    }

    /*
     * Jump Statements
     */

    @Override
    public Statement visitGoto(CParser.GotoContext ctx) {
        return new GotoStatement(ctx.start.getLine(), ctx.Identifier().getText());
    }

    @Override
    public Statement visitContinue(CParser.ContinueContext ctx) {
        return new ContinueStatement(ctx.start.getLine());
    }

    @Override
    public Statement visitBreak(CParser.BreakContext ctx) {
        return new BreakStatement(ctx.start.getLine());
    }

    @Override
    public Statement visitReturn(CParser.ReturnContext ctx) {
        List<Expression> retList;
        if (ctx.expressionList() != null) {
            retList = exprVisitor.parseExpressionList(ctx.expressionList());
        } else {
            retList = new ArrayList<>();
        }
        return new ReturnStatement(ctx.start.getLine(), retList);
    }


}
