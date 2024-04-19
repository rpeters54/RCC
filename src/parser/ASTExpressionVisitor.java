package parser;

import ast.expr.*;

import java.util.ArrayList;
import java.util.List;

public class ASTExpressionVisitor extends CBaseVisitor<Expression>{

    public ASTExpressionVisitor() {}

    @Override
    public Expression visitIndexExpr(CParser.IndexExprContext ctx) {
        int lineNum = ctx.start.getLine();
        Expression ptr = visit(ctx.arr);
        Expression offset = visit(ctx.index);
        return PrefixExpression.create(lineNum, "*",
                BinaryExpression.create(lineNum, "+", ptr, offset));
    }

    @Override
    public Expression visitApplicationExpr(CParser.ApplicationExprContext ctx) {
        List<Expression> expList = new ArrayList<>();
        List<CParser.ExpressionContext> expCtxList = ctx.expressionList().expression();

        for (CParser.ExpressionContext expCtx : expCtxList) {
            expList.add(visit(expCtx));
        }

        return new ApplicationExpression(
                ctx.start.getLine(),
                visit(ctx.func),
                expList
        );
    }

    @Override
    public Expression visitDotExpr(CParser.DotExprContext ctx) {
        return new DotExpression(
                ctx.op.getLine(),
                visit(ctx.operand),
                ctx.member.getText()
        );
    }

    @Override
    public Expression visitArrowExpr(CParser.ArrowExprContext ctx) {
        return new DotExpression(ctx.op.getLine(),
                PrefixExpression.create(ctx.op.getLine(), "*", visit(ctx.operand)),
                ctx.member.getText()
        );
    }

    @Override
    public Expression visitPrefixExpr(CParser.PrefixExprContext ctx) {
        return PrefixExpression.create(
                ctx.op.getLine(),
                ctx.op.getText(),
                visit(ctx.operand)
        );
    }

    @Override
    public Expression visitSizeofExprExpr(CParser.SizeofExprExprContext ctx) {
        return new SizeofExprExpression(
            visit(ctx.operand)
        );
    }

    @Override
    public Expression visitBinaryExpr(CParser.BinaryExprContext ctx) {
        return BinaryExpression.create(
                ctx.op.getLine(),
                ctx.op.getText(),
                visit(ctx.left),
                visit(ctx.right)
        );
    }

    @Override
    public Expression visitConditionalExpr(CParser.ConditionalExprContext ctx) {
        return new ConditionalExpression(
                ctx.op.getLine(),
                visit(ctx.guard),
                visit(ctx.then),
                visit(ctx.other)
        );
    }

    @Override
    public Expression visitAssignmentExpr(CParser.AssignmentExprContext ctx) {
        int lineNum = ctx.op.getLine();
        Expression left = visit(ctx.left);
        Expression right = visit(ctx.right);
        return new AssignmentExpression(lineNum,left,
                switch(ctx.op.getText()) {
                    case "=" -> right;
                    case "*=" -> BinaryExpression.create(lineNum, "*", left, right);
                    case "/=" -> BinaryExpression.create(lineNum, "/", left, right);
                    case "%=" -> BinaryExpression.create(lineNum, "%", left, right);
                    case "+=" -> BinaryExpression.create(lineNum, "+", left, right);
                    case "-=" -> BinaryExpression.create(lineNum, "-", left, right);
                    case "<<=" -> BinaryExpression.create(lineNum, "<<", left, right);
                    case ">>=" -> BinaryExpression.create(lineNum, ">>", left, right);
                    case "&=" -> BinaryExpression.create(lineNum, "&", left, right);
                    case "^=" -> BinaryExpression.create(lineNum, "^", left, right);
                    case "|=" -> BinaryExpression.create(lineNum, "|", left, right);
                    default -> throw new IllegalArgumentException();
                }
        );
    }

    @Override
    public Expression visitIdentifierExpr(CParser.IdentifierExprContext ctx) {
        return new IdentifierExpression(
                ctx.start.getLine(),
                ctx.getText()
        );
    }

    @Override
    public Expression visitIntegerExpr(CParser.IntegerExprContext ctx) {
        return new IntegerExpression(
                ctx.start.getLine(),
                ctx.getText()
        );
    }

    @Override
    public Expression visitFloatExpr(CParser.FloatExprContext ctx) {
        return new FloatExpression(
                ctx.start.getLine(),
                ctx.getText()
        );
    }

    @Override
    public Expression visitEnumExpr(CParser.EnumExprContext ctx) {
        return new EnumExpression(
                ctx.start.getLine(),
                ctx.getText()
        );
    }

    @Override
    public Expression visitCharExpr(CParser.CharExprContext ctx) {
        return new CharExpression(
                ctx.start.getLine(),
                ctx.getText().toCharArray()[0]
        );
    }

    @Override
    public Expression visitLiteralExpr(CParser.LiteralExprContext ctx) {
        return new LiteralExpression(
                ctx.start.getLine(),
                ctx.getText()
        );
    }

    @Override
    public Expression visitNestedExpr(CParser.NestedExprContext ctx) {
        return visit(ctx.expression());
    }

}
