package parser;

import ast.Declaration;
import ast.FunctionDefinition;
import ast.Program;

import java.util.ArrayList;
import java.util.List;

public class ASTProgramVisitor extends CBaseVisitor<Program> {

    private ASTExternalDeclarationVisitor exDecVis;

    public ASTProgramVisitor() {
        exDecVis = new ASTExternalDeclarationVisitor();
    }

    @Override
    public Program visitTranslationUnit(CParser.TranslationUnitContext ctx) {
        Program program = new Program();
        for (CParser.ExternalDeclarationContext decl : ctx.externalDeclaration()) {
            Object obj = exDecVis.visit(decl);
            if (obj instanceof FunctionDefinition) {
                program.getFuncs().add((FunctionDefinition) obj);
            } else if (obj instanceof Declaration) {
                program.getDecls().add((Declaration) obj);
            } else {
                throw new IllegalArgumentException("Illegal Result of External Declaration Visit");
            }
        }

        return program;
    }

}
