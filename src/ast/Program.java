package ast;

import ast.declarations.*;
import ast.statements.CompoundStatement;
import ast.statements.Statement;
import ast.types.*;
import codegen.BasicBlock;
import codegen.ControlFlowGraph;
import codegen.EscapeTuple;
import codegen.TranslationUnit;
import codegen.instruction.llvm.FunctionDeclarationLLVM;
import codegen.instruction.llvm.PhiLLVM;
import codegen.instruction.llvm.UnconditionalBranchLLVM;
import codegen.values.Register;


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
                case Declaration declaration -> {
                    switch (declaration.declSpec().getType()) {
                        case StructType struct -> {
                            if (!struct.members().isEmpty())
                                globalEnv.addClass(declaration.declSpec());
                        }
                        case UnionType union -> {
                            if (!union.members().isEmpty())
                                globalEnv.addClass(declaration.declSpec());
                        }
                        case EnumType enumeration -> {
                            if (!enumeration.getEnumerators().isEmpty())
                                globalEnv.addClass(declaration.declSpec());
                        }
                        default -> {}
                    }
                    DeclarationSpecifier expandedSpecifier = globalEnv.expandDeclaration(declaration.declSpec());
                    if (declaration.name() != null)
                        globalEnv.addBinding(declaration.name(), expandedSpecifier);
                }
                case TypeDeclaration declaration -> globalEnv.addTypeDef(declaration);
                case FunctionDefinition definition -> {
                    TypeEnvironment localEnv = definition.localEnv();
                    localEnv.clear();
                    Declaration stub = definition.declaration();
                    Statement stmt = definition.body();

                    // add function definition to the environment
                    globalEnv.addDefinition(stub.name(), definition);

                    // ensure that the function has function type and add its args to the local env
                    if (!(stub.declSpec().getType() instanceof FunctionType func))
                        throw new RuntimeException("Program: Function Definition with Non-Function Declaration");
                    for (Declaration param : func.inputTypes()) {
                        DeclarationSpecifier paramSpecifier = globalEnv.expandDeclaration(param.declSpec());
                        localEnv.addBinding(param.name(), paramSpecifier);
                    }

                    // by standard, functions must have a compound statement as their body
                    if (!(stmt instanceof CompoundStatement))
                        throw new RuntimeException("Program: Function Body Must Be a Compound Statement");

                    // recurse on the compound statement to verify it
                    stmt.verifySemantics(globalEnv, localEnv, definition);

                    if (!(func.returnType() instanceof VoidType) && !stmt.alwaysReturns()) {
                        throw new RuntimeException("Program::verifySemantics: Non-Void Function " +
                                definition.declaration().name() +
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

    /**
     * Given a properly typechecked C program, construct a control flow graph
     * for each function containing llvm ir
     * @return TranslationUnit object that contains the global environment and
     * a list of control flow graphs that contain the compiled intermediate representation
     */
    public TranslationUnit codegen() {
        TranslationUnit unit = new TranslationUnit(globalEnv.duplicate());
        int j = 0;
        for (ExternalDeclaration externalDeclaration : declarations) {
            switch (externalDeclaration) {
                case FunctionDefinition definition -> {
                    // get type environment
                    TypeEnvironment localEnv = localEnvs.get(j++).duplicate();

                    // construct a new cfg for the function
                    ControlFlowGraph graph = new ControlFlowGraph(localEnv, definition);
                    BasicBlock prologue = new BasicBlock();
                    graph.addBlock(prologue);

                    // add all parameter registers
                    definition.parameters().forEach(declaration ->
                            localEnv.AddParamDeclarations(declaration, graph, prologue)
                    );

                    // generate all code for the function body
                    BasicBlock last = definition.body().codegen(unit, graph, prologue, new EscapeTuple());

                    Optional<PhiLLVM> returnPhi = graph.getReturnPhi();
                    if (returnPhi.isPresent()) {
                        Register returnRegister = Register.LLVM_Register(definition.returnType());
                        graph.declareReturnRegister(returnRegister);
                    }

                    // if the final block was not linked to the epilogue by default, link them manually
                    // (this happens with void functions that do not end with a return)
                    if (!last.endsWithJump()) {
                        last.addInstruction(new UnconditionalBranchLLVM(graph.getReturnLabel()));
                        graph.linkReturnBlock(last);
                    }

                    // place the epilogue block and add the cfg to the program
                    graph.placeReturnBlock();
                    unit.addControlFlowGraph(graph);
                }
                case Declaration declaration -> {
                    if (declaration.name() != null) {
                        switch (declaration.declSpec().getType()) {
                            case FunctionType function -> {
                                FunctionDeclarationLLVM decl = new FunctionDeclarationLLVM(declaration.name(), function);
                                unit.getGlobalBlock().addInstruction(decl);
                            }
                            case null -> throw new RuntimeException("Program::codegen: null declaration");
                            default -> {
                                unit.getGlobalTypeEnvironment().addGlobalDeclarations(declaration, unit.getGlobalBlock());
                            }
                        }
                    }
                }
                case TypeDeclaration typedecl -> {}
                case null, default -> {
                    throw new RuntimeException("Program::codegen: Not Implemented");
                }
            }
        }

        return unit;
    }

}
