package ast.expr;

import ast.declarations.DeclarationSpecifier;
import ast.types.PrimitiveType;
import codegen.BasicBlock;
import codegen.ControlFlowGraph;
import codegen.TranslationUnit;
import codegen.instruction.llvm.BinaryLLVM;
import codegen.instruction.llvm.LoadLiteralLLVM;
import codegen.values.Literal;
import codegen.values.Register;
import ast.TypeEnvironment;

public class IncDecExpression extends LValue {
    private final Operator operator;
    private final Expression operand;

    private IncDecExpression(int lineNum, Operator operator, Expression operand) {
        super(lineNum);
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
    public DeclarationSpecifier verifySemantics(TypeEnvironment globalEnv, TypeEnvironment localEnv, TypeEnvironment.StorageLocation location) {
        if (!(operand instanceof LValue)) {
            throw new RuntimeException("PostIncDecExpression::verifySemantics: Operand must be a LValue");
        }
        DeclarationSpecifier opDeclSpec = operand.verifySemantics(globalEnv,localEnv, TypeEnvironment.StorageLocation.REGISTER);
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
    public Register codegen(TranslationUnit unit, ControlFlowGraph cfg, BasicBlock block) {
        // get current value
        Register operandCurrentValue = operand.codegen(unit, cfg, block);
        // load a literal with the value 1
        Register one = Register.LLVM_Register(operandCurrentValue.type());
        block.addInstruction(new LoadLiteralLLVM(new Literal("1", operandCurrentValue.type()), one));

        // depending on inc/dec create the proper binary instruction
        Register opResult = Register.LLVM_Register(operandCurrentValue.type());
        switch (operator) {
            case PRE_INC, POST_INC -> block.addInstruction(new BinaryLLVM(opResult,
                    BinaryExpression.Operator.PLUS, operandCurrentValue, one));
            case PRE_DEC, POST_DEC -> block.addInstruction(new BinaryLLVM(opResult,
                    BinaryExpression.Operator.MINUS, operandCurrentValue, one));
            default -> throw new RuntimeException("PostIncDecExpression::codegen: Invalid Operator");
        }

        // return the correct value depending on pre/post
        switch (operator) {
            case PRE_INC, PRE_DEC -> {
                ((LValue)operand).processLValue(unit,cfg,block,opResult);
                return opResult;
            }
            case POST_INC, POST_DEC -> {
                ((LValue)operand).processLValue(unit,cfg,block,opResult);
                return operandCurrentValue;
            }
            default -> throw new RuntimeException("PostIncDecExpression::codegen: Invalid Operator");
        }
    }

    @Override
    public Register processLValue(TranslationUnit unit, ControlFlowGraph cfg, BasicBlock block, Register right) {
        throw new RuntimeException("Not Implemented");
    }
}
