package ast.types;

public class Array implements Type {
    private Type base;
    private String size;

    public Array(Type base, String size) {
        this.base = base;
        this.size = size;
    }
}
