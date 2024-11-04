package ast.types.keyword;

import ast.types.Type;

public class FloatType extends Type {
    @Override
    public String toString() {
        return "FloatType";
    }

    @Override
    public long sizeof() {
        return 0;
    }

    @Override
    public Type clone() {
        return new FloatType();
    }
}
