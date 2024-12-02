package parser;

import ast.declarations.Declaration;
import ast.declarations.DeclarationSpecifier;
import ast.expr.*;
import ast.types.Type;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;

public class ASTExpressionVisitor extends CBaseVisitor<Expression>{

    private final ASTVisitor baseVisitor;

    public ASTExpressionVisitor(ASTVisitor baseVisitor) {
        this.baseVisitor = baseVisitor;
    }

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
        if (ctx.expressionList() != null) {
            List<CParser.AssignmentExpressionContext> expCtxList = ctx.expressionList().assignmentExpression();
            for (CParser.AssignmentExpressionContext expCtx : expCtxList) {
                expList.add(visit(expCtx));
            }
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
    public Expression visitPostIncDecExpr(CParser.PostIncDecExprContext ctx) {
        return IncDecExpression.createPostfix(
                ctx.op.getLine(),
                ctx.op.getText(),
                visit(ctx.operand)
        );
    }

    @Override
    public Expression visitPreIncDecExpr(CParser.PreIncDecExprContext ctx) {
        return IncDecExpression.createPrefix(
                ctx.op.getLine(),
                ctx.op.getText(),
                visit(ctx.operand)
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
    public Expression visitSizeofTypeExpr(CParser.SizeofTypeExprContext ctx) {
        Object obj = baseVisitor.visit(ctx.typeName());
        if (!(obj instanceof DeclarationSpecifier)) {
            throw new RuntimeException("visitSizeofTypeExpr: typename should refer to a Declaration Specifier");
        }
        return new SizeofTypeExpression(
                ctx.start.getLine(),
                ((DeclarationSpecifier) obj).getType()
        );
    }

    @Override
    public Expression visitSizeofExprExpr(CParser.SizeofExprExprContext ctx) {
        return new SizeofExprExpression(
                ctx.start.getLine(),
                visit(ctx.operand)
        );
    }

    @Override
    public Expression visitCastExpr(CParser.CastExprContext ctx) {
        Object obj = baseVisitor.visit(ctx.typeName());
        if (!(obj instanceof DeclarationSpecifier)) {
            throw new RuntimeException("visitCastExpr: typename should refer to a Declaration Specifier");
        }
        Type type = ((DeclarationSpecifier) obj).getType();
        Expression operand = visit(ctx.operand);
        return new CastExpression(ctx.start.getLine(), type, operand);
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
    public Expression visitAssignmentStepThrough(CParser.AssignmentStepThroughContext ctx) {
        return visit(ctx.expression());
    }

    @Override
    public Expression visitAssignmentExpr(CParser.AssignmentExprContext ctx) {
        int lineNum = ctx.op.getLine();
        Expression left = visit(ctx.left);
        if (!(left instanceof LValue leftValue))
            throw new RuntimeException("visitAssignmentExpr: left value should be a LValue");
        Expression right = visit(ctx.right);
        return new AssignmentExpression(lineNum,leftValue,
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
                    default -> throw new RuntimeException("visitAssignmentExpr: Undefined Desugared Binary Expression");
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
    public Expression visitNullExpr(CParser.NullExprContext ctx) {
        return new NullExpression(ctx.start.getLine());
    }

    @Override
    public Expression visitIntegerExpr(CParser.IntegerExprContext ctx) {

        String valueStr = ctx.getText().trim().replaceAll("[UuLl]", "");
        long value;
        if (valueStr.startsWith("0x") || valueStr.startsWith("0X")) {
            // Hexadecimal format (base 16)

            value = (new BigInteger(valueStr.substring(2), 16)).longValue();
        } else if (valueStr.startsWith("0") && valueStr.length() > 1) {
            // Octal format (base 8)
            value = (new BigInteger(valueStr.substring(1), 8)).longValue();
        } else {
            // Decimal format (base 10)
            value = (new BigInteger(valueStr, 10)).longValue();
        }

        return new IntegerExpression(
                ctx.start.getLine(),
                value
        );
    }

    @Override
    public Expression visitFloatExpr(CParser.FloatExprContext ctx) {
        return new FloatExpression(
                ctx.start.getLine(),
                Double.parseDouble(ctx.getText())
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
                ctx.getText()
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
        return visit(ctx.assignmentExpression());
    }



    public List<Expression> parseExpressionList(CParser.ExpressionListContext elctx) {
        List<Expression> expressionList = new ArrayList<>();
        for (CParser.AssignmentExpressionContext epctx : elctx.assignmentExpression()) {
            Expression exp = visit(epctx);
            expressionList.add(exp);
        }
        return expressionList;
    }
}
