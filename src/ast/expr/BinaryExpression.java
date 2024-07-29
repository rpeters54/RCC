package ast.expr;

import ast.declarations.DeclarationSpecifier;
import ast.types.*;
import codegen.BasicBlock;
import codegen.ControlFlowGraph;
import codegen.TranslationUnit;
import codegen.instruction.Instruction;
import codegen.instruction.llvm.BinaryInstruction;
import codegen.instruction.llvm.ComparatorInstruction;
import codegen.instruction.llvm.ConversionInstruction;
import codegen.instruction.llvm.GetElemPtrInstruction;
import codegen.values.Literal;
import codegen.values.Register;
import codegen.values.Source;
import ast.TypeEnvironment;

import java.util.Arrays;

public class BinaryExpression implements ast.expr.Expression {
    private final int lineNum;
    private final Operator operator;
    private final Expression left;
    private final Expression right;

    private BinaryExpression(int lineNum, Operator operator,
                             Expression left, Expression right) {
        this.lineNum = lineNum;
        this.operator = operator;
        this.left = left;
        this.right = right;
    }

    public static BinaryExpression create(int lineNum, String opStr,
                                          Expression left, Expression right) {
        return switch (opStr) {
            case TIMES_OPERATOR -> new BinaryExpression(lineNum, Operator.TIMES, left, right);
            case DIVIDE_OPERATOR -> new BinaryExpression(lineNum, Operator.DIVIDE, left, right);
            case MODULO_OPERATOR -> new BinaryExpression(lineNum, Operator.MODULO, left, right);
            case PLUS_OPERATOR -> new BinaryExpression(lineNum, Operator.PLUS, left, right);
            case MINUS_OPERATOR -> new BinaryExpression(lineNum, Operator.MINUS, left, right);
            case SHIFT_LEFT_OPERATOR -> new BinaryExpression(lineNum, Operator.SL, left, right);
            case SHIFT_RIGHT_OPERATOR -> new BinaryExpression(lineNum, Operator.SR, left, right);
            case LT_OPERATOR -> new BinaryExpression(lineNum, Operator.LT, left, right);
            case LE_OPERATOR -> new BinaryExpression(lineNum, Operator.LE, left, right);
            case GT_OPERATOR -> new BinaryExpression(lineNum, Operator.GT, left, right);
            case GE_OPERATOR -> new BinaryExpression(lineNum, Operator.GE, left, right);
            case EQ_OPERATOR -> new BinaryExpression(lineNum, Operator.EQ, left, right);
            case NE_OPERATOR -> new BinaryExpression(lineNum, Operator.NE, left, right);
            case BITWISE_AND_OPERATOR -> new BinaryExpression(lineNum, Operator.B_AND, left, right);
            case BITWISE_XOR_OPERATOR -> new BinaryExpression(lineNum, Operator.B_XOR, left, right);
            case BITWISE_OR_OPERATOR -> new BinaryExpression(lineNum, Operator.B_OR, left, right);
            case LOGICAL_AND_OPERATOR -> new BinaryExpression(lineNum, Operator.L_AND, left, right);
            case LOGICAL_OR_OPERATOR -> new BinaryExpression(lineNum, Operator.L_OR, left, right);
            default -> throw new IllegalArgumentException();
        };
    }

    private static final String TIMES_OPERATOR = "*";
    private static final String DIVIDE_OPERATOR = "/";
    private static final String MODULO_OPERATOR = "%";
    private static final String PLUS_OPERATOR = "+";
    private static final String MINUS_OPERATOR = "-";
    private static final String SHIFT_LEFT_OPERATOR = "<<";
    private static final String SHIFT_RIGHT_OPERATOR = ">>";
    private static final String LT_OPERATOR = "<";
    private static final String GT_OPERATOR = ">";
    private static final String LE_OPERATOR = "<=";
    private static final String GE_OPERATOR = ">=";
    private static final String EQ_OPERATOR = "==";
    private static final String NE_OPERATOR = "!=";
    private static final String BITWISE_AND_OPERATOR = "&";
    private static final String BITWISE_XOR_OPERATOR = "^";
    private static final String BITWISE_OR_OPERATOR = "|";
    private static final String LOGICAL_AND_OPERATOR = "&&";
    private static final String LOGICAL_OR_OPERATOR = "||";


    public enum Operator {
        TIMES, DIVIDE, MODULO, PLUS, MINUS, SL, SR, LT, GT, LE, GE, EQ, NE, B_AND, B_XOR, B_OR, L_AND, L_OR
    }

