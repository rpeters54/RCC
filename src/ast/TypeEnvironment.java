package ast;

import ast.declarations.Declaration;
import ast.declarations.DeclarationSpecifier;
import ast.declarations.FunctionDefinition;
import ast.declarations.TypeDeclaration;
import ast.types.*;
import codegen.BasicBlock;
import codegen.ControlFlowGraph;
import codegen.TranslationUnit;
import codegen.instruction.llvm.*;
import codegen.values.Literal;
import codegen.values.Register;

import java.util.*;

public class TypeEnvironment {
    private final Map<String, DeclarationSpecifier> types;
    private final Map<String, ObjectType> objects;
    private final Map<String, DeclarationSpecifier> names;
    private final Map<String, StorageLocation> locations;
    private final Set<String> declaredFunctions;

    public enum StorageLocation {
        REGISTER, STACK
    }

    public TypeEnvironment() {
        this.types = new HashMap<>();
        this.objects = new HashMap<>();
        this.names = new HashMap<>();
        this.locations = new HashMap<>();
        this.declaredFunctions = new HashSet<>();
    }

    public TypeEnvironment duplicate() {
        TypeEnvironment clone = new TypeEnvironment();
        clone.types.putAll(this.types);
        clone.objects.putAll(this.objects);
        clone.names.putAll(this.names);
        clone.locations.putAll(this.locations);
        clone.declaredFunctions.addAll(this.declaredFunctions);
        return clone;
    }

    public void clear() {
        this.types.clear();
        this.objects.clear();
        this.names.clear();
        this.locations.clear();
        this.declaredFunctions.clear();
    }


    /**
     * Add a type alias to the environment
     * @param type Mapping from a name to a type
     */
    public void addTypeDef(TypeDeclaration type) {
        if (types.get(type.name()) != null)
            throw new RuntimeException(String.format("TypeEnvironment: Typedef with name %s already exists", type.name()));
        DeclarationSpecifier cleanMapping = stripDefinedTypes(type.mapping());
        // add the type to the global environment if it defines the type in the typdef
        // ex typedef struct {...} alias; would add a anonymous struct to the list of defined structs
        switch (cleanMapping.getType()) {
            case StructType struct -> {
                if (!struct.members().isEmpty())
                    addClass(cleanMapping);
            }
            case UnionType union -> {
                if (!union.members().isEmpty())
                    addClass(cleanMapping);
            }
            case EnumType enumeration -> {
                if (!enumeration.getEnumerators().isEmpty())
                    addClass(cleanMapping);
            }
            default -> {}
        }
        types.put(type.name(), cleanMapping);
    }

    /**
     * Add a type to the environment (struct/enum/union)
     * @param specifier The type being added
     */
    public void addClass(DeclarationSpecifier specifier) {
        DeclarationSpecifier cleanSpecifier = stripDefinedTypes(specifier);
        // if the value is a struct/union/enum/typedef, track it in list of defined types
        switch(cleanSpecifier.getType()) {
            case DefinedType d -> {
                throw new RuntimeException("TypeEnvironment::update: should never encounter a defined type");
            }
            case StructType struct -> {
                if (struct.name() != null && !struct.members().isEmpty()) {
                    this.addStruct(struct.name(), struct);
                    for (Declaration decl : struct.members()) {
                        addClassHelper(decl);
                    }
                } else {
                    throw new RuntimeException("TypeEnvironment::addClass: Malformed struct declaration");
                }
            }
            case UnionType union -> {
                if (union.name() != null && !union.members().isEmpty()) {
                    this.addUnion(union.name(), union);
                    for (Declaration decl : union.members()) {
                        addClassHelper(decl);
                    }
                } else {
                    throw new RuntimeException("TypeEnvironment::addClass: Malformed union declaration");
                }
            }
            case EnumType enumeration -> {
                if (enumeration.getName() != null && !enumeration.getEnumerators().isEmpty()) {
                    this.addEnum(enumeration.getName(), enumeration);
                } else {
                    throw new RuntimeException("TypeEnvironment::addClass: Malformed enumeration");
                }
            }
            default -> {}
        }
    }

