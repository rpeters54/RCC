package ast.types;

import ast.TypeEnvironment;
import ast.expr.Expression;
import ast.expr.IntegerExpression;
import codegen.instruction.Instruction;
import codegen.instruction.llvm.GetElemPtrLLVM;
import codegen.instruction.llvm.LLVMInstruction;
import codegen.instruction.llvm.StoreLLVM;
import codegen.values.Literal;
import codegen.values.Register;
import codegen.values.Source;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Objects;

public class ArrayType extends Type implements CompoundType {
    private Type base;
    private long size;

    public ArrayType(Type base, long size) {
        this.base = base;
        this.size = size;
    }

    public ArrayType() {
        this.base = null;
        this.size = 0;
    }

    public Type base() {
        return base;
    }

    public void setBase(Type base) {
        this.base = base;
    }

    public void setSize(long size) {
        this.size = size;
    }

    public List<Instruction> initArrayValues(Register ptr, List<Register> values) {
        List<Instruction> inst = new ArrayList<>();
        List<Long> dimensions = new ArrayList<>();
        List<Long> currentIndex = new ArrayList<>();
        Type t = this;
        while (t instanceof ArrayType arr) {
            dimensions.add(arr.size);
            currentIndex.add((long)0);
            t = arr.base();
        }

        for (Register value : values) {
            Register offsetPtr = Register.LLVM_Register(new PointerType(this));
            List<Source> indirections = currentIndex.stream()
                    .map(Literal::longLiteral)
                    .collect(LinkedList::new, LinkedList::add, LinkedList::addAll);
            indirections.addFirst(Literal.longLiteral(0));
            indirections.addFirst(ptr);
            inst.add(new GetElemPtrLLVM(offsetPtr, indirections));
            inst.add(new StoreLLVM(value, offsetPtr));

            for (int i = currentIndex.size()-1; i >= 0; i--) {
                if (currentIndex.get(i).equals(dimensions.get(i)-1)) {
                    currentIndex.set(i, (long)0);
                } else {
                    currentIndex.set(i, currentIndex.get(i)+1);
                    break;
                }
            }
        }

        return inst;
    }

    @Override
    public long sizeof() {
        return size * base.sizeof();
    }

    //TODO, fix so it works with the constant size expression
    @Override
    public Type clone() {
        return new ArrayType(base.clone(), size);
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null) return false;
//        if (o.getClass() == VoidType.class) return true;
        if (getClass() != o.getClass()) return false;

        ArrayType arrayType = (ArrayType) o;
        return size == arrayType.size && Objects.equals(base, arrayType.base);
    }

    @Override
    public int hashCode() {
        return Objects.hash(base, size);
    }

    @Override
    public String toString() {
        return String.format("[%d x %s]", size, base.toString());
    }

    public String fmtTypeString() {
        return String.format("[%d x %s]", size, base.fmtTypeString());
    }
}
