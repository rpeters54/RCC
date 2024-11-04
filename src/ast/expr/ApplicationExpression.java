package ast.expr;

import ast.declarations.DeclarationSpecifier;
import ast.types.*;
import codegen.BasicBlock;
import codegen.ControlFlowGraph;
import codegen.TranslationUnit;
import codegen.instruction.llvm.CallInstruction;
import codegen.instruction.llvm.ConversionInstruction;
import codegen.values.Literal;
import codegen.values.Register;
import codegen.values.Source;
import ast.TypeEnvironment;

import java.util.List;
import java.util.stream.Collectors;

public class ApplicationExpression extends Expression {
    private final Expression func;
    private final List<Expression> args ;

    /**
     * AST node representing a function application
     * @param lineNum
     * @param func
     * @param args
     */
    public ApplicationExpression(int lineNum, Expression func, List<Expression> args) {
        super(lineNum);
        this.func = func;
        this.args = args;
    }

    @Override
    public DeclarationSpecifier verifySemantics(TypeEnvironment globalEnv, TypeEnvironment localEnv, TypeEnvironment.StorageLocation location) {
        DeclarationSpecifier functionSpecifier = func.verifySemantics(globalEnv,localEnv, TypeEnvironment.StorageLocation.REGISTER);

        if (!(functionSpecifier.getType() instanceof PointerType)
                || !(((PointerType) functionSpecifier.getType()).base() instanceof FunctionType functionType))
            throw new RuntimeException(String.format(
                    "ApplicationExpression::verifySemantics: At line %d, Can't Apply a Non-Function Pointer", lineNum()
            ));

        if (!functionType.isVariadic() && args.size() != functionType.inputTypes().size())
            throw new RuntimeException(String.format(
                    "ApplicationExpression::verifySemantics: At line %d, Function Expected a Different Number of Args", lineNum()
            ));

        if (functionType.isVariadic() && args.size() < functionType.inputTypes().size())
            throw new RuntimeException(String.format(
                    "ApplicationExpression::verifySemantics: At line %d, Function Expected a Different Number of Args", lineNum()
            ));


        int i = 0;
        for (; i < functionType.inputTypes().size(); i++) {
            DeclarationSpecifier argDecl = args.get(i).verifySemantics(globalEnv,localEnv, TypeEnvironment.StorageLocation.REGISTER);
            Type paramType = functionType.inputTypes().get(i).declSpec().getType();
            Type argType = argDecl.getType();
            if (!(paramType instanceof PrimitiveType primParam) || !(argType instanceof PrimitiveType primArg)) {
                if (!paramType.equals(argType)) {
                    throw new RuntimeException(String.format(
                            "ApplicationExpression::verifySemantics: At line %d, Mismatch Argument/Parameter Type", lineNum()
                    ));
                }
            } else {
                PrimitiveType.implicitConversion(primParam, primArg);
            }
        }
        for (; i< args.size(); i++) {
            args.get(i).verifySemantics(globalEnv,localEnv, TypeEnvironment.StorageLocation.REGISTER);
        }
        return new DeclarationSpecifier(functionType.returnType(), functionSpecifier.getStorage(), functionSpecifier.getQualifier());
    }

    @Override
    public Source codegen(TranslationUnit unit, ControlFlowGraph cfg, BasicBlock block) {
        assert func instanceof IdentifierExpression;
        String name = ((IdentifierExpression) func).getId();

        // ensure that the function exists
        FunctionType type = ((FunctionType)((PointerType) unit.getGlobalTypeEnvironment()
                .getBinding(name).getType()).base());

        List<Source> arguments = args.stream()
                .map(arg -> arg.codegen(unit, cfg, block))
                .collect(Collectors.toList());

        // add implicit type conversions if necessary
        for (int i = 0; i < type.inputTypes().size(); i++) {
            Source arg = arguments.get(i);
            Type paramType = type.inputTypes().get(i).declSpec().getType();
            if (arg.type() instanceof PrimitiveType at && paramType instanceof PrimitiveType pt) {
                if (!PrimitiveType.comparePrimitives(at, pt)) {
                    ConversionInstruction conv = ConversionInstruction.make(arg.clone(), (PrimitiveType) pt.clone());
                    block.addInstruction(conv);
                    arguments.set(i, conv.result().clone());
                }
            }
        }


        if (type.returnType() instanceof VoidType) {
            CallInstruction call = new CallInstruction(arguments, name);
            block.addInstruction(call);
            return Literal.nill(new PointerType(new VoidType()));
        } else {
            Register result = Register.LLVM_Register(type.returnType().clone());
            CallInstruction call = new CallInstruction(result, arguments, name);
            block.addInstruction(call);
            return result.clone();
        }
    }
}
