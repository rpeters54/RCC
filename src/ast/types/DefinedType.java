package ast.types;

import java.util.Objects;

public class DefinedType extends Type {
    private final String name; //name of the defined type

    public DefinedType(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public Type clone() {
        return new DefinedType(name);
    }

    @Override
    public long sizeof() {
        throw new RuntimeException("DefinedType::sizeof: defined type has no size");
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null) return false;
//        if (o.getClass() == VoidType.class) return true;
        if (getClass() != o.getClass()) return false;
        DefinedType that = (DefinedType) o;
        return Objects.equals(name, that.name);
    }

    @Override
    public int hashCode() {
        return Objects.hash(name);
    }

    @Override
    public String toString() {
        throw new RuntimeException("Shouldn't be called");
    }
}
