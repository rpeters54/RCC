package codegen.instruction.llvm;

import codegen.instruction.Instruction;
import codegen.values.Register;

import java.util.List;
import java.util.Map;

public interface Global {
    List<Instruction> genHeader(Map<Register, String> globalLabelMap);
}
