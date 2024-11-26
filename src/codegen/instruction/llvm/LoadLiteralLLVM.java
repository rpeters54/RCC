package codegen.instruction.llvm;

import ast.types.FloatingType;
import ast.types.IntegerType;
import ast.types.PointerType;
import ast.types.Type;
import codegen.instruction.Instruction;
import codegen.instruction.riscv.LoadImmRisc;
import codegen.instruction.riscv.LoadRisc;
import codegen.instruction.riscv.StoreRisc;
import codegen.values.Literal;
import codegen.values.Register;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class LoadLiteralLLVM extends LLVMInstruction {

    private final Literal value;

    public LoadLiteralLLVM(Literal value, Register local, Register address) {
        super(Arrays.asList(local), Arrays.asList(address));
        this.value = value;
    }

    @Override
    public String toString() {
        assert rvalue(0).type() instanceof PointerType;
        Type deref = ((PointerType) rvalue(0).type()).base();
        String alloca = String.format("%s = alloca %s", rvalue(0), deref);
        String store  = String.format("store %s %s, %s %s", value.type(), value, rvalue(0).type(), rvalue(0));
        String load   = String.format("%s = load %s, %s %s", result(), result().type(), rvalue(0).type(), rvalue(0));
        return alloca + "\n\t" + store + "\n\t" + load;
    }

    @Override
    public List<Instruction> toRisc(List<Register> localResults, List<Register> localRvalues) {
        List<Instruction> risc = new ArrayList<>();
        Register localResult = localResults.getFirst();
        switch (value.type()) {
            case IntegerType it -> risc.add(new LoadImmRisc(localResult.clone(),value.clone()));
            case PointerType pt -> risc.add(new LoadImmRisc(localResult.clone(),value.clone()));
            case FloatingType ft -> {
                Register intermediate = Register.LLVM_Register(new IntegerType(IntegerType.Width.LONG, true));
                risc.add(new AllocaLLVM(localRvalues.get(0).clone()));
                risc.add(new LoadImmRisc(intermediate.clone(), value.clone()));
                risc.add(new StoreRisc(intermediate, localRvalues.get(0).clone()));
                risc.add(new LoadRisc(localResult.clone(), localRvalues.get(0).clone()));
            }
            default -> throw new RuntimeException("invalid type");
        }
        return risc;
    }
}