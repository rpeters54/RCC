package codegen.instruction.riscv;

import ast.types.IntegerType;
import codegen.instruction.Instruction;
import codegen.values.Literal;
import codegen.values.Register;
import codegen.values.Source;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class LoadImmRisc extends RiscInstruction {

    private final Literal imm;

    public LoadImmRisc(Register result, Literal imm) {
        super(Arrays.asList(result), new ArrayList<>());
        this.imm = imm;
    }

    public static Register OptionalImmediateLoad(List<Instruction> instructions, Source optionalImm) {
        switch (optionalImm) {
            case Register reg -> { return reg.clone(); }
            case Literal literal -> {
                assert literal.type() instanceof IntegerType;
                Register result = Register.LLVM_Register(new IntegerType(IntegerType.Width.LONG, true));
                instructions.add(new LoadImmRisc(result.clone(), literal));
                return result;
            }
            default -> throw new IllegalArgumentException("Illegal immediate load");
        }
    }

    @Override
    public String toString() {
        return String.format("li %s, %s", result(), imm);
    }
}
