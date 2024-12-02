package ast.expr;

import ast.declarations.Declaration;
import ast.declarations.DeclarationSpecifier;
import ast.types.*;
import codegen.BasicBlock;
import codegen.ControlFlowGraph;
import codegen.TranslationUnit;
import codegen.instruction.llvm.ConversionLLVM;
import codegen.instruction.llvm.GetElemPtrLLVM;
import codegen.instruction.llvm.LoadLLVM;
import codegen.instruction.llvm.StoreLLVM;
import codegen.values.Literal;
import codegen.values.Register;
import codegen.values.Source;
import ast.TypeEnvironment;

import java.util.Arrays;
import java.util.List;

public class DotExpression extends LValue {
    private final Expression operand;
    private final String member;

    public DotExpression(int lineNum, Expression operand, String member) {
        super(lineNum);
        this.operand = operand;
        this.member = member;
    }

    @Override
    public DeclarationSpecifier verifySemantics(TypeEnvironment globalEnv, TypeEnvironment localEnv, TypeEnvironment.StorageLocation location) {
        DeclarationSpecifier structOrUnion = operand.verifySemantics(globalEnv, localEnv, TypeEnvironment.StorageLocation.REGISTER);

        // get the list of struct/union members
        List<Declaration> members;
        switch (structOrUnion.getType()) {
            case StructType s -> {
                if (s.members().isEmpty()) {
                    s = globalEnv.getStruct(s.name());
                }
                members = s.members();
            }
            case UnionType u -> {
                if (u.members().isEmpty()) {
                    u = globalEnv.getUnion(u.name());
                }
                members = u.members();
            }
            default -> throw new RuntimeException("DotExpression::verifySemantics: called with non-struct or union type");
        }

        // find the member and return its DeclarationSpecifiers
        List<String> memberNames = members.stream().map(Declaration::name).toList();
        int index = memberNames.indexOf(member);
        if (index == -1)
            throw new RuntimeException("DotExpression::verifySemantics: member " + member + " not found");
        return members.get(index).declSpec();
    }

    @Override
    public Register codegen(TranslationUnit unit, ControlFlowGraph cfg, BasicBlock block) {
        Register operandSource = operand.codegen(unit, cfg, block);
        if (!(operandSource.type() instanceof PointerType pt)) {
            throw new RuntimeException("DotExpression::codegen: Can't use dot operator on type: " + operandSource.type());
        }

        switch (pt.base()) {
            case StructType struct -> {
                Register offsetPtr = structOffset(unit, cfg, block, struct, operandSource);

                Type expandedType = unit.getGlobalTypeEnvironment()
                        .expandDeclaration(new DeclarationSpecifier(((PointerType)offsetPtr.type()).base())).getType();

                switch (expandedType) {
                    case ArrayType at -> { return offsetPtr; }
                    case StructType st -> { return offsetPtr; }
                    case UnionType ut -> { return offsetPtr; }
                    case PrimitiveType primt -> {
                        Register result = Register.LLVM_Register(expandedType);
                        block.addInstruction(new LoadLLVM(result.clone(), offsetPtr));
                        return result;
                    }
                    case null, default -> {
                        throw new RuntimeException("DotExpression::codegen: invalid type " +
                                expandedType);
                    }
                }
            }
            case UnionType union -> {
                Type deref = unit.getGlobalTypeEnvironment()
                        .expandDeclaration(new DeclarationSpecifier(union.typeOfMember(member))).getType();

                ConversionLLVM conv = ConversionLLVM.make(operandSource, new PointerType(deref));
                block.addInstruction(conv);

                Register castedPtr = conv.result();

                switch (deref) {
                    case ArrayType at -> { return castedPtr; }
                    case StructType st -> { return castedPtr; }
                    case UnionType ut -> { return castedPtr; }
                    case PrimitiveType primt -> {
                        // add the necessary bitcast and load
                        Register result = Register.LLVM_Register(deref);
                        block.addInstruction(new LoadLLVM(result, conv.result()));
                        return result;
                    }
                    case null, default -> {
                        throw new RuntimeException("DotExpression::codegen: invalid type " + castedPtr);
                    }
                }
            }
            case null, default -> throw new RuntimeException("DotExpression::codegen: called with non-struct or union type");
        }
    }

