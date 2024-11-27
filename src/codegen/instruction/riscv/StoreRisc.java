package codegen.instruction.riscv;

import ast.expr.BinaryExpression;
import ast.types.*;
import codegen.instruction.Instruction;
import codegen.values.Literal;
import codegen.values.Register;
import codegen.values.Source;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class StoreRisc extends RiscInstruction {

    private Literal offset;
    private final PrimitiveType storeType;

    public StoreRisc(Register value, Register location) {
        super(new ArrayList<>(), Arrays.asList(value, location));
        assert value.type() instanceof PrimitiveType;
        this.storeType = (PrimitiveType) value.type();
        this.offset = null;
    }

    private StoreRisc(Register value, Register location, Literal offset) {
        super(new ArrayList<>(), Arrays.asList(value, location));
        assert value.type() instanceof PrimitiveType;
        this.storeType = (PrimitiveType) value.type();
        this.offset = offset;
    }

    public StoreRisc(Register value, Register location, long offset) {
        super(new ArrayList<>(), Arrays.asList(value, location));
        assert value.type() instanceof PrimitiveType;
        this.storeType = (PrimitiveType) value.type();
        this.offset = new Literal(Long.toString(offset), new IntegerType(IntegerType.Width.LONG, true));
    }

//    public static List<Instruction> withOffset(Register value, Register location, long offset) {
//        Literal offsetLit = new Literal(Long.toString(offset), new IntegerType(IntegerType.Width.LONG, true));
//        if (offset > 2047 || offset < -2048) {
//            return List.of(
//                    new LoadImmRisc(Register.RiscIntTemp(0), offsetLit),
//                    new BinaryRisc(Register.RiscIntTemp(1), BinaryExpression.Operator.PLUS,
//                            Register.RiscIntTemp(0), Register.RiscSp()),
//                    new StoreRisc(value, Register.RiscIntTemp(1))
//            );
//        } else {
//            return List.of(
//                    new StoreRisc(value, location, offsetLit)
//            );
//        }
//    }

//    public static List<Instruction> generateDefaultStack(long offset) {
//        List<Instruction> result = new ArrayList<>();
//        // add SP decrement
//        if (offset > 2047 || offset < -2048) {
//            result.add(new LoadImmRisc(Register.RiscIntTemp(0), new Literal(Long.toString(-offset),
//                    new IntegerType(IntegerType.Width.LONG, true))));
//            result.add(new BinaryRisc(Register.RiscSp(), BinaryExpression.Operator.PLUS,
//                    Register.RiscSp(), Register.RiscIntTemp(0)));
//        } else {
//            result.add(new BinaryImmRisc(Register.RiscSp(), BinaryExpression.Operator.PLUS, Register.RiscSp(), -offset));
//        }
//        // store all saved registers
//        offset-=8;
//        result.addAll(StoreRisc.withOffset(Register.RiscRa(), Register.RiscSp(), offset));
//        offset-=8;
//        result.addAll(StoreRisc.withOffset(Register.RiscFp(), Register.RiscSp(), offset));
//
//        return result;
//    }

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
//        for (Register saved : Register.SavedRiscRegisters()) {
//            result.add(new StoreRisc(saved, Register.RiscSp(), base));
//            base+=8;
//        }
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
        switch (storeType) {
            case PointerType pt -> {
                opString = "sd";
            }
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
                    "Instruction exists to load type" + storeType);
        }

        if (offset != null) {
            return String.format("%s %s, %s(%s)", opString, rvalue(0), offset.riscPrint(), rvalue(1));
        } else {
            return String.format("%s %s, (%s)", opString, rvalue(0), rvalue(1));
        }
    }
}
