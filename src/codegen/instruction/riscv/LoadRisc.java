package codegen.instruction.riscv;

import ast.expr.BinaryExpression;
import ast.types.FloatingType;
import ast.types.IntegerType;
import codegen.instruction.Instruction;
import codegen.values.Literal;
import codegen.values.Register;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class LoadRisc extends RiscInstruction {

    private Literal offset;

    public LoadRisc(Register result, Register location, Literal offset) {
        super(Arrays.asList(result), Arrays.asList(location));
        this.offset = offset;
    }

    public LoadRisc(Register result, Register location, long offset) {
        super(Arrays.asList(result), Arrays.asList(location));
        this.offset = new Literal(Long.toString(offset), new IntegerType(IntegerType.Width.LONG, true));
    }

    public LoadRisc(Register result, Register location) {
        super(Arrays.asList(result), Arrays.asList(location));
        this.offset = null;
    }

    public void setOffset(long offset) {
        this.offset = new Literal(Long.toString(offset), new IntegerType(IntegerType.Width.LONG, true));
    }

    public static List<Instruction> collapseDefaultStack(long offset) {
        List<Instruction> result = new ArrayList<>();
        long base = 0;
        result.add(new LoadRisc(Register.RiscRa(), Register.RiscSp(), base));
        base+=8;
        result.add(new LoadRisc(Register.RiscFp(), Register.RiscSp(), base));
        base+=8;
        for (Register saved : Register.SavedRiscRegisters()) {
            result.add(new LoadRisc(saved, Register.RiscSp(), base));
            base+=8;
        }
        result.add(new BinaryImmRisc(Register.RiscSp(), BinaryExpression.Operator.PLUS,Register.RiscSp(), offset));
        return result;
    }

    @Override
    public String toString() {
        String opString;
        switch (result().type()) {
            case IntegerType i -> {
                opString = switch (i.size()) {
                    case LONG -> "ld";
                    case INT -> "lw";
                    case SHORT -> "lh";
                    case CHAR, BOOL -> "lb";
                };
                if (!i.signed()) {
                    opString += "u";
                }
            }
            case FloatingType f -> {
                opString = switch (f.size()) {
                    case DOUBLE -> "fld";
                    case FLOAT -> "flw";
                };
            }
            default -> throw new RuntimeException("LoadInstruction::toString: No " +
                    "Instruction exists to load type" + result().type());
        }

        if (offset != null) {
            return String.format("%s %s, %s(%s)", opString, result(), offset, rvalue(0));
        } else {
            return String.format("%s %s, (%s)", opString, result(), rvalue(0));
        }
    }
}
