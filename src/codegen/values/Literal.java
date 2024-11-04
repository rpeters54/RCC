package codegen.values;

import ast.types.*;

import java.util.Objects;

public class Literal implements Source {

    private final String value;
    private final Type type;

    public Literal(String value, Type type) {
        this.value = value;
        this.type = type;
    }

    public Literal clone() {
        return new Literal(value, type.clone());
    }

    /**
     * Value given to an uninitialized declaration, ensures that every declaration has a value
     * at the start of a function even if the programmer waits to initialize.
     * @param type Type of the nill value
     * @return A literal corresponding to the nill value
     */
    public static Literal nill(Type type) {
        if (type instanceof PointerType) {
            return new Literal("null", type);
        } else if (type instanceof NumberType) {
            return new Literal("0", type);
        } else {
            throw new RuntimeException("Literal::nill: can't handle non primitive values that are not initialized for " +
                    "all locations the value is in scope");
        }
    }

    @Override
    public String toString() {
        switch (type) {
           case FloatingType ft -> {
               switch (ft.size()) {
                   case DOUBLE -> {
                       return "0x"+Long.toHexString(Double.doubleToLongBits(Double.parseDouble(value)));
                   }
                   case FLOAT -> {
                       return "0x"+Long.toHexString(Double.doubleToLongBits(Double.parseDouble(value)) & 0xFFFFFFFF_00000000L);
                   }
                   case null, default -> {
                       throw new RuntimeException("not sure how i got here?");
                   }
               }
           }
           case null, default -> {
               return value;
           }
        }
    }

    public Type type() {
        return type;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Literal literal = (Literal) o;
        return Objects.equals(value, literal.value) && Objects.equals(type, literal.type);
    }

    @Override
    public int hashCode() {
        return Objects.hash(value, type);
    }
}
