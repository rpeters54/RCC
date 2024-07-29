package ast.types.keyword;

import ast.types.Type;

public class FloatType extends Type {
    @Override
    public String toString() {
        return "FloatType";
    }

    @Override
    public Type clone() {
        return new FloatType();
    }
}
