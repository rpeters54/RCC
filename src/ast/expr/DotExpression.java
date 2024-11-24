package ast.expr;

import ast.declarations.Declaration;
import ast.declarations.DeclarationSpecifier;
import ast.types.*;
import codegen.BasicBlock;
import codegen.ControlFlowGraph;
import codegen.TranslationUnit;
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
        Source operandSource = operand.codegen(unit, cfg, block);
        if (!(operandSource.type() instanceof PointerType pt)) {
            throw new RuntimeException("DotExpression::codegen: Can't use dot operator on type: " + operandSource.type());
        }

        switch (pt.base()) {
            case StructType struct -> {
                Register offsetPtr = structOffset(unit, cfg, block, struct, operandSource);

                Type expandedType = unit.getGlobalTypeEnvironment()
                        .expandDeclaration(new DeclarationSpecifier(((PointerType)offsetPtr.type()).base())).getType();
                Register result = Register.LLVM_Register(expandedType);
                LoadLLVM load = new LoadLLVM(result.clone(), offsetPtr);
                block.addInstruction(load);

                return result;
            }
            case UnionType union -> {
                throw new RuntimeException("Not Implemented");
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

                StoreLLVM store = new StoreLLVM(right, offsetPtr);
                block.addInstruction(store);

                return null;
            }
            case UnionType union -> {
                throw new RuntimeException("Not Implemented");
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
