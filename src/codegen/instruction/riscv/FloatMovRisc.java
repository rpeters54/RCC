package codegen.instruction.riscv;

import ast.types.FloatingType;
import ast.types.IntegerType;
import codegen.values.Register;
import codegen.values.Source;

import java.util.Arrays;
import java.util.List;

public class FloatMovRisc extends RiscInstruction {

    public FloatMovRisc(Register result, Register op1) {
        super(Arrays.asList(result), Arrays.asList(op1));
    }

    @Override
    public String toString() {
        String opString = "fmv";
        opString += getDot(result());
        opString += getDot(rvalue(0));
        return String.format("%s %s, %s", opString, result(), rvalue(0));
    }

    private static String getDot(Source item) {
        String result;
        switch (item.type()) {
            case IntegerType it -> {
                result = ".x";
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
