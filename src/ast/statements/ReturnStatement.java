package ast.statements;

import ast.declarations.DeclarationSpecifier;
import ast.declarations.FunctionDefinition;
import ast.expr.Expression;
import ast.types.ArrayType;
import ast.types.FunctionType;
import ast.types.PrimitiveType;
import codegen.BasicBlock;
import ast.TypeEnvironment;
import codegen.ControlFlowGraph;
import codegen.EscapeTuple;
import codegen.TranslationUnit;
import codegen.instruction.llvm.ConversionInstruction;
import codegen.instruction.llvm.UnconditionalBranchInstruction;
import codegen.values.Source;

import java.util.List;

public class ReturnStatement extends Statement {

    private final List<Expression> retVal;

    public ReturnStatement(int lineNum, List<Expression> retVal) {
        super(lineNum);
        this.retVal = retVal;
    }

    @Override
    public DeclarationSpecifier verifySemantics(TypeEnvironment globalEnv, TypeEnvironment localEnv, FunctionDefinition function) {
        DeclarationSpecifier specifier = new DeclarationSpecifier();
        for (Expression guard : retVal) {
            specifier = guard.verifySemantics(globalEnv, localEnv, TypeEnvironment.StorageLocation.REGISTER);
        }

        if (!(function.declaration().declSpec().getType() instanceof FunctionType))
            throw new RuntimeException("ReturnStatement::verifySemantics: Function Definition with Non-Function Type");

        FunctionType definitionType = (FunctionType) function.declaration().declSpec().getType();

        switch(definitionType.returnType()) {
            case PrimitiveType pl -> {
                if (specifier.getType() instanceof PrimitiveType pr) {
                    return new DeclarationSpecifier(PrimitiveType.implicitConversion(pl, pr));
                } else {
                    throw new RuntimeException("ReturnStatement::VerifySemantics: Return Statement " +
                            "contains value that does not match function signature");
                }
            }
            case null, default -> {
                if (!specifier.getType().equals(definitionType.returnType())) {
                    throw new RuntimeException("ReturnStatement::VerifySemantics: Return Statement " +
                            "contains value that does not match function signature");
                } else {
                    return specifier;
                }
            }
        }
    }

    @Override
    public boolean alwaysReturns() {
        return true;
    }

    @Override
    public BasicBlock codegen(TranslationUnit unit, ControlFlowGraph cfg, BasicBlock block, EscapeTuple esc) {
        List<Source> values = retVal.stream()
                .map(value -> value.codegen(unit, cfg, block))
                .toList();

        if (!values.isEmpty()) {
            Source retVal = values.getLast();
            if (retVal.type() instanceof PrimitiveType pt && cfg.getDefinition().returnType() instanceof PrimitiveType rt) {
                if (!PrimitiveType.comparePrimitives(pt, rt)) {
                    ConversionInstruction conv = ConversionInstruction.make(retVal, rt);
                    block.addInstruction(conv);
                    retVal = conv.result();
                }
            }
            cfg.addReturnValue(block.getLabel(), retVal);
        }
        block.addInstruction(new UnconditionalBranchInstruction(cfg.getReturnLabel()));
        cfg.linkReturnBlock(block);
        return block;
    }
}
