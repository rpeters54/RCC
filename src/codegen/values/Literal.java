package codegen.values;

import ast.types.Type;

public class Literal implements Source {

    private String value;
    private Type type;

    public Literal(String value, Type type) {
        this.value = value;
        this.type = type;
    }

    @Override
    public Literal copy(Type type) {
        return new Literal(value, type);
    }

    @Override
    public String toString() {
        return value;
    }

    public Type getType() {
        return type;
    }
}
