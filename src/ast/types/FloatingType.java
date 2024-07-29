package ast.types;

import java.util.Objects;

public class FloatingType extends NumberType {
    private final Width size;

    public FloatingType() {
        this.size = Width.FLOAT;
    }

    public FloatingType(Width size) {
        this.size = size;
    }

    public Width size() {
        return size;
    }

    public boolean isSameOrLarger(FloatingType other) {
        return this.size == Width.DOUBLE
                || this.size == Width.FLOAT && other.size == Width.FLOAT;
    }

    @Override
    public Type clone() {
        return new FloatingType(size);
    }

    public enum Width {
        FLOAT, DOUBLE
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null) return false;
        if (o.getClass() == VoidType.class) return true;
        if (getClass() != o.getClass()) return false;
        FloatingType that = (FloatingType) o;
        return size == that.size;
    }

    @Override
    public int hashCode() {
        return Objects.hash(size);
    }

    @Override
    public String toString() {
        return switch (size) {
            case FLOAT -> "float";
            case DOUBLE -> "double";
        };
    }

    public static FloatingType wider(FloatingType a, FloatingType b) {
        Width size;
        if (a.size == Width.DOUBLE || b.size == Width.DOUBLE) {
            size = Width.DOUBLE;
        } else {
            size = Width.FLOAT;
        }
        return new FloatingType(size);
    }
}

