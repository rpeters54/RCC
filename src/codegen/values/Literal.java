package codegen.values;

import ast.expr.FloatExpression;
import ast.expr.IntegerExpression;
import ast.expr.NullExpression;
import ast.types.*;
import codegen.BasicBlock;
import codegen.ControlFlowGraph;
import codegen.TranslationUnit;

import java.util.Objects;

public class Literal implements Source {

    private final String value;
    private final Type type;

    public Literal(String value, Type type) {
        this.value = value;
        this.type = type;
    }

    public String value() {
        return value;
    }

    public Literal clone() {
        return new Literal(value, type.clone());
    }

    /**
     * Value given to an uninitialized declaration, ensures that every declaration has a value
     * at the start of a function even if the programmer waits to initialize.
     *
     * @param type  Type of the nill value
     * @param unit
     * @param cfg
     * @param block
     * @return A literal corresponding to the nill value
     */
    public static Register nill(Type type, TranslationUnit unit, ControlFlowGraph cfg, BasicBlock block) {
        return switch (type) {
            case PointerType pointerType -> new NullExpression(-1).codegen(unit, cfg, block);
            case IntegerType integerType -> new IntegerExpression(-1, 0, integerType).codegen(unit, cfg, block);
            case FloatingType floatingType -> new FloatExpression(-1, 0, floatingType).codegen(unit, cfg, block);
            case null, default ->
                    throw new RuntimeException("Literal::nill: can't handle non primitive values that are not initialized for " +
                            "all locations the value is in scope");
        };
    }

    @Override
    public String toString() {
        switch (type) {
            case PointerType pt -> {
               return "null";
            }
           case null, default -> {
               return value;
           }
        }
    }

    public String llvmStorePrint() {
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
                return toString();
            }
        }
    }

    public static Literal longLiteral(long value) {
        return new Literal(Long.toString(value), new IntegerType(IntegerType.Width.LONG, true));
    }

    public String riscPrint() {
        switch (type) {
            case PointerType pt -> { return value; }
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
            case null, default -> { return toString(); }
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
