package ast.expr;

import ast.declarations.Declaration;
import ast.declarations.DeclarationSpecifier;
import ast.types.EnumType;
import ast.types.StructType;
import ast.types.UnionType;
import semantics.TypeEnvironment;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class DotExpression implements Expression {
    private final int lineNum;
    private final Expression operand;
    private final String member;

    public DotExpression(int lineNum, Expression operand, String member) {
        this.lineNum = lineNum;
        this.operand = operand;
        this.member = member;
    }

    @Override
    public DeclarationSpecifier verifySemantics(TypeEnvironment globalEnv, TypeEnvironment localEnv) {
        DeclarationSpecifier structOrUnion = operand.verifySemantics(globalEnv, localEnv);

        // get the list of struct/union members
        List<Declaration> members;
        switch (structOrUnion.getType()) {
            case StructType s -> members = s.getMembers();
            case UnionType u -> members = u.getMembers();
            default -> throw new RuntimeException("DotExpression::verifySemantics: called with non-struct or union type");
        }

        // find the member and return its DeclarationSpecifiers
        List<String> memberNames = members.stream().map(Declaration::getName).toList();
        int index = memberNames.indexOf(member);
        if (index == -1)
            throw new RuntimeException("DotExpression::verifySemantics: member " + member + " not found");
        return members.get(index).getDeclSpec();
    }
}
