package parser;

import ast.declarations.*;
import ast.Program;
import ast.expr.Expression;
import ast.statements.Statement;
import ast.types.*;
import ast.types.Enumeration;
import ast.types.keyword.*;
import org.antlr.v4.runtime.tree.TerminalNode;


import java.util.*;
import java.util.concurrent.atomic.AtomicBoolean;


public class ASTVisitor extends CBaseVisitor<Object> {

    private final ASTExpressionVisitor expVisitor;
    private final ASTStatementVisitor stmtVisitor;

    private int anon_struct_counter = 0;
    private int anon_union_counter = 0;

    protected final Set<String> typeNames = new HashSet<>();
    protected final Set<String> structNames = new HashSet<>();
    protected final Set<String> unionNames = new HashSet<>();

    public ASTVisitor() {
        expVisitor = new ASTExpressionVisitor(this);
        stmtVisitor = new ASTStatementVisitor(this, expVisitor);
    }

    private String anonStructName() {
        return String.format("anon.%s", anon_struct_counter++);
    }

    private String anonUnionName() {
        return String.format("anon.%s", anon_union_counter++);
    }


    /*
     ====================================================================================================

     ======================
     | Top-Level Visitors |
     ======================

     ====================================================================================================
     */


    /**
     * Visit a program parse tree and return its definitions
     * @param ctx Antlr context for top level program
     * @return List[Declaration] corresponding to all declarations in the program
     */
    @Override
    public Object visitTranslationUnit(CParser.TranslationUnitContext ctx) {
        Program prog = new Program();
        for (CParser.ExternalDeclarationContext edctx : ctx.externalDeclaration()) {
            Object obj = visit(edctx);
            if (obj instanceof ExternalDeclaration) {
                prog.addDeclaration((ExternalDeclaration) obj);
            } else if (obj instanceof List<?> && !((List<?>) obj).isEmpty()) {
                if (((List<?>) obj).getFirst() instanceof ExternalDeclaration) {
                    prog.getDeclarations().addAll((List<ExternalDeclaration>) obj);
                }
            } else {
                throw new RuntimeException("visitTranslationUnit: Encountered an Improperly Formatted External Declaration");
            }
        }
        return prog;
    }

    /**
     * Return the result of parsing either a function definition, declaration, or type declaration
     * @param ctx Antlr context for an external declaration
     * @return Union[ExternalDeclaration, List[ExternalDeclaration]]
     */
    @Override
    public Object visitExternalDeclaration(CParser.ExternalDeclarationContext ctx) {
        if (ctx.declaration() != null) {
            return visit(ctx.declaration());
        }
        if (ctx.functionDefinition() !=  null) {
            return visit(ctx.functionDefinition());
        }
        if (ctx.typeDeclaration() !=  null) {
            return visit(ctx.typeDeclaration());
        }
        throw new IllegalArgumentException("Illegal ExternalDeclaration");
    }

    /**
     * Return the result of parsing a function definition
     * @param ctx Antlr context for a function definition
     * @return FunctionDefinition Object that defines the parsed function
     */
    @Override
    public Object visitFunctionDefinition(CParser.FunctionDefinitionContext ctx) {

        // parse the return type
        // C considers functions to return int if nothing is specified
        DeclarationSpecifier retType;

        if (ctx.declarationSpecifier() != null) {
            retType = parseDeclSpecCtxList(ctx.declarationSpecifier());
        } else {
            retType = new DeclarationSpecifier();
            retType.setType(new IntegerType());
        }

        Object obj = visit(ctx.name);
        if (!(obj instanceof Declaration functionDeclaration)) {
            throw new RuntimeException("visitFunctionDefinition: visit(ctx.name) should return List<Declaration>");
        }

        //update functionDeclaration to contain the DeclarationSpecifier found while parsing retType
        updateDeclaration(functionDeclaration, retType);

        // parse old-style list of parameter declarations
        // (probably never going to be used, but it's a case I have to handle)
        if (ctx.declaration() != null && !ctx.declaration().isEmpty()) {
            List<Declaration> oldStyleArgList = new ArrayList<>();
            for (CParser.DeclarationContext dctx : ctx.declaration()) {
                obj = visit(dctx);
                if (!(obj instanceof List<?> && !((List<?>) obj).isEmpty() && ((List<?>) obj).getFirst() instanceof Declaration)) {
                    throw new RuntimeException("visitFunctionDefinition: visit(ctx.name) should return List<Declaration>");
                }
                oldStyleArgList.addAll((List<Declaration>)obj);
            }

            // for oldstyle declarations, the parameters are untyped names
            // I have to get a bit hacky to fix this since my code parses those names as defined types
            // this is why I'm doing some nonsense with defined types below
            FunctionType type = (FunctionType) functionDeclaration.declSpec().getType();
            List<Declaration> untypedParams = type.inputTypes();
            List<String> untypedNames = new ArrayList<>();
            for (Declaration decl : untypedParams) {
                if (!(decl.declSpec().getType() instanceof DefinedType)) {
                    throw new RuntimeException("visitFunctionDefinition: failed to parse names from parameter list");
                }
                untypedNames.add(((DefinedType)decl.declSpec().getType()).getName());
            }
            if (untypedParams.size() != oldStyleArgList.size()) {
                throw new RuntimeException("visitFunctionDefinition: different number of oldstyle args and parameters");
            }
            // update params to have same types as oldstyle args
            for (int i = 0; i < untypedNames.size(); i++) {
                String untypedName = untypedNames.get(i);
                Declaration modifier = oldStyleArgList.get(i);
                if (!untypedName.equals(modifier.name())) {
                    throw new RuntimeException("visitFunctionDefintion: parameter and corresponding " +
                            "oldstyle declration have mismatched names");
                }
                untypedParams.get(i).setName(untypedName);
                untypedParams.get(i).setDeclSpec(modifier.declSpec());
            }
        }

        Statement body = stmtVisitor.visit(ctx.body);
        return new FunctionDefinition(functionDeclaration, body);
    }

