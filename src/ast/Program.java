package ast;

import java.util.ArrayList;
import java.util.List;

public class Program {
    private List<FunctionDefinition> funcs;
    private List<Declaration> decls;

    public Program(List<FunctionDefinition> funcs,
                   List<Declaration> decls) {
        this.funcs = funcs;
        this.decls = decls;
    }

    public Program() {
        this.funcs = new ArrayList<>();
        this.decls = new ArrayList<>();
    }

    public List<FunctionDefinition> getFuncs() {
        return funcs;
    }

    public List<Declaration> getDecls() {
        return decls;
    }
}
