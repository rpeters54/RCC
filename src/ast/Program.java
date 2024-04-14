package ast;

import java.lang.reflect.Array;
import java.util.ArrayList;

public class Program {
    private ArrayList<FunctionDeclaration> funcs;
    private ArrayList<GeneralDeclaration> decls;

    public Program(ArrayList<FunctionDeclaration> funcs,
                   ArrayList<GeneralDeclaration> decls) {
        this.funcs = funcs;
        this.decls = decls;
    }
}
