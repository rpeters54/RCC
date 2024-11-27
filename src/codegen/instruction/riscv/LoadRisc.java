package codegen.instruction.riscv;

import ast.expr.BinaryExpression;
import ast.types.*;
import codegen.instruction.Instruction;
import codegen.values.Literal;
import codegen.values.Register;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class LoadRisc extends RiscInstruction {

    private Literal offset;
    private final PrimitiveType loadType;


    public LoadRisc(Register result, Register location) {
        super(Arrays.asList(result), Arrays.asList(location));
        assert result.type() instanceof PrimitiveType;
        this.loadType = (PrimitiveType) result.type();
        this.offset = null;
    }

    private LoadRisc(Register result, Register location, Literal offset) {
        super(Arrays.asList(result), Arrays.asList(location));
        assert result.type() instanceof PrimitiveType;
        this.loadType = (PrimitiveType) result.type();
        this.offset = offset;
    }

    public LoadRisc(Register result, Register location, long offset) {
        super(Arrays.asList(result), Arrays.asList(location));
        assert result.type() instanceof PrimitiveType;
        this.loadType = (PrimitiveType) result.type();
        Literal offsetLit = new Literal(Long.toString(offset), new IntegerType(IntegerType.Width.LONG, true));
        this.offset = offsetLit;
    }

//    public static List<Instruction> withOffset(Register value, Register location, long offset) {
//        Literal offsetLit = new Literal(Long.toString(offset), new IntegerType(IntegerType.Width.LONG, true));
//        if (offset > 2047 || offset < -2048) {
//            return List.of(
//                    new LoadImmRisc(Register.RiscIntTemp(0), offsetLit),
//                    new BinaryRisc(Register.RiscIntTemp(1), BinaryExpression.Operator.PLUS,
//                            Register.RiscIntTemp(0), Register.RiscSp()),
//                    new LoadRisc(value, Register.RiscIntTemp(1))
//            );
//        } else {
//            return List.of(
//                    new LoadRisc(value, location, offsetLit)
//            );
//        }
//    }



    public void setOffset(long offset) {
        this.offset = new Literal(Long.toString(offset), new IntegerType(IntegerType.Width.LONG, true));
    }

//    public static List<Instruction> collapseDefaultStack(long offset) {
//        List<Instruction> result = new ArrayList<>();
//        long base = 0;
//        offset-=16;
//        result.addAll(LoadRisc.withOffset(Register.RiscFp(), Register.RiscSp(), offset));
//        offset+=8;
//        result.addAll(LoadRisc.withOffset(Register.RiscRa(), Register.RiscSp(), offset));
//        offset+=8;
//
//        if (offset > 2047 || offset < -2048) {
//            result.add(new LoadImmRisc(Register.RiscIntTemp(0), new Literal(Long.toString(offset),
//                    new IntegerType(IntegerType.Width.LONG, true))));
//            result.add(new BinaryRisc(Register.RiscSp(), BinaryExpression.Operator.PLUS,
//                    Register.RiscSp(), Register.RiscIntTemp(0)));
//        } else {
//            result.add(new BinaryImmRisc(Register.RiscSp(), BinaryExpression.Operator.PLUS, Register.RiscSp(), offset));
//        }
//        return result;
//    }

    public static List<Instruction> collapseDefaultStack(long offset) {
        List<Instruction> result = new ArrayList<>();
        long base = 0;
        result.add(new LoadRisc(Register.RiscRa(), Register.RiscSp(), base));
        base+=8;
        result.add(new LoadRisc(Register.RiscFp(), Register.RiscSp(), base));
        base+=8;
//        for (Register saved : Register.SavedRiscRegisters()) {
//            result.add(new LoadRisc(saved, Register.RiscSp(), base));
//            base+=8;
//        }
        result.add(new BinaryImmRisc(Register.RiscSp(), BinaryExpression.Operator.PLUS,Register.RiscSp(), offset));
        return result;
    }

    @Override
    public String toString() {
        String opString;
        switch (loadType) {
            case PointerType pt -> {
                opString = "ld";
            }
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
                    "Instruction exists to load type" + loadType);
        }

        if (offset != null) {
            return String.format("%s %s, %s(%s)", opString, result(), offset.riscPrint(), rvalue(0));
        } else {
            return String.format("%s %s, (%s)", opString, result(), rvalue(0));
        }
    }
}
