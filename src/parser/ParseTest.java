package parser;


import ast.Program;
import ast.declarations.Declaration;
import ast.declarations.DeclarationSpecifier;
import ast.declarations.ExternalDeclaration;
import ast.types.*;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.Assertions;

import java.util.ArrayList;
import java.util.List;


public class ParseTest {

    private static String testDir = "/Users/rileypeters/ANSIParser/src/parser/tests/";

    @Test
    @DisplayName("Simple Variable Declarations")
    void simpleVariableDeclarations() {
        String[] testPath = {testDir+"simpleVariableDeclarations.c"};
        Program program = Main.parseProgram(testPath);
        List<Declaration> declarations = toDeclarationList(program.getDeclarations());

        numberDeclarationTest(declarations.get(0), "main", IntegerType.class, Integer.BYTES, true,
                DeclarationSpecifier.StorageClass.NONE,DeclarationSpecifier.TypeQualifier.NONE);
        numberDeclarationTest(declarations.get(1), "vroom", IntegerType.class, Character.BYTES, true,
                DeclarationSpecifier.StorageClass.NONE,DeclarationSpecifier.TypeQualifier.NONE);
        numberDeclarationTest(declarations.get(2), "mini", IntegerType.class, Short.BYTES, true,
                DeclarationSpecifier.StorageClass.NONE,DeclarationSpecifier.TypeQualifier.NONE);
        numberDeclarationTest(declarations.get(3), "length", IntegerType.class, Long.BYTES, true,
                DeclarationSpecifier.StorageClass.NONE,DeclarationSpecifier.TypeQualifier.NONE);
        numberDeclarationTest(declarations.get(4), "flying", FloatingType.class, Float.BYTES, true,
                DeclarationSpecifier.StorageClass.NONE,DeclarationSpecifier.TypeQualifier.NONE);
        numberDeclarationTest(declarations.get(5), "two", FloatingType.class, Double.BYTES, true,
                DeclarationSpecifier.StorageClass.NONE,DeclarationSpecifier.TypeQualifier.NONE);
    }


    @Test
    @DisplayName("Variable Declarations with Extra Specifiers")
    void extraSpecifierDeclarations() {
        String[] testPath = {testDir+"extraSpecifierDeclarations.c"};
        Program program = Main.parseProgram(testPath);
        List<Declaration> declarations = toDeclarationList(program.getDeclarations());

        numberDeclarationTest(declarations.get(0), "shortMan", IntegerType.class, Short.BYTES, true,
                DeclarationSpecifier.StorageClass.NONE,DeclarationSpecifier.TypeQualifier.NONE);
        numberDeclarationTest(declarations.get(1), "tallMan", IntegerType.class, Long.BYTES, true,
                DeclarationSpecifier.StorageClass.NONE,DeclarationSpecifier.TypeQualifier.NONE);
        numberDeclarationTest(declarations.get(2), "tallInt", IntegerType.class, Long.BYTES, true,
                DeclarationSpecifier.StorageClass.NONE,DeclarationSpecifier.TypeQualifier.NONE);
        numberDeclarationTest(declarations.get(3), "man", IntegerType.class, Long.BYTES, true,
                DeclarationSpecifier.StorageClass.NONE,DeclarationSpecifier.TypeQualifier.NONE);
        numberDeclarationTest(declarations.get(4), "superFloat", FloatingType.class, Double.BYTES, true,
                DeclarationSpecifier.StorageClass.NONE,DeclarationSpecifier.TypeQualifier.NONE);
        numberDeclarationTest(declarations.get(5), "floatie", FloatingType.class, Double.BYTES, true,
                DeclarationSpecifier.StorageClass.NONE,DeclarationSpecifier.TypeQualifier.NONE);
        numberDeclarationTest(declarations.get(6), "signless", IntegerType.class, Integer.BYTES, false,
                DeclarationSpecifier.StorageClass.NONE,DeclarationSpecifier.TypeQualifier.NONE);
    }