    @Override
    public Object visitDeclStatement(CParser.DeclStatementContext ctx) {
        if (ctx.declaration() != null) {
            return visit(ctx.declaration());
        }
        if (ctx.statement() != null) {
            return stmtVisitor.visit(ctx.statement());
        }
        throw new RuntimeException("visitDeclStatement: Encountered an Improperly Formatted Decl Statement");
    }


    /**
     * Return the result of parsing a declaration
     * Note: since one declaration can declare >1 variable, this function returns a
     * list of Declarations with each variable declared
     * @param ctx Antlr context for a declaration
     * @return List[Declaration] Object that defines all objects declared
     */
    @Override
    public Object visitDeclaration(CParser.DeclarationContext ctx) {
        // get the declaration specifier which contains
        // - base type
        // - storage class
        // - modifiers const / volatile
        DeclarationSpecifier specifier = parseDeclSpecCtxList(ctx.declarationSpecifier());

        // parse each individual declaration (since one declaration can have many items)
        List<Declaration> declList = new ArrayList<>();
        // if the declaration is anonymous, add it without a name
        if (ctx.initDeclaratorList() == null) {
            Declaration anonDecl = new Declaration();
            updateDeclaration(anonDecl, specifier);
            declList.add(anonDecl);
            return declList;
        }
        for (CParser.InitDeclaratorContext idctx : ctx.initDeclaratorList().initDeclarator()) {
            // visiting an init declarator should return a declaration
            // if it doesn't throw an error
            Object obj = visit(idctx);
            if (!(obj instanceof Declaration decl)) {
                throw new RuntimeException("Init Declarator visit should return declaration");
            }

            // with the declaration parsed, merge the top declaration specifier and the declaration
            updateDeclaration(decl, specifier);

            declList.add(decl);
        }

        // return list of parsed declarations
        return declList;
    }


    /**
     * Return the result of parsing a type declaration
     * Note: traditionally, C has type declarations be a subset of
     * normal declarations. I explicitly made type declarations their own language feature
     * to make the parsing much easier. This may lead to some unintended effects.
     * I'll leave discovering those cases as an exercise for the reader.
     * @param ctx Antlr context for a type declaration
     * @return TypeDeclaration Object that represents the mapping from a name to a type
     */
    @Override
    public Object visitTypeDeclaration(CParser.TypeDeclarationContext ctx) {
        DeclarationSpecifier specifier = new DeclarationSpecifier();
        for (CParser.SpecifierQualifierContext sqctx : ctx.specifierQualifier()) {
            Object obj = visit(sqctx);
            if (obj instanceof Type) {
                specifier.setType((Type) obj);
            } else if (obj instanceof Type.TypeQualifier) {
                specifier.updateQualifier((Type.TypeQualifier)obj);
            } else {
                throw new RuntimeException("visitTypeDeclaration: unresolved specifier qualifier");
            }
        }
        // Add type to the global context, (used to disambiguate statements and declarations in compound statement)
        typeNames.add(ctx.Identifier().getText());
        return new TypeDeclaration(ctx.Identifier().getText(), specifier);
    }


    /**
     * Parses the context associated with typecasts (ex. int x = (int) 9.5)
     * @param ctx Antlr context for a type name
     * @return DeclarationSpecifier that defines the type and type modifiers
     */
    @Override
    public Object visitTypeName(CParser.TypeNameContext ctx) {
        DeclarationSpecifier specifier = new DeclarationSpecifier();
        List<Type> typeList = new ArrayList<>();
        for (CParser.SpecifierQualifierContext sqctx : ctx.specifierQualifier()) {
            Object obj = visit(sqctx);
            if (obj instanceof Type) {
                typeList.add((Type) obj);
            } else if (obj instanceof Type.TypeQualifier) {
                specifier.updateQualifier((Type.TypeQualifier) obj);
            } else {
                throw new RuntimeException("visitTypeName: Encountered Malformed SpecifierQualifier");
            }
        }
        specifier.setType(buildBaseType(typeList));

        if (ctx.abstractDeclarator() != null) {
            Object obj = visit(ctx.abstractDeclarator());
            if (!(obj instanceof Declaration))
                throw new RuntimeException("visitTypeName: Encountered Malformed AbstractDeclarator");
            Type finalType = updateType(((Declaration) obj).declSpec().getType(), specifier.getType());
            specifier.setType(finalType);
            specifier.updateQualifier(((Declaration) obj).declSpec().getQualifier());
            specifier.updateStorage(((Declaration) obj).declSpec().getStorage());
        }
        return specifier;
    }

