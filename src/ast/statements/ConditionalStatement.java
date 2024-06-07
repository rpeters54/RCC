package ast.statements;

import ast.declarations.DeclarationSpecifier;
import ast.declarations.FunctionDefinition;
import ast.expr.Expression;
import ast.types.PrimitiveType;
import semantics.TypeEnvironment;

import java.util.List;

public class ConditionalStatement implements Statement {
    private final int lineNum;
    private final List<Expression> guardList;
    private final Statement thenBlock;
    private final Statement elseBlock;

    public ConditionalStatement(int lineNum, List<Expression> guardList, Statement thenBlock, Statement elseBlock) {
        this.lineNum = lineNum;
        this.guardList = guardList;
        this.thenBlock = thenBlock;
        this.elseBlock = elseBlock;
    }

    @Override
    public DeclarationSpecifier verifySemantics(TypeEnvironment globalEnv, TypeEnvironment localEnv, FunctionDefinition function) {
        DeclarationSpecifier specifier = new DeclarationSpecifier();
        for (Expression guard : guardList) {
            specifier = guard.verifySemantics(globalEnv, localEnv);
        }
        if (!(specifier.getType() instanceof PrimitiveType))
            throw new RuntimeException("ConditionalStatement::verifySemantics: Final expression in guardList is not a valid type");

        specifier = thenBlock.verifySemantics(globalEnv, localEnv, function);
        if (elseBlock != null)
            specifier = elseBlock.verifySemantics(globalEnv, localEnv, function);
        return specifier;
    }

    @Override
    public boolean alwaysReturns() {
        boolean thenReturn = thenBlock.alwaysReturns();
        if (elseBlock == null) {
            return thenReturn;
        } else {
            boolean elseReturn = elseBlock.alwaysReturns();
            return thenReturn && elseReturn;
        }
    }
}
