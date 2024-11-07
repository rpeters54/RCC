package ast.expr;

import ast.declarations.DeclarationSpecifier;
import ast.types.*;
import codegen.BasicBlock;
import codegen.ControlFlowGraph;
import codegen.TranslationUnit;
import codegen.instruction.llvm.ConversionInstruction;
import codegen.instruction.llvm.LoadInstruction;
import codegen.instruction.llvm.StoreInstruction;
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
    public Source codegen(TranslationUnit unit, ControlFlowGraph cfg, BasicBlock block) {

        DeclarationSpecifier specifier = cfg.getLocalEnvironment().getBinding(id);
        TypeEnvironment.StorageLocation location = cfg.getLocalEnvironment().getLocation(id);
        if (specifier != null) {
            assert location != null;
            // try to get value from block environment
            Source value = block.getBinding(id);
            // if not in current block environment, look for previous definitions
            if (value == null) {
                Pair<List<String>, List<Source>> pair = cfg.findPreviousDefinitions(block, id);
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
                    Type baseType = pt.base();
                    switch (baseType) {
                        case ArrayType at -> { return value.clone(); }
                        case StructType st -> { return value.clone(); }
                        case UnionType ut -> { return value.clone(); }
                        case PrimitiveType primt -> {
                            Register result = Register.LLVM_Register(baseType.clone());
                            LoadInstruction load = new LoadInstruction(result.clone(), value.clone());
                            block.addInstruction(load);
                            return result;
                        }
                        case null, default -> {
                            throw new RuntimeException("IdentifierExpression::codegen: invalid type " + baseType);
                        }
                    }
                }
            }

        }


        // if not locally defined, check global definitions
        specifier = unit.getGlobalTypeEnvironment().getBinding(id);
        if (specifier != null) {
            Source address = unit.getGlobalBlock().getBinding(id);
            assert address != null;
            assert address.type() instanceof PointerType;
            PointerType pt = (PointerType) address.type();
            Register result = Register.LLVM_Register(pt.base().clone());
            LoadInstruction load = new LoadInstruction(result.clone(), address.clone());
            block.addInstruction(load);
            return result;
        }
        throw new RuntimeException("IdentifierExpression::codegen: Unbound Identifier " + id);
    }

    @Override
    public Source processLValue(TranslationUnit unit, ControlFlowGraph cfg, BasicBlock block, Source right) {
        // find where the value is specified
        DeclarationSpecifier specifier = cfg.getLocalEnvironment().getBinding(id);
        TypeEnvironment.StorageLocation location = cfg.getLocalEnvironment().getLocation(id);
        if (specifier != null) {
            assert location != null;
            switch (location) {
                case REGISTER ->  {
                    // convert the value if necessary
                    if (!PrimitiveType.comparePrimitives((PrimitiveType) specifier.getType(), (PrimitiveType) right.type())) {
                        ConversionInstruction implicitConv = ConversionInstruction.make(
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
                    Source address = block.getBinding(id);
                    assert address != null;

                    Source result = right.clone();
                    if (!PrimitiveType.comparePrimitives((PrimitiveType) specifier.getType(), (PrimitiveType) right.type())) {
                        ConversionInstruction implicitConv = ConversionInstruction.make(
                                right,
                                (PrimitiveType) specifier.getType()
                        );
                        block.addInstruction(implicitConv);
                        result = implicitConv.result().clone();
                    }
                    StoreInstruction store = new StoreInstruction(result.clone(), address.clone());
                    block.addInstruction(store);
                    return result;
                }
            }
        }
        specifier = unit.getGlobalTypeEnvironment().getBinding(id);
        if (specifier != null) {
            Source address = unit.getGlobalBlock().getBinding(id);
            assert address != null;

            Source result = right.clone();
            if (!PrimitiveType.comparePrimitives((PrimitiveType) specifier.getType(), (PrimitiveType) right.type())) {
                ConversionInstruction implicitConv = ConversionInstruction.make(
                        right,
                        (PrimitiveType) specifier.getType()
                );
                block.addInstruction(implicitConv);
                result = implicitConv.result().clone();
            }
            StoreInstruction store = new StoreInstruction(result.clone(), address.clone());
            block.addInstruction(store);
            return result;
        }
        throw new RuntimeException("IdentifierExpression::processLValue: Unbound Identifier " + id);
    }

    public Source getAddress(TranslationUnit unit, ControlFlowGraph cfg, BasicBlock block) {
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
                    Source address = block.getBinding(id);
                    assert address != null;
                    return address.clone();
                }
            }
        }

        // check the global env
        specifier = unit.getGlobalTypeEnvironment().getBinding(id);
        if (specifier != null) {
            Source address = unit.getGlobalBlock().getBinding(id);
            if (address == null) {
                System.out.println("Here");
            }
            assert address != null;
            return address.clone();
        }

        throw new RuntimeException("IdentifierExpression::getAddress: Unbound Identifier " + id);
    }

}
