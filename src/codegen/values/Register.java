package codegen.values;

public class Register {
    private int number;
    private arch architecture;

    private static int REGISTER_COUNT = 0;

    public Register(int number, arch architecture) {
        this.number = number;
        this.architecture = architecture;
    }

    public static Register LLVM_Register() {
        return new Register(REGISTER_COUNT++, arch.LLVM);
    }

    public enum arch {
        LLVM, RISC
    }
}
