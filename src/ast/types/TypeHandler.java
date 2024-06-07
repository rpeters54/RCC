package ast.types;



public class TypeHandler {

    public static boolean compareTypes(Type left, Type right) {
        if (!left.getClass().equals(right.getClass())) {
            return false;
        }
        switch (left) {
            case CompoundType compound -> {
                CompoundType other = (CompoundType) right;
                return compareTypes(compound.getBase(), other.getBase());
            }
            case EnumType enumerator -> {
                EnumType other = (EnumType) right;
                return enumerator.getName().equals(other.getName())
                        && enumerator.getEnumerators().equals(other.getEnumerators());
            }
            case StructType struct -> {
                StructType other = (StructType) right;
                return struct.getName().equals(other.getName()) && struct.getMembers().equals(other.getMembers());
            }
            case UnionType union -> {
                UnionType other = (UnionType) right;
                return union.getName().equals(other.getName()) && union.getMembers().equals(other.getMembers());
            }
            case NumberType numberType -> {
                return true;
            }
            case VoidType voidType -> {
                return true;
            }
            case null, default -> {
                throw new RuntimeException("TypeHandler::compareTypes: invalid type");
            }
        }
    }

}
