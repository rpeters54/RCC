package codegen.instruction.llvm;

import ast.types.CompoundType;
import ast.types.Type;
import codegen.instruction.Instruction;
import codegen.values.Register;
import codegen.values.Source;

import java.util.Arrays;
import java.util.List;

public class GetElemPtrInstruction extends Instruction {

    public GetElemPtrInstruction(Register result, List<Source> indirections) {
        super(Arch.LLVM, Arrays.asList(result), indirections);
    }

    @Override
    public String toString() {
        if (!(getSource(0).type() instanceof CompoundType)) {
            throw new RuntimeException("GetElemPtrInstruction can only be used with a CompoundType");
        }
        Type internal = ((CompoundType) getSource(0).type()).getBase();
        String deref = switch(internal) {
            case CompoundType ct -> ct.typeString();
            default -> internal.toString();
        };
        StringBuilder builder = new StringBuilder();
        builder.append(String.format("%s = getelementptr inbounds %s", getResult(), deref));
        for (Source source : getSources()) {
            builder.append(String.format(", %s %s", source.type(), source));
        }
        return builder.toString();
    }
}
