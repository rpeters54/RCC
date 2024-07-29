package ast.types;

public abstract class Type {
    public abstract String toString();
    public abstract Type clone();

    public enum Specifier {
        CHAR, DOUBLE, FLOAT, INT, LONG, SHORT, SIGNED, UNSIGNED
    }

    public enum TypeQualifier {
        CONST, VOLATILE, BOTH, NONE
    }

    public enum StorageClass {
        AUTO, STATIC, EXTERN, REGISTER, NONE
    }
}
