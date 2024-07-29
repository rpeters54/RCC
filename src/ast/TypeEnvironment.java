package ast;

import ast.declarations.Declaration;
import ast.declarations.DeclarationSpecifier;
import ast.declarations.FunctionDefinition;
import ast.declarations.TypeDeclaration;
import ast.types.*;

import java.util.HashMap;
import java.util.Map;

public class TypeEnvironment {
    private final Map<String, DeclarationSpecifier> types;
    private final Map<String, EnumType> enums;
    private final Map<String, StructType> structs;
    private final Map<String, UnionType> unions;
    private final Map<String, DeclarationSpecifier> variables;

    public TypeEnvironment() {
        this.types = new HashMap<>();
        this.enums = new HashMap<>();
        this.structs = new HashMap<>();
        this.unions = new HashMap<>();
        this.variables = new HashMap<>();
    }

    public TypeEnvironment duplicate() {
        TypeEnvironment clone = new TypeEnvironment();
        clone.types.putAll(this.types);
        clone.enums.putAll(this.enums);
        clone.structs.putAll(this.structs);
        clone.unions.putAll(this.unions);
        clone.variables.putAll(this.variables);
        return clone;
    }

    public void clear() {
        this.types.clear();
        this.enums.clear();
        this.structs.clear();
        this.unions.clear();
        this.variables.clear();
    }

    public void update(Declaration declaration) {
        Type type = declaration.getDeclSpec().getType();
        switch(type) {
            case DefinedType d -> {
                throw new RuntimeException("TypeEnvironment::update: should never encounter a defined type");
            }
            case StructType struct -> {
                if (struct.getName() != null && !struct.getMembers().isEmpty())
                    this.addStruct(struct.getName(), struct);
            }
            case UnionType union -> {
                if (union.getName() != null && !union.getMembers().isEmpty())
                    this.addUnion(union.getName(), union);
            }
            case EnumType enumeration -> {
                if (enumeration.getName() != null && !enumeration.getEnumerators().isEmpty())
                    this.addEnum(enumeration.getName(), enumeration);
            }
            default -> {}
        }

        if (declaration.getName() != null) {
            switch (type) {
                case StructType s -> {
                    StructType struct = getStruct(s.getName());
                    DeclarationSpecifier structDeclSpec = new DeclarationSpecifier();
                    structDeclSpec.setType(struct);
                    structDeclSpec.updateBoth(declaration.getDeclSpec());
                    this.addBinding(declaration.getName(), structDeclSpec);
                }
                case UnionType u -> {
                    UnionType union = getUnion(u.getName());
                    DeclarationSpecifier unionDeclSpec = new DeclarationSpecifier();
                    unionDeclSpec.setType(union);
                    unionDeclSpec.updateBoth(declaration.getDeclSpec());
                    this.addBinding(declaration.getName(), unionDeclSpec);
                }
                case EnumType e -> {
                    EnumType enumeration = getEnum(e.getName());
                    DeclarationSpecifier enumDeclSpec = new DeclarationSpecifier();
                    enumDeclSpec.setType(enumeration);
                    enumDeclSpec.updateBoth(declaration.getDeclSpec());
                    this.addBinding(declaration.getName(), enumDeclSpec);
                }
                case FunctionType f -> {
                    DeclarationSpecifier funDeclSpec = new DeclarationSpecifier();
                    funDeclSpec.setType(new PointerType(f));
                    funDeclSpec.updateBoth(declaration.getDeclSpec());
                    this.addBinding(declaration.getName(), funDeclSpec);
                }
                default -> this.addBinding(declaration.getName(), declaration.getDeclSpec());
            }
        }
    }


