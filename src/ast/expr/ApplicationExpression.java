package ast.expr;

import ast.declarations.DeclarationSpecifier;
import ast.types.*;
import codegen.BasicBlock;
import codegen.ControlFlowGraph;
import codegen.TranslationUnit;
import codegen.instruction.llvm.CallLLVM;
import codegen.instruction.llvm.ConversionLLVM;
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

        List<DeclarationSpecifier> argSpecifiers = args.stream()
                .map(arg -> arg.verifySemantics(globalEnv,localEnv, TypeEnvironment.StorageLocation.REGISTER))
                .toList();

        if (!(functionSpecifier.getType() instanceof PointerType)
                || !(((PointerType) functionSpecifier.getType()).base() instanceof FunctionType functionType))
            throw new RuntimeException(String.format(
                    "ApplicationExpression::verifySemantics: At line %d, Can't Apply a Non-Function Pointer", lineNum()
            ));

        if (!functionType.isVariadic() && argSpecifiers.size() != functionType.inputTypes().size())
            throw new RuntimeException(String.format(
                    "ApplicationExpression::verifySemantics: At line %d, Function Expected a Different Number of Args", lineNum()
            ));

        if (functionType.isVariadic() && argSpecifiers.size() < functionType.inputTypes().size())
            throw new RuntimeException(String.format(
                    "ApplicationExpression::verifySemantics: At line %d, Function Expected a Different Number of Args", lineNum()
            ));


        int i = 0;
        for (; i < functionType.inputTypes().size(); i++) {
            DeclarationSpecifier argDecl = argSpecifiers.get(i);
            Type paramType = functionType.inputTypes().get(i).declSpec().getType();
            Type argType = argDecl.getType();
            switch (paramType) {
                case PrimitiveType primParam when argType instanceof PrimitiveType primArg ->
                        PrimitiveType.implicitConversion(primParam, primArg);
                case PrimitiveType primParam when argType instanceof ArrayType arrayArg ->
                        PrimitiveType.implicitConversion(primParam, new PointerType(arrayArg.base()));
                case ArrayType arrayParam when argType instanceof PrimitiveType primArg ->
                        PrimitiveType.implicitConversion(new PointerType(arrayParam.base()), primArg);
                case null, default -> {
                    assert paramType != null;
                    if (!paramType.equals(argType)) {
                        throw new RuntimeException(String.format(
                                "ApplicationExpression::verifySemantics: At line %d, Mismatch Argument/Parameter Type", lineNum()
                        ));
                    }
                }
            }
        }
        return new DeclarationSpecifier(functionType.returnType(), functionSpecifier.getStorage(), functionSpecifier.getQualifier());
    }

    @Override
    public Register codegen(TranslationUnit unit, ControlFlowGraph cfg, BasicBlock block) {

        if (func instanceof IdentifierExpression idExp) {
            String name = idExp.getId();

            // ensure that the function exists
            FunctionType ft = ((FunctionType)((PointerType) unit.getGlobalTypeEnvironment()
                .getBinding(name).getType()).base());

            List<Register> arguments = handleArguments(unit, cfg, block, ft);

            if (ft.returnType() instanceof VoidType) {
                CallLLVM call = new CallLLVM(arguments, name, ft);
                block.addInstruction(call);
                return null;
            } else {
                Type expandedReturnType = unit.getGlobalTypeEnvironment()
                        .expandDeclaration(new DeclarationSpecifier(ft.returnType())).getType();
                Register result = Register.LLVM_Register(expandedReturnType);
                CallLLVM call = new CallLLVM(result, arguments, name, ft);
                block.addInstruction(call);
                return result.clone();
            }
        } else {
            Register functionPtr = func.codegen(unit, cfg, block);

            FunctionType ft = ((FunctionType)((PointerType)functionPtr.type()).base());

            handleArguments(unit, cfg, block, ft);

            List<Register> arguments = handleArguments(unit, cfg, block, ft);

            if (ft.returnType() instanceof VoidType) {
                CallLLVM call = new CallLLVM(arguments, functionPtr, ft);
                block.addInstruction(call);
                return null;
            } else {
                Type expandedReturnType = unit.getGlobalTypeEnvironment()
                        .expandDeclaration(new DeclarationSpecifier(ft.returnType())).getType();
                Register result = Register.LLVM_Register(expandedReturnType);
                CallLLVM call = new CallLLVM(result, arguments, functionPtr, ft);
                block.addInstruction(call);
                return result.clone();
            }
        }

    }

    public List<Register> handleArguments(TranslationUnit unit, ControlFlowGraph cfg, BasicBlock block, FunctionType ft) {
        List<Register> arguments = args.stream()
                .map(arg -> arg.codegen(unit, cfg, block))
                .collect(Collectors.toList());

        // add implicit type conversions if necessary
        int i;
        for (i = 0; i < ft.inputTypes().size(); i++) {
            Register arg = arguments.get(i);
            Type paramType = ft.inputTypes().get(i).declSpec().getType();
            if (arg.type() instanceof PrimitiveType at && paramType instanceof PrimitiveType pt) {
                if (!PrimitiveType.comparePrimitives(at, pt)) {
                    ConversionLLVM conv = ConversionLLVM.make(arg.clone(), pt);
                    block.addInstruction(conv);
                    arguments.set(i, conv.result().clone());
                }
            }
        }

        // variadic functions promote unspecified floats to doubles
        // add that conversion here for the remaining arguments
        if (ft.isVariadic()) {
            for (; i < arguments.size(); i++) {
                Register arg = arguments.get(i);
                if (arg.type() instanceof FloatingType flt && flt.size() == FloatingType.Width.FLOAT) {
                    ConversionLLVM conv = ConversionLLVM.make(arg.clone(), new FloatingType(FloatingType.Width.DOUBLE));
                    block.addInstruction(conv);
                    arguments.set(i, conv.result().clone());
                }
            }
        }

        return arguments;
    }
}


