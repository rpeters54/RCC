package main;


import ast.Program;
import ast.declarations.Declaration;
import ast.declarations.ExternalDeclaration;
import ast.declarations.FunctionDefinition;
import ast.types.*;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.Assertions;

import java.io.File;
import java.nio.file.DirectoryStream;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;


public class ParseTest {

    private static final String testDir = "/Users/rileypeters/ANSIParser/src/main/tests/parseTests/";

    @Test
    @DisplayName("Test Fails")
    void testFails() {
        String directoryPath = testDir+"badFiles/";
        File directory = new File(directoryPath);
        for (File file : Objects.requireNonNull(directory.listFiles())) {
            if (file.getName().endsWith(".c")) {
                Assertions.assertThrows(Exception.class, () -> {
                    Main.parseProgram(new String[]{directoryPath+file.getName()});
                });
            }
        }
    }

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
        StructType type = (StructType) anonStruct.declSpec().getType();
        List<Declaration> members = type.members();
        Assertions.assertEquals("goated", anonStruct.name());
        integerDeclarationTest(members.get(0), "name", IntegerType.Width.CHAR, true,
                Type.StorageClass.NONE, Type.TypeQualifier.NONE);
        integerDeclarationTest(members.get(1), "game", IntegerType.Width.INT, true,
                Type.StorageClass.NONE, Type.TypeQualifier.NONE);

        Declaration truck = declarations.get(1);
        type = (StructType) truck.declSpec().getType();
        members = type.members();
        Assertions.assertEquals("truck", type.name());

        Declaration arr = members.getFirst();
        Assertions.assertEquals("arr", arr.name());
        ArrayType arrType = (ArrayType) arr.declSpec().getType();
        Assertions.assertInstanceOf(IntegerType.class, arrType.base());
        Assertions.assertFalse(((IntegerType) arrType.base()).signed());

        Declaration malloc = members.get(1);
        Assertions.assertEquals("malloc", malloc.name());
        PointerType ptr = (PointerType) malloc.declSpec().getType();
        FunctionType mallocType = (FunctionType) ptr.base();
        Assertions.assertInstanceOf(PointerType.class, mallocType.returnType());
        Type retType = ((PointerType) mallocType.returnType()).base();
        Assertions.assertInstanceOf(VoidType.class, retType);

        integerDeclarationTest(mallocType.inputTypes().getFirst(), "size", IntegerType.Width.INT,
                true, Type.StorageClass.NONE, Type.TypeQualifier.NONE);

        Declaration compare = members.get(2);
        Assertions.assertEquals("compare", compare.name());
        PointerType compPtr = (PointerType) compare.declSpec().getType();
        FunctionType compType = (FunctionType) compPtr.base();
        Assertions.assertInstanceOf(IntegerType.class, compType.returnType());

        Type derefA = ((PointerType) compType.inputTypes().get(0).declSpec().getType()).base();
        Type derefB = ((PointerType) compType.inputTypes().get(1).declSpec().getType()).base();
        Assertions.assertEquals("a", compType.inputTypes().get(0).name());
        Assertions.assertEquals("b", compType.inputTypes().get(1).name());
        Assertions.assertInstanceOf(IntegerType.class, derefA);
        Assertions.assertInstanceOf(IntegerType.class, derefB);

        Declaration union = declarations.get(2);
        UnionType uType = (UnionType) union.declSpec().getType();
        members = uType.members();
        Assertions.assertEquals("constitution", uType.name());

        Declaration innerStruct = members.get(0);
        Assertions.assertInstanceOf(StructType.class, innerStruct.declSpec().getType());
        StructType innerType = (StructType) innerStruct.declSpec().getType();

        integerDeclarationTest(innerType.members().get(0), "man", IntegerType.Width.LONG,
                true, Type.StorageClass.NONE, Type.TypeQualifier.NONE);

        Type member2Type = innerType.members().get(1).declSpec().getType();
        Assertions.assertInstanceOf(PointerType.class, member2Type);
        Assertions.assertInstanceOf(IntegerType.class, ((PointerType)member2Type).base());

        Declaration fooba = members.get(1);

        Type foobaType = fooba.declSpec().getType();
        Assertions.assertInstanceOf(PointerType.class, foobaType);
        Assertions.assertInstanceOf(PointerType.class, ((PointerType)foobaType).base());
        Assertions.assertInstanceOf(IntegerType.class, ((PointerType) ((PointerType)foobaType).base()).base());
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
            Type type = declarations.get(i).declSpec().getType();
            for (int j = 0; j < i - 2; j++) {
                Assertions.assertInstanceOf(PointerType.class, type);
                type = ((PointerType) type).base();
            }
            Assertions.assertEquals(ptrNames[i-3], declarations.get(i).name());
            Assertions.assertInstanceOf(IntegerType.class, type);
        }
    }


    @Test
    @DisplayName("Function Definitions")
    void functionDefinitions() {
        String[] testPath = {testDir + "functionDefinitions.c"};
        Program program = Main.parseProgram(testPath);
        List<FunctionDefinition> defs = program.getDeclarations().stream()
                .filter(item -> item instanceof FunctionDefinition)
                .map(item -> (FunctionDefinition) item)
                .toList();

        for (FunctionDefinition def : defs) {
            System.out.println(def);
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
        Assertions.assertEquals(name, item.name());
        switch (item.declSpec().getType()) {
            case IntegerType it -> {
                Assertions.assertEquals(size, it.size());
                Assertions.assertEquals(sign, it.signed());
            }
            case null, default -> Assertions.fail();
        }
        Assertions.assertEquals(storage, item.declSpec().getStorage());
        Assertions.assertEquals(qualifier, item.declSpec().getQualifier());
    }

    void floatingDeclarationTest(Declaration item, String name, FloatingType.Width size,
                                 Type.StorageClass storage, Type.TypeQualifier qualifier) {
        Assertions.assertEquals(name, item.name());
        switch (item.declSpec().getType()) {
            case FloatingType it -> {
                Assertions.assertEquals(size, it.size());
            }
            case null, default -> Assertions.fail();
        }
        Assertions.assertEquals(storage, item.declSpec().getStorage());
        Assertions.assertEquals(qualifier, item.declSpec().getQualifier());
    }

}
