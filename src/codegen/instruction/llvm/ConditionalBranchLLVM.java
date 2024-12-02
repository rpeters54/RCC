package codegen.instruction.llvm;

import ast.types.IntegerType;
import codegen.instruction.Instruction;
import codegen.instruction.Jump;
import codegen.instruction.riscv.*;
import codegen.values.Register;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Objects;

public class ConditionalBranchLLVM extends LLVMInstruction implements Jump {

    private String ifTrue;
    private String ifFalse;

    public ConditionalBranchLLVM(Register condition, String ifTrue, String ifFalse) {
        super(Arrays.asList(), Arrays.asList(condition));
        this.ifTrue = ifTrue;
        this.ifFalse = ifFalse;
    }

    public String ifTrue() {
        return ifTrue;
    }

    public String ifFalse() {
        return ifFalse;
    }

    public void setIfTrue(String ifTrue) {
        this.ifTrue = ifTrue;
    }

    public void setIfFalse(String ifFalse) {
        this.ifFalse = ifFalse;
    }

    public String toString() {
        return String.format("br %s %s, label %%l%s, label %%l%s", rvalue(0).type(), rvalue(0), ifTrue, ifFalse);
    }

    @Override
    public List<Instruction> toRisc(List<Register> localResults, List<Register> localRvalues) {
        List<Instruction> risc = new ArrayList<>();
        if (Objects.requireNonNull(localRvalues.get(0).type()) instanceof IntegerType) {
            risc.add(new BranchRisc(localRvalues.get(0), Register.RiscZero(), BranchRisc.BranchType.NE, ifTrue));
        } else {
            throw new IllegalArgumentException("Unexpected type: " + localRvalues.get(0).type());
        }
        risc.add(new JumpRisc(ifFalse));
        return risc;
    }
}
