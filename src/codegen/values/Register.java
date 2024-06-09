package codegen.values;


import ast.types.Type;
import ast.types.VoidType;

public class Register implements Source {
    private int number;
    private Type type;
    private Arch arch;

    private static int LLVM_REGISTER_COUNT = 0;
    private static int RISC_REGISTER_COUNT = 0;

    public Register(Arch arch, int number, Type type) {
        this.arch = arch;
        this.number = number;
        this.type = type;
    }

    public static Register LLVM_Register() {
        return new Register(Arch.LLVM, LLVM_REGISTER_COUNT++, new VoidType());
    }

    public static Register RISC_Register(Type type) {
        return new Register(Arch.RISC, RISC_REGISTER_COUNT++, type);
    }

    @Override
    public Register copy(Type type) {
        return new Register(arch, number, type);
    }

    @Override
    public String toString() {
        return switch (arch) {
            case LLVM -> "%%r" + number;
            case RISC -> "r" + number;
        };
    }

    public Type getType() {
        return type;
    }

    public enum Arch {
        LLVM, RISC
    }
}
