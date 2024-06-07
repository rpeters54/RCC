package parser;

import ast.Program;
import ast.expr.Expression;
import org.antlr.runtime.ANTLRInputStream;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;


import static java.lang.System.exit;

public class Main {

    public static void main(String[] args) {
        Program program = parseProgram(args);
        program.verifySemantics();
    }

    public static Program parseProgram(String[] args) {
        Program program = null;

        try {
            if (args.length != 1)
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
