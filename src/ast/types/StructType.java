package ast.types;

import ast.declarations.Declaration;

import java.util.List;
import java.util.Objects;

public class StructType extends Type {
    private final String name;
    private List<Declaration> members;

    public StructType(String name, List<Declaration> members) {
        this.name = name;
        this.members = members;
    }

    public String getName() {
        return name;
    }

    public List<Declaration> getMembers() {
        return members;
    }

    public void setMembers(List<Declaration> members) {
        this.members = members;
    }

    @Override
    public Type clone() {
        throw new RuntimeException("not implemented yet");
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null) return false;
        if (o.getClass() == VoidType.class) return true;
        if (getClass() != o.getClass()) return false;
        StructType that = (StructType) o;
        return Objects.equals(name, that.name);
    }

    @Override
    public int hashCode() {
        return Objects.hashCode(name);
    }

    @Override
    public String toString() {
        return "struct." + name;
    }
}