    /*
     ====================================================================================================

     ==========================
     | Declaration Specifiers |
     ==========================

     ====================================================================================================
     */

    /**
     * Visits declarations specifier parse tree object
     * @param ctx Antlr context for a fields of a Declaration Specifier
     * @return Union[StorageClassEnum, TypeQualifierEnum, Type]
     */
    @Override
    public Object visitDeclarationSpecifier(CParser.DeclarationSpecifierContext ctx) {
        if (ctx.storageClassSpecifier() != null) {
            return visit(ctx.storageClassSpecifier());
        }

        if (ctx.typeSpecifier() != null) {
            return visit(ctx.typeSpecifier());
        }

        if (ctx.typeQualifier() != null) {
            return visit(ctx.typeQualifier());
        }

        throw new IllegalArgumentException("Nonexistent Declaration Specifier");
    }


    /**
     * Parses a storage class specifier which declares how a variable should be handled in memory
     * @param ctx Antlr context for a Storage Class Specifier
     * @return StorageClassEnum representing the storage class specifier
     */
    @Override
    public Object visitStorageClassSpecifier(CParser.StorageClassSpecifierContext ctx) {
        switch (ctx.getText()) {
            case "auto" -> {return Type.StorageClass.AUTO;}
            case "register" -> {return Type.StorageClass.REGISTER;}
            case "static" -> {return Type.StorageClass.STATIC;}
            case "extern" -> {return Type.StorageClass.EXTERN;}
            default -> throw new IllegalArgumentException("Nonexistent Storage Class Specifier");
        }
    }

    @Override
    public Object visitTypeSpecifier(CParser.TypeSpecifierContext ctx) {
        if (ctx.structOrUnionSpecifier() != null) {
            return visit(ctx.structOrUnionSpecifier());
        }
        if (ctx.enumSpecifier() != null) {
            return visit(ctx.enumSpecifier());
        }
        switch (ctx.getText()) {
            case "void" -> {return new VoidType();}
            case "char" -> {return new CharType();}
            case "short" -> {return new ShortType();}
            case "int" -> {return new IntType();}
            case "long" -> {return new LongType();}
            case "float" -> {return new FloatType();}
            case "double" -> {return new DoubleType();}
            case "signed" -> {return new SignedType();}
            case "unsigned" -> {return new UnsignedType();}
            default -> {return new DefinedType(ctx.getText());}
        }
    }

    @Override
    public Object visitTypeQualifier(CParser.TypeQualifierContext ctx) {
        switch (ctx.getText()) {
            case "const" -> {return Type.TypeQualifier.CONST;}
            case "volatile" -> {return Type.TypeQualifier.VOLATILE;}
            default -> throw new IllegalArgumentException("Nonexistent Type Qualifier");
        }
    }

    @Override
    public Object visitStructOrUnionSpecifier(CParser.StructOrUnionSpecifierContext ctx) {
        String structOrUnion = ctx.structOrUnion().getText();

        List<Declaration> members = new ArrayList<>();
        if (ctx.structDeclarationList() != null) {
            for (CParser.StructDeclarationContext sdctx : ctx.structDeclarationList().structDeclaration()) {
                Object obj = visit(sdctx);
                if (!(obj instanceof List)) {
                    throw new RuntimeException("visitStructOrUnionSpecifier: tried to visit member, didn't get declaration list");
                }
                if (!(!((List<?>) obj).isEmpty() && ((List<?>) obj).getFirst() instanceof Declaration)) {
                    throw new RuntimeException("visitStructOrUnionSpecifier: tried to visit member, didn't get declaration list");
                }

                members.addAll((List<Declaration>) obj);
            }
        }

        switch (structOrUnion) {
            case "struct" -> {
                String name = ctx.Identifier() != null ? ctx.Identifier().getText() : anonStructName();
                return new StructType(name, members);
            }
            case "union" -> {
                String name = ctx.Identifier() != null ? ctx.Identifier().getText() : anonUnionName();
                return new UnionType(name, members);
            }
            default -> throw new RuntimeException("visitStructOrUnionSpecifier: visited structOrUnion but failed to" +
                    "get a struct or union");
        }
    }

