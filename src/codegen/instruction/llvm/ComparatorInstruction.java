package codegen.instruction.llvm;

import ast.expr.BinaryExpression;
import ast.types.CompoundType;
import ast.types.FloatingType;
import ast.types.IntegerType;
import ast.types.Type;
import codegen.instruction.Instruction;
import codegen.values.Register;
import codegen.values.Source;

import java.util.Arrays;

public class ComparatorInstruction extends Instruction {

    private final BinaryExpression.Operator op;

    public ComparatorInstruction(Register result, BinaryExpression.Operator op, Source Left, Source Right) {
        super(Arch.LLVM, Arrays.asList(result), Arrays.asList(Left, Right));
        this.op = op;
    }

    //LT, GT, LE, GE, EQ, NE, L_AND, L_OR

    @Override
    public String toString() {
        String opcodeString;
        String operatorString;
        switch (getSource(0).type()) {
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
            case CompoundType ct -> {
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

        return String.format("%s = %s %s %s %s, %s", getResult(),
                opcodeString, operatorString, getSource(0).type(),
                getSource(0), getSource(1));
    }
}
