package ast.declarations;

import ast.expr.Expression;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;


public class Declaration implements ExternalDeclaration {
    private DeclarationSpecifier declSpec;
    private String name;
    private List<Expression> initialValue;

    public Declaration() {
        this.declSpec = new DeclarationSpecifier();
        this.name = null;
        this.initialValue = new ArrayList<>();
    }

    public Declaration(String name) {
        this.declSpec = new DeclarationSpecifier();
        this.name = name;
        this.initialValue = new ArrayList<>();
    }

    public Declaration(String name, DeclarationSpecifier declSpec) {
        this.declSpec = declSpec;
        this.name = name;
        this.initialValue = new ArrayList<>();
    }

    public DeclarationSpecifier declSpec() {
        return declSpec;
    }

    public void setDeclSpec(DeclarationSpecifier declSpec) {
        this.declSpec = declSpec;
    }

    public void setInitialValue(List<Expression> initialValue) {
        this.initialValue = initialValue;
    }

    public String name() {
        return name;
    }

    public List<Expression> initialValue() {
        return Collections.unmodifiableList(initialValue);
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "Declaration{\n"
                + "    name=" + name + ",\n"
                + "    type=" + declSpec.getType() + ",\n"
                + "    qualifier=" + declSpec.getQualifier() + ",\n"
                + "    storage=" + declSpec.getStorage() + ",\n"
                + "    initialValue=" + initialValue + ",\n"
                + "}";
    }


}
