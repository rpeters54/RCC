# RCC - RISC-V C Compiler

## Timeline:

### Parsing: [Status - Working/Testing]

- Created a parser using ANTLR that can parse a valid C-Program
- Implemented a Visitor that walks the resulting parse tree and generates an AST of the program
### Static Analysis: [Status - Working/Testing]

- Created a function that walks through the AST to ensure that the C program is compilable as written.
- Created a function that traverses the statements of each function to ensure that a non-void function 
always ends in a return statement. Since arbitrary jumps make this process overly complicated, the function ignores Goto statements.

### Simple Codegen (Expressions): [Status - In Progress]

- To get something simple running ASAP, I am going to start by writing a simple routine that walks expressions and
directly generates valid RISC-V code.
- I will start with the integer math instructions and move to the floating point instructions when possible.

## Building

