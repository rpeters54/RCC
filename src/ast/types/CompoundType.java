package ast.types;


public interface CompoundType extends PrimitiveType {
    Type getBase();
    void setBase(Type type);
}