    @Override
    public Register processLValue(TranslationUnit unit, ControlFlowGraph cfg, BasicBlock block, Register right) {
        Register operandReg = operand.codegen(unit, cfg, block);
        if (!(operandReg.type() instanceof PointerType pt)) {
            throw new RuntimeException("DotExpression::codegen: Can't use dot operator on type: " + operandReg.type());
        }

        switch (pt.base()) {
            case StructType struct -> {
                Register offsetPtr = structOffset(unit, cfg, block, struct, operandReg);

                Register optionalCast;
                if (struct.typeOfMember(member) instanceof PrimitiveType) {
                    if (!PrimitiveType.comparePrimitives((PrimitiveType) struct.typeOfMember(member), (PrimitiveType) right.type())) {
                        ConversionLLVM implicitConv = ConversionLLVM.make(
                                right,
                                (PrimitiveType) struct.typeOfMember(member)
                        );
                        block.addInstruction(implicitConv);
                        optionalCast = implicitConv.result().clone();
                    } else {
                        optionalCast = right;
                    }
                } else {
                    optionalCast = right;
                }


                StoreLLVM store = new StoreLLVM(optionalCast, offsetPtr);
                block.addInstruction(store);

                return null;
            }
            case UnionType union -> {
                Type deref = unit.getGlobalTypeEnvironment()
                        .expandDeclaration(new DeclarationSpecifier(union.typeOfMember(member))).getType();

                // add the necessary bitcast and load
                ConversionLLVM conv = ConversionLLVM.make(operandReg, new PointerType(deref));
                block.addInstruction(conv);
                block.addInstruction(new StoreLLVM(right, conv.result()));

                return null;
            }
            case null, default -> throw new RuntimeException("DotExpression::codegen: called with non-struct or union type");
        }
    }

    public Register handleRef(TranslationUnit unit, ControlFlowGraph cfg, BasicBlock block) {
        Source operandSource = operand.codegen(unit, cfg, block);
        if (!(operandSource.type() instanceof PointerType pt)) {
            throw new RuntimeException("DotExpression::codegen: Can't use dot operator on type: " + operandSource.type());
        }

        switch (pt.base()) {
            case StructType struct -> {
                return structOffset(unit, cfg, block, struct, operandSource);
            }
            case UnionType union -> {
                throw new RuntimeException("Not Implemented");
            }
            case null, default -> throw new RuntimeException("DotExpression::codegen: called with non-struct or union type");
        }
    }

    public Register structOffset(TranslationUnit unit, ControlFlowGraph cfg, BasicBlock block,
                               StructType struct, Source operand) {
        // if the members aren't included in the variable definition,
        // look up the top level defn for the struct
        if (struct.members().isEmpty()) {
            struct = unit.getGlobalTypeEnvironment().getStruct(struct.name());
        }

        int index = struct.indexOfMember(member);
        Type memberType =  unit.getGlobalTypeEnvironment()
                .expandDeclaration(new DeclarationSpecifier(struct.typeOfMember(member))).getType();

        // Step through the struct pointer
        Source stepThrough = new Literal("0", new IntegerType());
        // position of member in the type
        Source indexVal = new Literal(Integer.toString(index), new IntegerType());

        // ptr offset and result
        Register offsetPtr = Register.LLVM_Register(new PointerType(memberType));

        GetElemPtrLLVM gep = new GetElemPtrLLVM(offsetPtr.clone(),
                Arrays.asList(operand, stepThrough, indexVal));
        block.addInstruction(gep);

        return offsetPtr;
    }


}
