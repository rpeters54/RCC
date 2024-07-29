package ast.types.keyword;

import ast.types.Type;

public class IntType extends Type {
    @Override
    public String toString() {
        return "IntType";
    }

    @Override
    public Type clone() {
        return new IntType();
    }
}
