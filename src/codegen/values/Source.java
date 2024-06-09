package codegen.values;

import ast.types.Type;

public interface Source {
    Type getType();
    Source copy(Type type);
}
