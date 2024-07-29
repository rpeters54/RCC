package codegen.values;

import ast.types.Type;

public interface Source {
    Type type();
    Source clone();
}
