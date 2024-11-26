package codegen.instruction.riscv;

import ast.types.FloatingType;
import ast.types.IntegerType;
import ast.types.PointerType;
import ast.types.PrimitiveType;
import codegen.values.Register;
import codegen.values.Source;

import java.util.Arrays;
import java.util.List;

public class FloatConversionRisc extends RiscInstruction {

    private final PrimitiveType resultType;
    private final PrimitiveType opType;

    public FloatConversionRisc(Register result, Register op1) {
        super(Arrays.asList(result), Arrays.asList(op1));

        assert result.type() instanceof PrimitiveType;
        assert op1.type() instanceof PrimitiveType;
        this.resultType = (PrimitiveType) result.type();
        this.opType = (PrimitiveType) op1.type();
    }

    @Override
    public String toString() {
        String opString = "fcvt";
        opString += getDot(resultType);
        opString += getDot(opType);
        return String.format("%s %s, %s", opString, result(), rvalue(0));
    }

    private static String getDot(PrimitiveType t) {
        String result;
        switch (t) {
            case IntegerType it -> {
                if (it.size() == IntegerType.Width.LONG) {
                    result = ".l";
                } else {
                    result = ".w";
                }
                if (it.signed()) {
                    result += "u";
                }
            }
            case PointerType pt -> result = ".l";
            case FloatingType ft -> {
                if (ft.size() == FloatingType.Width.DOUBLE) {
                    result = ".d";
                } else {
                    result = ".s";
                }
            }
            default -> throw new RuntimeException("FloatConversionInstruction: Invalid type: " + t);
        }
        return result;
    }
}
