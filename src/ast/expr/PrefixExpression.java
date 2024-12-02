package ast.expr;

import ast.declarations.DeclarationSpecifier;
import ast.types.*;
import codegen.BasicBlock;
import codegen.ControlFlowGraph;
import codegen.TranslationUnit;
import codegen.instruction.llvm.BinaryLLVM;
import codegen.instruction.llvm.ComparatorLLVM;
import codegen.instruction.llvm.LoadLLVM;
import codegen.instruction.llvm.StoreLLVM;
import codegen.values.Literal;
import codegen.values.Register;
import codegen.values.Source;
import ast.TypeEnvironment;

public class PrefixExpression extends LValue implements ConstantExpression {

    private final Operator operator;
    private final Expression operand;

    private PrefixExpression(int lineNum, Operator operator, Expression operand) {
        super(lineNum);
        this.operator = operator;
        this.operand = operand;
    }

    public static PrefixExpression create(int lineNum, String opStr,
                                         Expression operand) {
        return switch (opStr) {
            case REF_OPERATOR -> new PrefixExpression(lineNum, PrefixExpression.Operator.REF, operand);
            case POINTER_OPERATOR -> new PrefixExpression(lineNum, PrefixExpression.Operator.POINTER, operand);
            case POS_OPERATOR -> new PrefixExpression(lineNum, PrefixExpression.Operator.POS, operand);
            case MINUS_OPERATOR -> new PrefixExpression(lineNum, PrefixExpression.Operator.MINUS, operand);
            case INV_OPERATOR -> new PrefixExpression(lineNum, PrefixExpression.Operator.INV, operand);
            case NOT_OPERATOR -> new PrefixExpression(lineNum, PrefixExpression.Operator.NOT, operand);
            default -> throw new RuntimeException("PrefixExpression::create: invalid operator: " + opStr);
        };
    }

    private static final String REF_OPERATOR = "&";
    private static final String POINTER_OPERATOR = "*";
    private static final String POS_OPERATOR = "+";
    private static final String MINUS_OPERATOR = "-";
    private static final String INV_OPERATOR = "~";
    private static final String NOT_OPERATOR = "!";


    public enum Operator {
        REF, POINTER, POS, MINUS, INV, NOT
    }

    @Override
    public DeclarationSpecifier verifySemantics(TypeEnvironment globalEnv, TypeEnvironment localEnv, TypeEnvironment.StorageLocation location) {

        switch (operator) {
            case REF -> {
                DeclarationSpecifier opDeclSpec = operand.verifySemantics(globalEnv,localEnv, TypeEnvironment.StorageLocation.STACK);
                return new DeclarationSpecifier(new PointerType(opDeclSpec.getType()),
                        opDeclSpec.getStorage(), opDeclSpec.getQualifier());
            }
            case POINTER -> {
                DeclarationSpecifier opDeclSpec = operand.verifySemantics(globalEnv,localEnv, TypeEnvironment.StorageLocation.REGISTER);
                if (!(opDeclSpec.getType() instanceof CompoundType))
                    throw new RuntimeException("PrefixExpression::verifySemantics: Can't dereference a non-pointer/array");
                Type baseType = ((CompoundType) opDeclSpec.getType()).base();
                return new DeclarationSpecifier(baseType, opDeclSpec.getStorage(),opDeclSpec.getQualifier());
            }
            case POS, MINUS, INV, NOT -> {
                DeclarationSpecifier opDeclSpec = operand.verifySemantics(globalEnv,localEnv, TypeEnvironment.StorageLocation.REGISTER);
                if (!(opDeclSpec.getType() instanceof PrimitiveType))
                    throw new RuntimeException("PrefixExpression::verifySemantics: Can't use +/-/!/~ on a non-primitive");
                return opDeclSpec;
            }
            default -> throw new RuntimeException("PrefixExpression::verifySemantics: Invalid Operator");
        }
    }

    @Override
    public Register codegen(TranslationUnit unit, ControlFlowGraph cfg, BasicBlock block) {

        switch (operator) {
            case POINTER -> {
                Register operandReg = operand.codegen(unit, cfg, block);
                PointerType pt = (PointerType) operandReg.type();
                Type expandedType = unit.getGlobalTypeEnvironment()
                        .expandDeclaration(new DeclarationSpecifier(pt.base())).getType();

                switch (expandedType) {
                    case ArrayType at -> { return operandReg; }
                    case StructType st -> { return operandReg; }
                    case UnionType ut -> { return operandReg; }
                    case PrimitiveType primt -> {
                        Register result = Register.LLVM_Register(expandedType);
                        block.addInstruction(new LoadLLVM(result.clone(), operandReg));
                        return result;
                    }
                    case null, default -> {
                        throw new RuntimeException("IdentifierExpression::codegen: invalid type " + expandedType);
                    }
                }

            }
            case REF -> {
                switch (operand) {
                    case IdentifierExpression idExp -> {
                        return idExp.getAddress(unit, cfg, block);
                    }
                    case PrefixExpression pExp -> {
                        if (pExp.operator == Operator.POINTER) {
                            return pExp.operand.codegen(unit, cfg, block);
                        } else {
                            throw new RuntimeException("PrefixExpression::codegen: Can't get address of a non-identifier");
                        }
                    }
                    case DotExpression dotExp -> {
                        return dotExp.handleRef(unit, cfg, block);
                    }
                    case null, default -> {
                        throw new RuntimeException("PrefixExpression::codegen: Can't get address of a non-identifier");
                    }
                }
            }
            case NOT -> {
                Register value = operand.codegen(unit, cfg, block);
                Register zero = Literal.nill(value.type(), unit, cfg, block);
                Register result = Register.LLVM_Register(new IntegerType(IntegerType.Width.BOOL, true));
                ComparatorLLVM comp = new ComparatorLLVM(result.clone(),
                        BinaryExpression.Operator.EQ, value, zero);

                block.addInstruction(comp);
                return result;
            }
            case MINUS -> {
                Register value = operand.codegen(unit, cfg, block);
                Register zero = Literal.nill(value.type(), unit, cfg, block);
                Register result = Register.LLVM_Register(value.type());
                BinaryLLVM minus = new BinaryLLVM(result.clone(), BinaryExpression.Operator.MINUS, zero, value);

                block.addInstruction(minus);
                return result;
            }
            case null, default -> throw new RuntimeException("PrefixExpression::codegen: Not Implemented");
        }
    }

    @Override
    public Register processLValue(TranslationUnit unit, ControlFlowGraph cfg, BasicBlock block, Register right) {
        switch (operator) {
            case POINTER -> {
                Register operandReg = operand.codegen(unit, cfg, block);
                block.addInstruction(new StoreLLVM(right, operandReg));
                return null;
            }
            case REF -> {
                throw new RuntimeException("PrefixExpression::processLValue: Can't assign value to value with & operator");
            }
            case null, default -> throw new RuntimeException("PrefixExpression::codegen: Not Implemented");
        }
    }

    /**
     * Interpret a constant expression, used for handling array types in parser
     * @return the interpreted value
     */
    public long interp() {
        if (!(operand instanceof ConstantExpression opConst)) {
            throw new RuntimeException("Can't interp a non-constant expression");
        }

        long opVal = opConst.interp();

        return switch(operator) {
            case MINUS -> -opVal;
            case INV -> ~opVal;
            case POS -> opVal;
            case null, default -> throw new RuntimeException("Invalid operator: " + operator);
        };
    }
}