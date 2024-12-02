package ast.expr;

import ast.declarations.DeclarationSpecifier;
import ast.types.*;
import codegen.BasicBlock;
import codegen.ControlFlowGraph;
import codegen.TranslationUnit;
import codegen.instruction.Instruction;
import codegen.instruction.llvm.BinaryLLVM;
import codegen.instruction.llvm.ComparatorLLVM;
import codegen.instruction.llvm.ConversionLLVM;
import codegen.instruction.llvm.GetElemPtrLLVM;
import codegen.values.Literal;
import codegen.values.Register;
import codegen.values.Source;
import ast.TypeEnvironment;

import java.util.Arrays;

public class BinaryExpression extends Expression implements ConstantExpression {
    private final Operator operator;
    private final Expression left;
    private final Expression right;

    private BinaryExpression(int lineNum, Operator operator,
                             Expression left, Expression right) {
        super(lineNum);
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
        TIMES, DIVIDE, MODULO, PLUS, MINUS, SL, SR, SR_A, LT,
        GT, LE, GE, EQ, NE, B_AND, B_XOR, B_OR, L_AND, L_OR
    }

    @Override
    public DeclarationSpecifier verifySemantics(TypeEnvironment globalEnv, TypeEnvironment localEnv, TypeEnvironment.StorageLocation location) {
        DeclarationSpecifier leftDecl = left.verifySemantics(globalEnv, localEnv, TypeEnvironment.StorageLocation.REGISTER);
        DeclarationSpecifier rightDecl = right.verifySemantics(globalEnv, localEnv, TypeEnvironment.StorageLocation.REGISTER);

        if (leftDecl.getType() instanceof ArrayType atl) {
            leftDecl = new DeclarationSpecifier(new PointerType(atl.base()),
                    leftDecl.getStorage(),
                    leftDecl.getQualifier());
        }

        if (rightDecl.getType() instanceof ArrayType atr) {
            rightDecl = new DeclarationSpecifier(new PointerType(atr.base()),
                    rightDecl.getStorage(),
                    rightDecl.getQualifier());
        }

        if (!(leftDecl.getType() instanceof PrimitiveType primLeft
                && rightDecl.getType() instanceof PrimitiveType primRight)) {
            throw new RuntimeException("BinaryExpression::verifySemantics: can only apply " +
                    "binary operators to primitive types");
        }

        PrimitiveType resultType;
        switch (operator) {
            case PLUS -> {
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
            case MINUS -> {
                boolean left = primLeft instanceof CompoundType;
                boolean right = primRight instanceof CompoundType;
                if (left && !right || !left && right) {
                    resultType = primLeft instanceof CompoundType ? primLeft : primRight;
                } else if (left || right) {
                    resultType = new IntegerType(IntegerType.Width.LONG, true);
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
    public Register codegen(TranslationUnit unit, ControlFlowGraph cfg, BasicBlock block) {
        Register leftReg = left.codegen(unit, cfg, block);
        Register rightReg = right.codegen(unit, cfg, block);

        Register result;
        switch (operator) {
            case PLUS -> {
                if (leftReg.type() instanceof PointerType ^ rightReg.type() instanceof PointerType) {
                    Register ptr = leftReg.type() instanceof PointerType ? leftReg : rightReg;
                    Register operand = leftReg.type() instanceof PointerType ? rightReg : leftReg;
                    switch (((PointerType) ptr.type()).base()) {
                        case ArrayType at -> {
                            Type expandedBase = unit.getGlobalTypeEnvironment()
                                    .expandDeclaration(new DeclarationSpecifier(at.base())).getType();
                            result = Register.LLVM_Register(new PointerType(expandedBase));
                            Literal stepThrough = new Literal("0", new IntegerType());
                            block.addInstruction(new GetElemPtrLLVM(result, Arrays.asList(ptr, stepThrough, operand)));
                        }
                        case null, default -> {
                            result = Register.LLVM_Register(ptr.type());
                            block.addInstruction(new GetElemPtrLLVM(result, Arrays.asList(ptr, operand)));
                        }
                    }
                } else {
                    RegTuple tuple = addConversion(block, leftReg, rightReg);
                    result = Register.LLVM_Register(tuple.left.type());
                    block.addInstruction(new BinaryLLVM(result, operator, tuple.left(), tuple.right()));
                }
            }
            case MINUS -> {
                if (leftReg.type() instanceof PointerType && rightReg.type() instanceof PointerType) {
                    result = Register.LLVM_Register(new IntegerType(IntegerType.Width.LONG, true));
                    ConversionLLVM leftConv = ConversionLLVM.make(leftReg, (PrimitiveType) result.type());
                    ConversionLLVM rightConv = ConversionLLVM.make(rightReg, (PrimitiveType) result.type());
                    block.addInstruction(leftConv);
                    block.addInstruction(rightConv);
                    block.addInstruction(new BinaryLLVM(result, operator, leftConv.result(), rightConv.result()));
                } else if (leftReg.type() instanceof PointerType ^ rightReg.type() instanceof PointerType) {
                    Register ptr = leftReg.type() instanceof PointerType ? leftReg : rightReg;
                    Register operand = leftReg.type() instanceof PointerType ? rightReg : leftReg;
                    Register zero = Literal.nill(new IntegerType(IntegerType.Width.LONG, true), unit,cfg,block);
                    Register sub = Register.LLVM_Register(new IntegerType(IntegerType.Width.LONG, true));
                    if (!PrimitiveType.comparePrimitives((PrimitiveType) operand.type(),(PrimitiveType) zero.type())) {
                        ConversionLLVM conv = ConversionLLVM.make(operand, new IntegerType(IntegerType.Width.LONG, true));
                        operand = conv.result().clone();
                        block.addInstruction(conv);
                    }
                    BinaryLLVM minus = new BinaryLLVM(sub.clone(), Operator.MINUS, zero, operand);
                    block.addInstruction(minus);
                    switch (((PointerType) ptr.type()).base()) {
                        case ArrayType at -> {
                            Type expandedType = unit.getGlobalTypeEnvironment()
                                    .expandDeclaration(new DeclarationSpecifier(at.base())).getType();
                            result = Register.LLVM_Register(expandedType);
                            Source stepThrough = new Literal("0", new IntegerType());
                            block.addInstruction(new GetElemPtrLLVM(result, Arrays.asList(ptr, stepThrough, sub)));
                        }
                        case null, default -> {
                            result = Register.LLVM_Register(ptr.type());
                            block.addInstruction(new GetElemPtrLLVM(result, Arrays.asList(ptr, sub)));
                        }
                    }
                } else{
                    RegTuple tuple = addConversion(block, leftReg, rightReg);
                    result = Register.LLVM_Register(tuple.left.type());
                    block.addInstruction(new BinaryLLVM(result, operator, tuple.left(), tuple.right()));
                }
            }
            case TIMES, DIVIDE, MODULO, SL, SR, B_AND, B_XOR, B_OR -> {
                RegTuple tuple = addConversion(block, leftReg, rightReg);
                result = Register.LLVM_Register(tuple.left.type());
                block.addInstruction(new BinaryLLVM(result, operator, tuple.left(), tuple.right()));
            }
            case LT, GT, LE, GE, EQ, NE -> {
                RegTuple tuple = addConversion(block, leftReg, rightReg);
                result = Register.LLVM_Register(new IntegerType(IntegerType.Width.BOOL, true));
                block.addInstruction(new ComparatorLLVM(result, operator, tuple.left(), tuple.right()));
            }
            case L_AND -> {
                RegTuple tuple = addConversion(block, leftReg, rightReg);
                Register temp = Register.LLVM_Register(tuple.left.type());
                result = Register.LLVM_Register(new IntegerType(IntegerType.Width.BOOL, true));
                block.addInstruction(new BinaryLLVM(temp.clone(), Operator.B_AND, tuple.left(), tuple.right()));
                block.addInstruction(new ComparatorLLVM(result, Operator.NE, temp,
                        Literal.nill(temp.type(), unit, cfg, block)));
            }
            case L_OR -> {
                RegTuple tuple = addConversion(block, leftReg, rightReg);
                Register temp = Register.LLVM_Register(tuple.left.type());
                result = Register.LLVM_Register(new IntegerType(IntegerType.Width.BOOL, true));
                block.addInstruction(new BinaryLLVM(temp.clone(), Operator.B_OR, tuple.left(), tuple.right()));
                block.addInstruction(new ComparatorLLVM(result, Operator.NE, temp,
                        Literal.nill(temp.type(), unit, cfg, block)));
            }
            default -> throw new RuntimeException("BinaryExpression::codegen: undefined operator");
        }

        return result.clone();
    }


    private record RegTuple(Register left, Register right) {}
    private static RegTuple addConversion(BasicBlock block, Register leftReg, Register rightReg) {
        // add implicit conversion if necessary
        PrimitiveType conversion = PrimitiveType.implicitConversion(
                (PrimitiveType) leftReg.type(),
                (PrimitiveType) rightReg.type()
        );

        if (!PrimitiveType.comparePrimitives(conversion, (PrimitiveType) leftReg.type())) {
            Instruction converter = ConversionLLVM.make(leftReg, conversion);
            block.addInstruction(converter);
            leftReg = converter.result().clone();
        }

        if (!PrimitiveType.comparePrimitives(conversion, (PrimitiveType) rightReg.type())) {
            Instruction converter = ConversionLLVM.make(rightReg, conversion);
            block.addInstruction(converter);
            rightReg = converter.result().clone();
        }

        return new RegTuple(leftReg, rightReg);
    }


    /**
     * Interpret a constant expression, used for handling array types in parser
     * @return the interpreted value
     */
    public long interp() {
        if (!(left instanceof ConstantExpression lConst && right instanceof ConstantExpression rConst)) {
            throw new RuntimeException("Can't interp a non-constant expression");
        }

        long leftVal = lConst.interp();
        long rightVal = rConst.interp();

        return switch(operator) {
            case EQ -> leftVal == rightVal ? 1 : 0;
            case NE -> leftVal != rightVal ? 1 : 0;
            case LT -> leftVal < rightVal ? 1 : 0;
            case GT -> leftVal > rightVal ? 1 : 0;
            case LE -> leftVal <= rightVal ? 1 : 0;
            case GE -> leftVal >= rightVal ? 1 : 0;
            case SL -> leftVal << rightVal;
            case SR -> leftVal >> rightVal;
            case B_AND -> leftVal & rightVal;
            case B_OR -> leftVal | rightVal;
            case B_XOR -> leftVal ^ rightVal;
            case PLUS -> leftVal + rightVal;
            case MINUS -> leftVal - rightVal;
            case TIMES -> leftVal * rightVal;
            case DIVIDE -> leftVal / rightVal;
            case MODULO -> leftVal % rightVal;
            case L_OR -> ((leftVal | rightVal) != 0) ? 1 : 0;
            case L_AND -> ((leftVal & rightVal) != 0) ? 1 : 0;
            case SR_A -> leftVal >>> rightVal;
            case null, default -> throw new RuntimeException("Invalid operator: " + operator);
        };
    }



}