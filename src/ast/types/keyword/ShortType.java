package ast.types.keyword;

import ast.types.Type;

public class ShortType extends Type {
    @Override
    public String toString() {
        return "ShortType";
    }

    @Override
    public long sizeof() {
        return 0;
    }

    @Override
    public Type clone() {
        return new ShortType();
    }
}
