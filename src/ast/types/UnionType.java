package ast.types;

import ast.declarations.Declaration;

import java.util.List;
import java.util.Objects;

public class UnionType extends ObjectType {
    private final String name;
    private List<Declaration> members;

    public UnionType(String name, List<Declaration> members) {
        this.name = name;
        this.members = members;
    }

    public String name() {
        return name;
    }

    public List<Declaration> members() {
        return members;
    }

    public void setMembers(List<Declaration> members) {
        this.members = members;
    }

    @Override
    public long sizeof() {
        long size = 0;
        for (Declaration member : members) {
            size = Math.max(size, member.declSpec().getType().sizeof());
        }
        return size;
    }

    @Override
    public Type clone() {
        throw new RuntimeException("not implemented yet");
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null) return false;
//        if (o.getClass() == VoidType.class) return true;
        if (getClass() != o.getClass()) return false;
        UnionType unionType = (UnionType) o;
        return Objects.equals(name, unionType.name);
    }

    public String header() {
        StringBuilder result = new StringBuilder(String.format("%%union.%s = type {\n", name));
        for (Declaration member : members) {
            result.append(String.format("    %s,\n", member.declSpec().getType()));
        }
        result.delete(result.length() - 2, result.length());
        result.append("\n}\n");
        return result.toString();
    }

    @Override
    public int hashCode() {
        return Objects.hashCode(name);
    }

    @Override
    public String toString() {
        return "%union." + name;
    }
}
