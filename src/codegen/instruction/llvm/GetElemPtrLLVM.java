package codegen.instruction.llvm;

import ast.expr.BinaryExpression;
import ast.types.*;
import codegen.instruction.Instruction;
import codegen.instruction.riscv.BinaryImmRisc;
import codegen.instruction.riscv.BinaryRisc;
import codegen.instruction.riscv.LoadImmRisc;
import codegen.values.Literal;
import codegen.values.Register;
import codegen.values.Source;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class GetElemPtrLLVM extends LLVMInstruction {

    private final List<Source> indirections;

    public GetElemPtrLLVM(Register result, List<Source> indirections) {
        super(Arrays.asList(result), new ArrayList<>());
        this.indirections = indirections;
    }

    @Override
    public List<Register> rvalues() {
        return indirections.stream()
                .filter(item -> item instanceof Register)
                .map(item -> (Register) item).toList();
    }


    @Override
    public Register rvalue(int index) {
        List<Register> item = rvalues();
        return item.get(index);
    }

    @Override
    public void addRValue(Register register) {
        indirections.add(register);
    }

    @Override
    public void setRvalue(int index, Register register) {
        List<Register> items = rvalues();
        Register item = items.get(index);
        int realIndex = indirections.indexOf(item);
        indirections.set(realIndex, register);
    }


    @Override
    public String toString() {
        if (!(rvalue(0).type() instanceof PointerType)) {
            throw new RuntimeException("GetElemPtrInstruction can only be used with a PointerType");
        }
        Type internal = ((PointerType) rvalue(0).type()).base();
        String deref = switch(internal) {
            case PointerType pt -> pt.typeString();
            case CompoundType ct -> ct.typeString();
            default -> internal.toString();
        };
        StringBuilder builder = new StringBuilder();
        builder.append(String.format("%s = getelementptr inbounds %s", result(), deref));
        for (Source source : indirections) {
            builder.append(String.format(", %s %s", source.type(), source));
        }
        return builder.toString();
    }

    @Override
    public List<Instruction> toRisc(List<Register> localResults, List<Register> localRvalues) {
        List<Instruction> risc = new ArrayList<>();

        assert indirections.getFirst() instanceof Register;
        Register ptr = (Register) indirections.getFirst();
        Type temp = ptr.type();

        for (int i = 1; i < indirections.size(); i++) {
            Source source = indirections.get(i);
            switch (temp) {
                case PointerType pt -> {
                    ptr = handlePointerAndArrayOffset(ptr, source, pt.base(), risc);
                    temp = pt.base();
                }
                case ArrayType at -> {
                    ptr = handlePointerAndArrayOffset(ptr, source, at.base(), risc);
                    temp = at.base();
                }
                case StructType st -> {
                    int index;
                    switch (source) {
                        case Register reg -> throw new RuntimeException("StructType should not have register index");
                        case Literal lit -> index = Integer.parseInt(lit.value());
                        default -> throw new RuntimeException("Invalid source type");
                    }
                    long offsetValue = st.offset(index);
                    Literal offset = new Literal(Long.toString(offsetValue), new IntegerType(IntegerType.Width.LONG, true));
                    Register newPtr = Register.LLVM_Register(new IntegerType(IntegerType.Width.LONG, true));
                    risc.add(new BinaryImmRisc(newPtr.clone(), BinaryExpression.Operator.PLUS, ptr, offset));
                    ptr = newPtr;
                }
                case null, default -> throw new RuntimeException("Can't handle other types");
            }
        }
        risc.addAll(BinaryRisc.Mov(localResults.getFirst().clone(), ptr));
        return risc;
    }

    private Register handlePointerAndArrayOffset(Register basePtr, Source source, Type base, List<Instruction> risc) {
        long factorValue = base.sizeof();
        Register factor = Register.LLVM_Register(new IntegerType(IntegerType.Width.LONG, true));
        Register product = Register.LLVM_Register(new IntegerType(IntegerType.Width.LONG, true));
        Register offsetPtr = Register.LLVM_Register(basePtr.type());
        risc.add(new LoadImmRisc(factor.clone(), new Literal(Long.toString(factorValue),
                new IntegerType(IntegerType.Width.LONG, true))));
        switch (source) {
            case Register reg -> {
                risc.add(new BinaryRisc(product.clone(), BinaryExpression.Operator.TIMES, factor, reg.clone()));
                risc.add(new BinaryRisc(offsetPtr.clone(), BinaryExpression.Operator.PLUS, product, basePtr));
            }
            case Literal lit -> {
                Register temp = Register.LLVM_Register(new IntegerType(IntegerType.Width.LONG, true));
                risc.add(new LoadImmRisc(temp.clone(), lit.clone()));
                risc.add(new BinaryRisc(product.clone(), BinaryExpression.Operator.TIMES, factor, temp));
                risc.add(new BinaryRisc(offsetPtr.clone(), BinaryExpression.Operator.PLUS, product, basePtr));
            }
            default -> throw new IllegalArgumentException("Null value");
        }
        return offsetPtr;
    }
}
