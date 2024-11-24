package codegen.instruction.llvm;

import ast.expr.BinaryExpression;
import ast.types.FloatingType;
import ast.types.IntegerType;
import ast.types.PointerType;
import codegen.instruction.Instruction;
import codegen.instruction.riscv.BinaryImmRisc;
import codegen.instruction.riscv.BinaryRisc;
import codegen.values.Literal;
import codegen.values.Register;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class ComparatorLLVM extends LLVMInstruction {

    private final BinaryExpression.Operator op;

    public ComparatorLLVM(Register result, BinaryExpression.Operator op, Register Left, Register Right) {
        super(Arrays.asList(result), Arrays.asList(Left, Right));
        this.op = op;
    }

    //LT, GT, LE, GE, EQ, NE, L_AND, L_OR

    @Override
    public String toString() {
        String opcodeString;
        String operatorString;
        switch (rvalue(0).type()) {
            case IntegerType it -> {
                opcodeString = "icmp";
                if (it.signed()) {
                    operatorString = switch (op) {
                        case LT -> "slt";
                        case GT -> "sgt";
                        case LE -> "sle";
                        case GE -> "sge";
                        case EQ -> "eq";
                        case NE -> "ne";
                        default -> throw new RuntimeException("ComparatorInstruction::toString: " +
                                "Invalid Operator");
                    };
                } else {
                    operatorString = switch (op) {
                        case LT -> "ult";
                        case GT -> "ugt";
                        case LE -> "ule";
                        case GE -> "uge";
                        case EQ -> "eq";
                        case NE -> "ne";
                        default -> throw new RuntimeException("ComparatorInstruction::toString: " +
                                "Invalid Operator");
                    };
                }
            }
            case FloatingType ft -> {
                opcodeString = "fcmp";
                operatorString = switch (op) {
                    case LT -> "olt";
                    case GT -> "ogt";
                    case LE -> "ole";
                    case GE -> "oge";
                    case EQ -> "oeq";
                    case NE -> "one";
                    default -> throw new RuntimeException("ComparatorInstruction::toString: " +
                            "Invalid Operator");
                };
            }
            case PointerType pt -> {
                opcodeString = "icmp";
                operatorString = switch (op) {
                    case LT -> "slt";
                    case GT -> "sgt";
                    case LE -> "sle";
                    case GE -> "sge";
                    case EQ -> "eq";
                    case NE -> "ne";
                    default -> throw new RuntimeException("ComparatorInstruction::toString: " +
                            "Invalid Operator");
                };
            }
            case null, default -> throw new RuntimeException("ComparatorInstruction::toString: " +
                    "Invalid Type");
        }

        return String.format("%s = %s %s %s %s, %s", result(),
                opcodeString, operatorString, rvalue(0).type(),
                rvalue(0), rvalue(1));
    }

    @Override
    public List<Instruction> toRisc(List<Register> localResults, List<Register> localRvalues) {
        ArrayList<Instruction> risc = new ArrayList<>();
        Register localResult = localResults.getFirst();
        switch (localRvalues.get(0).type()) {
            case IntegerType it -> handleIntAndPointer(localResults, localRvalues, op, risc);
            case PointerType pt -> handleIntAndPointer(localResults, localRvalues, op, risc);
            case FloatingType ft -> {
                switch (op) {
                    case LT -> risc.add(new BinaryRisc(localResult.clone(),
                            BinaryExpression.Operator.LT, localRvalues.get(0).clone(), localRvalues.get(1)));
                    case LE -> risc.add(new BinaryRisc(localResult.clone(), BinaryExpression.Operator.LE,
                            localRvalues.get(1).clone(), localRvalues.get(0)));
                    case EQ -> risc.add(new BinaryRisc(localResult.clone(), BinaryExpression.Operator.EQ,
                            localRvalues.get(0).clone(), localRvalues.get(1)));
                    case GT -> {
                        Register secondaryResult = Register.LLVM_Register(new IntegerType(IntegerType.Width.BOOL, true));
                        risc.add(new BinaryRisc(secondaryResult.clone(), BinaryExpression.Operator.LE,
                                localRvalues.get(1).clone(), localRvalues.get(0)));
                        risc.add(new BinaryImmRisc(localResult.clone(), BinaryExpression.Operator.B_XOR,
                                secondaryResult, new Literal("1", new IntegerType(IntegerType.Width.BOOL, true))));
                    }
                    case GE -> {
                        Register secondaryResult = Register.LLVM_Register(new IntegerType(IntegerType.Width.BOOL, true));
                        risc.add(new BinaryRisc(secondaryResult.clone(), BinaryExpression.Operator.LT,
                                localRvalues.get(0).clone(), localRvalues.get(1)));
                        risc.add(new BinaryImmRisc(localResult.clone(), BinaryExpression.Operator.B_XOR,
                                secondaryResult, new Literal("1", new IntegerType(IntegerType.Width.BOOL, true))));
                    }
                    case NE -> {
                        Register secondaryResult = Register.LLVM_Register(new IntegerType(IntegerType.Width.BOOL, true));
                        risc.add(new BinaryRisc(secondaryResult.clone(), BinaryExpression.Operator.EQ,
                                localRvalues.get(0).clone(), localRvalues.get(1)));
                        risc.add(new BinaryImmRisc(localResult.clone(), BinaryExpression.Operator.B_XOR,
                                secondaryResult, new Literal("1", new IntegerType(IntegerType.Width.BOOL, true))));
                    }
                    default -> throw new RuntimeException("ComparatorInstruction::toString: " +
                            "Invalid Operator");
                };
            }
            case null, default -> throw new RuntimeException("ComparatorInstruction::toString: " +
                    "Invalid Type");
        }
        return risc;
    }

    private static void handleIntAndPointer(List<Register> localResults, List<Register> localRvalues,
                                            BinaryExpression.Operator op, List<Instruction> risc) {
        Register localResult = localResults.getFirst();
        switch (op) {
            case LT -> risc.add(new BinaryRisc(localResult.clone(), BinaryExpression.Operator.LT,
                    localRvalues.get(0).clone(), localRvalues.get(1)));
            case GT -> {
                Register secondaryResult = Register.LLVM_Register(new IntegerType(IntegerType.Width.BOOL, true));
                risc.add(new BinaryRisc(secondaryResult.clone(), BinaryExpression.Operator.LT,
                        localRvalues.get(0).clone(), localRvalues.get(1)));
                risc.add(new BinaryImmRisc(localResult.clone(), BinaryExpression.Operator.B_XOR,
                        secondaryResult, new Literal("1", new IntegerType(IntegerType.Width.BOOL, true))));
            }
            case LE -> {
                Register secondaryResult = Register.LLVM_Register(new IntegerType(IntegerType.Width.BOOL, true));
                risc.add(new BinaryRisc(secondaryResult.clone(), BinaryExpression.Operator.LT,
                        localRvalues.get(1).clone(), localRvalues.get(0)));
                risc.add(new BinaryImmRisc(localResult.clone(), BinaryExpression.Operator.B_XOR,
                        secondaryResult, new Literal("1", new IntegerType(IntegerType.Width.BOOL, true))));
            }
            case GE -> risc.add(new BinaryRisc(localResult.clone(), BinaryExpression.Operator.LT,
                    localRvalues.get(1).clone(), localRvalues.get(0)));
            case EQ -> {
                Register secondaryResult = Register.LLVM_Register(new IntegerType(IntegerType.Width.BOOL, true));
                risc.add(new BinaryRisc(secondaryResult.clone(), BinaryExpression.Operator.B_XOR,
                        localRvalues.get(0).clone(), localRvalues.get(1)));
                risc.add(new BinaryImmRisc(localResult.clone(), BinaryExpression.Operator.B_XOR,
                        secondaryResult, new Literal("1", new IntegerType(IntegerType.Width.BOOL, true))));
            }
            case NE -> risc.add(new BinaryRisc(localResult.clone(), BinaryExpression.Operator.B_XOR,
                    localRvalues.get(0).clone(), localRvalues.get(1)));
            default -> throw new RuntimeException("ComparatorInstruction::toString: " +
                    "Invalid Operator");
        }
    }
}
