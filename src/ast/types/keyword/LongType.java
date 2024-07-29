package ast.types.keyword;

import ast.types.Type;

public class LongType extends Type {
    @Override
    public String toString() {
        return "LongType";
    }

    @Override
    public Type clone() {
        return new LongType();
    }
}
