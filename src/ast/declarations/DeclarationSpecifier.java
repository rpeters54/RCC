package ast.declarations;

import ast.types.Type;
import ast.types.VoidType;

import java.util.Objects;

public class DeclarationSpecifier {
    private Type type;
    private Type.StorageClass storage;
    private Type.TypeQualifier qualifier;

    public DeclarationSpecifier() {
        this.type = new VoidType();
        this.storage = Type.StorageClass.NONE;
        this.qualifier = Type.TypeQualifier.NONE;
    }

    public DeclarationSpecifier(Type type) {
        this.type = type;
        this.storage = Type.StorageClass.NONE;
        this.qualifier = Type.TypeQualifier.NONE;
    }

    public DeclarationSpecifier(Type type, Type.StorageClass storage, Type.TypeQualifier qualifier) {
        this.type = type;
        this.storage = storage;
        this.qualifier = qualifier;
    }

    public DeclarationSpecifier(DeclarationSpecifier other) {
        this.type = other.type.clone();
        this.storage = other.storage;
        this.qualifier = other.qualifier;
    }

    public Type getType() {
        return type;
    }

    public Type.StorageClass getStorage() {
        return storage;
    }

    public Type.TypeQualifier getQualifier() {
        return qualifier;
    }

    public void setType(Type type) {
        this.type = type;
    }

    public void updateStorage(Type.StorageClass sc) {
        if (storage == Type.StorageClass.NONE) {
            storage = sc;
        } else {
            throw new RuntimeException("Can't have >1 storage class");
        }
    }


    public void updateBoth(DeclarationSpecifier other) {
        updateStorage(other.getStorage());
        updateQualifier(other.getQualifier());
    }


    public void updateQualifier(Type.TypeQualifier tq) {
        switch (qualifier) {
            case NONE -> qualifier = tq;
            case CONST -> {
                if (tq == Type.TypeQualifier.VOLATILE) {
                    qualifier = Type.TypeQualifier.BOTH;
                } else {
                    throw new RuntimeException("Can't specify same qualifier twice");
                }
            }
            case VOLATILE -> {
                if (tq == Type.TypeQualifier.CONST) {
                    qualifier = Type.TypeQualifier.BOTH;
                } else {
                    throw new RuntimeException("Can't specify same qualifier twice");
                }
            }
            case BOTH -> {
                throw new RuntimeException("Can't specify same qualifier twice");
            }
        }
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        DeclarationSpecifier that = (DeclarationSpecifier) o;
        return Objects.equals(type, that.type) && storage == that.storage && qualifier == that.qualifier;
    }

    @Override
    public int hashCode() {
        return Objects.hash(type, storage, qualifier);
    }

}
