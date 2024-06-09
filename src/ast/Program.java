package ast;

import ast.declarations.*;
import ast.statements.CompoundStatement;
import ast.statements.Statement;
import ast.types.*;
import codegen.BasicBlock;
import codegen.instruction.Instruction;
import semantics.TypeEnvironment;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Program {
    private final List<ExternalDeclaration> declarations;
    private final TypeEnvironment globalEnv;

    public Program() {
        this.declarations = new ArrayList<>();
        this.globalEnv = new TypeEnvironment();
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
        // ensure that the environment is empty before starting
        globalEnv.clear();
        for (ExternalDeclaration externalDeclaration : declarations) {
            // add all global variables to the global environment
            switch (externalDeclaration) {
                case Declaration declaration -> globalEnv.update(declaration);
                case TypeDeclaration declaration -> globalEnv.addType(declaration);
                case FunctionDefinition definition -> {
                    TypeEnvironment localEnv = definition.getLocalEnv();
                    localEnv.clear();
                    Declaration stub = definition.getDeclaration();
                    Statement stmt = definition.getBody();

                    // add function definition to the environment
                    globalEnv.update(stub);

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
                    //System.out.println("Function " + stub.getName() + " Done");
                }
                case null, default -> {
                    throw new RuntimeException("Program::verifySemantics: Undefined ExternalDeclaration");
                }
            }
        }
    }

    public void shittyCodegen() {
        for (ExternalDeclaration externalDeclaration : declarations) {
            switch (externalDeclaration) {
                case FunctionDefinition definition -> {
                    List<BasicBlock> blocks = Arrays.asList(new BasicBlock());
                    definition.getBody().codegen(blocks, globalEnv, definition.getLocalEnv());
                    for (Instruction instruction : blocks.getFirst().getAllInstructions()) {
                        System.out.println(instruction);
                    }
                }
                case null, default -> {
                    throw new RuntimeException("Program::shittyCodegen: Not Implemented");
                }
            }
        }
    }
}
