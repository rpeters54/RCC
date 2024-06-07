package semantics;

import ast.declarations.Declaration;
import ast.declarations.DeclarationSpecifier;
import ast.declarations.TypeDeclaration;
import ast.types.*;

import java.security.spec.RSAOtherPrimeInfo;
import java.util.HashMap;
import java.util.Map;

public class TypeEnvironment {
    private Map<String, DeclarationSpecifier> types;
    private Map<String, EnumType> enums;
    private Map<String, StructType> structs;
    private Map<String, UnionType> unions;
    private Map<String, FunctionType> funcs;
    private Map<String, DeclarationSpecifier> variables;

    public TypeEnvironment() {
        this.types = new HashMap<>();
        this.enums = new HashMap<>();
        this.structs = new HashMap<>();
        this.unions = new HashMap<>();
        this.funcs = new HashMap<>();
        this.variables = new HashMap<>();
    }

    public TypeEnvironment duplicate() {
        TypeEnvironment clone = new TypeEnvironment();
        clone.types.putAll(this.types);
        clone.enums.putAll(this.enums);
        clone.structs.putAll(this.structs);
        clone.unions.putAll(this.unions);
        clone.funcs.putAll(this.funcs);
        clone.variables.putAll(this.variables);
        return clone;
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
            case FunctionType function -> {
                if (declaration.getName() != null)
                    this.addFunc(declaration.getName(), function);
            }
            default -> {}
        }

        if (declaration.getName() != null) {
            switch (type) {
                case StructType s -> {
                    StructType struct = getStruct(s.getName());
                    declaration.getDeclSpec().setType(struct);
                    this.addVariable(declaration.getName(), declaration.getDeclSpec());
                }
                case UnionType u -> {
                    UnionType union = getUnion(u.getName());
                    declaration.getDeclSpec().setType(union);
                    this.addVariable(declaration.getName(), declaration.getDeclSpec());
                }
                case EnumType e -> {
                    EnumType enumeration = getEnum(e.getName());
                    declaration.getDeclSpec().setType(enumeration);
                    this.addVariable(declaration.getName(), declaration.getDeclSpec());
                }
                default -> addVariable(declaration.getName(), declaration.getDeclSpec());
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

    public void addFunc(String name, FunctionType func) {
        if (funcs.get(name) != null)
            throw new RuntimeException(String.format("TypeEnvironment: Function with name %s already exists", name));
        funcs.put(name, func);
    }

    public void addVariable(String name, DeclarationSpecifier variable) {
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

    public FunctionType getFunc(String name) {
        FunctionType func = funcs.get(name);
        if (func == null)
            throw new RuntimeException(String.format("TypeEnvironment: Function with name %s does not exist", name));
        return func;
    }

    public DeclarationSpecifier getVariable(String name) {
        DeclarationSpecifier declarationSpecifier = variables.get(name);
        if (declarationSpecifier == null) {
            FunctionType func = funcs.get(name);
            if (func != null) {
                declarationSpecifier = new DeclarationSpecifier();
                declarationSpecifier.setType(func);
            }
        }
//        if (declarationSpecifier == null)
//            throw new RuntimeException(String.format("TypeEnvironment: Variable with name %s does not exist", name));
        return declarationSpecifier;
    }


}