    @Override
    public Object visitEnumSpecifier(CParser.EnumSpecifierContext ctx) {
        List<Enumeration> enums = new ArrayList<>();
        for (CParser.EnumeratorContext ectx : ctx.enumeratorList().enumerator()) {
            enums.add((Enumeration) visit(ectx));
        }
        Declaration enumDeclaration = new Declaration();
        enumDeclaration.setName(ctx.Identifier().getText());
        enumDeclaration.declSpec().setType(new EnumType(ctx.Identifier().getText(),enums));
        return enumDeclaration;
    }


    @Override
    public Object visitSpecifierQualifierList(CParser.SpecifierQualifierListContext ctx) {
        List<DeclarationSpecifier> specifierList = new ArrayList<>();
        if (ctx.specifierQualifierList() != null) {
            Object obj = visit(ctx.specifierQualifierList());
            if (!(obj instanceof List)) {
                throw new RuntimeException("visitSpecifierQualifierList: Expected Declaration Specifier List");
            }
            if (!((List<?>) obj).isEmpty()) {
                if (!(((List<?>) obj).getFirst() instanceof DeclarationSpecifier)) {
                    throw new RuntimeException("visitSpecifierQualifierList: Expected Declaration Specifier List");
                }
            }
            specifierList.addAll((List<DeclarationSpecifier>) obj);
        }

        DeclarationSpecifier specifier = new DeclarationSpecifier();
        if (ctx.typeSpecifier() != null) {
            Object obj = visit(ctx.typeSpecifier());
            if (!(obj instanceof Type)) {
                throw new RuntimeException("visitSpecifierQualifierList: Expected Type");
            }
            specifier.setType((Type) obj);
        }
        if (ctx.typeQualifier() != null) {
            Object obj = visit(ctx.typeQualifier());
            if (!(obj instanceof Type.TypeQualifier)) {
                throw new RuntimeException("visitSpecifierQualifierList: Expected Type Qualifier");
            }
            specifier.updateQualifier((Type.TypeQualifier) obj);
        }
        specifierList.add(specifier);
        return specifierList;
    }


    /*
     ====================================================================================================

     =====================
     | Specifier Helpers |
     =====================

     ====================================================================================================
     */

    @Override
    public Object visitStructDeclaration(CParser.StructDeclarationContext ctx) {
        Object obj = visit(ctx.specifierQualifierList());
        if (!(obj instanceof List)) {
            throw new RuntimeException("visitSpecifierQualifierList: Expected Declaration Specifier List");
        }
        if (!((List<?>) obj).isEmpty()) {
            if (!(((List<?>) obj).getFirst() instanceof DeclarationSpecifier)) {
                throw new RuntimeException("visitSpecifierQualifierList: Expected Declaration Specifier List");
            }
        }
        List<DeclarationSpecifier> specifierList = (List<DeclarationSpecifier>) obj;
        DeclarationSpecifier specifier = parseDeclSpecList(specifierList);

        List<Declaration> declarationList = new ArrayList<>();
        if (ctx.structDeclaratorList() == null) {
            Declaration anonDecl = new Declaration();
            updateDeclaration(anonDecl, specifier);
            declarationList.add(anonDecl);
            return declarationList;
        }
        for (CParser.StructDeclaratorContext dectx : ctx.structDeclaratorList().structDeclarator()) {
            obj = visit(dectx.declarator());
            if (!(obj instanceof Declaration decl)) {
                throw new RuntimeException("visitStructDeclation: didn't get Declaration");
            }
            updateDeclaration(decl, specifier);
            declarationList.add(decl);
        }
        return declarationList;
    }

    @Override
    public Object visitInitDeclarator(CParser.InitDeclaratorContext ctx) {
        Object obj = visit(ctx.declarator());
        if (!(obj instanceof Declaration decl)) {
            throw new IllegalArgumentException("Invalid return from declarator visit");
        }
        if (ctx.initializer() != null) {
            obj = visit(ctx.initializer());
            if (!(obj instanceof List)) {
                throw new IllegalArgumentException("Invalid return from initializer visit");
            }
            decl.setInitialValue((List<Expression>) obj);
        }
        return decl;
    }

    @Override
    public Object visitInitializer(CParser.InitializerContext ctx) {
        List<Expression> initList = new ArrayList<>();
        if (ctx.expression() != null) {
            initList.add(expVisitor.visit(ctx.expression()));
        }
        if (ctx.initializerList() != null) {
            for (CParser.InitializerContext ictx : ctx.initializerList().initializer()) {
                initList.addAll((List<Expression>) visit(ictx));
            }
        }
        return initList;
    }

    @Override
    public Object visitEnumerator(CParser.EnumeratorContext ctx) {
        List<Expression> exp = null;
        if (ctx.constantExpressionList() != null)
            exp = expVisitor.parseExpressionList(ctx.constantExpressionList().expressionList());
        return new Enumeration(ctx.Identifier().getText(), exp);
    }

    /*
     ====================================================================================================

     ==============
     | Declarator |
     ==============

     ====================================================================================================
     */


