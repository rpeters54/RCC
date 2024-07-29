package ast.types;

import java.util.Objects;

public class PointerType extends CompoundType {
    private Type base;

    public PointerType(Type base) {
        this.base = base;
    }

    public Type getBase() {
        return base;
    }

    public void setBase(Type base) {
        this.base = base;
    }

    @Override
    public Type clone() {
        return new PointerType(base.clone());
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null) return false;
        if (o.getClass() == VoidType.class) return true;
        if (getClass() != o.getClass()) return false;
        PointerType that = (PointerType) o;
        return Objects.equals(base, that.base);
    }

    @Override
    public int hashCode() {
        return Objects.hashCode(base);
    }

    public String typeString() {
        return base.toString() + "*";
    }

    @Override
    public String toString() {
        return "ptr";
    }
}
