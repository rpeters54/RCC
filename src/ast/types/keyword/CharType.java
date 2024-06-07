package ast.types.keyword;

import ast.types.Type;

import java.util.Objects;

public class CharType implements Type {
    private boolean isSigned;

    public void setSigned(boolean signed) {
        isSigned = signed;
    }

    public boolean isSigned() {
        return isSigned;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        CharType charType = (CharType) o;
        return isSigned == charType.isSigned;
    }

    @Override
    public int hashCode() {
        return Objects.hash(isSigned);
    }
}
