package ast.declarations;

import ast.types.Type;

public class TypeDeclaration implements ExternalDeclaration {
    String name;
    DeclarationSpecifier mapping;

    public TypeDeclaration(String name, DeclarationSpecifier mapping) {
        this.name = name;
        this.mapping = mapping;
    }

    public String getName() {
        return name;
    }

    public DeclarationSpecifier getMapping() {
        return mapping;
    }
}
