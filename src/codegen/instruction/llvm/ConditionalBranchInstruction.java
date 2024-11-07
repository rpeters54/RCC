package codegen.instruction.llvm;

import codegen.instruction.Instruction;
import codegen.values.Source;

import java.util.Arrays;

public class ConditionalBranchInstruction extends Instruction implements JumpInstruction {

    private String ifTrue;
    private String ifFalse;

    public ConditionalBranchInstruction(Source condition, String ifTrue, String ifFalse) {
        super(Arch.LLVM, Arrays.asList(), Arrays.asList(condition));
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
        return String.format("br %s %s, label %%l%s, label %%l%s", source(0).type(), source(0), ifTrue, ifFalse);
    }
}
