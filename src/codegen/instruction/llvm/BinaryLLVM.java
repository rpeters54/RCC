package codegen.instruction.llvm;

import ast.expr.BinaryExpression;
import ast.types.FloatingType;
import ast.types.IntegerType;

import ast.types.PointerType;
import codegen.instruction.Instruction;
import codegen.instruction.riscv.BinaryRisc;
import codegen.values.Literal;
import codegen.values.Register;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class BinaryLLVM extends LLVMInstruction {

    private final BinaryExpression.Operator op;

    public BinaryLLVM(Register result, BinaryExpression.Operator op, Register op1, Register op2) {
        super(Arrays.asList(result), Arrays.asList(op1, op2));
        this.op = op;
    }

    @Override
    public String toString() {
        String opString;
        switch (result().type()) {
            case IntegerType i -> {
                opString = switch(op) {
                    case PLUS -> "add";
                    case MINUS -> "sub";
                    case TIMES -> "mul";
                    case DIVIDE -> "sdiv";
                    case B_XOR -> "xor";
                    case B_AND -> "and";
                    case B_OR -> "or";
                    case SR -> "lshr";
                    case SL -> "shl";
                    case MODULO -> "srem";
                    default -> throw new RuntimeException("BinaryInstruction::toString: No Integer " +
                            "Instruction exists with " + op);
                };
            }
            case FloatingType f -> {
                opString = switch(op) {
                    case PLUS -> "fadd";
                    case MINUS -> "fsub";
                    case TIMES -> "fmul";
                    case DIVIDE -> "fdiv";
                    default -> throw new RuntimeException("BinaryInstruction::toString: No Floating Point " +
                            "Instruction exists with " + op);
                };
            }
            default -> throw new RuntimeException("BinaryInstruction::toString: No " +
                    "Instruction exists with " + op);
        }
        return String.format("%s = %s %s %s, %s",
                result(), opString, rvalue(0).type(),
                rvalue(0), rvalue(1));
    }

    public LoadLiteralLLVM collapse(Literal left, Literal right) {

        Literal result;
        switch (left.type()) {
            case IntegerType it -> {
                long leftVal = Long.parseLong(left.toString());
                long rightVal = Long.parseLong(right.toString());
                long resultVal = switch (op) {
                    case PLUS -> leftVal + rightVal;
                    case MINUS -> leftVal - rightVal;
                    case TIMES -> leftVal * rightVal;
                    case DIVIDE -> leftVal / rightVal;
                    case B_XOR -> leftVal ^ rightVal;
                    case B_AND -> leftVal & rightVal;
                    case B_OR -> leftVal | rightVal;
                    case SR -> leftVal >> rightVal;
                    case SL -> leftVal << rightVal;
                    case MODULO -> leftVal % rightVal;
                    case null, default -> throw new RuntimeException("BinaryInstruction::collapse: " +
                            "Undefined Operand");
                };
                switch (it.size()) {
                    case LONG -> {
                        if (it.signed()) {
                            result = new Literal(Long.toString(resultVal),
                                    new IntegerType(IntegerType.Width.LONG, true));
                        } else {
                            result = new Literal(Long.toUnsignedString(resultVal),
                                    new IntegerType(IntegerType.Width.LONG, false));
                        }
                    }
                    case INT -> {
                        int clippedResultVal = (int) resultVal;
                        if (it.signed()) {
                            result = new Literal(Integer.toString(clippedResultVal),
                                    new IntegerType(IntegerType.Width.INT, true));
                        } else {
                            result = new Literal(Integer.toUnsignedString(clippedResultVal),
                                    new IntegerType(IntegerType.Width.INT, false));
                        }
                    }
                    case SHORT -> {
                        short clippedResultVal = (short) resultVal;
                        if (it.signed()) {
                            result = new Literal(Short.toString(clippedResultVal),
                                    new IntegerType(IntegerType.Width.SHORT, true));
                        } else {
                            result = new Literal(Integer.toUnsignedString(clippedResultVal),
                                    new IntegerType(IntegerType.Width.SHORT, false));
                        }
                    }
                    case CHAR -> {
                        char clippedResultVal = (char) resultVal;
                        if (it.signed()) {
                            result = new Literal(Integer.toString(clippedResultVal),
                                    new IntegerType(IntegerType.Width.CHAR, true));
                        } else {
                            result = new Literal(Integer.toUnsignedString(clippedResultVal),
                                    new IntegerType(IntegerType.Width.CHAR, false));
                        }
                    }
                    case BOOL -> {
                        int boolVal = resultVal != 0 ? 1 : 0;
                        result = new Literal(Integer.toUnsignedString(boolVal),
                                new IntegerType(IntegerType.Width.BOOL, true));
                    }
                    case null, default -> throw new RuntimeException("Invalid integer size");
                }
            }
            case FloatingType ft -> {
                double leftVal = Double.parseDouble(left.toString());
                double rightVal = Double.parseDouble(right.toString());
                double resultVal = switch (op) {
                    case PLUS -> leftVal + rightVal;
                    case MINUS -> leftVal - rightVal;
                    case TIMES -> leftVal * rightVal;
                    case DIVIDE -> leftVal / rightVal;
                    case null, default -> throw new RuntimeException("BinaryInstruction::collapse: " +
                            "Undefined Operand");
                };
                switch (ft.size()) {
                    case DOUBLE -> {
                        result = new Literal(Double.toString(resultVal),
                                new FloatingType(FloatingType.Width.DOUBLE));
                    }
                    case FLOAT -> {
                        float clippedResultVal = (float) resultVal;
                        result = new Literal(Float.toString(clippedResultVal),
                                new FloatingType(FloatingType.Width.FLOAT));
                    }
                    case null, default -> throw new RuntimeException("Invalid floating point size");
                }
            }
            case null, default -> throw new RuntimeException("BinaryInstruction::collapse: No " +
                    "Instruction exists with " + op);
        }

        Register tempLocal = Register.LLVM_Register(result.type());
        return new LoadLiteralLLVM(result, tempLocal);
    }

    public List<Instruction> toRisc(List<Register> localResults, List<Register> localRvalues) {
        List<Instruction> instructions = new ArrayList<>();

        Register localResult = localResults.getFirst();
        switch (localResult.type()) {
            case IntegerType it -> {
                Register left = localRvalues.get(0);
                Register right = localRvalues.get(1);
                switch (it.size()) {
                    case LONG -> instructions.add(new BinaryRisc(localResult.clone(), op, left, right));
                    case INT, SHORT, BOOL, CHAR-> {
                        BinaryExpression.Operator sr = it.signed() ?
                               BinaryExpression.Operator.SR_A : BinaryExpression.Operator.SR;
                        Register interResult = Register.LLVM_Register(new IntegerType(IntegerType.Width.LONG, it.signed()));
                        instructions.add(new BinaryRisc(interResult.clone(), op, left, right));
                        ConversionLLVM.addShifts(instructions, sr, localResult.clone(), interResult);
                    }
                }
            }
            case FloatingType ft -> {
                instructions.add(new BinaryRisc(localResult.clone(), op,
                        localRvalues.get(0).clone(), localRvalues.get(1).clone()));
            }
            case PointerType pt -> {
                instructions.add(new BinaryRisc(localResult.clone(), op,
                        localRvalues.get(0).clone(), localRvalues.get(1).clone()));
            }
            default -> throw new RuntimeException("BinaryInstruction::toRisc: invalid type");
        }

        return instructions;
    }

}
