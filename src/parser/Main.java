package parser;

import org.antlr.runtime.ANTLRInputStream;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import static java.lang.System.exit;

public class Main {

    public static void main(String[] args) {
        ParseTree tree;
        parseParameters(args);
        try {
            // Create a CharStream that reads from the input file
            CharStream input = CharStreams.fromFileName(_inputFile);

            // Create a lexer that feeds off of input CharStream
            CLexer lexer = new CLexer(input);

            // Create a buffer of tokens pulled from the lexer
            CommonTokenStream tokens = new CommonTokenStream(lexer);

            // Create a parser that feeds off the tokens buffer
            CParser parser = new CParser(tokens);

            // Begin parsing at top-most rule
            tree = parser.translationUnit();
            System.out.print(tree.toStringTree());

        } catch (IOException e) {
            e.printStackTrace();
            exit(-1);
        }

    }


    private static String _inputFile = null;

    private static void parseParameters(String [] args)
    {
        for (int i = 0; i < args.length; i++)
        {
            if (args[i].charAt(0) == '-')
            {
                System.err.println("unexpected option: " + args[i]);
                exit(1);
            }
            else if (_inputFile != null)
            {
                System.err.println("too many files specified");
                exit(1);
            }
            else
            {
                _inputFile = args[i];
            }
        }
    }
}
