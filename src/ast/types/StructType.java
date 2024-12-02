package ast.types;

import ast.declarations.Declaration;

import java.util.List;
import java.util.Objects;

public class StructType extends ObjectType {
    private final String name;
    private final List<Declaration> members;

    public StructType(String name, List<Declaration> members) {
        this.name = name;
        this.members = members;
    }

    public String name() {
        return name;
    }

    public List<Declaration> members() {
        return members;
    }

    public Type typeOfMember(String name) {
        for (Declaration member : members) {
            if (member.name().equals(name)) {
                return member.declSpec().getType();
            }
        }
        return null;
    }

    public int indexOfMember(String name) {
        for (int i = 0; i < members.size(); i++) {
            if (members.get(i).name().equals(name)) {
                return i;
            }
        }
        return -1;
    }

    @Override
    public long sizeof() {
        long size = 0;
        for (Declaration member : members) {
            size += member.declSpec().getType().sizeof();
        }
        return size;
    }

    @Override
    public Type clone() {
        return new StructType(name, members);
    }

    public long offset(int index) {
        long offset = 0;
        if (index >= members.size()) {
            System.out.println("Here");
        }
        for (int i = 0; i < index; i++) {
            offset += members.get(i).declSpec().getType().sizeof();
        }
        return offset;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null) return false;
//        if (o.getClass() == VoidType.class) return true;
        if (getClass() != o.getClass()) return false;
        StructType that = (StructType) o;
        return Objects.equals(name, that.name);
    }

    @Override
    public int hashCode() {
        return Objects.hashCode(name);
    }

    public String header() {
        StringBuilder result = new StringBuilder(String.format("%%struct.%s = type {\n", name));
        for (Declaration member : members) {
            result.append(String.format("    %s,\n", member.declSpec().getType()));
        }
        result.delete(result.length() - 2, result.length());
        result.append("\n}\n");
        return result.toString();
    }


    @Override
    public String toString() {
        return "%struct." + name;
    }

    @Override
    public String fmtTypeString() {
        return toString();
    }
}

