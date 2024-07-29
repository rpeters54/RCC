package ast.expr;

import ast.declarations.DeclarationSpecifier;
import ast.types.FunctionType;
import ast.types.PointerType;
import ast.types.PrimitiveType;
import ast.types.Type;
import codegen.BasicBlock;
import codegen.ControlFlowGraph;
import codegen.TranslationUnit;
import codegen.instruction.llvm.CallInstruction;
import codegen.instruction.llvm.ConversionInstruction;
import codegen.values.Register;
import codegen.values.Source;
import ast.TypeEnvironment;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

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
            Type paramType = functionType.getInputTypes().get(i).getDeclSpec().getType();
            Type argType = argDecl.getType();
            if (!(paramType instanceof PrimitiveType primParam) || !(argType instanceof PrimitiveType primArg)) {
                if (!paramType.equals(argType)) {
                    throw new RuntimeException("ApplicationExpression::verifySemantics: Mismatch Argument/Parameter Type");
                }
            } else {
                PrimitiveType.implicitConversion(primParam, primArg);
            }
        }
        return new DeclarationSpecifier(functionType.getReturnType(), functionSpecifier.getStorage(), functionSpecifier.getQualifier());
    }

    @Override
    public Source codegen(TranslationUnit unit, ControlFlowGraph cfg, BasicBlock block) {
        assert func instanceof IdentifierExpression;
        String name = ((IdentifierExpression) func).getId();

        // ensure that the function exists
        FunctionType type = ((FunctionType)((PointerType) unit.getGlobalTypeEnvironment()
                .getBinding(name).getType()).getBase());

        List<Source> arguments = args.stream()
                .map(arg -> arg.codegen(unit, cfg, block))
                .collect(Collectors.toList());

        // add implicit type conversions if necessary
        for (int i = 0; i < type.getInputTypes().size(); i++) {
            Source arg = arguments.get(i);
            Type paramType = type.getInputTypes().get(i).getDeclSpec().getType();
            if (!arg.type().equals(paramType)) {
                ConversionInstruction conv = ConversionInstruction.make(arg.clone(), (PrimitiveType) paramType.clone());
                block.addInstruction(conv);
                arguments.set(i, conv.getResult().clone());
            }
        }

        Register result = Register.LLVM_Register(type.getReturnType().clone());
        CallInstruction call = new CallInstruction(result, arguments, name);
        block.addInstruction(call);

        return result.clone();
    }
}
