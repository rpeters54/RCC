package parser;

import ast.declarations.*;
import ast.Program;
import ast.expr.Expression;
import ast.statements.Statement;
import ast.types.*;
import ast.types.keyword.*;
import org.antlr.v4.runtime.tree.TerminalNode;


import java.util.ArrayList;
import java.util.List;


public class ASTVisitor extends CBaseVisitor<Object> {

    private static ASTExpressionVisitor expVisitor = new ASTExpressionVisitor();
    private static ASTStatementVisitor stmtVisitor = new ASTStatementVisitor();

    /*
     ====================================================================================================

     ======================
     | Top-Level Visitors |
     ======================

     ====================================================================================================
     */


    /**
     * Visit a program parse tree and return its definitions
     * @param ctx
     * @return List[Declaration] corresponding to all declarations in the program
     */
    @Override
    public Object visitTranslationUnit(CParser.TranslationUnitContext ctx) {
        Program prog = new Program();
        for (CParser.ExternalDeclarationContext edctx : ctx.externalDeclaration()) {
            Object obj = visit(edctx);
            if (obj instanceof ExternalDeclaration) {
                prog.addDeclaration((ExternalDeclaration) obj);
            } else if (obj instanceof List<?> && ((List<?>) obj).size() > 0) {
                if (((List<?>) obj).get(0) instanceof ExternalDeclaration) {
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
     * @param ctx
     * @return
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

    @Override
    public Object visitFunctionDefinition(CParser.FunctionDefinitionContext ctx) {

        // parse the return type
        // C considers functions to return int if nothing is specified
        DeclarationSpecifier retType;

        if (ctx.declarationSpecifier() != null) {
            retType = parseDeclSpecCtxList(ctx.declarationSpecifier());
        } else {
            retType = new DeclarationSpecifier();
            IntegerType type = new IntegerType();
            type.setBits(BitsPerByte*Integer.BYTES);
            retType.setType(type);
        }

        Object obj = visit(ctx.name);
        if (!(obj instanceof Declaration)) {
            throw new RuntimeException("visitFunctionDefinition: visit(ctx.name) should return List<Declaration>");
        }
        Declaration functionDeclaration = (Declaration) obj;

        //update functionDeclaration to contain the DeclarationSpecifier found while parsing retType
        updateDeclaration(functionDeclaration, retType);

        // parse old-style list of parameter declarations
        // (probably never going to be used, but it's a case I have to handle)
        if (ctx.declaration() != null && ctx.declaration().size() > 0) {
            List<Declaration> oldStyleArgList = new ArrayList<>();
            for (CParser.DeclarationContext dctx : ctx.declaration()) {
                obj = visit(dctx);
                if (!(obj instanceof List<?> && ((List<?>) obj).size() > 0 && ((List<?>) obj).get(0) instanceof Declaration)) {
                    throw new RuntimeException("visitFunctionDefinition: visit(ctx.name) should return List<Declaration>");
                }
                oldStyleArgList.addAll((List<Declaration>)obj);
            }

            // for oldstyle declarations, the parameters are untyped names
            // I have to get a bit hacky to fix this since my code parses those names as defined types
            // this is why I'm doing some nonsense with defined types below
            FunctionType type = (FunctionType) functionDeclaration.getDeclSpec().getType();
            List<Declaration> untypedParams = type.getInputTypes();
            List<String> untypedNames = new ArrayList<>();
            for (Declaration decl : untypedParams) {
                if (!(decl.getDeclSpec().getType() instanceof DefinedType)) {
                    throw new RuntimeException("visitFunctionDefinition: failed to parse names from parameter list");
                }
                untypedNames.add(((DefinedType)decl.getDeclSpec().getType()).getName());
            }
            if (untypedParams.size() != oldStyleArgList.size()) {
                throw new RuntimeException("visitFunctionDefinition: different number of oldstyle args and parameters");
            }
            // update params to have same types as oldstyle args
            for (int i = 0; i < untypedNames.size(); i++) {
                String untypedName = untypedNames.get(i);
                Declaration modifier = oldStyleArgList.get(i);
                if (!untypedName.equals(modifier.getName())) {
                    throw new RuntimeException("visitFunctionDefintion: parameter and corresponding " +
                            "oldstyle declration have mismatched names");
                }
                untypedParams.get(i).setName(untypedName);
                untypedParams.get(i).setDeclSpec(modifier.getDeclSpec());
            }
        }

        Statement body = stmtVisitor.visit(ctx.body);
        return new FunctionDefinition(functionDeclaration, body);
    }

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
            if (!(obj instanceof Declaration)) {
                throw new RuntimeException("Init Declarator visit should return declaration");
            }

            // with the declaration parsed, merge the top declaration specifier and the declaration
            Declaration decl = (Declaration) obj;

            updateDeclaration(decl, specifier);

            declList.add(decl);
        }

        // return list of parsed declarations
        return declList;
    }

    @Override
    public Object visitTypeDeclaration(CParser.TypeDeclarationContext ctx) {
        DeclarationSpecifier specifier = new DeclarationSpecifier();
        for (CParser.SpecifierQualifierContext sqctx : ctx.specifierQualifier()) {
            Object obj = visit(sqctx);
            if (obj instanceof Type) {
                specifier.setType((Type) obj);
            } else if (obj instanceof DeclarationSpecifier.TypeQualifier) {
                specifier.updateQualifier((DeclarationSpecifier.TypeQualifier)obj);
            } else {
                throw new RuntimeException("visitTypeDeclaration: unresolved specifier qualifier");
            }
        }
        return new TypeDeclaration(ctx.Identifier().getText(), specifier);
    }

    @Override
    public Object visitTypeName(CParser.TypeNameContext ctx) {
        DeclarationSpecifier specifier = new DeclarationSpecifier();
        List<Type> typeList = new ArrayList<>();
        for (CParser.SpecifierQualifierContext sqctx : ctx.specifierQualifier()) {
            Object obj = visit(sqctx);
            if (obj instanceof Type) {
                typeList.add((Type) obj);
            } else if (obj instanceof DeclarationSpecifier.TypeQualifier) {
                specifier.updateQualifier((DeclarationSpecifier.TypeQualifier) obj);
            } else {
                throw new RuntimeException("visitTypeName: Encountered Malformed SpecifierQualifier");
            }
        }
        specifier.setType(buildBaseType(typeList));

        if (ctx.abstractDeclarator() != null) {
            Object obj = visit(ctx.abstractDeclarator());
            if (!(obj instanceof DeclarationSpecifier))
                throw new RuntimeException("visitTypeName: Encountered Malformed AbstractDeclarator");
            Type finalType = updateType(((DeclarationSpecifier) obj).getType(), specifier.getType());
            specifier.setType(finalType);
            specifier.updateQualifier(((DeclarationSpecifier) obj).getQualifier());
            specifier.updateStorage(((DeclarationSpecifier) obj).getStorage());
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
     * @param ctx
     * @return Union(StorageClassEnum, TypeQualifierEnum, Type)
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
     * Visits storage class parse tree object
     * @param ctx
     * @return StorageClassEnum
     */
    @Override
    public Object visitStorageClassSpecifier(CParser.StorageClassSpecifierContext ctx) {
        switch (ctx.getText()) {
            case "auto" -> {return DeclarationSpecifier.StorageClass.AUTO;}
            case "register" -> {return DeclarationSpecifier.StorageClass.REGISTER;}
            case "static" -> {return DeclarationSpecifier.StorageClass.STATIC;}
            case "extern" -> {return DeclarationSpecifier.StorageClass.EXTERN;}
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
            case "const" -> {return DeclarationSpecifier.TypeQualifier.CONST;}
            case "volatile" -> {return DeclarationSpecifier.TypeQualifier.VOLATILE;}
            default -> throw new IllegalArgumentException("Nonexistent Type Qualifier");
        }
    }

    @Override
    public Object visitStructOrUnionSpecifier(CParser.StructOrUnionSpecifierContext ctx) {
        String structOrUnion = ctx.structOrUnion().getText();
        String name = null;
        if (ctx.Identifier() != null)
            name = ctx.Identifier().getText();

        List<Declaration> members = new ArrayList<>();
        for (CParser.StructDeclarationContext sdctx : ctx.structDeclarationList().structDeclaration()) {
            Object obj = visit(sdctx);
            if (!(obj instanceof List)) {
                throw new RuntimeException("visitStructOrUnionSpecifier: tried to visit member, didn't get declaration list");
            }
            if (!(((List<?>) obj).size() > 0 && ((List<?>) obj).get(0) instanceof Declaration)) {
                throw new RuntimeException("visitStructOrUnionSpecifier: tried to visit member, didn't get declaration list");
            }

            members.addAll((List<Declaration>) obj);
        }
        switch (structOrUnion) {
            case "struct" -> {return new StructType(name, members);}
            case "union" -> {return new UnionType(name, members);}
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
        enumDeclaration.getDeclSpec().setType(new EnumType(ctx.Identifier().getText(),enums));
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
            if (((List<?>) obj).size() > 0) {
                if (!(((List<?>) obj).get(0) instanceof DeclarationSpecifier)) {
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
            if (!(obj instanceof DeclarationSpecifier.TypeQualifier)) {
                throw new RuntimeException("visitSpecifierQualifierList: Expected Type Qualifier");
            }
            specifier.updateQualifier((DeclarationSpecifier.TypeQualifier) obj);
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
        if (((List<?>) obj).size() > 0) {
            if (!(((List<?>) obj).get(0) instanceof DeclarationSpecifier)) {
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
            if (!(obj instanceof Declaration)) {
                throw new RuntimeException("visitStructDeclation: didn't get Declaration");
            }
            Declaration decl = (Declaration) obj;
            updateDeclaration(decl, specifier);
            declarationList.add(decl);
        }
        return declarationList;
    }

    @Override
    public Object visitInitDeclarator(CParser.InitDeclaratorContext ctx) {
        Object obj = visit(ctx.declarator());
        if (!(obj instanceof Declaration)) {
            throw new IllegalArgumentException("Invalid return from declarator visit");
        }
        Declaration decl = (Declaration) obj;
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
        if (ctx.expression() == null) {
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
        if (!(obj instanceof Declaration))
            throw new RuntimeException("Non-Declarator Found in visitDirectDeclarator");
        Declaration decl = (Declaration) obj;
        if (ctx.pointer() != null) {
            obj = visit(ctx.pointer());
            if (!(obj instanceof DeclarationSpecifier))
                throw new RuntimeException("Non-DeclarationSpecifier Found in visitDeclarator");
            DeclarationSpecifier pointerSpecifier = (DeclarationSpecifier) obj;
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
            if (obj instanceof DeclarationSpecifier.TypeQualifier) {
                dt.updateQualifier((DeclarationSpecifier.TypeQualifier) obj);
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
            arr.setSizeExpression(expVisitor.parseExpressionList(ctx.constantExpressionList().expressionList()));
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
        if (!(obj instanceof Declaration))
            throw new RuntimeException("visitOldFunctionDeclarator: visit declarator should return a Declaration");
        // get nested declarator
        Declaration decl = (Declaration) obj;

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
        return visit(ctx.pointer());
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
            if (!(obj instanceof DeclarationSpecifier)) {
                throw new RuntimeException("Non-DeclarationSpecifier Found in visitAbstractDeclarator");
            }
            DeclarationSpecifier pointerSpecifier = (DeclarationSpecifier) obj;
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
            type = typelist.get(0);
        }

        // if a constant expression list, return an array declaration
        if (ctx.constantExpressionList() != null) {
            List<Expression> expList = expVisitor.parseExpressionList(ctx.constantExpressionList().expressionList());
            ArrayType arr = new ArrayType();
            arr.setSizeExpression(expList);
            arr.setBase(type);
            self.getDeclSpec().setType(arr);
            return self;
        }

        if (ctx.parameterTypeList() != null) {
            Object obj = visit(ctx.parameterTypeList());
            if (!(obj instanceof FunctionType)) {
                throw new RuntimeException("visitDirectAbstractDeclarator: " +
                        "visitParameterTypeList returned non-FunctionType");
            }
            self.getDeclSpec().setType((FunctionType)obj);
            return self;
        }

        if (ctx.abstractDeclarator() != null) {
            Object obj = visit(ctx.abstractDeclarator());
            if (!(obj instanceof Declaration))
                throw new RuntimeException("visitDirectAbstractDeclarator: " +
                        "visitAbstractDeclarator returned non-Declaration");
            Declaration abstractDecl = (Declaration) obj;
            if (type != null) {
                Type absType = abstractDecl.getDeclSpec().getType();
                if (type instanceof CompoundType && absType instanceof CompoundType) {
                    CompoundType base = getNestedBase((CompoundType) absType);
                    base.setBase(type);
                } else if (type instanceof FunctionType) {
                    ((FunctionType) type).setReturnType(absType);
                    abstractDecl.getDeclSpec().setType(type);
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
            arr.setSizeExpression(expList);
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
        base.getDeclSpec().updateQualifier(pointerSpecifier.getQualifier());
        base.getDeclSpec().updateStorage(pointerSpecifier.getStorage());
        if (!(pointerSpecifier.getType() instanceof PointerType)) {
            throw new IllegalArgumentException("Pointer Declaration Specifier with Non-Pointer Type");
        }


        Type declarationType = base.getDeclSpec().getType();
        Type pointerType = pointerSpecifier.getType();
        Type newType = updateType(declarationType, pointerType);
        base.getDeclSpec().setType(newType);

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
        Type type = decl.getDeclSpec().getType();
        Type newType = updateType(type, specifier.getType());
        decl.getDeclSpec().setType(newType);
        // update the declaration to have the proper storage class and type qualifiers
        decl.getDeclSpec().updateStorage(specifier.getStorage());
        decl.getDeclSpec().updateQualifier(specifier.getQualifier());

        return decl;
    }

    public Type updateType(Type outer, Type base) {
        switch (outer) {
            case CompoundType compound -> {
                CompoundType inner = getNestedBase(compound);
                Type innerBase = inner.getBase();
                Type newInnerBase = updateType(innerBase, base);
                inner.setBase(newInnerBase);
                return outer;
            }
            case FunctionType function -> {
                Type returnType = function.getReturnType();
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
        while(outer.getBase() instanceof CompoundType) {
            outer = (CompoundType) outer.getBase();
        }
        return outer;
    }

    public Type nestTypes(CompoundType outer, Type inner) {
        CompoundType temp = outer;
        while(temp.getBase() != null) {
            Type inter = temp.getBase();
            if (!(inter instanceof CompoundType)) {
                throw new RuntimeException("Tried to nest Non-Compound Type");
            }
            temp = (CompoundType) inter;
        }
        temp.setBase(inner);
        return outer;
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
            if (obj instanceof DeclarationSpecifier.StorageClass) {
                declSpec.updateStorage((DeclarationSpecifier.StorageClass) obj);
            } else if (obj instanceof Type) {
                typeList.add((Type) obj);
            } else if (obj instanceof DeclarationSpecifier.TypeQualifier) {
                declSpec.updateQualifier((DeclarationSpecifier.TypeQualifier) obj);
            } else {
                throw new IllegalArgumentException("Unrecognized type specifier while parsing declaration");
            }
        }
        if (typeList.size() == 0) {
            int i = 0;
        }
        declSpec.setType(buildBaseType(typeList));
        return declSpec;
    }



    public static final int BitsPerByte = 8;

    /**
     * rectify list of type keywords into a single base type
     * ex. [long long int] -> new IntegerType() with long long size
     * @param typeList
     * @return
     */
    public static Type buildBaseType(List<Type> typeList) {
        Type sign = null;
        boolean isSigned = true;
        boolean intFlag = false;
        boolean floatFlag = false;
        boolean charFlag = false;
        int shortCount = 0;
        int longCount = 0;

        switch (typeList.get(0)) {
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
                    if (sign == null) {
                        sign = type;
                    } else {
                        throw new IllegalArgumentException("Can't have multiple signed/unsigned keywords in a declaration");
                    }
                    break;
                case IntType _:
                    if (floatFlag || intFlag || charFlag) {
                        throw new IllegalArgumentException("Either specified int twice or float, char, or int at same time");
                    } else {
                        intFlag = true;
                    }
                    break;
                case DoubleType _:
                    longCount++;
                case FloatType _:
                    if (floatFlag || intFlag || charFlag) {
                        throw new IllegalArgumentException("Either specified double/float twice or float, char, or int at same time");
                    } else {
                        floatFlag = true;
                    }
                    break;
                case CharType _:
                    if (floatFlag || intFlag || charFlag) {
                        throw new IllegalArgumentException("Either specified char twice or float, char, or int at same time");
                    } else {
                        charFlag = true;
                    }
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

//        for (Type type : typeList) {
//            if (type instanceof SignedType || type instanceof UnsignedType) {
//                if (sign == null) {
//                    sign = type;
//                } else {
//                    throw new IllegalArgumentException("Can't have multiple signed/unsigned keywords in a declaration");
//                }
//            } else if (type instanceof IntType) {
//                if (floatFlag || intFlag || charFlag) {
//                    throw new IllegalArgumentException("Either specified int twice or float, char, or int at same time");
//                } else {
//                    intFlag = true;
//                }
//            } else if (type instanceof DoubleType || type instanceof FloatType) {
//                if (floatFlag || intFlag || charFlag) {
//                    throw new IllegalArgumentException("Either specified double/float twice or float, char, or int at same time");
//                } else {
//                    if (type instanceof DoubleType) longCount++;
//                    floatFlag = true;
//                }
//            } else if (type instanceof CharType) {
//                if (floatFlag || intFlag || charFlag) {
//                    throw new IllegalArgumentException("Either specified char twice or float, char, or int at same time");
//                } else {
//                    charFlag = true;
//                }
//            } else if (type instanceof ShortType) {
//                shortCount++;
//            } else if (type instanceof LongType) {
//                longCount++;
//            } else {
//                // failed to resolve type, likely because item is an identifier
//                return null;
//            }
//        }

        if (longCount > 0 && shortCount > 0) {
            throw new IllegalArgumentException("Can't specify long and short at the same time");
        }
        if (sign instanceof UnsignedType) {
            isSigned = false;
        }

        boolean noSpecifier = !(charFlag || intFlag || floatFlag);
        if (charFlag) {
            if (longCount > 0 || shortCount > 0) {
                throw new IllegalArgumentException("No long or short specifiers for a char");
            }
            IntegerType ch = new IntegerType();
            ch.setSigned(isSigned);
            ch.setBits(BitsPerByte);
            return ch;
        }
        if (intFlag || noSpecifier) {
            if (longCount > 2 || shortCount > 1) {
                throw new IllegalArgumentException("Wrong number of long/short specifiers for int");
            }
            IntegerType it = new IntegerType();
            it.setSigned(isSigned);
            if (longCount > 0) {
                it.setBits(BitsPerByte*Long.BYTES);
            } else if (shortCount > 0) {
                it.setBits(BitsPerByte*Short.BYTES);
            } else {
                it.setBits(BitsPerByte*Integer.BYTES);
            }
            return it;
        }
        if (floatFlag) {
            if (longCount > 2 || shortCount > 0) {
                throw new IllegalArgumentException("Wrong number of long/short specifiers for float");
            }
            FloatingType ft = new FloatingType();
            ft.setSigned(isSigned);
            if (longCount > 0) {
                ft.setBits(BitsPerByte*Double.BYTES);
            } else {
                ft.setBits(BitsPerByte*Float.BYTES);
            }
            return ft;
        }
        throw new IllegalArgumentException("Could Not Resolve Type");
    }
}
