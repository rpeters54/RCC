package ast.types;

import java.util.Objects;

public class VoidType extends Type {

    public static final int HASH = Objects.hash("void");

    @Override
    public long sizeof() {
        return 0;
    }

    @Override
    public Type clone() {
        return new VoidType();
    }

    @Override
    public boolean equals(Object obj) {
        return obj instanceof VoidType;
    }

    @Override
    public int hashCode() {
        return HASH;
    }

    @Override
    public String toString() {
        return "void";
    }

    @Override
    public String fmtTypeString() {
        return "i8";
    }
}