    @Override
    public Object visitDeclarator(CParser.DeclaratorContext ctx) {
        Object obj = visit(ctx.directDeclarator());
        if (!(obj instanceof Declaration decl))
            throw new RuntimeException("Non-Declarator Found in visitDirectDeclarator");
        if (ctx.pointer() != null) {
            obj = visit(ctx.pointer());
            if (!(obj instanceof DeclarationSpecifier pointerSpecifier))
                throw new RuntimeException("Non-DeclarationSpecifier Found in visitDeclarator");
            decl = addPointerToDeclarator(pointerSpecifier, decl);
        }
        return decl;
    }

    @Override
    public Object visitPointer(CParser.PointerContext ctx) {
        DeclarationSpecifier dt = new DeclarationSpecifier();
        if (ctx.pointer() != null) {
            Object obj = visit(ctx.pointer());
            if (!(obj instanceof DeclarationSpecifier)) {
                throw new IllegalArgumentException("invalid visit pointer return type");
            }
            dt = (DeclarationSpecifier) obj;
        }
        for (CParser.TypeQualifierContext tqctx : ctx.typeQualifier()) {
            Object obj = visit(tqctx);
            if (obj instanceof Type.TypeQualifier) {
                dt.updateQualifier((Type.TypeQualifier) obj);
            } else {
                throw new IllegalArgumentException("Bad type qualifier in pointer");
            }
        }
        dt.setType(new PointerType(dt.getType()));
        return dt;
    }


    @Override
    public Object visitVariableDeclarator(CParser.VariableDeclaratorContext ctx) {
        return new Declaration(ctx.getText());
    }

    @Override
    public Object visitNestedDeclarator(CParser.NestedDeclaratorContext ctx) {
        return visit(ctx.declarator());
    }

    @Override
    public Object visitArrayDeclarator(CParser.ArrayDeclaratorContext ctx) {
        Object obj = visit(ctx.directDeclarator());
        // get nested declarator
        Declaration decl = (Declaration) obj;

        // add array type to declarator
        ArrayType arr = new ArrayType();
        if (ctx.constantExpressionList() != null) {
            arr.deriveSize(expVisitor.parseExpressionList(ctx.constantExpressionList().expressionList()));
        }

        DeclarationSpecifier arraySpecifier = new DeclarationSpecifier();
        arraySpecifier.setType(arr);
        updateDeclaration(decl, arraySpecifier);

        return decl;
    }

    @Override
    public Object visitFunctionDeclarator(CParser.FunctionDeclaratorContext ctx) {
        Object obj = visit(ctx.directDeclarator());
        // get nested declarator
        Declaration decl = (Declaration) obj;

        // build new function type
        FunctionType func = new FunctionType();
        if (ctx.parameterTypeList() != null) {
            obj = visit(ctx.parameterTypeList());
            if (!(obj instanceof FunctionType))
                throw new IllegalArgumentException("ParameterTypeList should return FunctionType");
            func = (FunctionType) obj;
        }

        DeclarationSpecifier functionSpecifier = new DeclarationSpecifier();
        functionSpecifier.setType(func);
        updateDeclaration(decl, functionSpecifier);

        return decl;
    }

    @Override
    public Object visitOldFunctionDeclarator(CParser.OldFunctionDeclaratorContext ctx) {
        Object obj = visit(ctx.directDeclarator());
        // get nested declarator
        if (!(obj instanceof Declaration decl))
            throw new RuntimeException("visitOldFunctionDeclarator: visit declarator should return a Declaration");

        // build new function type
        FunctionType func = new FunctionType();
        List<Declaration> params = new ArrayList<>();
        if (ctx.identifierList() != null) {
            for (TerminalNode id : ctx.identifierList().Identifier()) {
                Declaration param = new Declaration();
                param.setName(id.getText());
                params.add(param);
            }
        }

        DeclarationSpecifier functionSpecifier = new DeclarationSpecifier();
        functionSpecifier.setType(func);
        updateDeclaration(decl, functionSpecifier);

        return decl;
    }

    /*
     ====================================================================================================

     =======================
     | Abstract Declarator |
     =======================

     ====================================================================================================
     */


    @Override
    public Object visitAbsPointer(CParser.AbsPointerContext ctx) {
        Declaration absPointerDecl = new Declaration(null);
        absPointerDecl.setDeclSpec((DeclarationSpecifier) visit(ctx.pointer()));
        return absPointerDecl;
    }

    @Override
    public Object visitAbsDeclarator(CParser.AbsDeclaratorContext ctx) {
        Object obj = visit(ctx.directAbstractDeclarator());
        if (!(obj instanceof Declaration)) {
            throw new RuntimeException("Non-Declarator Found in visitAbstractDeclarator");
        }
        Declaration decl = (Declaration) obj;
        if (ctx.pointer() != null) {
            obj = visit(ctx.pointer());
            if (!(obj instanceof DeclarationSpecifier pointerSpecifier)) {
                throw new RuntimeException("Non-DeclarationSpecifier Found in visitAbstractDeclarator");
            }
            decl = addPointerToDeclarator(pointerSpecifier, decl);
        }
        return decl;
    }

