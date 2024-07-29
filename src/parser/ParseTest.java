package parser;


import ast.Program;
import ast.declarations.Declaration;
import ast.declarations.ExternalDeclaration;
import ast.types.*;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.Assertions;

import java.util.ArrayList;
import java.util.List;


public class ParseTest {

    private static final String testDir = "/Users/rileypeters/ANSIParser/src/parser/tests/parseTests/";

    @Test
    @DisplayName("Simple Variable Declarations")
    void simpleVariableDeclarations() {
        String[] testPath = {testDir+"simpleVariableDeclarations.c"};
        Program program = Main.parseProgram(testPath);
        List<Declaration> declarations = toDeclarationList(program.getDeclarations());

        integerDeclarationTest(declarations.get(0), "main", IntegerType.Width.INT, true,
                Type.StorageClass.NONE, Type.TypeQualifier.NONE);
        integerDeclarationTest(declarations.get(1), "vroom", IntegerType.Width.CHAR, true,
                Type.StorageClass.NONE, Type.TypeQualifier.NONE);
        integerDeclarationTest(declarations.get(2), "mini", IntegerType.Width.SHORT, true,
                Type.StorageClass.NONE, Type.TypeQualifier.NONE);
        integerDeclarationTest(declarations.get(3), "length", IntegerType.Width.LONG, true,
                Type.StorageClass.NONE, Type.TypeQualifier.NONE);
        floatingDeclarationTest(declarations.get(4), "flying", FloatingType.Width.FLOAT,
                Type.StorageClass.NONE, Type.TypeQualifier.NONE);
        floatingDeclarationTest(declarations.get(5), "two", FloatingType.Width.DOUBLE,
                Type.StorageClass.NONE, Type.TypeQualifier.NONE);
    }


    @Test
    @DisplayName("Variable Declarations with Extra Specifiers")
    void extraSpecifierDeclarations() {
        String[] testPath = {testDir+"extraSpecifierDeclarations.c"};
        Program program = Main.parseProgram(testPath);
        List<Declaration> declarations = toDeclarationList(program.getDeclarations());

        integerDeclarationTest(declarations.get(0), "shortMan", IntegerType.Width.SHORT, true,
                Type.StorageClass.NONE, Type.TypeQualifier.NONE);
        integerDeclarationTest(declarations.get(1), "tallMan", IntegerType.Width.LONG, true,
                Type.StorageClass.NONE, Type.TypeQualifier.NONE);
        integerDeclarationTest(declarations.get(2), "tallInt", IntegerType.Width.LONG, true,
                Type.StorageClass.NONE, Type.TypeQualifier.NONE);
        integerDeclarationTest(declarations.get(3), "man", IntegerType.Width.LONG, true,
                Type.StorageClass.NONE, Type.TypeQualifier.NONE);
        floatingDeclarationTest(declarations.get(4), "superFloat", FloatingType.Width.DOUBLE,
                Type.StorageClass.NONE, Type.TypeQualifier.NONE);
        floatingDeclarationTest(declarations.get(5), "floatie", FloatingType.Width.DOUBLE,
                Type.StorageClass.NONE, Type.TypeQualifier.NONE);
        integerDeclarationTest(declarations.get(6), "signless", IntegerType.Width.INT, false,
                Type.StorageClass.NONE, Type.TypeQualifier.NONE);
    }


    @Test
    @DisplayName("Variable Declarations with Storage Class Specifiers")
    void storageDeclarationTest() {
        String[] testPath = {testDir+"storageDeclarations.c"};
        Program program = Main.parseProgram(testPath);
        List<Declaration> declarations = toDeclarationList(program.getDeclarations());

        integerDeclarationTest(declarations.get(0), "shortMan", IntegerType.Width.SHORT, true,
                Type.StorageClass.AUTO, Type.TypeQualifier.NONE);
        integerDeclarationTest(declarations.get(1), "tallMan", IntegerType.Width.LONG, true,
                Type.StorageClass.STATIC, Type.TypeQualifier.NONE);
        integerDeclarationTest(declarations.get(2), "tallInt", IntegerType.Width.LONG, false,
                Type.StorageClass.EXTERN, Type.TypeQualifier.NONE);
        integerDeclarationTest(declarations.get(3), "regMan", IntegerType.Width.LONG, true,
                Type.StorageClass.REGISTER, Type.TypeQualifier.NONE);
    }


