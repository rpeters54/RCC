package ast.types;

import ast.declarations.Declaration;

import java.util.List;
import java.util.Objects;

public class UnionType extends Type {
    private String name;
    private List<Declaration> members;

    public UnionType(String name, List<Declaration> members) {
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
        UnionType unionType = (UnionType) o;
        return Objects.equals(name, unionType.name);
    }

    @Override
    public int hashCode() {
        return Objects.hashCode(name);
    }

    @Override
    public String toString() {
        return "union." + name;
    }
}
