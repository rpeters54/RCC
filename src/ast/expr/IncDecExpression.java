package ast.expr;

import ast.declarations.DeclarationSpecifier;
import ast.types.PrimitiveType;
import codegen.BasicBlock;
import codegen.values.Register;
import codegen.values.Source;
import semantics.TypeEnvironment;

public class IncDecExpression implements LValue {
    private final int lineNum;
    private final Operator operator;
    private final Expression operand;

    private IncDecExpression(int lineNum, Operator operator, Expression operand) {
        this.lineNum = lineNum;
        this.operator = operator;
        this.operand = operand;
    }

    public static IncDecExpression createPostfix(int lineNum, String opStr,
                                          Expression operand) {
        return switch (opStr) {
            case INC_OPERATOR -> new IncDecExpression(lineNum, Operator.POST_INC, operand);
            case DEC_OPERATOR -> new IncDecExpression(lineNum, Operator.POST_DEC, operand);
            default -> throw new RuntimeException("PostIncDecExpression::createPostfix: invalid operator: " + opStr);
        };
    }

    public static IncDecExpression createPrefix(int lineNum, String opStr,
                                                 Expression operand) {
        return switch (opStr) {
            case INC_OPERATOR -> new IncDecExpression(lineNum, Operator.PRE_INC, operand);
            case DEC_OPERATOR -> new IncDecExpression(lineNum, Operator.PRE_DEC, operand);
            default -> throw new RuntimeException("PostIncDecExpression::createPrefix: invalid operator: " + opStr);
        };
    }

    private static final String INC_OPERATOR = "++";
    private static final String DEC_OPERATOR = "--";

    public enum Operator {
        PRE_INC, PRE_DEC, POST_INC, POST_DEC
    }

    @Override
    public DeclarationSpecifier verifySemantics(TypeEnvironment globalEnv, TypeEnvironment localEnv) {
        DeclarationSpecifier opDeclSpec = operand.verifySemantics(globalEnv,localEnv);
        switch (operator) {
            case PRE_INC, PRE_DEC, POST_INC, POST_DEC -> {
                if (!(opDeclSpec.getType() instanceof PrimitiveType))
                    throw new RuntimeException("PostIncDecExpression::verifySemantics: Can't use +/-/!/~ on a non-primitive");
                return opDeclSpec;
            }
            default -> throw new RuntimeException("PostIncDecExpression::verifySemantics: Invalid Operator");
        }
    }

    @Override
    public Source codegen(BasicBlock block, TypeEnvironment globalEnv, TypeEnvironment localEnv) {
        throw new RuntimeException("Not Implemented");
    }

    @Override
    public Register getLValue(BasicBlock block) {
        throw new RuntimeException("Not Implemented");
    }
}
