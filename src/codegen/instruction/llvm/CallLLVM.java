package codegen.instruction.llvm;

import ast.types.FloatingType;
import ast.types.IntegerType;
import ast.types.PointerType;
import codegen.instruction.Instruction;
import codegen.instruction.riscv.BinaryRisc;
import codegen.instruction.riscv.CallRisc;
import codegen.instruction.riscv.LoadImmRisc;
import codegen.values.Register;
import codegen.values.Source;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class CallLLVM extends LLVMInstruction implements Critical {

    private final String name;

    public CallLLVM(Register result, List<Register> arguments, String name) {
        super(Arrays.asList(result), arguments);
        this.name = name;
    }

    public CallLLVM(List<Register> arguments, String name) {
        super(Arrays.asList(), arguments);
        this.name = name;
    }

    @Override
    public String toString() {
        StringBuilder builder = new StringBuilder();
        if (results().isEmpty()) {
            builder.append(String.format("call void @%s(", name));
        } else {
            builder.append(String.format("%s = call %s @%s(", result(), result().type(), name));
        }
        for (Source source : rvalues()) {
            builder.append(String.format("%s %s, ", source.type(), source));
        }
        if (!rvalues().isEmpty()) {
            builder.delete(builder.length() - 2, builder.length());
        }
        builder.append(")");
        return builder.toString();
    }

    @Override
    public List<Instruction> toRisc(List<Register> localResults, List<Register> localRvalues) {
        int intRegCount = 0;
        int floatRegCount = 0;
        List<Instruction> risc = new ArrayList<>();
        // push all arguments into the proper risc arg registers
        for (Source source : localRvalues) {
            Register operand = LoadImmRisc.OptionalImmediateLoad(risc, source);
            switch (operand.type()) {
                case PointerType pt -> risc.addAll(BinaryRisc.Mov(Register.RiscIntArg(intRegCount++), operand));
                case IntegerType it -> risc.addAll(BinaryRisc.Mov(Register.RiscIntArg(intRegCount++), operand));
                case FloatingType ft -> risc.addAll(BinaryRisc.FMov(Register.RiscFloatArg(floatRegCount++), operand));
                case null, default -> throw new IllegalArgumentException("Unsupported source type: " + operand.type());
            }
        }
        // add the call instruction
        risc.add(new CallRisc(name));
        // grab the result from the correct risc arg register
        if (!localResults.isEmpty()) {
            Register localResult = localResults.getFirst();
            switch (localResult.type()) {
                case PointerType pt -> risc.addAll(BinaryRisc.Mov(localResult, Register.RiscIntArg(0)));
                case IntegerType it -> risc.addAll(BinaryRisc.Mov(localResult, Register.RiscIntArg(0)));
                case FloatingType ft -> risc.addAll(BinaryRisc.FMov(localResult, Register.RiscFloatArg(0)));
                case null, default -> throw new IllegalArgumentException("Unsupported result type: " + localResult.type());
            }
        }
        return risc;
    }
}
