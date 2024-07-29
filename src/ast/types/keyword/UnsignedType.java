package ast.types.keyword;

import ast.types.Type;

public class UnsignedType extends Type {
    @Override
    public String toString() {
        return "UnsignedType";
    }

    @Override
    public Type clone() {
        return new UnsignedType();
    }
}