    /**
     * Helper for add class that adds any nested anonymous classes
     * @param declaration
     */
    public void addClassHelper(Declaration declaration) {
        switch(declaration.declSpec().getType()) {
            case StructType struct -> {
//                if (struct.name() != null && !struct.members().isEmpty()) {
//                    this.tryAddStruct(struct.name(), struct);
//                } else {
//                    throw new RuntimeException("TypeEnvironment::addClassHelper: Malformed struct declaration");
//                }
                if (struct.name() != null) {
                    if (objects.get(struct.name()) == null) {
                        if (!struct.members().isEmpty()) {
                            this.addStruct(struct.name(), struct);
                        } else {
                            throw new RuntimeException("TypeEnvironment::addClassHelper: Malformed union declaration");
                        }
                    }
                }
                for (Declaration decl : struct.members()) {
                    addClassHelper(decl);
                }
            }
            case UnionType union -> {
                if (union.name() != null) {
                    if (objects.get(union.name()) == null) {
                        if (!union.members().isEmpty()) {
                            this.addUnion(union.name(), union);
                        } else {
                            throw new RuntimeException("TypeEnvironment::addClassHelper: Malformed union declaration");
                        }
                    }
                }
                for (Declaration decl : union.members()) {
                    addClassHelper(decl);
                }
            }
            case EnumType enumeration -> {
                if (enumeration.getName() != null && !enumeration.getEnumerators().isEmpty()) {
                    this.tryAddEnum(enumeration.getName(), enumeration);
                } else {
                    throw new RuntimeException("TypeEnvironment::addClassHelper: Malformed enumeration");
                }
            }
            default -> {}
        }
    }

    /**
     * cleans up a declaration, expanding any type aliases and replacing placeholders
     *
     * @param specifier the declaration that defines an object in the environment
     */
    public DeclarationSpecifier expandDeclaration(DeclarationSpecifier specifier) {
        DeclarationSpecifier cleanSpecifier = stripDefinedTypes(specifier);
        return expandDeclarationHelper(cleanSpecifier);
    }

    public DeclarationSpecifier expandDeclarationHelper(DeclarationSpecifier specifier) {
        // can't expand an unnamed variable
//        if (declaration.name() == null) {
//            return null;
//        }
        switch (specifier.getType()) {
            case CompoundType c -> {
                c.setBase(expandDeclarationHelper(new DeclarationSpecifier(c.base())).getType());
                return specifier;
            }
            case StructType s -> {
                StructType struct = getStruct(s.name());
                return new DeclarationSpecifier(struct,
                        specifier.getStorage(),
                        specifier.getQualifier());
            }
            case UnionType u -> {
                UnionType union = getUnion(u.name());
                return new DeclarationSpecifier(union,
                        specifier.getStorage(),
                        specifier.getQualifier());
            }
            case EnumType e -> {
                EnumType enumeration = getEnum(e.getName());
                return new DeclarationSpecifier(enumeration,
                        specifier.getStorage(),
                        specifier.getQualifier());
            }
            case FunctionType f -> {
                Type retType = expandDeclaration(new DeclarationSpecifier(f.returnType())).getType();
                List<Declaration> expandedInputs = f.inputTypes().stream()
                        .map(decl -> new Declaration(decl.name(), expandDeclaration(decl.declSpec())))
                        .toList();

                return new DeclarationSpecifier(new FunctionType(retType, expandedInputs, f.isVariadic()),
                        specifier.getStorage(),
                        specifier.getQualifier());
            }
            default -> {return specifier;}
        }

    }

