package ast.types.keyword;

import ast.types.Type;

import java.util.Objects;

public class CharType extends Type {
    @Override
    public String toString() {
        return "CharType";
    }

    @Override
    public Type clone() {
        return new CharType();
    }
}