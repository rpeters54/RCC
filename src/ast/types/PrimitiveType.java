package ast.types;

public abstract class PrimitiveType extends Type {

    /**
     * Resolve the output type for an operation involving two primitive types:
     * [pointers, integers, or floats]
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
                    case PointerType rpt -> {
                        return (PrimitiveType) rpt.clone();
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
                    case PointerType rpt -> {
                        throw new RuntimeException("PrimitiveType::implicitConversion: " +
                                "Can not convert between floats and pointers");
                    }
                    case null, default ->
                            throw new RuntimeException("PrimitiveType::implicitConversion:" +
                                    " operand must be a valid number type");                }
            }
            case PointerType lpt -> {
                switch (right) {
                    case IntegerType rit -> {
                        return (PrimitiveType) lpt.clone();
                    }
                    case FloatingType rft -> {
                        throw new RuntimeException("PrimitiveType::implicitConversion: " +
                                "Can not convert between floats and pointers");
                    }
                    case PointerType rpt -> {
                        return (PrimitiveType) lpt.clone();
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

    public static boolean comparePrimitives(PrimitiveType left, PrimitiveType right) {
        if (left.getClass() != right.getClass()) {
            return false;
        }

        switch (left) {
            case IntegerType lit -> {
                IntegerType rit = (IntegerType) right;
                return lit.size() == rit.size();
            }
            case FloatingType lft -> {
                FloatingType rft = (FloatingType) right;
                return lft.size() == rft.size();
            }
            case PointerType lpt -> {
                PointerType rpt = (PointerType) right;
                return lpt.base().equals(rpt.base());
            }
            default -> {
                return false;
            }
        }

    }
}
