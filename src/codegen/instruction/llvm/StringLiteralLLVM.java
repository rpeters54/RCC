package codegen.instruction.llvm;

import codegen.instruction.Instruction;
import codegen.instruction.riscv.StringAllocRisc;
import codegen.values.Register;
import org.antlr.v4.runtime.misc.Pair;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

public class StringLiteralLLVM extends LLVMInstruction implements Global {

    private final String value;

    public StringLiteralLLVM(Register location, String value) {
        super(Arrays.asList(location), Arrays.asList());
        this.value = value;
    }

    @Override
    public String toString() {
        Pair<String, Integer> filteredString = filterEscapes(value);
        return String.format("%s = private unnamed_addr constant [%d x i8] c%s",
                result(), filteredString.b, filteredString.a);
    }


    public static Pair<String, Integer> filterEscapes(String value) {
        StringBuilder result = new StringBuilder();
        result.append('"');
        int len = 0;
        for (int i = 0; i < value.length(); i++) {
            len++;
            char c = value.charAt(i);
            if (c == '\\') {
                char esc = value.charAt(++i);
                switch (esc) {
                    case 'a' -> result.append("\\07");
                    case 'b' -> result.append("\\08");
                    case 'e' -> result.append("\\1B");
                    case 'f' -> result.append("\\0C");
                    case 'n' -> result.append("\\0A");
                    case 'r' -> result.append("\\0D");
                    case 't' -> result.append("\\09");
                    case 'v' -> result.append("\\0B");
                    case '\\' -> result.append("\\5C");
                    case '\'' -> result.append("\\27");
                    case '\"' -> result.append("\\22");
                    case '?' -> result.append("\\3F");
                }
            } else {
                result.append(c);
            }
        }
        len++;
        result.append("\\00\"");
        return new Pair<>(result.toString(), len);
    }

    @Override
    public List<Instruction> toRisc(List<Register> localResults, List<Register> localRvalues) {
        throw new RuntimeException("Can't generate instructions for global header");
    }

    @Override
    public List<Instruction> genHeader(Map<Register, String> globalLabelMap) {
        String label = "L."+result().number()+ ".string";
        globalLabelMap.put(result(), label);
        return List.of(new StringAllocRisc(label, value));
    }
}
