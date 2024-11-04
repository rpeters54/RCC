package ast.statements;

import ast.declarations.DeclarationSpecifier;
import ast.declarations.FunctionDefinition;
import codegen.BasicBlock;
import ast.TypeEnvironment;
import codegen.ControlFlowGraph;
import codegen.EscapeTuple;
import codegen.TranslationUnit;

public abstract class Statement {

    private final int lineNum;

    /**
     * AST Node Type that represent C Statements,
     * these are combinations of expressions that (generally) evaluate to type Void
     * @param lineNum The line number in the base file that the Statement is defined
     */
    public Statement(int lineNum) {
        this.lineNum = lineNum;
    }

    public int lineNum() {
        return lineNum;
    }

    /**
     * Semantic analysis function which determines whether the statement is properly formatted
     * so that it can be compiled.
     * @param globalEnv Global type environment, defines all types and variables with global scope
     * @param localEnv Local type environment, defines all types and variables that are local to the
     *                 function
     * @param function The function that contains the statement
     * @return A DeclarationSpecifier that the statement evaluates to
     */
    public abstract DeclarationSpecifier verifySemantics(TypeEnvironment globalEnv,
                                                         TypeEnvironment localEnv,
                                                         FunctionDefinition function);

    /**
     * Simple return path check that ensures a non-void function will always execute a return instruction.
     * Note: Does follow goto statements
     * @return true/false corresponding to whether the function will always return
     */
    public abstract boolean alwaysReturns();

    /**
     * Generate the statement's corresponding ir / basic blocks and add them to the current control flow graph
     *
     * @param unit  The TranslationUnit defining the entire compiled program
     * @param cfg   The ControlFlowGraph defining the cfg of the current function
     * @param block The BasicBlock being modified
     * @param esc A tuple of basic blocks and labels used by continues and breaks to find their destination
     * @return The newest BasicBlock in the cfg. Depending on whether the statement generates control flow
     * this may not / may be the same as the BasicBlock passed in as argument
     */
    public abstract BasicBlock codegen(TranslationUnit unit, ControlFlowGraph cfg, BasicBlock block, EscapeTuple esc);
}
