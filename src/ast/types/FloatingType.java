package ast.types;

import java.util.Objects;

public class FloatingType implements NumberType {
    private String value;
    private int bitsPrecision;
    private boolean signed;

    public FloatingType() {
        this.value = null;
        this.bitsPrecision = Float.BYTES*8;
        this.signed = true;

    }

    public FloatingType(String value, int bitsPrecision, boolean signed) {
        this.value = value;
        this.bitsPrecision = bitsPrecision;
        this.signed = signed;
    }

    public void setSigned(boolean signed) {
        this.signed = signed;
    }

    public boolean isSigned() {
        return signed;
    }

    public void setBits(int bitsPrecision) {
        this.bitsPrecision = bitsPrecision;
    }

    public int getBits() {
        return bitsPrecision;
    }


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null) return false;
        if (o.getClass() == VoidType.class) return true;
        if (getClass() != o.getClass()) return false;
        FloatingType that = (FloatingType) o;
        return bitsPrecision == that.bitsPrecision && signed == that.signed;
    }

    @Override
    public int hashCode() {
        return Objects.hash(bitsPrecision, signed);
    }
}

