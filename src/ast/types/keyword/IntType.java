package ast.types.keyword;

import ast.types.Type;

public class IntType extends Type {
    @Override
    public String toString() {
        return "IntType";
    }

    @Override
    public String fmtTypeString() {
        return toString();
    }

    @Override
    public long sizeof() {
        return 0;
    }

    @Override
    public Type clone() {
        return new IntType();
    }
}
