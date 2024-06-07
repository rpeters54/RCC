package ast.types;

public interface NumberType extends PrimitiveType{
    void setBits(int bits);
    int getBits();
    boolean isSigned();
}