    @Override
    public DeclarationSpecifier verifySemantics(TypeEnvironment globalEnv, TypeEnvironment localEnv) {
        DeclarationSpecifier leftDecl = left.verifySemantics(globalEnv, localEnv);
        DeclarationSpecifier rightDecl = right.verifySemantics(globalEnv, localEnv);

        if (!(leftDecl.getType() instanceof PrimitiveType primLeft
                && rightDecl.getType() instanceof PrimitiveType primRight)) {
            throw new RuntimeException("BinaryExpression::verifySemantics: can only apply " +
                    "binary operators to primitive types");
        }

        PrimitiveType resultType;
        switch (operator) {
            case PLUS, MINUS -> {
                boolean left = primLeft instanceof CompoundType;
                boolean right = primRight instanceof CompoundType;
                if (left && !right || !left && right) {
                    resultType = primLeft instanceof CompoundType ? primLeft : primRight;
                } else if (left || right) {
                    throw new RuntimeException("BinaryExpression::verifySemantics: " +
                            "Can't do pointer arithmetic with two pointers");
                } else {
                    resultType = PrimitiveType.implicitConversion(primLeft, primRight);
                }
            }
            case TIMES, DIVIDE -> {
                boolean left = primLeft instanceof CompoundType;
                boolean right = primRight instanceof CompoundType;
                if (left || right) {
                    throw new RuntimeException("BinaryExpression::verifySemantics: " +
                            "Can't do multiplication with pointers");
                } else {
                    resultType = PrimitiveType.implicitConversion(primLeft, primRight);
                }
            }
            case MODULO, SL, SR, B_AND, B_XOR, B_OR -> {
                if (primLeft instanceof CompoundType || primRight instanceof CompoundType) {
                    throw new RuntimeException("BinaryExpression::verifySemantics: " +
                            "Can't apply bitwise operations on pointers");
                }
                if (primLeft instanceof FloatingType || primRight instanceof FloatingType) {
                    throw new RuntimeException("BinaryExpression::verifySemantics: can't apply " +
                            "bitwise operators on floating point numbers");
                }
                resultType = PrimitiveType.implicitConversion(primLeft, primRight);
            }
            case LT, GT, LE, GE, EQ, NE, L_AND, L_OR -> {
                resultType = PrimitiveType.implicitConversion(primLeft, primRight);
            }
            case null, default -> {
                throw new RuntimeException("BinaryExpression::verifySemantics: undefined operator");
            }
        }
        return new DeclarationSpecifier(resultType);
    }


    @Override
    public Source codegen(TranslationUnit unit, ControlFlowGraph cfg, BasicBlock block) {
        Source leftSource = left.codegen(unit, cfg, block);
        Source rightSource = right.codegen(unit, cfg, block);


        Register result;
        // handle ptr arithmetic
        if (leftSource.type() instanceof CompoundType ^ rightSource.type() instanceof CompoundType) {
            Source ptr = leftSource.type() instanceof CompoundType ? leftSource : rightSource;
            Source operand = leftSource.type() instanceof CompoundType ? rightSource : leftSource;
            result = Register.LLVM_Register(ptr.type());
            block.addInstruction(new GetElemPtrInstruction(result, Arrays.asList(ptr, operand)));
        } else {
            // add implicit conversion if necessary
            PrimitiveType conversion = PrimitiveType.implicitConversion(
                    (PrimitiveType) leftSource.type(),
                    (PrimitiveType) rightSource.type()
            );

            if (!conversion.equals(leftSource.type())) {
                Instruction converter = ConversionInstruction.make(leftSource, conversion);
                block.addInstruction(converter);
                leftSource = converter.getResult().clone();
            }
            if (!conversion.equals(rightSource.type())) {
                Instruction converter = ConversionInstruction.make(rightSource, conversion);
                block.addInstruction(converter);
                rightSource = converter.getResult().clone();
            }

            switch (operator) {
                case PLUS, MINUS, TIMES, DIVIDE, MODULO, SL, SR, B_AND, B_XOR, B_OR -> {
                    result = Register.LLVM_Register(leftSource.type().clone());
                    block.addInstruction(new BinaryInstruction(result, operator, leftSource, rightSource));
                }
                case LT, GT, LE, GE, EQ, NE -> {
                    result = Register.LLVM_Register(new IntegerType(IntegerType.Width.BOOL, true));
                    block.addInstruction(new ComparatorInstruction(result, operator, leftSource, rightSource));
                }
                case L_AND -> {
                    Register temp = Register.LLVM_Register(leftSource.type().clone());
                    result = Register.LLVM_Register(new IntegerType(IntegerType.Width.BOOL, true));
                    block.addInstruction(new BinaryInstruction(temp, Operator.B_AND, leftSource, rightSource));
                    block.addInstruction(new ComparatorInstruction(result, Operator.NE, temp.clone(),
                            new Literal("0", temp.type().clone())));
                }
                case L_OR -> {
                    Register temp = Register.LLVM_Register(leftSource.type().clone());
                    result = Register.LLVM_Register(new IntegerType(IntegerType.Width.BOOL, true));
                    block.addInstruction(new BinaryInstruction(temp, Operator.B_OR, leftSource, rightSource));
                    block.addInstruction(new ComparatorInstruction(result, Operator.NE, temp.clone(),
                            new Literal("0", temp.type().clone())));
                }
                default -> throw new RuntimeException("BinaryExpression::codegen: undefined operator");
            }
        }
        return result.clone();
    }


}