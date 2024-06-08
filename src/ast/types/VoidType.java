package ast.types;

import java.util.Objects;

public class VoidType implements Type {

    public static final int HASH = Objects.hash("void");

    @Override
    public boolean equals(Object obj) {
        return obj instanceof Type;
    }

    @Override
    public int hashCode() {
        return HASH;
    }
}
