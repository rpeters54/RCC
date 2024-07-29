package codegen.values;

import ast.types.FloatingType;
import ast.types.Type;

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
}
