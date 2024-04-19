package ast.types;

public class Integer implements Type {
    private String value;
    private int bitsPrecision;

    public Integer(String value, int bitsPrecision) {
        this.value = value;
        this.bitsPrecision = bitsPrecision;
    }

}
