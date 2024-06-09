package ast.types;

import ast.declarations.Declaration;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class FunctionType implements Type {
    private Type returnType;
    private List<Declaration> inputTypes;
    private boolean isVariadic;

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

    public boolean isVariadic() {
        return isVariadic;
    }

    public Type getReturnType() {
        return returnType;
    }

    public List<Declaration> getInputTypes() {
        return inputTypes;
    }

    public void setReturnType(Type returnType) {
        this.returnType = returnType;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null) return false;
        if (o.getClass() == VoidType.class) return true;
        if (getClass() != o.getClass()) return false;
        FunctionType that = (FunctionType) o;
        if (this.inputTypes.size() != that.inputTypes.size()) return false;
        for (int i = 0; i < this.inputTypes.size(); i++) {
            if (!this.inputTypes.get(i).getDeclSpec().getType().equals(that.inputTypes.get(i).getDeclSpec().getType())) {
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
}
