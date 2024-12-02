package codegen.instruction.riscv;

import ast.expr.BinaryExpression;
import ast.types.FloatingType;
import ast.types.IntegerType;
import ast.types.PointerType;
import ast.types.PrimitiveType;
import codegen.instruction.Instruction;
import codegen.values.Register;

import java.util.Arrays;
import java.util.List;

public class BinaryRisc extends RiscInstruction {

    private final BinaryExpression.Operator op;
    private final PrimitiveType operationType;

    public BinaryRisc(Register result, BinaryExpression.Operator op, Register op1, Register op2) {
        super(Arrays.asList(result), Arrays.asList(op1, op2));

        assert result.type() instanceof PrimitiveType;
        this.operationType = (PrimitiveType) op1.type();
        this.op = op;
    }

    public BinaryRisc(Register result, BinaryExpression.Operator op, Register op1, Register op2,
                         PrimitiveType operationType) {
        super(Arrays.asList(result), Arrays.asList(op1, op2));

        this.operationType = operationType;
        this.op = op;
    }

    public BinaryExpression.Operator getOp() {
        return op;
    }

    public static List<Instruction> AnyMov(Register result, Register op1) {
        return switch (op1.type()) {
            case IntegerType it -> BinaryRisc.Mov(result, op1);
            case PointerType it -> BinaryRisc.Mov(result, op1);
            case FloatingType ft -> BinaryRisc.FMovToFloatReg(result, op1);
            default -> throw new RuntimeException("invalid type");
        };
    }

    public static List<Instruction> Mov(Register result, Register op1) {
        assert op1.type() instanceof IntegerType || op1.type() instanceof PointerType;
        return List.of(new BinaryRisc(result, BinaryExpression.Operator.PLUS, op1, Register.RiscZero()));
    }

    /**
     * move a float into another floating register
     * @param result
     * @param op1
     * @return
     */
    public static List<Instruction> FMovToFloatReg(Register result, Register op1) {
        assert op1.type() instanceof FloatingType;
        assert result.type() instanceof FloatingType;
        Register floatingRegister = Register.LLVM_Register(op1.type());
        return List.of(
                new FloatMovRisc(floatingRegister, Register.RiscZero()),
                new BinaryRisc(result, BinaryExpression.Operator.PLUS, op1, floatingRegister)
        );
    }

    /**
     * move a float into an integer register
     * @param result
     * @param op1
     * @return
     */
    public static List<Instruction> FMovToIntReg(Register result, Register op1) {
        assert op1.type() instanceof FloatingType;
        assert result.type() instanceof IntegerType;
        FloatingType ft = (FloatingType) op1.type();
        Register temp = Register.LLVM_Register(result.type());
        return List.of(
                new FloatMovRisc(temp, op1),
                new BinaryRisc(result, BinaryExpression.Operator.PLUS, temp, Register.RiscZero())
        );
    }

    @Override
    public String toString() {
        String opString;
        switch (operationType) {
            case PointerType p -> {
                opString = switch(op) {
                    case PLUS -> "add";
                    case MINUS -> "sub";
                    default -> throw new RuntimeException("BinaryInstruction::toString: No Pointer " +
                            "Instruction exists with " + op);
                };
            }
            case IntegerType i -> {
                opString = switch(op) {
                    case PLUS -> "add";
                    case MINUS -> "sub";
                    case TIMES -> "mul";
                    case DIVIDE -> "div";
                    case B_XOR -> "xor";
                    case B_AND -> "and";
                    case B_OR -> "or";
                    case SR_A -> "sra";
                    case SR -> "srl";
                    case SL -> "sll";
                    case MODULO -> "rem";
                    case LT -> "slt";
                    default -> throw new RuntimeException("BinaryInstruction::toString: No 64-bit Integer " +
                            "Instruction exists with " + op);
                };
                if (!i.signed()) {
                    switch (op) {
                        case DIVIDE, MODULO, LT -> opString += "u";
                        default -> {}
                    }
                }
            }
            case FloatingType f -> {
                opString = switch(op) {
                    case PLUS -> "fadd";
                    case MINUS -> "fsub";
                    case TIMES -> "fmul";
                    case DIVIDE -> "fdiv";
                    case EQ -> "feq";
                    case LT -> "flt";
                    case LE -> "fle";
                    default -> throw new RuntimeException("BinaryInstruction::toString: No Floating Point " +
                            "Instruction exists with " + op);
                };
                switch (f.size()) {
                    case DOUBLE -> opString += ".d";
                    case FLOAT -> opString += ".s";
                }
            }
            default -> throw new RuntimeException("BinaryInstruction::toString: No " +
                    "Instruction exists with " + op);
        }
        return String.format("%s %s, %s, %s", opString, result(), rvalue(0), rvalue(1));
    }

}
