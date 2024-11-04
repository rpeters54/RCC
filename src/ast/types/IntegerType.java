package ast.types;

import java.util.Objects;

public class IntegerType extends NumberType {
    private final Width size;
    private final boolean signed;

    public IntegerType() {
        this.size = Width.INT;
        this.signed = true;
    }

    public IntegerType(Width size, boolean signed) {
        this.size = size;
        this.signed = signed;
    }

    @Override
    public long sizeof() {
        return size.value / 8;
    }

    public Width size() {
        return size;
    }

    public boolean signed() {
        return signed;
    }

    public enum Width {
        BOOL(1),
        CHAR(8),
        SHORT(16),
        INT(32),
        LONG(64);

        private final long value;

        Width(int value) {
            this.value = value;
        }

        public long value() {
            return value;
        }
    }

    @Override
    public Type clone() {
        return new IntegerType(size, signed);
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null) return false;
//        if (o.getClass() == VoidType.class) return true;
        if (getClass() != o.getClass()) return false;
        IntegerType that = (IntegerType) o;
        return size == that.size && signed == that.signed;
    }

    @Override
    public int hashCode() {
        return Objects.hash(size, signed);
    }

    @Override
    public String toString() {
        return "i"+size.value;
    }

    public static IntegerType clone_larger(IntegerType a, IntegerType b) {
        Width size;
        boolean signed = a.signed || b.signed;
        if (a.size == Width.LONG || b.size == Width.LONG) {
            size = Width.LONG;
        } else if (a.size == Width.INT || b.size == Width.INT) {
            size = Width.INT;
        } else if (a.size == Width.SHORT || b.size == Width.SHORT) {
            size = Width.SHORT;
        } else if (a.size == Width.CHAR || b.size == Width.CHAR) {
            size = Width.CHAR;
        } else {
            size = Width.BOOL;
        }
        return new IntegerType(size, signed);
    }

    public boolean isSameOrLarger(IntegerType a) {
        return this.size.value >= a.size.value;
    }

}
