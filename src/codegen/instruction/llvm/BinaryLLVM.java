package codegen.instruction.llvm;

import ast.expr.BinaryExpression;
import ast.types.FloatingType;
import ast.types.IntegerType;

import ast.types.PointerType;
import codegen.instruction.Instruction;
import codegen.instruction.riscv.BinaryRisc;
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

//    public Source collapse() {
//        Source leftSource = rvalue(0);
//        Source rightSource = rvalue(1);
//
//        if (!(leftSource instanceof Literal leftLiteral) || !(rightSource instanceof Literal rightLiteral)) {
//            return null;
//        }
//
//        String result;
//        switch (leftLiteral.type()) {
//            case IntegerType it -> {
//                long left = Long.parseLong(leftLiteral.toString());
//                long right = Long.parseLong(rightLiteral.toString());
//                switch (op) {
//                    case PLUS -> result = String.format("%d", left + right);
//                    case MINUS -> result = String.format("%d", left - right);
//                    case TIMES -> result = String.format("%d", left * right);
//                    case DIVIDE -> result = String.format("%d", left / right);
//                    case B_XOR -> result = String.format("%d", left ^ right);
//                    case B_AND -> result = String.format("%d", left & right);
//                    case B_OR -> result = String.format("%d", left | right);
//                    case SR -> result = String.format("%d", left >> right);
//                    case SL -> result = String.format("%d", left << right);
//                    case MODULO -> result = String.format("%d", left % right);
//                    case null, default -> throw new RuntimeException("BinaryInstruction::collapse: " +
//                            "Undefined Operand");
//                }
//            }
//            case FloatingType ft -> {
//                double left = Double.parseDouble(leftLiteral.toString());
//                double right = Double.parseDouble(rightLiteral.toString());
//                switch (op) {
//                    case PLUS -> result = String.format("%f", left + right);
//                    case MINUS -> result = String.format("%f", left - right);
//                    case TIMES -> result = String.format("%f", left * right);
//                    case DIVIDE -> result = String.format("%f", left / right);
//                    case null, default -> throw new RuntimeException("BinaryInstruction::collapse: " +
//                            "Undefined Operand");
//                }
//            }
//            case null, default -> throw new RuntimeException("BinaryInstruction::collapse: No " +
//                    "Instruction exists with " + op);
//        }
//
//        return new Literal(result, leftLiteral.type().clone());
//    }

    public List<Instruction> toRisc(List<Register> localResults, List<Register> localRvalues) {
        List<Instruction> instructions = new ArrayList<>();

        Register localResult = localResults.getFirst();
        switch (localResult.type()) {
            case IntegerType it -> {
                Register left = localRvalues.get(0);
                Register right = localRvalues.get(1);
                switch (it.size()) {
                    case LONG -> instructions.add(new BinaryRisc(localResult.clone(), op, left, right));
                    case INT, SHORT, CHAR-> {
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
