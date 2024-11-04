package ast.types.keyword;

import ast.types.Type;

public class DoubleType extends Type {
    @Override
    public String toString() {
        return "DoubleType";
    }

    @Override
    public long sizeof() {
        return 0;
    }

    @Override
    public Type clone() {
        return new DoubleType();
    }
}