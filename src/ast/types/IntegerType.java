package ast.types;

import java.util.Objects;

public class IntegerType implements NumberType {
    private String value;
    private int bitsPrecision;
    private boolean signed;

    public IntegerType() {
        this.value = null;
        this.bitsPrecision = Integer.BYTES*8;
        this.signed = true;
    }

    public IntegerType(String value, int bitsPrecision, boolean signed) {
        this.value = value;
        this.bitsPrecision = bitsPrecision;
        this.signed = signed;
    }

    public void setBits(int bitsPrecision) {
        this.bitsPrecision = bitsPrecision;
    }

    public int getBits() {
        return bitsPrecision;
    }

    public void setSigned(boolean signed) {
        this.signed = signed;
    }

    public boolean isSigned() {
        return signed;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        IntegerType that = (IntegerType) o;
        return bitsPrecision == that.bitsPrecision && signed == that.signed;
    }

    @Override
    public int hashCode() {
        return Objects.hash(bitsPrecision, signed);
    }
}
