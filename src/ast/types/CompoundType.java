package ast.types;


public abstract class CompoundType extends PrimitiveType {
    public abstract Type getBase();
    public abstract void setBase(Type type);
    public abstract String typeString();
}
