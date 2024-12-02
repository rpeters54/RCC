package ast.expr;

import ast.declarations.DeclarationSpecifier;
import ast.types.*;
import codegen.BasicBlock;
import codegen.ControlFlowGraph;
import codegen.TranslationUnit;
import codegen.instruction.llvm.ConversionLLVM;
import codegen.instruction.llvm.LoadLLVM;
import codegen.instruction.llvm.StoreLLVM;
import codegen.values.Register;
import codegen.values.Source;
import ast.TypeEnvironment;
import org.antlr.v4.runtime.misc.Pair;

import java.util.List;

public class IdentifierExpression extends LValue {

    private final String id;

    public IdentifierExpression(int lineNum, String id) {
        super(lineNum);
        this.id = id;
    }

    public String getId() {
        return id;
    }

    @Override
    public DeclarationSpecifier verifySemantics(TypeEnvironment globalEnv, TypeEnvironment localEnv, TypeEnvironment.StorageLocation location) {
        DeclarationSpecifier defn = localEnv.getBinding(id);
        if (defn != null) {
            localEnv.updateVariableStorageLocation(id, location);
            return defn;
        } else {
            defn = globalEnv.getBinding(id);
        }
        if (defn != null) {
            globalEnv.updateVariableStorageLocation(id, location);
            return defn;
        } else {
            throw new RuntimeException("IdentifierExpression::verifySemantics: '" + id + "' not included in local " +
                    "or global environment");
        }
    }

    @Override
    public Register codegen(TranslationUnit unit, ControlFlowGraph cfg, BasicBlock block) {

        DeclarationSpecifier specifier = cfg.getLocalEnvironment().getBinding(id);
        TypeEnvironment.StorageLocation location = cfg.getLocalEnvironment().getLocation(id);
        if (specifier != null) {
            assert location != null;
            // try to get value from block environment
            Register value = block.getBinding(id);
            // if not in current block environment, look for previous definitions
            if (value == null) {
                Pair<List<String>, List<Register>> pair = cfg.findPreviousDefinitions(block, id);
                // if the value was defined but has multiple unique definitions, a phi block should have already been placed
                // throw an error
                if (!pair.a.isEmpty()) {
                    if (!pair.b.stream().allMatch(pair.b.getFirst()::equals)) {
                        throw new RuntimeException("IdentifierExpression::codegen: multiple definitions of '" + id + "' " +
                                "reach this location without an intermediate phi block");
                    } else {
                        value = pair.b.getFirst();
                    }
                } else {
                    throw new RuntimeException("IdentifierExpression::codegen: value '" + id + "' " +
                            "defined as local but not present in block environment");
                }
            }

            switch (location) {
                case REGISTER -> {
                    return value.clone();
                }
                case STACK -> {
                    assert value.type() instanceof PointerType;
                    PointerType pt = (PointerType) value.type();
                    Type expandedBaseType = unit.getGlobalTypeEnvironment()
                            .expandDeclaration(new DeclarationSpecifier(pt.base())).getType();
                    switch (expandedBaseType) {
                        case ArrayType at -> { return value.clone(); }
                        case StructType st -> { return value.clone(); }
                        case UnionType ut -> { return value.clone(); }
                        case PrimitiveType primt -> {
                            Register result = Register.LLVM_Register(expandedBaseType);
                            LoadLLVM load = new LoadLLVM(result.clone(), value.clone());
                            block.addInstruction(load);
                            return result;
                        }
                        case null, default -> {
                            throw new RuntimeException("IdentifierExpression::codegen: invalid type " + expandedBaseType);
                        }
                    }
                }
            }

        }


        // if not locally defined, check global definitions
        specifier = unit.getGlobalTypeEnvironment().getBinding(id);
        if (specifier != null) {
            Register address = unit.getGlobalBlock().getBinding(id);
            assert address != null;
            assert address.type() instanceof PointerType;
            PointerType pt = (PointerType) address.type();
            Type expandedType = unit.getGlobalTypeEnvironment()
                    .expandDeclaration(new DeclarationSpecifier(pt.base())).getType();

            Register result;
            if (expandedType instanceof FunctionType) {
                result = address.clone();
            } else {
                result = Register.LLVM_Register(expandedType);
                LoadLLVM load = new LoadLLVM(result.clone(), address.clone());
                block.addInstruction(load);
            }

            return result;
        }
        throw new RuntimeException("IdentifierExpression::codegen: Unbound Identifier " + id);
    }

