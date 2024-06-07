package ast.declarations;

import ast.types.Type;
import ast.types.VoidType;

public class DeclarationSpecifier {
    private Type type;
    private StorageClass storage;
    private TypeQualifier qualifier;

    public DeclarationSpecifier() {
        this.type = new VoidType();
        this.storage = StorageClass.NONE;
        this.qualifier = TypeQualifier.NONE;
    }

    public DeclarationSpecifier(Type type, StorageClass storage, TypeQualifier qualifier) {
        this.type = type;
        this.storage = storage;
        this.qualifier = qualifier;
    }

    public Type getType() {
        return type;
    }

    public StorageClass getStorage() {
        return storage;
    }

    public TypeQualifier getQualifier() {
        return qualifier;
    }

    public void setType(Type type) {
        this.type = type;
    }

    public void updateStorage(StorageClass sc) {
        if (storage == StorageClass.NONE) {
            storage = sc;
        } else {
            throw new RuntimeException("Can't have >1 storage class");
        }
    }


    public void updateBoth(DeclarationSpecifier other) {
        updateStorage(other.getStorage());
        updateQualifier(other.getQualifier());
    }


    public void updateQualifier(TypeQualifier tq) {
        switch (qualifier) {
            case NONE -> qualifier = tq;
            case CONST -> {
                if (tq == TypeQualifier.VOLATILE) {
                    qualifier = TypeQualifier.BOTH;
                } else {
                    throw new RuntimeException("Can't specify same qualifier twice");
                }
            }
            case VOLATILE -> {
                if (tq == TypeQualifier.CONST) {
                    qualifier = TypeQualifier.BOTH;
                } else {
                    throw new RuntimeException("Can't specify same qualifier twice");
                }
            }
            case BOTH -> {
                throw new RuntimeException("Can't specify same qualifier twice");
            }
        }
    }

    public enum TypeQualifier {
        CONST, VOLATILE, BOTH, NONE
    }

    public enum StorageClass {
        AUTO, STATIC, EXTERN, REGISTER, NONE
    }
}