    /**
     * Add a binding to the environment
     * @param name name of the declaration to be added
     * @param specifier type and specifier qualifier of the declaration
     */
    public void addBinding(String name, DeclarationSpecifier specifier, TypeEnvironment globalEnv) {
        if (specifier == null) {
            System.err.println("TypeEnvironment::addBinding: Malformed specifier declaration");
        }

        DeclarationSpecifier expanded = globalEnv.expandDeclaration(specifier);
        switch (specifier.getType()) {
            case ArrayType at -> addVariable(name, expanded, StorageLocation.STACK);
            case StructType st -> addVariable(name, expanded, StorageLocation.STACK);
            case UnionType ut -> addVariable(name, expanded, StorageLocation.STACK);
            case FunctionType ft -> {
                expanded.setType(new PointerType(expanded.getType()));
                addVariable(name, expanded, StorageLocation.REGISTER);
            }
            case null -> throw new RuntimeException("TypeEnvironment::addBinding: should never encounter a null type");
            default -> addVariable(name, expanded, StorageLocation.REGISTER);
        }
    }


    /**
     * Expand typedef defined types to the genuine c-types
     * @param specifier the type to be expanded
     * @return the final expanded type
     */
    public DeclarationSpecifier stripDefinedTypes(DeclarationSpecifier specifier) {
        DeclarationSpecifier copy = new DeclarationSpecifier(specifier);
        return stripDefinedTypeHelper(copy);
    }

    public DeclarationSpecifier stripDefinedTypeHelper(DeclarationSpecifier specifier) {
        DeclarationSpecifier result = specifier;
        switch (specifier.getType()) {
            case DefinedType d -> {
                DeclarationSpecifier definedSpecifier = getType(d.getName());
                result = new DeclarationSpecifier(definedSpecifier);
            }
            case StructType struct -> {
                for (Declaration member : struct.members()) {
                    member.setDeclSpec(stripDefinedTypeHelper(member.declSpec()));
                }
            }
            case UnionType union -> {
                for (Declaration member : union.members()) {
                    member.setDeclSpec(stripDefinedTypeHelper(member.declSpec()));
                }
            }
            case CompoundType compound -> {
                DeclarationSpecifier wrapper = new DeclarationSpecifier();
                wrapper.setType(compound.base());
                compound.setBase(stripDefinedTypeHelper(wrapper).getType());
            }
            case FunctionType function -> {
                DeclarationSpecifier wrapper = new DeclarationSpecifier();
                wrapper.setType(function.returnType());
                function.setReturnType(stripDefinedTypeHelper(wrapper).getType());

                for (Declaration param : function.inputTypes()) {
                    param.setDeclSpec(stripDefinedTypeHelper(param.declSpec()));
                }

            }
            case null, default -> {}
        }
        return result;
    }

    /**
     * Add a global declaration to the global block
     * @param declaration
     * @param globalBlock
     */
    public void addGlobalDeclarations(Declaration declaration, BasicBlock globalBlock) {
        DeclarationSpecifier specifier = expandDeclaration(declaration.declSpec());
        declaration.setDeclSpec(specifier);
        Type t = specifier.getType();
        Register globalReg;
        if (t instanceof FunctionType ft) {
            declaredFunctions.add(declaration.name());
            globalReg = Register.FunctionPointer(declaration.name(), new PointerType(t));
            globalBlock.addInstruction(new FunctionDeclarationLLVM(globalReg, ft));
        } else {
            globalReg = Register.Global(new PointerType(t));
            globalBlock.addInstruction(new GlobalVariableLLVM(globalReg.clone(), declaration.name(), t));
        }
        globalBlock.addBinding(declaration.name(), globalReg.clone());
    }


