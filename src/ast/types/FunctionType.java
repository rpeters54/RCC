package ast.types;

import ast.declarations.Declaration;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class FunctionType extends Type {
    private Type returnType;
    private final List<Declaration> inputTypes;
    private final boolean isVariadic;

    public FunctionType() {
        returnType = null;
        inputTypes = new ArrayList<>();
        isVariadic = false;
    }

    public FunctionType(List<Declaration> paramList, boolean isVariadic) {
        returnType = null;
        inputTypes = paramList;
        this.isVariadic = isVariadic;
    }

    public FunctionType(Type returnType, List<Declaration> inputTypes, boolean isVariadic) {
        this.returnType = returnType;
        this.inputTypes = inputTypes;
        this.isVariadic = isVariadic;
    }

    public boolean isVariadic() {
        return isVariadic;
    }

    public Type returnType() {
        return returnType;
    }

    public List<Declaration> inputTypes() {
        return inputTypes;
    }

    public void setReturnType(Type returnType) {
        this.returnType = returnType;
    }

    @Override
    public long sizeof() {
        throw new RuntimeException("FunctionType::sizeof: FunctionType has no size");
    }

    @Override
    public Type clone() {
        return new FunctionType(returnType.clone(), inputTypes, isVariadic);
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null) return false;
//        if (o.getClass() == VoidType.class) return true;
        if (getClass() != o.getClass()) return false;
        FunctionType that = (FunctionType) o;
        if (this.inputTypes.size() != that.inputTypes.size()) return false;
        for (int i = 0; i < this.inputTypes.size(); i++) {
            if (!this.inputTypes.get(i).declSpec().getType().equals(that.inputTypes.get(i).declSpec().getType())) {
                return false;
            }
        }
        return this.returnType.equals(that.returnType) && this.isVariadic == that.isVariadic;
    }

    @Override
    public int hashCode() {
        //TODO: This may cause problems, may want to change in the future
        return Objects.hash(returnType, inputTypes, isVariadic);
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(returnType.toString()).append(" (");
        for (Declaration input : inputTypes) {
            sb.append(input.declSpec().getType()).append(" ");
        }
        sb.append(")");
        return sb.toString();
    }

    @Override
    public String fmtTypeString() {
        StringBuilder sb = new StringBuilder();
        sb.append(returnType.fmtTypeString()).append(" (");
        for (Declaration input : inputTypes) {
            sb.append(input.declSpec().getType().fmtTypeString()).append(" ");
        }
        sb.append(")");
        return sb.toString();
    }
}
