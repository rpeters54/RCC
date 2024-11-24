package codegen.instruction.llvm;

import ast.declarations.Declaration;
import ast.declarations.DeclarationSpecifier;
import ast.types.FunctionType;
import ast.types.Type;
import codegen.instruction.Instruction;
import codegen.values.Register;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

public class FunctionDeclarationLLVM extends LLVMInstruction implements Global {

    private final String name;
    private final FunctionType type;

    public FunctionDeclarationLLVM(String name, FunctionType type) {
        super(Arrays.asList(), Arrays.asList());
        this.name = name;
        this.type = type;
    }

    public String name() {
        return this.name;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(String.format("declare %s @%s(", type.returnType(), name));
        List<Type> inputTypes = type.inputTypes().stream()
                .map(Declaration::declSpec)
                .map(DeclarationSpecifier::getType)
                .toList();
        for (Type inputType : inputTypes) {
            sb.append(String.format("%s, ", inputType));
        }

        if (type.isVariadic()) {
            sb.append("...");
        } else {
            if (!inputTypes.isEmpty()) {
                sb.delete(sb.length() - 2, sb.length());
            }
        }
        sb.append(")");
        return sb.toString();
    }

    @Override
    public List<Instruction> toRisc(List<Register> localResults, List<Register> localRvalues) {
        // does nothing so return nothing
        return List.of();
    }

    @Override
    public List<Instruction> genHeader(Map<Register, String> globalLabelMap) {
        return List.of();
    }
}
