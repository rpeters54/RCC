package ast.expr;

import ast.declarations.DeclarationSpecifier;
import ast.types.FunctionType;
import ast.types.PointerType;
import codegen.BasicBlock;
import codegen.values.Source;
import semantics.TypeEnvironment;

import java.util.List;

public class ApplicationExpression implements Expression {
    private final int lineNum;
    private final Expression func;
    private final List<Expression> args ;

    public ApplicationExpression(int lineNum, Expression func, List<Expression> args) {
        this.lineNum = lineNum;
        this.func = func;
        this.args = args;
    }

    @Override
    public DeclarationSpecifier verifySemantics(TypeEnvironment globalEnv, TypeEnvironment localEnv) {
        DeclarationSpecifier functionSpecifier = func.verifySemantics(globalEnv,localEnv);

        if (!(functionSpecifier.getType() instanceof PointerType)
                || !(((PointerType) functionSpecifier.getType()).getBase() instanceof FunctionType functionType))
            throw new RuntimeException("ApplicationExpression::verifySemantics: Can't Apply a Non-Function Pointer");

        if (!functionType.isVariadic() && args.size() != functionType.getInputTypes().size())
            throw new RuntimeException("ApplicationExpression::verifySemantics: Function Expected a Different Number of Args");

        if (functionType.isVariadic() && args.size() < functionType.getInputTypes().size())
            throw new RuntimeException("ApplicationExpression::verifySemantics: Function Expected a Different Number of Args");

        for (int i = 0; i < functionType.getInputTypes().size(); i++) {
            DeclarationSpecifier argDecl = args.get(i).verifySemantics(globalEnv,localEnv);
            if (!functionType.getInputTypes().get(i).getDeclSpec().getType().equals(argDecl.getType()))
                throw new RuntimeException("ApplicationExpression::verifySemantics: Mismatch Argument/Parameter Type");
        }
        return new DeclarationSpecifier(functionType.getReturnType(), functionSpecifier.getStorage(), functionSpecifier.getQualifier());
    }

    @Override
    public Source codegen(BasicBlock block, TypeEnvironment globalEnv, TypeEnvironment localEnv) {
        throw new RuntimeException("Not Implemented");
    }
}
