package ast.expr;

import ast.declarations.DeclarationSpecifier;
import ast.types.*;
import codegen.BasicBlock;
import codegen.ControlFlowGraph;
import codegen.TranslationUnit;
import codegen.instruction.llvm.ConversionInstruction;
import codegen.values.Source;
import ast.TypeEnvironment;

public class AssignmentExpression implements Expression {
    private final int lineNum;
    private final LValue left;
    private final Expression right;


    public AssignmentExpression(int lineNum, LValue left, Expression right) {
        this.lineNum = lineNum;
        this.left = left;
        this.right = right;
    }


    @Override
    public DeclarationSpecifier verifySemantics(TypeEnvironment globalEnv, TypeEnvironment localEnv) {
        DeclarationSpecifier leftDecl = left.verifySemantics(globalEnv, localEnv);
        DeclarationSpecifier rightDecl = right.verifySemantics(globalEnv, localEnv);

        if (leftDecl.getQualifier() == Type.TypeQualifier.CONST) {
            throw new RuntimeException("AssignmentExpression::verifySemantics: can't assign to a constant");
        }


        Type result;
        // if the types are primitive and non-equal, cast to the type being assigned to
        if (!(leftDecl.getType() instanceof PrimitiveType) || !(rightDecl.getType() instanceof PrimitiveType)) {
            if (!leftDecl.getType().equals(rightDecl.getType())) {
                throw new RuntimeException("AssignmentExpression::verifySemantics: left and right types do not match");
            }
            result = leftDecl.getType().clone();
        } else if ((leftDecl.getType() instanceof CompoundType) || (rightDecl.getType() instanceof CompoundType)){
            switch (leftDecl.getType()) {
                case CompoundType lct -> result = lct.clone();
                case IntegerType lit ->  result = rightDecl.getType().clone();
                default ->  throw new RuntimeException("AssignmentExpression::verifySemantics: " +
                        "can't apply implicit conversion to float and pointer");
            }
        } else {
            result = PrimitiveType.implicitConversion(
                    (NumberType) leftDecl.getType(),
                    (NumberType) rightDecl.getType()
            );
        }

        return new DeclarationSpecifier(result);
    }



    @Override
    public Source codegen(TranslationUnit unit, ControlFlowGraph cfg, BasicBlock block) {
        Source rightSource = right.codegen(unit, cfg, block);

        Source result;
        if (left instanceof IdentifierExpression idExp) {
            DeclarationSpecifier specifier = cfg.getLocalEnvironment().getBinding(idExp.getId());
            if (specifier == null) {
                block = unit.getGlobalBlock();
                specifier = unit.getGlobalTypeEnvironment().getBinding(idExp.getId());
            }
            if (specifier == null) {
                throw new RuntimeException("AssignmentExpression::codegen: Unbound Identifier " + idExp.getId());
            }

            if (!specifier.getType().equals(rightSource.type())) {
                ConversionInstruction implicitConv = ConversionInstruction.make(rightSource, (PrimitiveType) specifier.getType());
                block.addInstruction(implicitConv);
                block.addBinding(idExp.getId(), implicitConv.getResult().clone());
                result = implicitConv.getResult().clone();
            } else {
                block.addBinding(idExp.getId(), rightSource.clone());
                result = rightSource.clone();
            }

        } else {
            //Register leftRegister = left.getLValue(block);
            throw new RuntimeException("not implemented");
        }

        return result;
    }
}
