package ast;

import ast.declarations.*;
import ast.statements.CompoundStatement;
import ast.statements.Statement;
import ast.types.*;
import semantics.TypeEnvironment;

import java.util.ArrayList;
import java.util.List;

public class Program {
    private List<ExternalDeclaration> declarations;

    public Program(List<ExternalDeclaration> declarations) {
        this.declarations = declarations;
    }

    public Program() {
        this.declarations = new ArrayList<>();
    }

    public void addDeclaration(ExternalDeclaration declaration) {
        this.declarations.add(declaration);
    }

    public List<ExternalDeclaration> getDeclarations() {
        return declarations;
    }


    /**
     * Verifies that the program is runnable (typechecking, scope, etc.)
     */
    public void verifySemantics() {
        TypeEnvironment globalEnv = new TypeEnvironment();
        for (ExternalDeclaration externalDeclaration : declarations) {
            // add all global variables to the global environment
            switch (externalDeclaration) {
                case Declaration declaration -> globalEnv.update(declaration);
                case TypeDeclaration declaration -> globalEnv.addType(declaration);
                case FunctionDefinition definition -> {
                    TypeEnvironment localEnv = new TypeEnvironment();
                    Declaration stub = definition.getDeclaration();
                    Statement stmt = definition.getBody();

                    // ensure that the function has function type and add its args to the local env
                    if (!(stub.getDeclSpec().getType() instanceof FunctionType func))
                        throw new RuntimeException("Program: Function Definition with Non-Function Declaration");
                    for (Declaration param : func.getInputTypes()) {
                        localEnv.update(param);
                    }

                    // by standard, functions must have a compound statement as their body
                    if (!(stmt instanceof CompoundStatement))
                        throw new RuntimeException("Program: Function Body Must Be a Compound Statement");

                    // recurse on the compound statement to verify it
                    stmt.verifySemantics(globalEnv, localEnv, definition);

                    if (!(func.getReturnType() instanceof VoidType) && !stmt.alwaysReturns()) {
                        throw new RuntimeException("Program::verifySemantics: Non-Void Function " +
                                definition.getDeclaration().getName() +
                                " Does Not Return for All Paths");
                    }

                    // debugging code
                    System.out.println("Function " + stub.getName() + " Done");
                }
                case null, default -> {
                    throw new RuntimeException("Program::verifySemantics: Undefined ExternalDeclaration");
                }
            }
        }
    }
}
