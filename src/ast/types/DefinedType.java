package ast.types;

import java.util.Objects;

public class DefinedType implements Type{
    private String name; //name of the defined type

    public DefinedType(String name) {
        this.name = name;

    }

    public String getName() {
        return name;
    }


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        DefinedType that = (DefinedType) o;
        return Objects.equals(name, that.name);
    }

    @Override
    public int hashCode() {
        return Objects.hash(name);
    }
}