    @Test
    @DisplayName("Variable Declarations with Storage Class Specifiers")
    void storageDeclarationTest() {
        String[] testPath = {testDir+"storageDeclarations.c"};
        Program program = Main.parseProgram(testPath);
        List<Declaration> declarations = toDeclarationList(program.getDeclarations());

        numberDeclarationTest(declarations.get(0), "shortMan", IntegerType.class, Short.BYTES, true,
                DeclarationSpecifier.StorageClass.AUTO,DeclarationSpecifier.TypeQualifier.NONE);
        numberDeclarationTest(declarations.get(1), "tallMan", IntegerType.class, Long.BYTES, true,
                DeclarationSpecifier.StorageClass.STATIC,DeclarationSpecifier.TypeQualifier.NONE);
        numberDeclarationTest(declarations.get(2), "tallInt", IntegerType.class, Long.BYTES, false,
                DeclarationSpecifier.StorageClass.EXTERN,DeclarationSpecifier.TypeQualifier.NONE);
        numberDeclarationTest(declarations.get(3), "regMan", IntegerType.class, Long.BYTES, true,
                DeclarationSpecifier.StorageClass.REGISTER,DeclarationSpecifier.TypeQualifier.NONE);
    }


    @Test
    @DisplayName("Variable Declarations with Type Qualifiers")
    void qualifiedDeclarationTest() {
        String[] testPath = {testDir+"qualifiedDeclarations.c"};
        Program program = Main.parseProgram(testPath);
        List<Declaration> declarations = toDeclarationList(program.getDeclarations());

        numberDeclarationTest(declarations.get(0), "shortMan", IntegerType.class, Short.BYTES, true,
                DeclarationSpecifier.StorageClass.AUTO,DeclarationSpecifier.TypeQualifier.VOLATILE);
        numberDeclarationTest(declarations.get(1), "tallMan", IntegerType.class, Long.BYTES, true,
                DeclarationSpecifier.StorageClass.STATIC,DeclarationSpecifier.TypeQualifier.CONST);
        numberDeclarationTest(declarations.get(2), "tallInt", IntegerType.class, Long.BYTES, true,
                DeclarationSpecifier.StorageClass.EXTERN,DeclarationSpecifier.TypeQualifier.VOLATILE);
        numberDeclarationTest(declarations.get(3), "regMan", IntegerType.class, Long.BYTES, false,
                DeclarationSpecifier.StorageClass.REGISTER,DeclarationSpecifier.TypeQualifier.BOTH);
    }

    @Test
    @DisplayName("Struct and Union Declarations")
    void structAndUnionTest() {
        String[] testPath = {testDir + "structsAndUnions.c"};
        Program program = Main.parseProgram(testPath);
        List<Declaration> declarations = toDeclarationList(program.getDeclarations());

        Declaration anonStruct = declarations.get(0);
        StructType type = (StructType) anonStruct.getDeclSpec().getType();
        List<Declaration> members = type.getMembers();
        Assertions.assertEquals("goated", anonStruct.getName());
        Assertions.assertNull(type.getName());
        numberDeclarationTest(members.get(0), "name", IntegerType.class, Character.BYTES, true,
                DeclarationSpecifier.StorageClass.NONE, DeclarationSpecifier.TypeQualifier.NONE);
        numberDeclarationTest(members.get(1), "game", IntegerType.class, Integer.BYTES, true,
                DeclarationSpecifier.StorageClass.NONE, DeclarationSpecifier.TypeQualifier.NONE);

        Declaration truck = declarations.get(1);
        type = (StructType) truck.getDeclSpec().getType();
        members = type.getMembers();
        Assertions.assertNull(truck.getName());
        Assertions.assertEquals("truck", type.getName());

        Declaration arr = members.get(0);
        Assertions.assertEquals("arr", arr.getName());
        ArrayType arrType = (ArrayType) arr.getDeclSpec().getType();
        Assertions.assertInstanceOf(IntegerType.class, arrType.getBase());
        Assertions.assertFalse(((NumberType) arrType.getBase()).isSigned());

        Declaration malloc = members.get(1);
        Assertions.assertEquals("malloc", malloc.getName());
        PointerType ptr = (PointerType) malloc.getDeclSpec().getType();
        FunctionType mallocType = (FunctionType) ptr.getBase();
        Assertions.assertInstanceOf(PointerType.class, mallocType.getReturnType());
        Type retType = ((PointerType) mallocType.getReturnType()).getBase();
        Assertions.assertInstanceOf(VoidType.class, retType);

        numberDeclarationTest(mallocType.getInputTypes().get(0), "size", IntegerType.class, Integer.BYTES,
                true, DeclarationSpecifier.StorageClass.NONE, DeclarationSpecifier.TypeQualifier.NONE);

        Declaration compare = members.get(2);
        Assertions.assertEquals("compare", compare.getName());
        PointerType compPtr = (PointerType) compare.getDeclSpec().getType();
        FunctionType compType = (FunctionType) compPtr.getBase();
        Assertions.assertInstanceOf(IntegerType.class, compType.getReturnType());

        Type derefA = ((PointerType) compType.getInputTypes().get(0).getDeclSpec().getType()).getBase();
        Type derefB = ((PointerType) compType.getInputTypes().get(1).getDeclSpec().getType()).getBase();
        Assertions.assertEquals("a", compType.getInputTypes().get(0).getName());
        Assertions.assertEquals("b", compType.getInputTypes().get(1).getName());
        Assertions.assertInstanceOf(IntegerType.class, derefA);
        Assertions.assertInstanceOf(IntegerType.class, derefB);

        Declaration union = declarations.get(2);
        UnionType uType = (UnionType) union.getDeclSpec().getType();
        members = uType.getMembers();
        Assertions.assertNull(union.getName());
        Assertions.assertEquals("constitution", uType.getName());

        Declaration innerStruct = members.get(0);
        Assertions.assertInstanceOf(StructType.class, innerStruct.getDeclSpec().getType());
        StructType innerType = (StructType) innerStruct.getDeclSpec().getType();
        Assertions.assertNull(innerStruct.getName());
        Assertions.assertNull(innerType.getName());

        numberDeclarationTest(innerType.getMembers().get(0), "man", IntegerType.class, Long.BYTES,
                true, DeclarationSpecifier.StorageClass.NONE, DeclarationSpecifier.TypeQualifier.NONE);

        Type member2Type = innerType.getMembers().get(1).getDeclSpec().getType();
        Assertions.assertInstanceOf(PointerType.class, member2Type);
        Assertions.assertInstanceOf(IntegerType.class, ((PointerType)member2Type).getBase());

        Declaration fooba = members.get(1);

        Type foobaType = fooba.getDeclSpec().getType();
        Assertions.assertInstanceOf(PointerType.class, foobaType);
        Assertions.assertInstanceOf(PointerType.class, ((PointerType)foobaType).getBase());
        Assertions.assertInstanceOf(IntegerType.class, ((PointerType) ((PointerType)foobaType).getBase()).getBase());
    }

