package codegen.instruction.llvm;

import ast.types.FloatingType;
import ast.types.IntegerType;
import ast.types.PointerType;
import codegen.instruction.Instruction;
import codegen.instruction.riscv.BinaryRisc;
import codegen.instruction.riscv.LoadImmRisc;
import codegen.instruction.riscv.ReturnRisc;
import codegen.values.Register;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class ReturnLLVM extends LLVMInstruction implements Critical {

    public ReturnLLVM() {
        super(Arrays.asList(), Arrays.asList());
    }

    public ReturnLLVM(Register value) {
        super(Arrays.asList(), Arrays.asList(value));
    }

    public String toString() {
        if (rvalues().isEmpty()) {
            return "ret void";
        }
        return String.format("ret %s %s", rvalue(0).type(), rvalue(0));
    }

    @Override
    public List<Instruction> toRisc(List<Register> localResults, List<Register> localRvalues) {
        List<Instruction> risc = new ArrayList<>();
        if (!localRvalues.isEmpty()) {
            switch (localRvalues.get(0).type()) {
                case PointerType pt -> {
                    risc.addAll(BinaryRisc.Mov(Register.RiscIntArg(0), localRvalues.get(0)));
                }
                case IntegerType it -> {
                    risc.addAll(BinaryRisc.Mov(Register.RiscIntArg(0), localRvalues.get(0)));
                }
                case FloatingType ft -> {
                    risc.addAll(BinaryRisc.FMovToFloatReg(Register.RiscFloatArg(0), localRvalues.get(0)));
                }
                default -> throw new IllegalArgumentException("Unexpected type: " + localRvalues.get(0).type());
            }
        }
        risc.add(new ReturnRisc());
        return risc;
    }
}
