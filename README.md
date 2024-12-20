# RCC - RISC-V C Compiler

CPE Senior Project - Spring/Fall 2024

## Scope:

This project is an attempt to get a fully featured ANSI (C89) C Compiler working that targets the RISCV64 architecture.
Because of time constraints, I did not get all features up and running, but here's a checklist of what works:

### Language Features:
- [x] Binary and Unary Expressions (+/-/*/etc.)
- [x] Floating Point Numbers
- [x] Pointers and Pointer Arithmetic
- [x] Function Calls
- [x] If-Statements (without boolean short-circuiting)
- [x] While, Do, and For loops
- [x] Type Definitions
- [x] Structs
- [x] Unions

### Todo:
- [ ] Global Variables With Intial Value (Global Variables are initialized to zero by default)
- [ ] Enumerations
- [ ] Switch Statements
- [ ] Goto / Arbitrary Jumps
- [ ] Conditional Expressions ( \<expr\> ? \<expr\> : \<expr\>)

## Timeline:

### Parsing: [Status - Working]

- Created a parser using ANTLR that can parse a valid C-Program
- Implemented a Visitor that walks the resulting parse tree and generates an AST of the program

### Static Analysis: [Status - Working]

- Created a function that walks through the AST to ensure that the C program is compilable as written.
- Created a function that traverses the statements of each function to ensure that a non-void function
  always ends in a return statement. Since arbitrary jumps make this process overly complicated, the function ignores Goto statements.

### IR Codegen: [Status - Working]

- Generates a well-formatted LLVM IR that can be assembled with clang/llc to create a working executable

### Optimization Passes: [Status - Working]

- Reduces unnecessary instructions present in the IR
- Runs Aggressive Dead Code Elimination, Redundant Phi Elimination, and Constant Propagation/Folding

### RISC-V Codegen: [Status - Working]

- Translates the LLVM instructions into their RISC-V equivalents
- Properly builds the stack and register allocates


## Running

To make it as easy as possible to build and run, I included a .jar of the current build in the 'build' directory.

***Important Note:*** This project uses features from Java version 22 (unnamed variables and pattern matching) since
they remove a lot of the clutter caused by frequent 'instanceof' checks and casts.
***You must have jdk version 22 installed to run the .jar file.***

The current build of the program which does parsing and static analysis can be run with the command.

```
java -jar RCC.jar <source_file.c>
```
