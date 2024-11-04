package codegen.instruction.llvm;

import ast.types.CompoundType;
import ast.types.PointerType;
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
        if (!(source(0).type() instanceof PointerType)) {
            throw new RuntimeException("GetElemPtrInstruction can only be used with a PointerType");
        }
        Type internal = ((PointerType) source(0).type()).base();
        String deref = switch(internal) {
            case PointerType pt -> pt.typeString();
            case CompoundType ct -> ct.typeString();
            default -> internal.toString();
        };
        StringBuilder builder = new StringBuilder();
        builder.append(String.format("%s = getelementptr inbounds %s", result(), deref));
        for (Source source : sources()) {
            builder.append(String.format(", %s %s", source.type(), source));
        }
        return builder.toString();
    }
}
