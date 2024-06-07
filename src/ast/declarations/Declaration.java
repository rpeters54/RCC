package ast.declarations;

import ast.expr.Expression;
import ast.types.Type;
import ast.types.VoidType;

import java.util.ArrayList;
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
        this.initialValue = null;
    }

    public DeclarationSpecifier getDeclSpec() {
        return declSpec;
    }

    public void setDeclSpec(DeclarationSpecifier declSpec) {
        this.declSpec = declSpec;
    }

    public void setInitialValue(List<Expression> initialValue) {
        this.initialValue = initialValue;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

}
