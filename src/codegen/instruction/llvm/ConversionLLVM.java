package codegen.instruction.llvm;

import ast.expr.BinaryExpression;
import ast.types.*;
import codegen.instruction.Instruction;
import codegen.instruction.riscv.BinaryImmRisc;
import codegen.instruction.riscv.BinaryRisc;
import codegen.instruction.riscv.FloatConversionRisc;
import codegen.values.Register;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class ConversionLLVM extends LLVMInstruction {

    private final ConversionType type;

    private ConversionLLVM(Register result, Register operand, ConversionType type) {
        super(Arrays.asList(result), Arrays.asList(operand));
        this.type = type;
    }

    public static ConversionLLVM make(Register operand, PrimitiveType target) {
        if (!(operand.type() instanceof PrimitiveType opType)) {
            throw new RuntimeException("ConversionInstruction::make operand must be a primitive type");
        }

        ConversionType type;

        switch (opType) {
            case IntegerType op -> {
                switch (target) {
                    case IntegerType it -> {
                        if (op.isSameOrLarger(it)) {
                            type = ConversionType.TRUNC;
                        } else {
                            if (it.signed()) {
                                type = ConversionType.SEXT;
                            } else {
                                type = ConversionType.ZEXT;
                            }
                        }
                    }
                    case FloatingType ft -> {
                        if (op.signed()) {
                            type = ConversionType.SITOFP;
                        } else {
                            type = ConversionType.UITOFP;
                        }
                    }
                    case PointerType pt -> type = ConversionType.INTTOPTR;
                    case null, default -> throw new RuntimeException("ConversionInstruction::make operand must be a valid primitive type");
                }
            }
            case FloatingType op -> {
                switch (target) {
                    case IntegerType it -> {
                        if (it.signed()) {
                            type = ConversionType.FPTOSI;
                        } else {
                            type = ConversionType.FPTOUI;
                        }
                    }
                    case FloatingType ft -> {
                        if (op.isSameOrLarger(ft)) {
                            type = ConversionType.FPTRUNC;
                        } else {
                            type = ConversionType.FPEXT;
                        }
                    }
                    case null, default -> throw new RuntimeException("ConversionInstruction::make operand must be a valid primitive type");
                }
            }
            case PointerType lpt -> {
                switch (target) {
                    case IntegerType rit -> type = ConversionType.PTRTOINT;
                    case PointerType rpt -> type = ConversionType.BITCAST;
                    case null, default -> throw new RuntimeException("ConversionInstruction::make operand must be a valid primitive type");
                }
            }
            case null, default -> throw new RuntimeException("ConversionInstruction::make operand must be a valid primitive type");
        }

        Register result = Register.LLVM_Register(target);
        return new ConversionLLVM(result, operand, type);
    }

    @Override
    public String toString() {
        String op = switch (type) {
            case TRUNC -> "trunc";
            case SEXT -> "sext";
            case ZEXT -> "zext";

            case SITOFP -> "sitofp";
            case UITOFP -> "uitofp";
            case FPTOSI -> "fptosi";
            case FPTOUI -> "fptoui";

            case FPTRUNC -> "fptrunc";
            case FPEXT -> "fpext";

            case INTTOPTR -> "inttoptr";
            case PTRTOINT -> "ptrtoint";
            case BITCAST -> "bitcast";
        };
        return String.format("%s = %s %s %s to %s", this.result(), op, this.rvalue(0).type(),
                this.rvalue(0), this.result().type());
    }

    public enum ConversionType {
        TRUNC, ZEXT, SEXT, FPTRUNC, FPEXT, FPTOUI, FPTOSI, UITOFP, SITOFP, PTRTOINT, INTTOPTR, BITCAST
    }

    @Override
    public List<Instruction> toRisc(List<Register> localResults, List<Register> localRvalues) {
        List<Instruction> instructions = new ArrayList<>();

        Register localResult = localResults.getFirst();
        Register operand = localRvalues.getFirst();
        switch(type) {
            case TRUNC -> {
                assert localResult.type() instanceof IntegerType;
                IntegerType resultIt = (IntegerType) localResult.type();
                BinaryExpression.Operator sr = resultIt.signed() ?
                        BinaryExpression.Operator.SR_A : BinaryExpression.Operator.SR;
                addShifts(instructions, sr, localResult, operand);
            }
            case SEXT -> addShifts(instructions, BinaryExpression.Operator.SR_A, localResult, operand);
            case ZEXT -> addShifts(instructions, BinaryExpression.Operator.SR, localResult, operand);
            case SITOFP, UITOFP, FPTOSI, FPTOUI, FPTRUNC, FPEXT ->
                    instructions.add(new FloatConversionRisc(localResult.clone(), operand.clone()));
            case INTTOPTR, PTRTOINT, BITCAST -> instructions.addAll(BinaryRisc.Mov(localResult, operand));
        }
        return instructions;
    }

    protected static void addShifts(List<Instruction> instructions, BinaryExpression.Operator shr_op,
                                  Register result, Register operand) {
        assert result.type() instanceof IntegerType;
        assert operand.type() instanceof IntegerType;

        IntegerType resultIt = (IntegerType) result.type();
        IntegerType sourceIt = (IntegerType) operand.type();

        Register interResult1 = Register.LLVM_Register(result.type());

        long shift = Math.abs(IntegerType.sizeDiff(sourceIt, resultIt));
        instructions.add(new BinaryImmRisc(interResult1.clone(), BinaryExpression.Operator.SL,
                operand.clone(), shift));
        instructions.add(new BinaryImmRisc(result.clone(), shr_op,
                interResult1, shift));
    }
}
