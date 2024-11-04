package ast.declarations;

public class TypeDeclaration implements ExternalDeclaration {
    String name;
    DeclarationSpecifier mapping;

    /**
     * AST node representing a TypeDeclaration, which aliases a name to an already defined type
     * @param name The type alias being defined
     * @param mapping A declaration specifier that the type alias refers to
     */
    public TypeDeclaration(String name, DeclarationSpecifier mapping) {
        this.name = name;
        this.mapping = mapping;
    }

    public String name() {
        return name;
    }

    public DeclarationSpecifier mapping() {
        return mapping;
    }

    @Override
    public String toString() {
        return "TypeDeclaration{" +
                "name='" + name + '\'' +
                ", mapping=" + mapping +
                '}';
    }


}
