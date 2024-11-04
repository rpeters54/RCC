package codegen.instruction.llvm;

import ast.types.*;
import codegen.instruction.Instruction;
import codegen.values.Register;
import codegen.values.Source;

import java.util.Arrays;

public class ConversionInstruction extends Instruction {

    private final ConversionType type;

    private ConversionInstruction(Register result, Source operand, ConversionType type) {
        super(Arch.LLVM, Arrays.asList(result), Arrays.asList(operand));
        this.type = type;
    }

    public static ConversionInstruction make(Source operand, PrimitiveType target) {
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
                    case FloatingType _ -> {
                        if (op.signed()) {
                            type = ConversionType.SITOFP;
                        } else {
                            type = ConversionType.UITOFP;
                        }
                    }
                    case PointerType _ -> type = ConversionType.INTTOPTR;
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
            case PointerType _ -> {
                switch (target) {
                    case IntegerType _ -> type = ConversionType.PTRTOINT;
                    case PointerType _ -> type = ConversionType.BITCAST;
                    case null, default -> throw new RuntimeException("ConversionInstruction::make operand must be a valid primitive type");
                }
            }
            case null, default -> throw new RuntimeException("ConversionInstruction::make operand must be a valid primitive type");
        }

        Register result = Register.LLVM_Register(target);
        return new ConversionInstruction(result, operand, type);
    }

    @Override
    public String toString() {
        String op = switch (type) {
            case TRUNC -> "trunc";
            case SEXT -> "sext";
            case ZEXT -> "zext";
            case SITOFP -> "sitofp";
            case UITOFP -> "uitofp";
            case INTTOPTR -> "inttoptr";
            case FPTOSI -> "fptosi";
            case FPTOUI -> "fptoui";
            case FPTRUNC -> "fptrunc";
            case FPEXT -> "fpext";
            case PTRTOINT -> "ptrtoint";
            case BITCAST -> "bitcast";
        };
        return String.format("%s = %s %s %s to %s", this.result(), op, this.source(0).type(),
                this.source(0), this.result().type());
    }

    public enum ConversionType {
        TRUNC, ZEXT, SEXT, FPTRUNC, FPEXT, FPTOUI, FPTOSI, UITOFP, SITOFP, PTRTOINT, INTTOPTR, BITCAST
    }
}
