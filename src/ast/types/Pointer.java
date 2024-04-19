package ast.types;

public class Pointer implements Type {
    private Type base;

    public Pointer(Type base) {
        this.base = base;
    }
}