    @Override
    public Object visitDirectAbstractDeclarator(CParser.DirectAbstractDeclaratorContext ctx) {
        Declaration self = new Declaration();

        Type type = null;
        if (ctx.directAbstractDeclaratorTail() != null) {
            List<Type> typelist = new ArrayList<>();
            List<CParser.DirectAbstractDeclaratorTailContext> dactx = ctx.directAbstractDeclaratorTail();
            for (int i = 0; i < dactx.size(); i++) {
                Object obj = visit(dactx.get(i));
                if (!(obj instanceof Type))
                    throw new RuntimeException("visitDirectAbstractDeclarator: tail not a type");
                if (!(obj instanceof ArrayType) && i < dactx.size()-1)
                    throw new RuntimeException("visitDirectAbstractDeclarator: tail has items following a function");
                typelist.add((Type) obj);
            }
            for (int i = typelist.size()-1; i > 1; i--) {
                Type base = typelist.get(i);
                CompoundType outer = (CompoundType) typelist.get(i-1);
                outer.setBase(base);
            }
            type = typelist.getFirst();
        }

        // if a constant expression list, return an array declaration
        if (ctx.constantExpressionList() != null) {
            List<Expression> expList = expVisitor.parseExpressionList(ctx.constantExpressionList().expressionList());
            ArrayType arr = new ArrayType();
            arr.deriveSize(expList);
            arr.setBase(type);
            self.declSpec().setType(arr);
            return self;
        }

        if (ctx.parameterTypeList() != null) {
            Object obj = visit(ctx.parameterTypeList());
            if (!(obj instanceof FunctionType)) {
                throw new RuntimeException("visitDirectAbstractDeclarator: " +
                        "visitParameterTypeList returned non-FunctionType");
            }
            self.declSpec().setType((FunctionType)obj);
            return self;
        }

        if (ctx.abstractDeclarator() != null) {
            Object obj = visit(ctx.abstractDeclarator());
            if (!(obj instanceof Declaration abstractDecl))
                throw new RuntimeException("visitDirectAbstractDeclarator: " +
                        "visitAbstractDeclarator returned non-Declaration");
            if (type != null) {
                Type absType = abstractDecl.declSpec().getType();
                if (type instanceof CompoundType && absType instanceof CompoundType) {
                    CompoundType base = getNestedBase((CompoundType) absType);
                    base.setBase(type);
                } else if (type instanceof FunctionType) {
                    ((FunctionType) type).setReturnType(absType);
                    abstractDecl.declSpec().setType(type);
                } else {
                    throw new RuntimeException("visitAbstractDeclarator: encountered unexpected tail type");
                }
            }
            return abstractDecl;
        }

        throw new RuntimeException("visitAbstractDeclarator: no parsable element");
    }

    @Override
    public Object visitDirectAbstractDeclaratorTail(CParser.DirectAbstractDeclaratorTailContext ctx) {
        if (ctx.constantExpressionList() != null) {
            List<Expression> expList = expVisitor.parseExpressionList(ctx.constantExpressionList().expressionList());
            ArrayType arr = new ArrayType();
            arr.deriveSize(expList);
            return arr;
        }

        if (ctx.parameterTypeList() != null) {
            Object obj = visit(ctx.parameterTypeList());
            if (!(obj instanceof FunctionType)) {
                throw new RuntimeException("visitDirectAbstractDeclaratorTail: " +
                        "visitParameterTypeList returned non-FunctionType");
            }
            return obj;
        }

        throw new RuntimeException("visitDirectAbstractDeclaratorTail: Found neither an array nor function type");
    }

    /**
     * Used by abstract and regular declarator functions to update the type of the declaration they
     * return to include pointer types.
     * @param pointerSpecifier
     * @param base
     * @return
     */
    public Declaration addPointerToDeclarator(DeclarationSpecifier pointerSpecifier, Declaration base) {
        base.declSpec().updateQualifier(pointerSpecifier.getQualifier());
        base.declSpec().updateStorage(pointerSpecifier.getStorage());
        if (!(pointerSpecifier.getType() instanceof PointerType)) {
            throw new IllegalArgumentException("Pointer Declaration Specifier with Non-Pointer Type");
        }


        Type declarationType = base.declSpec().getType();
        Type pointerType = pointerSpecifier.getType();
        Type newType = updateType(declarationType, pointerType);
        base.declSpec().setType(newType);

        return base;
    }


    @Override
    public Object visitFixedParams(CParser.FixedParamsContext ctx) {
        List<Declaration> declList = new ArrayList<>();
        for (CParser.ParameterDeclarationContext pdctx : ctx.parameterList().parameterDeclaration()) {
            declList.add((Declaration)visit(pdctx));
        }
        return new FunctionType(declList, false);
    }

