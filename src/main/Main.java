package main;

import ast.Program;
import codegen.BasicBlock;
import codegen.ControlFlowGraph;
import codegen.TranslationUnit;
import codegen.values.Register;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;
import parser.ASTVisitor;
import parser.CLexer;
import parser.CParser;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Collection;
import java.util.List;


import static java.lang.System.exit;

public class Main {

    public static void main(String[] args) {

        // These functions reset static variables so that the
        // test bench can run main a bunch of times
        Register.ResetCount();
        BasicBlock.ResetCount();

        Program program = parseProgram(args);
        program.verifySemantics();
        TranslationUnit code = program.codegen();
        code.pruneRedundantPhis();
        code.deadCodeElimination();

        TranslationUnit risc = code.toRisc();
        risc.generateRiscFile(args[2]);

        code.bubbleAllocas();
        code.generateLLFile(args[1]);
    }

    public static Program parseProgram(String[] args) {
        Program program = null;

        try {
            if (args.length < 1)
                throw new FileNotFoundException("Main: Input File Not Found");
        } catch (FileNotFoundException e) {
            e.printStackTrace();
            System.err.println(e.getMessage());
            exit(1);
        }
        String filepath = args[0];
        try {
            // Create a CharStream that reads from the input file
            CharStream input = CharStreams.fromFileName(filepath);

            // Create a lexer that feeds off of input CharStream
            CLexer lexer = new CLexer(input);

            // Create a buffer of tokens pulled from the lexer
            CommonTokenStream tokens = new CommonTokenStream(lexer);

            // Create a parser that feeds off the tokens buffer
            CParser parser = new CParser(tokens);

            // Begin parsing at top-most rule
            ParseTree tree = parser.translationUnit();
            //System.out.print(tree.toStringTree());

            if (parser.getNumberOfSyntaxErrors() > 0) {
                System.err.println("syntax error");
                exit(1);
            }

            ASTVisitor progVis = new ASTVisitor();
            program = (Program) progVis.visit(tree);

        } catch (IOException e) {
            e.printStackTrace();
            exit(-1);
        }
        return program;
    }

}