    public DeclarationSpecifier stripDefinedTypes(DeclarationSpecifier specifier) {
        try {
            switch (specifier.getType()) {
                case DefinedType d -> {
                    DeclarationSpecifier definedSpecifier = getType(d.getName());
                    specifier.updateBoth(definedSpecifier);
                    specifier.setType(definedSpecifier.getType());
                }
                case StructType struct -> {
                    for (Declaration member : struct.getMembers()) {
                        member.setDeclSpec(stripDefinedTypes(member.getDeclSpec()));
                    }
                }
                case UnionType union -> {
                    for (Declaration member : union.getMembers()) {
                        member.setDeclSpec(stripDefinedTypes(member.getDeclSpec()));
                    }
                }
                case CompoundType compound -> {
                    DeclarationSpecifier innerSpecifier = new DeclarationSpecifier();
                    innerSpecifier.setType(compound.getBase());
                    innerSpecifier = stripDefinedTypes(innerSpecifier);
                    compound.setBase(innerSpecifier.getType());
                }
                case FunctionType function -> {
                    DeclarationSpecifier returnSpecifier = new DeclarationSpecifier();
                    returnSpecifier.setType(function.getReturnType());
                    specifier.updateBoth(returnSpecifier);
                    function.setReturnType(returnSpecifier.getType());

                    for (Declaration param : function.getInputTypes()) {
                        param.setDeclSpec(stripDefinedTypes(param.getDeclSpec()));
                    }

                }
                case null -> {
                    throw new RuntimeException("TypeEnvironment::stripDefinedTypes: null specifier");
                }
                default -> {
                }
            }
            return specifier;
        } catch (RuntimeException e) {
            return null;
        }
    }

    /* Setters */

    public void addType(TypeDeclaration type) {
        if (types.get(type.getName()) != null)
            throw new RuntimeException(String.format("TypeEnvironment: Typedef with name %s already exists", type.getName()));
        types.put(type.getName(), type.getMapping());
    }

    public void addEnum(String name, EnumType enumeration) {
        if (enums.get(name) != null)
            throw new RuntimeException(String.format("TypeEnvironment: Enum with name %s already exists", name));
        enums.put(name, enumeration);
    }

    public void addStruct(String name, StructType structure) {
        if (structs.get(name) != null)
            throw new RuntimeException(String.format("TypeEnvironment: Struct with name %s already exists", name));
        structs.put(name, structure);
    }

    public void addUnion(String name, UnionType union) {
        if (unions.get(name) != null)
            throw new RuntimeException(String.format("TypeEnvironment: Union with name %s already exists", name));
        unions.put(name, union);
    }

    public void addDefinition(String name, FunctionDefinition func) {
        DeclarationSpecifier declSpec = variables.get(name);

        if (declSpec != null) {
            assert declSpec.getType() instanceof PointerType;
            Type type = ((PointerType) declSpec.getType()).getBase();
            if (!func.getDeclaration().getDeclSpec().getType().equals(type)) {
                throw new RuntimeException(String.format("TypeEnvironment: Illegal Redifinition of Function %s", name));
            }
        }

        DeclarationSpecifier newSpec = new DeclarationSpecifier(new PointerType(func.getDeclaration().getDeclSpec().getType()));
        newSpec.updateBoth(func.getDeclaration().getDeclSpec());
        variables.put(name, newSpec);
    }

    public void addBinding(String name, DeclarationSpecifier variable) {
        if (variables.get(name) != null)
            throw new RuntimeException(String.format("TypeEnvironment: Variable with name %s already exists", name));
        variables.put(name, variable);
    }

    /* Getters */

    public DeclarationSpecifier getType(String name) {
        DeclarationSpecifier declarationSpecifier = types.get(name);
        if (declarationSpecifier == null)
            throw new RuntimeException(String.format("TypeEnvironment: Type with name %s does not exist", name));
        return declarationSpecifier;
    }

    public EnumType getEnum(String name) {
        EnumType enumeration = enums.get(name);
        if (enumeration == null)
            throw new RuntimeException(String.format("TypeEnvironment: Enum with name %s does not exist", name));
        return enumeration;
    }

    public StructType getStruct(String name) {
        StructType struct = structs.get(name);
        if (struct == null)
            throw new RuntimeException(String.format("TypeEnvironment: Struct with name %s does not exist", name));
        return struct;
    }

    public UnionType getUnion(String name) {
        UnionType union = unions.get(name);
        if (union == null)
            throw new RuntimeException(String.format("TypeEnvironment: Union with name %s does not exist", name));
        return union;
    }

    public DeclarationSpecifier getBinding(String name) {
        DeclarationSpecifier declarationSpecifier = variables.get(name);
        return declarationSpecifier;
    }


}
