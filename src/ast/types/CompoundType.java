package ast.types;


public interface CompoundType {
    Type base();
    void setBase(Type type);
    String typeString();
}
