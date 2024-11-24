package codegen.instruction.riscv;

import ast.expr.BinaryExpression;
import ast.types.FloatingType;
import ast.types.IntegerType;
import codegen.instruction.Instruction;
import codegen.values.Literal;
import codegen.values.Register;
import codegen.values.Source;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class StoreRisc extends RiscInstruction {

    private Literal offset;

    public StoreRisc(Register value, Register location, Literal offset) {
        super(new ArrayList<>(), Arrays.asList(value, location));
        this.offset = offset;
    }

    public StoreRisc(Register value, Register location, long offset) {
        super(new ArrayList<>(), Arrays.asList(value, location));
        this.offset = new Literal(Long.toString(offset), new IntegerType(IntegerType.Width.LONG, true));
    }

    public StoreRisc(Register value, Register location) {
        super(new ArrayList<>(), Arrays.asList(value, location));
        this.offset = null;
    }

    public static List<Instruction> generateDefaultStack(long offset) {
        List<Instruction> result = new ArrayList<>();
        long base = 0;
        // add SP decrement
        result.add(new BinaryImmRisc(Register.RiscSp(), BinaryExpression.Operator.PLUS,Register.RiscSp(), -offset));
        // store all saved registers
        result.add(new StoreRisc(Register.RiscRa(), Register.RiscSp(), base));
        base+=8;
        result.add(new StoreRisc(Register.RiscFp(), Register.RiscSp(), base));
        base+=8;
        for (Register saved : Register.SavedRiscRegisters()) {
            result.add(new StoreRisc(saved, Register.RiscSp(), base));
            base+=8;
        }
        // move current SP into the FP
        result.addAll(BinaryRisc.Mov(Register.RiscFp(), Register.RiscSp()));
        return result;
    }

    public void setOffset(long offset) {
        this.offset = new Literal(Long.toString(offset), new IntegerType(IntegerType.Width.LONG, true));
    }

    @Override
    public String toString() {
        String opString;
        switch (rvalue(0).type()) {
            case IntegerType i -> {
                opString = switch (i.size()) {
                    case LONG -> "sd";
                    case INT -> "sw";
                    case SHORT -> "sh";
                    case CHAR, BOOL -> "sb";
                };
            }
            case FloatingType f -> {
                opString = switch (f.size()) {
                    case DOUBLE -> "fsd";
                    case FLOAT -> "fsw";
                };
            }
            default -> throw new RuntimeException("BinaryInstruction::toString: No " +
                    "Instruction exists to load type" + result().type());
        }

        if (offset != null) {
            return String.format("%s %s, %s(%s)", opString, rvalue(0), offset, rvalue(1));
        } else {
            return String.format("%s %s, (%s)", opString, rvalue(0), rvalue(1));
        }
    }
}
