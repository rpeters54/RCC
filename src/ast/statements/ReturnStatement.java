package ast.statements;

import ast.declarations.DeclarationSpecifier;
import ast.declarations.FunctionDefinition;
import ast.expr.Expression;
import ast.types.FunctionType;
import codegen.BasicBlock;
import semantics.TypeEnvironment;

import java.util.List;

public class ReturnStatement implements Statement {
    private final int lineNum;
    private final List<Expression> retVal;

    public ReturnStatement(int lineNum, List<Expression> retVal) {
        this.lineNum = lineNum;
        this.retVal = retVal;
    }

    @Override
    public DeclarationSpecifier verifySemantics(TypeEnvironment globalEnv, TypeEnvironment localEnv, FunctionDefinition function) {
        DeclarationSpecifier specifier = new DeclarationSpecifier();
        for (Expression guard : retVal) {
            specifier = guard.verifySemantics(globalEnv, localEnv);
        }

        if (!(function.getDeclaration().getDeclSpec().getType() instanceof FunctionType))
            throw new RuntimeException("ReturnStatement::verifySemantics: Function Definition with Non-Function Type");

        FunctionType definitionType = (FunctionType) function.getDeclaration().getDeclSpec().getType();

        if (!specifier.getType().equals(definitionType.getReturnType()))
            throw new RuntimeException("ReturnStatement::VerifySemantics: Return Statement " +
                    "contains value that does not match function signature");

        return specifier;
    }

    @Override
    public boolean alwaysReturns() {
        return true;
    }

    @Override
    public void codegen(List<BasicBlock> blocks, TypeEnvironment globalEnv, TypeEnvironment localEnv) {
        throw new RuntimeException("Not implemented yet");
    }
}
