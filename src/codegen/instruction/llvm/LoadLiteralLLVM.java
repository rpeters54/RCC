package codegen.instruction.llvm;

import ast.types.FloatingType;
import ast.types.IntegerType;
import ast.types.PointerType;
import ast.types.Type;
import codegen.instruction.Instruction;
import codegen.instruction.riscv.FloatConversionRisc;
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

    public LoadLiteralLLVM(Literal value, Register local) {
        super(Arrays.asList(local), new ArrayList<>());
        Register address = Register.LLVM_Register(new PointerType(value.type()));

        addRValue(address);
        this.value = value;
    }

    public Literal getValue() {
        return value;
    }

    @Override
    public String toString() {
        assert rvalue(0).type() instanceof PointerType;
        Type deref = ((PointerType) rvalue(0).type()).base();
        String alloca = String.format("%s = alloca %s", rvalue(0), deref);
        String store  = String.format("store %s %s, %s %s", value.type(), value.llvmStorePrint(),
                rvalue(0).type(), rvalue(0));
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
                risc.add(new StoreRisc(intermediate, localRvalues.get(0).clone(), intermediate.type()));
                risc.add(new LoadRisc(localResult.clone(), localRvalues.get(0).clone(), localResult.clone().type()));
//                switch (ft.size()) {
//                    case DOUBLE -> {
//                        risc.add(new LoadRisc(localResult.clone(), localRvalues.get(0).clone(), localResult.clone().type()));
//                    }
//                    case FLOAT -> {
//                        Register temp = Register.LLVM_Register(new FloatingType(FloatingType.Width.DOUBLE));
//                        risc.add(new LoadRisc(temp.clone(), localRvalues.get(0).clone(), localResult.clone().type()));
//                        risc.add(new FloatConversionRisc(localResult.clone(), temp));
//                    }
//                }
            }
            default -> throw new RuntimeException("invalid type");
        }
        return risc;
    }
}