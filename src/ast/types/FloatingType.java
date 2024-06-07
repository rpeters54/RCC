package ast.types;

public class FloatingType implements NumberType {
    private String value;
    private int bitsPrecision;
    private boolean isSigned;

    public FloatingType() {
        this.value = null;
        this.bitsPrecision = Float.BYTES*8;
        this.isSigned = true;

    }

    public FloatingType(String value, int bitsPrecision, boolean isSigned) {
        this.value = value;
        this.bitsPrecision = bitsPrecision;
        this.isSigned = isSigned;
    }

    public void setSigned(boolean signed) {
        isSigned = signed;
    }

    public boolean isSigned() {
        return isSigned;
    }

    public void setBits(int bitsPrecision) {
        this.bitsPrecision = bitsPrecision;
    }

    public int getBits() {
        return bitsPrecision;
    }
}