    @Override
    public Object visitVariadicParams(CParser.VariadicParamsContext ctx) {
        List<Declaration> declList = new ArrayList<>();
        for (CParser.ParameterDeclarationContext pdctx : ctx.parameterList().parameterDeclaration()) {
            declList.add((Declaration)visit(pdctx));
        }
        return new FunctionType(declList, true);
    }

    @Override
    public Object visitStandardParameterDecl(CParser.StandardParameterDeclContext ctx) {
        DeclarationSpecifier declSpec = parseDeclSpecCtxList(ctx.declarationSpecifier());
        Declaration decl = (Declaration) visit(ctx.declarator());
        return updateDeclaration(decl, declSpec);
    }

    @Override
    public Object visitAbstractParameterDecl(CParser.AbstractParameterDeclContext ctx) {
        DeclarationSpecifier declSpec = parseDeclSpecCtxList(ctx.declarationSpecifier());
        Declaration decl = new Declaration();
        if (ctx.abstractDeclarator() != null)
            decl = (Declaration) visit(ctx.abstractDeclarator());
        return updateDeclaration(decl, declSpec);
    }

    /*
    public Declaration combineParameterDecl(Declaration declarator, DeclarationSpecifier specifier) {
        if (!(declarator.getDeclSpec().getType() instanceof CompoundType)) {
            declarator.getDeclSpec().setType(specifier.getType());
        } else {
            CompoundType compType = (CompoundType) declarator.getDeclSpec().getType();
            declarator.getDeclSpec().setType(nestTypes(compType, specifier.getType()));
        }
        declarator.getDeclSpec().updateQualifier(specifier.getQualifier());
        declarator.getDeclSpec().updateStorage(specifier.getStorage());
        return declarator;
    }
*/
    /* Util Functions */


    /**
     * Helper function called by visitDeclaration that updates the declaration to include any
     * visited declaration specifiers
     * @param decl
     * @param specifier
     * @return
     */
    public Declaration updateDeclaration(Declaration decl, DeclarationSpecifier specifier) {
        // if the declaration is a compound type (pointer or array)
        // extract the base type contained in the array/pointer
        Type type = decl.declSpec().getType();
        Type newType = updateType(type, specifier.getType());
        decl.declSpec().setType(newType);
        // update the declaration to have the proper storage class and type qualifiers
        decl.declSpec().updateStorage(specifier.getStorage());
        decl.declSpec().updateQualifier(specifier.getQualifier());

        return decl;
    }

    public Type updateType(Type outer, Type base) {
        switch (outer) {
            case CompoundType compound -> {
                CompoundType inner = getNestedBase(compound);
                Type innerBase = inner.base();
                Type newInnerBase = updateType(innerBase, base);
                inner.setBase(newInnerBase);
                return outer;
            }
            case FunctionType function -> {
                Type returnType = function.returnType();
                Type newReturnType = updateType(returnType, base);
                function.setReturnType(newReturnType);
                return function;
            }
            case null, default -> {
                return base;
            }
        }
    }

    // Gets base type from a nested set of compound types (arrays and pointers)
    public CompoundType getNestedBase(CompoundType outer) {
        while(outer.base() instanceof CompoundType) {
            outer = (CompoundType) outer.base();
        }
        return outer;
    }

    public Type nestTypes(CompoundType outer, Type inner) {
        CompoundType temp = outer;
        while(temp.base() != null) {
            Type inter = temp.base();
            if (!(inter instanceof CompoundType)) {
                throw new RuntimeException("Tried to nest Non-Compound Type");
            }
            temp = (CompoundType) inter;
        }
        temp.setBase(inner);
        return (Type) outer;
    }

    /**
     * Parse a list of declaration specifier objects and combine them to form a single DeclarationSpecifier Object
     * @param specifierList
     * @return
     */
    public DeclarationSpecifier parseDeclSpecList(List<DeclarationSpecifier> specifierList) {
        DeclarationSpecifier declSpec = new DeclarationSpecifier();
        List<Type> typeList = new ArrayList<>();

        for (DeclarationSpecifier specifier : specifierList) {
            declSpec.updateStorage(specifier.getStorage());
            declSpec.updateQualifier(specifier.getQualifier());
            if (specifier.getType() != null) {
                typeList.add(specifier.getType());
            }
        }

        declSpec.setType(buildBaseType(typeList));
        return declSpec;
    }

    /**
     * Parse a list of declaration specifier contexts and combine them to form a single DeclarationSpecifier object
     * @param ctx
     * @return
     */
    public DeclarationSpecifier parseDeclSpecCtxList(List<CParser.DeclarationSpecifierContext> ctx) {
        DeclarationSpecifier declSpec = new DeclarationSpecifier();
        // build list of primitive types
        List<Type> typeList = new ArrayList<>();

        for (CParser.DeclarationSpecifierContext dsctx : ctx) {
            Object obj = visit(dsctx);
            switch (obj) {
                case Type.StorageClass storageClass -> declSpec.updateStorage(storageClass);
                case Type type -> typeList.add(type);
                case Type.TypeQualifier typeQualifier -> declSpec.updateQualifier(typeQualifier);
                case null, default ->
                        throw new IllegalArgumentException("Unrecognized type specifier while parsing declaration");
            }
        }
        declSpec.setType(buildBaseType(typeList));
        return declSpec;
    }



