package ast.types.keyword;

import ast.types.Type;

public class SignedType extends Type {
    @Override
    public String toString() {
        return "SignedType";
    }

    @Override
    public long sizeof() {
        return 0;
    }

    @Override
    public Type clone() {
        return new SignedType();
    }
}
