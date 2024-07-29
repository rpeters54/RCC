package ast.types;

public abstract class PrimitiveType extends Type {

    /**
     * Resolve the output type of an operation involving two primitive types:
     * [arrays, pointers, integers, or floats]
     * @param left the left operand
     * @param right the right operand
     * @return the resulting type of the operation
     */
    public static PrimitiveType implicitConversion(PrimitiveType left, PrimitiveType right) {
        switch (left) {
            case IntegerType lit -> {
                switch (right) {
                    case IntegerType rit -> {
                        if (lit.isSameOrLarger(rit)) {
                            return (NumberType) lit.clone();
                        } else {
                            return (NumberType) rit.clone();
                        }
                    }
                    case FloatingType rft -> {
                        return (NumberType) rft.clone();
                    }
                    case CompoundType rct -> {
                        return (PrimitiveType) rct.clone();
                    }
                    case null, default ->
                            throw new RuntimeException("PrimitiveType::implicitConversion:" +
                                    " operand must be a valid number type");
                }
            }
            case FloatingType lft -> {
                switch (right) {
                    case IntegerType rit -> {
                        return (NumberType) lft.clone();
                    }
                    case FloatingType rft -> {
                        if (lft.isSameOrLarger(rft)) {
                            return (NumberType) lft.clone();
                        } else {
                            return (NumberType) rft.clone();
                        }
                    }
                    case CompoundType rct -> {
                        throw new RuntimeException("PrimitiveType::implicitConversion: " +
                                "Can not convert between floats and pointers");
                    }
                    case null, default ->
                            throw new RuntimeException("PrimitiveType::implicitConversion:" +
                                    " operand must be a valid number type");                }
            }
            case CompoundType lct -> {
                switch (right) {
                    case IntegerType rit -> {
                        return (PrimitiveType) lct.clone();
                    }
                    case FloatingType rft -> {
                        throw new RuntimeException("PrimitiveType::implicitConversion: " +
                                "Can not convert between floats and pointers");
                    }
                    case CompoundType rct -> {
                        if (!lct.equals(rct)) {
                            throw new RuntimeException("PrimitiveType::implicitConversion: " +
                                    "Incompatible Pointers");
                        } else {
                            return (PrimitiveType) lct.clone();
                        }
                    }
                    case null, default ->
                            throw new RuntimeException("PrimitiveType::implicitConversion:" +
                                    " operand must be a valid number type");
                }
            }
            case null, default ->
                    throw new RuntimeException("PrimitiveType::implicitConversion:" +
                            " operand must be a valid number type");        }
    }
}
