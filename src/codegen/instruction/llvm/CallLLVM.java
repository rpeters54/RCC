package codegen.instruction.llvm;

import ast.types.FloatingType;
import ast.types.FunctionType;
import ast.types.IntegerType;
import ast.types.PointerType;
import codegen.instruction.Instruction;
import codegen.instruction.riscv.*;
import codegen.values.Register;
import codegen.values.Source;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class CallLLVM extends LLVMInstruction implements Critical {

    private final String name;
    private final Register funcPtr;
    private FunctionType type;

    public CallLLVM(Register result, List<Register> arguments, String name, FunctionType type) {
        super(Arrays.asList(result), arguments);
        this.name = name;
        this.type = type;
        this.funcPtr = null;
    }

    public CallLLVM(List<Register> arguments, String name, FunctionType type) {
        super(Arrays.asList(), arguments);
        this.name = name;
        this.type = type;
        this.funcPtr = null;
    }

    public CallLLVM(Register result, List<Register> arguments, Register functionPtr, FunctionType type) {
        super(Arrays.asList(result), arguments);
        addRValue(functionPtr);
        this.name = "";
        this.type = type;
        this.funcPtr = functionPtr;
    }

    public CallLLVM(List<Register> arguments, Register functionPtr, FunctionType type) {
        super(Arrays.asList(), arguments);
        addRValue(functionPtr);
        this.name = "";
        this.type = type;
        this.funcPtr = functionPtr;
    }

    @Override
    public String toString() {
        StringBuilder builder = new StringBuilder();

        if (name.isEmpty()) {
            if (results().isEmpty()) {
                builder.append(String.format("call void % s(", funcPtr));
            } else {
                builder.append(String.format("%s = call %s %s(", result(), result().type(), funcPtr));
            }
        } else {
            if (results().isEmpty()) {
                builder.append(String.format("call void @%s(", name));
            } else {
                builder.append(String.format("%s = call %s @%s(", result(), result().type(), name));
            }
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
        int regCount = 0;
        List<Instruction> risc = new ArrayList<>();
        // push all arguments into the proper risc arg registers
        for (Register operand : localRvalues) {
            switch (operand.type()) {
                case PointerType pt -> risc.addAll(BinaryRisc.Mov(Register.RiscIntArg(regCount++), operand));
                case IntegerType it -> risc.addAll(BinaryRisc.Mov(Register.RiscIntArg(regCount++), operand));
                case FloatingType ft -> {
                    if (regCount < type.inputTypes().size()) {
                        risc.addAll(BinaryRisc.FMovToFloatReg(Register.RiscFloatArg(regCount++), operand));
                    } else {
                        risc.addAll(BinaryRisc.FMovToIntReg(Register.RiscIntArg(regCount++), operand));
                    }
                }
                case null, default -> throw new IllegalArgumentException("Unsupported source type: " + operand.type());
            }
        }
        // add the call instruction
        if (name.isEmpty()) {
            risc.add(new JalrRisc(funcPtr));
        } else {
            risc.add(new LoadAddressRisc(Register.RiscIntTemp(1), name));
            risc.add(new JalrRisc(Register.RiscIntTemp(1)));
        }
        // grab the result from the correct risc arg register
        if (!localResults.isEmpty()) {
            Register localResult = localResults.getFirst();
            switch (localResult.type()) {
                case PointerType pt -> risc.addAll(BinaryRisc.Mov(localResult, Register.RiscIntArg(0)));
                case IntegerType it -> risc.addAll(BinaryRisc.Mov(localResult, Register.RiscIntArg(0)));
                case FloatingType ft -> risc.addAll(BinaryRisc.FMovToFloatReg(localResult, Register.RiscFloatArg(0)));
                case null, default -> throw new IllegalArgumentException("Unsupported result type: " + localResult.type());
            }
        }
        return risc;
    }
}
