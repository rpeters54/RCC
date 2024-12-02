package codegen.instruction.riscv;

import ast.expr.BinaryExpression;
import ast.types.IntegerType;
import ast.types.PointerType;
import ast.types.PrimitiveType;
import codegen.values.Literal;
import codegen.values.Register;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public class BinaryImmRisc extends RiscInstruction {

    private final BinaryExpression.Operator op;
    private Literal imm;
    private final PrimitiveType operationType;

    public BinaryImmRisc(Register result, BinaryExpression.Operator op, Register op1, Literal imm) {
        super(Arrays.asList(result), Arrays.asList(op1));

        assert result.type() instanceof PrimitiveType;
        this.operationType = (PrimitiveType) op1.type();

        this.imm = imm;
        this.op = op;
    }

    public BinaryImmRisc(Register result, BinaryExpression.Operator op, Register op1, Literal imm,
                         PrimitiveType operationType) {
        super(Arrays.asList(result), Arrays.asList(op1));

        this.operationType = operationType;
        this.imm = imm;
        this.op = op;
    }


    public BinaryImmRisc(Register result, BinaryExpression.Operator op, Register op1, long imm) {
        super(Arrays.asList(result), Arrays.asList(op1));

        assert result.type() instanceof PrimitiveType;
        this.operationType = (PrimitiveType) op1.type();

        this.op = op;
        this.imm = new Literal(Long.toString(imm), new IntegerType(IntegerType.Width.LONG, true));
    }

    public void setImmAsLong(long imm) {
        this.imm = new Literal(Long.toString(imm), new IntegerType(IntegerType.Width.LONG, true));
    }

    @Override
    public String toString() {
        String opString;
        switch (operationType) {
            case PointerType p -> {
                opString = switch(op) {
                    case PLUS -> "addi";
                    default -> throw new RuntimeException("BinaryInstruction::toString: No Pointer " +
                            "Instruction exists with " + op);
                };
            }
            case IntegerType i -> {
                opString = switch(op) {
                    case PLUS -> "addi";
                    case B_XOR -> "xori";
                    case B_AND -> "andi";
                    case B_OR -> "ori";
                    case SR_A -> "srai";
                    case SR -> "srli";
                    case SL -> "slli";
                    case LT -> "slti";
                    default -> throw new RuntimeException("BinaryInstruction::toString: No Integer " +
                            "Instruction exists with " + op);
                };
                if (!i.signed()) {
                    switch (op) {
                        case LT -> opString += "u";
                        default -> {}
                    }
                }
            }
            default -> throw new RuntimeException("BinaryInstruction::toString: No " +
                    "Instruction exists with type " + result().type());
        }
        return String.format("%s %s, %s, %s", opString, result(), rvalue(0), imm.riscPrint());
    }


}
