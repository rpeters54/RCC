package ast.types;

import ast.expr.Expression;

import java.util.List;
import java.util.Objects;

public class ArrayType extends CompoundType {
    private Type base;
    private long size;
    private List<Expression> sizeExpression;

    public ArrayType(Type base, long size) {
        this.base = base;
        this.size = size;
        this.sizeExpression = null;
    }

    public ArrayType() {
        this.base = null;
        this.size = 0;
    }

    public Type getBase() {
        return base;
    }

    public void setBase(Type base) {
        this.base = base;
    }

    public void setSize(long size) {
        this.size = size;
    }

    public void setSizeExpression(List<Expression> sizeExpression) {
        this.sizeExpression = sizeExpression;
    }

    //TODO, fix so it works with the constant size expression
    @Override
    public Type clone() {
        return new ArrayType(base.clone(), size);
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null) return false;
        if (o.getClass() == VoidType.class) return true;
        if (getClass() != o.getClass()) return false;

        ArrayType arrayType = (ArrayType) o;
        return size == arrayType.size && Objects.equals(base, arrayType.base);
    }

    @Override
    public int hashCode() {
        return Objects.hash(base, size);
    }

    public String typeString() {
        return String.format("[%d x %s]", size, base.toString());
    }

    @Override
    public String toString() {
        return "ptr";
    }
}