    /**
     * Add function definition to the global type environment
     * @param name
     * @param func
     * @param globalEnv
     */
    public void addFunctionDefinition(String name, FunctionDefinition func, TypeEnvironment globalEnv) {
        DeclarationSpecifier currentSpecifier = names.get(name);
        DeclarationSpecifier funcExpanded = globalEnv.expandDeclaration(func.declaration().declSpec());
        func.setDeclSpec(funcExpanded);

        if (currentSpecifier != null) {
            DeclarationSpecifier expanded = globalEnv.expandDeclaration(currentSpecifier);
            assert expanded.getType() instanceof PointerType;
            Type type = ((PointerType) expanded.getType()).base();
            if (!funcExpanded.getType().equals(type)) {
                throw new RuntimeException(String.format("TypeEnvironment: Illegal Redifinition of Function %s", name));
            }
        } else {
            DeclarationSpecifier newSpec = new DeclarationSpecifier(new PointerType(funcExpanded.getType()));
            newSpec.updateBoth(funcExpanded);
            addBinding(name, newSpec, globalEnv);
        }
    }

    /**
     * Add declaration from the parameters of a function
     * @param declaration the declaration to add
     * @param graph the control flow graph that define the current function
     * @param block the current basic block
     */
    public void AddParamDeclarations(Declaration declaration, ControlFlowGraph graph, BasicBlock block) {
        String name = declaration.name();
        Type paramType = getBinding(name).getType();
        switch (getLocation(name)) {
            case REGISTER -> {
                Register pReg = Register.LLVM_Register(paramType);
                block.addBinding(name, pReg.clone());
                graph.addParameter(pReg);
            }
            case STACK -> {
                Register pTemp = Register.LLVM_Register(paramType);
                Register pReg = Register.LLVM_Register(new PointerType(paramType));
                AllocaLLVM alloca = new AllocaLLVM(pReg.clone());
                StoreLLVM store = new StoreLLVM(pTemp.clone(), pReg.clone());
                block.addInstruction(alloca);
                block.addInstruction(store);
                block.addBinding(name, pReg.clone());
                graph.addParameter(pTemp);
            }
            case null, default -> throw new IllegalStateException("Invalid Location");
        }
    }


    /**
     * Add declaration from a compound statement
     * @param declaration the declaration to add
     * @param unit the top-level program object
     * @param graph the control flow graph that define the current function
     * @param block the current basic block
     */
    public void addCompoundDeclarations(Declaration declaration, TranslationUnit unit,
                                      ControlFlowGraph graph, BasicBlock block, TypeEnvironment globalEnv) {
        // generate code for each value in the value list
        // ex. int i = 7 + 9, 6, 8; will generate code for 7 + 9, 6, and 8;
        List<Register> valueList = declaration.initialValue().stream()
                .map(exp -> exp.codegen(unit, graph, block)).toList();

        String name = declaration.name();
        Type paramType = getBinding(name).getType();

        switch (getLocation(name)) {
            case REGISTER -> {
                Register value = valueList.isEmpty() ? Literal.nill(paramType, unit, graph, block) : valueList.getLast();
                assert value.type() instanceof PrimitiveType;
                assert paramType instanceof PrimitiveType;
                if (!PrimitiveType.comparePrimitives((PrimitiveType) value.type(),(PrimitiveType) paramType)) {
                    ConversionLLVM conv = ConversionLLVM.make(value, (PrimitiveType) paramType);
                    block.addInstruction(conv);
                    value = conv.result().clone();
                }
                block.addBinding(name, value);
            }
            case STACK -> {
                DeclarationSpecifier paramSpec = globalEnv.expandDeclaration(declaration.declSpec());
                Register pReg = Register.LLVM_Register(new PointerType(paramSpec.getType()));
                AllocaLLVM alloca = new AllocaLLVM(pReg.clone());
                block.addInstruction(alloca);
                if (!valueList.isEmpty()) {
                    if (paramSpec.getType() instanceof ArrayType arr) {
                        block.getMutableInstructions().addAll(arr.initArrayValues(pReg, valueList));
                    } else {
                        StoreLLVM store = new StoreLLVM(valueList.getLast(), pReg.clone());
                        block.addInstruction(store);
                    }
                }
                block.addBinding(name, pReg.clone());
            }
            case null, default -> throw new IllegalStateException("Invalid Location");
        }
    }


