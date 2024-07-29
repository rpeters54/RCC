package ast;

import ast.declarations.*;
import ast.statements.CompoundStatement;
import ast.statements.Statement;
import ast.types.*;
import codegen.BasicBlock;
import codegen.ControlFlowGraph;
import codegen.TranslationUnit;
import codegen.instruction.llvm.FunctionDeclaration;
import codegen.instruction.llvm.PhiInstruction;
import codegen.values.Register;
import org.antlr.v4.runtime.misc.Pair;


import java.util.*;

public class Program {
    private final List<ExternalDeclaration> declarations;
    private final TypeEnvironment globalEnv;
    private final List<TypeEnvironment> localEnvs;

    public Program() {
        this.declarations = new ArrayList<>();
        this.globalEnv = new TypeEnvironment();
        this.localEnvs = new ArrayList<>();
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
        localEnvs.clear();
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
                    globalEnv.addDefinition(stub.getName(), definition);

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

                    localEnvs.add(localEnv);
                    // debugging code
                    //System.out.println("Function " + stub.getName() + " Done");
                }
                case null, default -> {
                    throw new RuntimeException("Program::verifySemantics: Undefined ExternalDeclaration");
                }
            }
        }
    }


    public TranslationUnit codegen() {
        TranslationUnit unit = new TranslationUnit(globalEnv.duplicate());
        int j = 0;
        for (int i = 0; i < declarations.size(); i++) {
            ExternalDeclaration externalDeclaration = declarations.get(i);
            switch (externalDeclaration) {
                case FunctionDefinition definition -> {
                    // get type environment
                    TypeEnvironment localEnv = localEnvs.get(j++).duplicate();
                    // construct a new cfg for the function
                    ControlFlowGraph graph = new ControlFlowGraph(localEnv, definition);
                    BasicBlock prologue = new BasicBlock();
                    graph.addBlock(prologue);
                    // add all parameter registers
                    for (Pair<String, Type> paramPair : definition.getParameters()) {
                        Register param = Register.LLVM_Register(paramPair.b);
                        prologue.addBinding(paramPair.a, param);
                        graph.addParameter(param.clone());
                    }
                    // generate a new register for the return value and
                    definition.getBody().codegen(unit, graph, prologue);

                    BasicBlock epilogue = new BasicBlock();
                    Optional<PhiInstruction> returnPhi = graph.getReturnPhi();
                    if (returnPhi.isPresent()) {
                        Register returnRegister = Register.LLVM_Register(definition.getReturnType());
                        graph.declareReturnRegister(returnRegister);
                        epilogue.addInstruction(returnPhi.get());
                    }

                    graph.placeReturnBlock();
                    unit.addControlFlowGraph(graph);
                }
                case Declaration declaration -> {
                    if (declaration.getDeclSpec().getType() instanceof FunctionType func) {
                        FunctionDeclaration decl = new FunctionDeclaration(declaration.getName(), func);
                        unit.getGlobalBlock().addInstruction(decl);
                    } else {
                        throw new RuntimeException("Program::shittyCodegen: Other decls not implemented");
                    }
                }
                case null, default -> {
                    throw new RuntimeException("Program::shittyCodegen: Not Implemented");
                }
            }
        }

        return unit;
    }
}
