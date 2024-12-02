package ast.types;

import java.util.Objects;

public class PointerType extends PrimitiveType implements CompoundType {
    private Type base;

    public PointerType(Type base) {
        this.base = base;
    }

    public Type base() {
        return base;
    }

    public void setBase(Type base) {
        this.base = base;
    }

    @Override
    public long sizeof() {
        return 8;
    }

    @Override
    public Type clone() {
        return new PointerType(base.clone());
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null) return false;
//        if (o.getClass() == VoidType.class) return true;
        if (getClass() != o.getClass()) return false;
        PointerType that = (PointerType) o;
        return Objects.equals(base, that.base);
    }

    @Override
    public int hashCode() {
        return Objects.hashCode(base);
    }

    public String fmtTypeString() {
        return base.fmtTypeString() + "*";
    }

    @Override
    public String toString() {
        return "ptr";
    }
}