    @Test
    @DisplayName("Variable Declarations with Type Qualifiers")
    void qualifiedDeclarationTest() {
        String[] testPath = {testDir+"qualifiedDeclarations.c"};
        Program program = Main.parseProgram(testPath);
        List<Declaration> declarations = toDeclarationList(program.getDeclarations());

        integerDeclarationTest(declarations.get(0), "shortMan", IntegerType.Width.SHORT, true,
                Type.StorageClass.AUTO, Type.TypeQualifier.VOLATILE);
        integerDeclarationTest(declarations.get(1), "tallMan", IntegerType.Width.LONG, true,
                Type.StorageClass.STATIC, Type.TypeQualifier.CONST);
        integerDeclarationTest(declarations.get(2), "tallInt", IntegerType.Width.LONG, true,
                Type.StorageClass.EXTERN, Type.TypeQualifier.VOLATILE);
        integerDeclarationTest(declarations.get(3), "regMan", IntegerType.Width.LONG, false,
                Type.StorageClass.REGISTER, Type.TypeQualifier.BOTH);
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
        integerDeclarationTest(members.get(0), "name", IntegerType.Width.CHAR, true,
                Type.StorageClass.NONE, Type.TypeQualifier.NONE);
        integerDeclarationTest(members.get(1), "game", IntegerType.Width.INT, true,
                Type.StorageClass.NONE, Type.TypeQualifier.NONE);

        Declaration truck = declarations.get(1);
        type = (StructType) truck.getDeclSpec().getType();
        members = type.getMembers();
        Assertions.assertNull(truck.getName());
        Assertions.assertEquals("truck", type.getName());

        Declaration arr = members.getFirst();
        Assertions.assertEquals("arr", arr.getName());
        ArrayType arrType = (ArrayType) arr.getDeclSpec().getType();
        Assertions.assertInstanceOf(IntegerType.class, arrType.getBase());
        Assertions.assertFalse(((IntegerType) arrType.getBase()).signed());

        Declaration malloc = members.get(1);
        Assertions.assertEquals("malloc", malloc.getName());
        PointerType ptr = (PointerType) malloc.getDeclSpec().getType();
        FunctionType mallocType = (FunctionType) ptr.getBase();
        Assertions.assertInstanceOf(PointerType.class, mallocType.getReturnType());
        Type retType = ((PointerType) mallocType.getReturnType()).getBase();
        Assertions.assertInstanceOf(VoidType.class, retType);

        integerDeclarationTest(mallocType.getInputTypes().getFirst(), "size", IntegerType.Width.INT,
                true, Type.StorageClass.NONE, Type.TypeQualifier.NONE);

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

        integerDeclarationTest(innerType.getMembers().get(0), "man", IntegerType.Width.LONG,
                true, Type.StorageClass.NONE, Type.TypeQualifier.NONE);

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
            integerDeclarationTest(declarations.get(i), names[i], IntegerType.Width.LONG, true,
                    Type.StorageClass.NONE, Type.TypeQualifier.NONE);
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

    void integerDeclarationTest(Declaration item, String name, IntegerType.Width size,
                               boolean sign, Type.StorageClass storage, Type.TypeQualifier qualifier) {
        Assertions.assertEquals(name, item.getName());
        switch (item.getDeclSpec().getType()) {
            case IntegerType it -> {
                Assertions.assertEquals(size, it.size());
                Assertions.assertEquals(sign, it.signed());
            }
            case null, default -> Assertions.fail();
        }
        Assertions.assertEquals(storage, item.getDeclSpec().getStorage());
        Assertions.assertEquals(qualifier, item.getDeclSpec().getQualifier());
    }

    void floatingDeclarationTest(Declaration item, String name, FloatingType.Width size,
                                 Type.StorageClass storage, Type.TypeQualifier qualifier) {
        Assertions.assertEquals(name, item.getName());
        switch (item.getDeclSpec().getType()) {
            case FloatingType it -> {
                Assertions.assertEquals(size, it.size());
            }
            case null, default -> Assertions.fail();
        }
        Assertions.assertEquals(storage, item.getDeclSpec().getStorage());
        Assertions.assertEquals(qualifier, item.getDeclSpec().getQualifier());
    }

}
