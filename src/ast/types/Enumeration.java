package ast.types;

import ast.expr.Expression;

import java.util.List;
import java.util.Objects;

public class Enumeration {
    private final String identifier;
    private final List<Expression> value;

    public Enumeration(String identifier, List<Expression> value) {
        this.identifier = identifier;
        this.value = value;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Enumeration that = (Enumeration) o;
        return Objects.equals(identifier, that.identifier);
    }

    @Override
    public int hashCode() {
        return Objects.hash(identifier);
    }

    @Override
    public String toString() {
        throw new RuntimeException("Not implemented yet");
    }
}
