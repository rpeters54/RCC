package codegen.instruction.riscv;

import ast.types.FloatingType;
import ast.types.IntegerType;
import codegen.values.Register;
import codegen.values.Source;

import java.util.Arrays;
import java.util.List;

public class FloatConversionRisc extends RiscInstruction {

    public FloatConversionRisc(Register result, Register value) {
        super(Arrays.asList(result), Arrays.asList(value));
    }

    @Override
    public String toString() {
        String opString = "fcvt";
        opString += getDot(result());
        opString += getDot(rvalue(0));
        return String.format("%s %s, %s", opString, result(), rvalue(0));
    }

    private static String getDot(Source item) {
        String result;
        switch (item.type()) {
            case IntegerType it -> {
                if (it.size() == IntegerType.Width.LONG) {
                    result = ".l";
                } else {
                    result = ".f";
                }
                if (it.signed()) {
                    result += "u";
                }
            }
            case FloatingType ft -> {
                if (ft.size() == FloatingType.Width.DOUBLE) {
                    result = ".d";
                } else {
                    result = ".s";
                }
            }
            default -> throw new RuntimeException("FloatConversionInstruction: Invalid type: " + item.type());
        }
        return result;
    }
}
