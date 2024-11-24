package codegen.instruction.riscv;

import codegen.instruction.Jump;
import codegen.values.Register;

import java.util.ArrayList;
import java.util.Arrays;

public class BranchRisc extends RiscInstruction implements Jump {

    private final String trueLabel;
    private final BranchType bt;

    public BranchRisc(Register left, Register right, BranchType bt, String trueLabel) {
        super(new ArrayList<>(), Arrays.asList(left, right));
        this.trueLabel = trueLabel;
        this.bt = bt;
    }

    public String getTrueLabel() {
        return trueLabel;
    }

    public BranchType getBt() {
        return bt;
    }

    public enum BranchType {
        EQ, NE, LT, LTU, GTE, GTEU
    }

    @Override
    public String toString() {
        String opString = switch (bt) {
            case EQ -> "eq";
            case NE -> "ne";
            case LT -> "lt";
            case LTU -> "ltu";
            case GTE -> "gte";
            case GTEU -> "gteu";
        };
        return String.format("b%s %s, %s, l%s", opString, rvalue(0), rvalue(1), trueLabel);
    }
}
