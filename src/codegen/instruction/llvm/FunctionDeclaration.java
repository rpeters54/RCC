package codegen.instruction.llvm;

import ast.declarations.Declaration;
import ast.declarations.DeclarationSpecifier;
import ast.types.FunctionType;
import ast.types.Type;
import codegen.instruction.Instruction;

import java.util.Arrays;
import java.util.List;

public class FunctionDeclaration extends Instruction {

    private final String name;
    private final FunctionType type;

    public FunctionDeclaration(String name, FunctionType type) {
        super(Arch.LLVM, Arrays.asList(), Arrays.asList());
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

}