    /**
     * rectify list of type keywords into a single base type
     * ex. [long long int] -> new IntegerType() with long long size
     * @param typeList
     * @return
     */
    public static Type buildBaseType(List<Type> typeList) {
        Optional<Type> sign = Optional.empty();
        Optional<Type.Specifier> primType = Optional.empty();
        AtomicBoolean isSigned = new AtomicBoolean(true);
        int shortCount = 0;
        int longCount = 0;

        switch (typeList.getFirst()) {
            case DefinedType _:
            case StructType _:
            case UnionType _:
            case EnumType _:
            case VoidType _:
                if (typeList.size() > 1) {
                    throw new IllegalArgumentException("Can't specify other types with defined type");
                }
                return typeList.getFirst();
            default:
                break;
        }

        for (Type type : typeList) {
            switch (type) {
                case SignedType _:
                case UnsignedType _:
                    sign.ifPresent((obj) -> { throw new IllegalArgumentException(
                            "Can't have multiple signed/unsigned keywords in a declaration"
                    );});
                    sign = Optional.of(type);
                    break;
                case IntType _:
                    primType.ifPresent((obj) -> { throw new IllegalArgumentException(
                            "Either specified int twice or float, char, or int at same time"
                    );});
                    primType = Optional.of(Type.Specifier.INT);
                    break;
                case DoubleType _:
                    primType.ifPresent((obj) -> { throw new IllegalArgumentException(
                            "Either specified int twice or float, char, or int at same time"
                    );});
                    primType = Optional.of(Type.Specifier.DOUBLE);
                    break;
                case FloatType _:
                    primType.ifPresent((obj) -> { throw new IllegalArgumentException(
                            "Either specified int twice or float, char, or int at same time"
                    );});
                    primType = Optional.of(Type.Specifier.FLOAT);
                    break;
                case CharType _:
                    primType.ifPresent((obj) -> { throw new IllegalArgumentException(
                            "Either specified int twice or float, char, or int at same time"
                    );});
                    primType = Optional.of(Type.Specifier.CHAR);
                    break;
                case ShortType _:
                    shortCount++;
                    break;
                case LongType _:
                    longCount++;
                    break;
                case null, default:
                    throw new RuntimeException("ASTVisitor::buildBaseType: failed to resolve type");
            }
        }

        if (primType.isEmpty()) {
            primType = Optional.of(Type.Specifier.INT);
        }

        // check to make sure that long and short keywords were specified at the same time
        if (longCount > 0 && shortCount > 0) {
            throw new IllegalArgumentException("Can't specify long and short at the same time");
        }

        sign.ifPresentOrElse(
                (obj) -> {
                    switch (obj) {
                        case SignedType _ -> isSigned.set(true);
                        case UnsignedType _ -> isSigned.set(false);
                        case null, default -> throw new RuntimeException("ASTVisitor::buildBaseType: Illegal object inside sign");
                    }
                },
                () -> { isSigned.set(true); }
        );

        if (primType.isEmpty()) {
            throw new IllegalArgumentException("Could Not Resolve Type");
        }

        switch(primType.get()) {
            case CHAR -> {
                if (longCount > 0 || shortCount > 0) {
                    throw new IllegalArgumentException("No long or short specifiers for a char");
                }
                return new IntegerType(IntegerType.Width.CHAR, isSigned.get());
            }
            case FLOAT -> {
                if (longCount > 2 || shortCount > 0) {
                    throw new IllegalArgumentException("Wrong number of long/short specifiers for float");
                }
                if (sign.isPresent()) {
                    throw new IllegalArgumentException("Can't specify float as signed or unsigned");
                }

                FloatingType.Width size;
                if (longCount > 0) {
                    size = FloatingType.Width.DOUBLE;
                } else {
                    size = FloatingType.Width.FLOAT;
                }
                return new FloatingType(size);
            }
            case DOUBLE -> {
                if (longCount > 1 || shortCount > 0) {
                    throw new IllegalArgumentException("Wrong number of long/short specifiers for float");
                }
                if (sign.isPresent()) {
                    throw new IllegalArgumentException("Can't specify double as signed or unsigned");
                }

                return new FloatingType(FloatingType.Width.DOUBLE);
            }
            case null, default -> {
                if (longCount > 2 || shortCount > 1) {
                    throw new IllegalArgumentException("Wrong number of long/short specifiers for int");
                }
                IntegerType.Width size;
                if (longCount > 0) {
                    size = IntegerType.Width.LONG;
                } else if (shortCount > 0) {
                    size = IntegerType.Width.SHORT;
                } else {
                    size = IntegerType.Width.INT;
                }
                return new IntegerType(size, isSigned.get());
            }
        }
    }
}
