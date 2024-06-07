# RCC - RISC-V C Compiler

CPE Senior Project - Spring/Fall 2024

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

## Running

To make it as easy as possible to build and run, I included a .jar of the current build in the 'build' directory.

***Important Note:*** This project uses features from Java version 22 (unnamed variables and pattern matching) since
they remove a lot of the clutter caused by frequent 'instanceof' checks and casts.
***You must have jdk version 22 installed to run the .jar file.***

The current build of the program which does parsing and static analysis can be run with the command.

```
java -jar RCC.jar <source_file.c>
```
