package ast.types;

import java.util.Objects;

public class PointerType implements CompoundType {
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
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        PointerType that = (PointerType) o;
        return Objects.equals(base, that.base);
    }

    @Override
    public int hashCode() {
        return Objects.hashCode(base);
    }
}