    @Test
    @DisplayName("Array and Pointer Declarations")
    void compoundDeclarations() {
        String[] testPath = {testDir + "compoundDeclarations.c"};
        Program program = Main.parseProgram(testPath);
        List<Declaration> declarations = toDeclarationList(program.getDeclarations());

        int i = 0;
        String[] names = {"hey", "frey", "bingo"};
        for (; i < 3; i++) {
            numberDeclarationTest(declarations.get(i), names[i], IntegerType.class, Long.BYTES, true,
                    DeclarationSpecifier.StorageClass.NONE, DeclarationSpecifier.TypeQualifier.NONE);
        }


        String[] ptrNames = {"car", "bar", "afar", "far", "away"};
        for (; i < 8; i++) {
            Type type = declarations.get(i).getDeclSpec().getType();
            for (int j = 0; j < i - 2; j++) {
                Assertions.assertInstanceOf(PointerType.class, type);
                type = ((PointerType) type).getBase();
            }
            Assertions.assertEquals(ptrNames[i-3], declarations.get(i).getName());
            Assertions.assertInstanceOf(IntegerType.class, type);
        }

    }


    List<Declaration> toDeclarationList(List<ExternalDeclaration> externalDeclarations) {
        List<Declaration> declarations = new ArrayList<>();
        for (ExternalDeclaration decl : externalDeclarations) {
            Assertions.assertInstanceOf(Declaration.class, decl);
            declarations.add((Declaration) decl);
        }
        return declarations;
    }

    void numberDeclarationTest(Declaration item, String name, Class<?> expectedType, int bytes, boolean sign,
                               DeclarationSpecifier.StorageClass storage, DeclarationSpecifier.TypeQualifier qualifier) {
        Assertions.assertEquals(name, item.getName());
        Assertions.assertInstanceOf(expectedType, item.getDeclSpec().getType());
        NumberType type = (NumberType) item.getDeclSpec().getType();
        Assertions.assertEquals(bytes*8, type.getBits());
        Assertions.assertEquals(sign, type.isSigned());
        Assertions.assertEquals(storage, item.getDeclSpec().getStorage());
        Assertions.assertEquals(qualifier, item.getDeclSpec().getQualifier());
    }


}
