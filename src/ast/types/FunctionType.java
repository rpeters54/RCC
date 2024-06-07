package ast.types;

import ast.declarations.Declaration;

import java.util.ArrayList;
import java.util.List;

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
}
