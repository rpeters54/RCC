package ast.statements;

import ast.declarations.DeclarationSpecifier;
import ast.declarations.FunctionDefinition;
import ast.expr.Expression;
import ast.types.IntegerType;
import codegen.BasicBlock;
import ast.TypeEnvironment;
import codegen.ControlFlowGraph;
import codegen.EscapeTuple;
import codegen.TranslationUnit;

import java.util.List;

public class SwitchStatement extends Statement {

    private final List<Expression> guardList;
    private final Statement body;

    public SwitchStatement(int lineNum, List<Expression> guardList, Statement body) {
        super(lineNum);
        this.guardList = guardList;
        this.body = body;
    }

    @Override
    public DeclarationSpecifier verifySemantics(TypeEnvironment globalEnv, TypeEnvironment localEnv, FunctionDefinition function) {
        DeclarationSpecifier specifier = new DeclarationSpecifier();
        for (Expression guard : guardList) {
            specifier = guard.verifySemantics(globalEnv, localEnv, TypeEnvironment.StorageLocation.REGISTER);
        }
        if (!(specifier.getType() instanceof IntegerType))
            throw new RuntimeException("SwitchStatement::verifySemantics: Final expression in guardList is not a valid type");

        if (!(body instanceof CompoundStatement))
            throw new RuntimeException("SwitchStatement::VerifySemantics: body must be a Compound Statement");
        if (!((CompoundStatement) body).getDeclarations().isEmpty())
            throw new RuntimeException("SwitchStatement::VerifySemantics: body can not contain any declarations");
//        for (Statement stmt : ((CompoundStatement) body).getStatements()) {
//            if (!(stmt instanceof CaseStatement || stmt instanceof DefaultCaseStatement))
//                throw new RuntimeException("SwitchStatement::VerifySemantics: body must only contain case/default statements");
//        }

        return body.verifySemantics(globalEnv, localEnv, function);
    }

    @Override
    public boolean alwaysReturns() {
        return body.alwaysReturns();
    }

    @Override
    public BasicBlock codegen(TranslationUnit unit, ControlFlowGraph cfg, BasicBlock block, EscapeTuple esc) {
        throw new RuntimeException("Not implemented yet");
    }
}