    @Override
    public Register processLValue(TranslationUnit unit, ControlFlowGraph cfg, BasicBlock block, Register right) {
        // find where the value is specified

        DeclarationSpecifier specifier = cfg.getLocalEnvironment().getBinding(id);
        TypeEnvironment.StorageLocation location = cfg.getLocalEnvironment().getLocation(id);
        if (specifier != null) {
            assert location != null;
            switch (location) {
                case REGISTER ->  {
                    // convert the value if necessary
                    if (!PrimitiveType.comparePrimitives((PrimitiveType) specifier.getType(), (PrimitiveType) right.type())) {
                        ConversionLLVM implicitConv = ConversionLLVM.make(
                                right,
                                (PrimitiveType) specifier.getType()
                        );
                        block.addInstruction(implicitConv);
                        block.addBinding(id, implicitConv.result().clone());
                        return implicitConv.result().clone();
                    } else {
                        block.addBinding(id, right.clone());
                        return right.clone();
                    }
                }
                case STACK -> {
                    Register address = block.getBinding(id);
                    assert address != null;

                    Register result = right.clone();
                    if (!PrimitiveType.comparePrimitives((PrimitiveType) specifier.getType(), (PrimitiveType) right.type())) {
                        ConversionLLVM implicitConv = ConversionLLVM.make(
                                right,
                                (PrimitiveType) specifier.getType()
                        );
                        block.addInstruction(implicitConv);
                        result = implicitConv.result().clone();
                    }
                    StoreLLVM store = new StoreLLVM(result.clone(), address.clone());
                    block.addInstruction(store);
                    return result;
                }
            }
        }
        specifier = unit.getGlobalTypeEnvironment().getBinding(id);
        if (specifier != null) {
            if (unit.getGlobalTypeEnvironment().isDeclaredFunction(id)) {
                throw new RuntimeException("IdentifierExpression::processLValue: '" + id + "' on line: "+ lineNum()
                        + " is a declared function" +
                        " and therefore can not be modified");
            }

            Register address = unit.getGlobalBlock().getBinding(id);
            assert address != null;

            Register result = right.clone();
            if (!PrimitiveType.comparePrimitives((PrimitiveType) specifier.getType(), (PrimitiveType) right.type())) {
                ConversionLLVM implicitConv = ConversionLLVM.make(
                        right,
                        (PrimitiveType) specifier.getType()
                );
                block.addInstruction(implicitConv);
                result = implicitConv.result().clone();
            }
            StoreLLVM store = new StoreLLVM(result.clone(), address.clone());
            block.addInstruction(store);
            return result;
        }
        throw new RuntimeException("IdentifierExpression::processLValue: Unbound Identifier " + id);
    }

    public Register getAddress(TranslationUnit unit, ControlFlowGraph cfg, BasicBlock block) {
        // check the local env
        DeclarationSpecifier specifier = cfg.getLocalEnvironment().getBinding(id);
        TypeEnvironment.StorageLocation location = cfg.getLocalEnvironment().getLocation(id);
        if (specifier != null) {
            assert location != null;
            switch (location) {
                case REGISTER -> {
                    throw new RuntimeException("IdentifierExpression::getAddress: Can't get address of register " +
                            "allocated value " + id);
                }
                case STACK -> {
                    Register address = block.getBinding(id);
                    assert address != null;
                    return address.clone();
                }
            }
        }

        // check the global env
        specifier = unit.getGlobalTypeEnvironment().getBinding(id);
        if (specifier != null) {
            Register address = unit.getGlobalBlock().getBinding(id);
            assert address != null;
            return address.clone();
        }

        throw new RuntimeException("IdentifierExpression::getAddress: Unbound Identifier " + id);
    }

}