    private void tryAddEnum(String name, EnumType enumeration) {
        if (objects.get(name) != null)
            return;
        objects.put(name, enumeration);
    }

    private void addEnum(String name, EnumType enumeration) {
        if (objects.get(name) != null)
            throw new RuntimeException(String.format("TypeEnvironment: Enum/Struct/Union with name %s already exists", name));
        objects.put(name, enumeration);
    }

    private void tryAddStruct(String name, StructType structure) {
        if (objects.get(name) != null)
            return;
        objects.put(name, structure);
    }

    private void addStruct(String name, StructType structure) {
        if (objects.get(name) != null)
            throw new RuntimeException(String.format("TypeEnvironment: Enum/Struct/Union with name %s already exists", name));
        objects.put(name, structure);
    }

    private void tryAddUnion(String name, UnionType union) {
        if (objects.get(name) != null)
            return;
        objects.put(name, union);
    }

    private void addUnion(String name, UnionType union) {
        if (objects.get(name) != null)
            throw new RuntimeException(String.format("TypeEnvironment: Enum/Struct/Union with name %s already exists", name));
        objects.put(name, union);
    }

    private void addVariable(String name, DeclarationSpecifier variable, StorageLocation location) {
        if (names.get(name) != null)
            throw new RuntimeException(String.format("TypeEnvironment: Variable with name %s already exists", name));
        locations.put(name, location);
        names.put(name, variable);
    }

    public void updateVariableStorageLocation(String name, StorageLocation location) {
        switch (locations.get(name)) {
            case REGISTER -> {
                if (location == StorageLocation.STACK) {
                    locations.put(name, StorageLocation.STACK);
                }
            }
            case STACK -> {}
            case null, default -> {
                throw new RuntimeException(String.format("TypeEnvironment: Location with name %s does not exist", name));
            }
        }

    }

    /* Getters */

    public DeclarationSpecifier getType(String name) {
        DeclarationSpecifier declarationSpecifier = types.get(name);
        if (declarationSpecifier == null)
            throw new RuntimeException(String.format("TypeEnvironment: Type with name %s does not exist", name));
        return declarationSpecifier;
    }

    public EnumType getEnum(String name) {
        ObjectType obj = objects.get(name);
        if (!(obj instanceof EnumType enumeration))
            throw new RuntimeException(String.format("TypeEnvironment: Enum with name %s does not exist", name));
        return enumeration;
    }

    public StructType getStruct(String name) {
        ObjectType obj = objects.get(name);
        if (!(obj instanceof StructType struct))
            throw new RuntimeException(String.format("TypeEnvironment: Struct with name %s does not exist", name));
        return struct;
    }

    public UnionType getUnion(String name) {
        ObjectType obj = objects.get(name);
        if (!(obj instanceof UnionType union))
            throw new RuntimeException(String.format("TypeEnvironment: Union with name %s does not exist", name));
        return union;
    }

    public List<StructType> getStructs() {
        return objects.values().stream()
                .filter(item -> item instanceof StructType)
                .map(item -> (StructType) item).toList();
    }

    public List<UnionType> getUnions() {
        return objects.values().stream()
                .filter(item -> item instanceof UnionType)
                .map(item -> (UnionType) item).toList();
    }

    public List<EnumType> getEnums() {
        return objects.values().stream()
                .filter(item -> item instanceof EnumType)
                .map(item -> (EnumType) item).toList();
    }

    public DeclarationSpecifier getBinding(String name) {
        return names.get(name);
    }

    public StorageLocation getLocation(String name) {
        return locations.get(name);
    }

    public boolean isDeclaredFunction(String name) {
        return declaredFunctions.contains(name);
    }


}
