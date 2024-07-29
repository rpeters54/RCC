package codegen.values;


import ast.types.Type;

import java.util.Objects;

public class Register implements Source {
    private final int number;
    private final Type type;
    private final boolean global;
    private final Arch arch;

    private static int LLVM_REGISTER_COUNT = 0;
    private static int RISC_REGISTER_COUNT = 0;

    public Register(Arch arch, int number, Type type, boolean global) {
        this.arch = arch;
        this.number = number;
        this.type = type;
        this.global = global;
    }

    public static Register LLVM_Register(Type type) {
        return new Register(Arch.LLVM, LLVM_REGISTER_COUNT++, type, false);
    }

    public static Register RISC_Register(Type type) {
        return new Register(Arch.RISC, RISC_REGISTER_COUNT++, type, false);
    }

    public static Register Global(Type type) {
        return new Register(Arch.LLVM, LLVM_REGISTER_COUNT++, type, true);
    }

    @Override
    public Register clone() {
        return new Register(arch, number, type.clone(), global);
    }

    @Override
    public String toString() {
        return switch (arch) {
            case LLVM -> global ? "@.r" + number : "%r" + number;
            case RISC -> switch (number) {
                case 0 -> "zero";
                case 1 -> "ra";
                case 2 -> "sp";
                case 3 -> "gp";
                case 4 -> "tp";
                case 5, 6, 7 -> "t" + (number-5);
                case 8 -> "fp";
                case 9 -> "s1";
                case 10, 11, 12, 13, 14, 15, 16, 17 -> "a" + (number-10);
                case 18, 19, 20, 21, 22, 23, 24, 25, 26, 27 -> "s" + (number-16);
                case 28, 29, 30, 31 -> "t" + (number-25);
                default -> throw new RuntimeException("Register::toString: RISC register number exceeds limit " + number);
            };
        };
    }

    public Type type() {
        return type;
    }

    public boolean global() {
        return global;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Register register = (Register) o;
        return number == register.number && Objects.equals(type, register.type)
                && arch == register.arch && global == register.global;
    }

    @Override
    public int hashCode() {
        return Objects.hash(number, type, arch, global);
    }

    public enum Arch {
        LLVM, RISC
    }
}
