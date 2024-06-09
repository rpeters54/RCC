package ast.types;

import ast.expr.Expression;

import java.util.List;
import java.util.Objects;

public class EnumType implements Type {

    private String name;
    private List<Enumeration> enumerators;

    public EnumType(String name, List<Enumeration> enumerators) {
        this.name = name;
        this.enumerators = enumerators;
    }

    public String getName() {
        return name;
    }

    public List<Enumeration> getEnumerators() {
        return enumerators;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null) return false;
        if (o.getClass() == VoidType.class) return true;
        if (getClass() != o.getClass()) return false;
        EnumType enumType = (EnumType) o;
        return Objects.equals(name, enumType.name);
    }

    @Override
    public int hashCode() {
        return Objects.hash(name);
    }
}
