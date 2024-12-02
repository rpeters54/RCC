package ast.types.keyword;

import ast.types.Type;

public class LongType extends Type {
    @Override
    public String toString() {
        return "LongType";
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
        return new LongType();
    }
}
