
grammar C;

translationUnit
    : externalDeclaration*
    ;

externalDeclaration
    : functionDefinition
    | declaration
    ;

functionDefinition
    : declarationSpecifier* declarator declaration* compoundStatement
    ;

declaration
    : declarationSpecifier+ initDeclaratorList? ';'
    ;

declarationSpecifier
    : storageClassSpecifier
    | typeSpecifier
    | typeQualifier
    ;

storageClassSpecifier
    : 'auto'
    | 'register'
    | 'static'
    | 'extern'
    | 'typedef'
    ;

typeSpecifier
    : 'void'
    | 'char'
    | 'short'
    | 'int'
    | 'long'
    | 'float'
    | 'double'
    | 'signed'
    | 'unsigned'
    | structOrUnionSpecifier
    | enumSpecifier
    | typedefName
    ;

typeQualifier
    : 'const'
    | 'volatile'
    ;

structOrUnionSpecifier
    : structOrUnion Identifier? '{' structDeclarationList '}'
    | structOrUnion Identifier
    ;

structOrUnion
    : 'struct'
    | 'union'
    ;

initDeclaratorList
    : initDeclarator (',' initDeclarator)*
    ;

initDeclarator
    : declarator
    | declarator '=' initializer
    ;


structDeclarationList
    : structDeclaration+
    ;

structDeclaration // The first two rules have priority order and cannot be simplified to one expression.
    : specifierQualifierList structDeclaratorList ';'
    | specifierQualifierList ';'
    ;

specifierQualifierList
    : (typeSpecifier | typeQualifier) specifierQualifierList?
    ;

specifierQualifier
    : typeSpecifier
    | typeQualifier
    ;

structDeclaratorList
    : structDeclarator (',' structDeclarator)*
    ;

structDeclarator
    : declarator
    | declarator? ':' constantExpression
    ;

enumSpecifier
    : 'enum' Identifier? '{' enumeratorList '}'
    | 'enum' Identifier
    ;

enumeratorList
    : enumerator (',' enumerator)*
    ;

enumerator
    : Identifier
    | Identifier '=' constantExpression
    ;

declarator
    : pointer? directDeclarator
    ;

directDeclarator
    : Identifier
    | '(' declarator ')'
    | directDeclarator '[' constantExpression? ']'
    | directDeclarator '(' parameterTypeList ')'
    | directDeclarator '(' identifierList? ')'
    ;

pointer
    : '*' typeQualifier* pointer?
    ;

/* Not sure if this case is correct */
parameterTypeList
    : parameterList
    | parameterList ',' parameterList*
    ;

parameterList
    : parameterDeclaration (',' parameterDeclaration)*
    ;

parameterDeclaration
    : declarationSpecifier+ declarator
    | declarationSpecifier+ abstractDeclarator?
    ;

identifierList
    : Identifier (',' Identifier)*
    ;

initializer
    : assignmentExpression
    | '{' initializerList '}'
    | '{' initializerList ',' '}'
    ;

initializerList
    : initializer (',' initializer)*
    ;

typeName
    : specifierQualifier+ abstractDeclarator?
    ;

abstractDeclarator
    : pointer
    | pointer? directAbstractDeclarator
    ;

/* K&R Definition is Mutually-Left Recursive, so I had to modify the original structure */
directAbstractDeclarator
    : '(' abstractDeclarator ')' directAbstractDeclaratorTail*
    ;

directAbstractDeclaratorTail
    : '[' constantExpression? ']'
    | '(' parameterTypeList? ')'
    ;

typedefName
    : Identifier
    ;

statement
    : labeledStatement
    | expressionStatement
    | compoundStatement
    | selectionStatement
    | iterationStatement
    | jumpStatement
    ;

labeledStatement
    : Identifier ':' statement
    | 'case' constantExpression ':' statement
    | 'default' ':' statement
    ;

expressionStatement
    : expression? ';'
    ;

compoundStatement
    : '{' declaration* statement* '}'
    ;

selectionStatement
    : 'if' '(' expression ')' statement
    | 'if' '(' expression ')' statement 'else' statement
    | 'switch' '(' expression ')' statement
    ;

iterationStatement
    : 'while' '(' expression ')' statement
    | 'do' statement 'while' '(' expression ')' ';'
    | 'for' '(' expression? ';' expression? ';' expression? ')' statement
    ;

jumpStatement
    : 'goto' Identifier ';'
    | 'continue' ';'
    | 'break' ';'
    | 'return' expression? ';'
    ;

expression
    : assignmentExpression (',' assignmentExpression)*
    ;

assignmentExpression
    : conditionalExpression
    | unaryExpression ('=' | '*=' | '/=' | '%=' | '+=' | '-=' | '<<=' | '>>=' | '&=' | '^=' | '|=') assignmentExpression
    ;

conditionalExpression
    : logicalOrExpression
    | logicalOrExpression '?' expression ':' conditionalExpression
    ;

constantExpression
    : conditionalExpression
    ;

logicalOrExpression
    : logicalAndExpression ('||' logicalAndExpression)*
    ;

logicalAndExpression
    : inclusiveOrExpression ('&&' inclusiveOrExpression)*
    ;

inclusiveOrExpression
    : exclusiveOrExpression ('|' exclusiveOrExpression)*
    ;

exclusiveOrExpression
    : andExpression ('^' andExpression)*
    ;

andExpression
    : equalityExpression ('&' equalityExpression)*
    ;

equalityExpression
    : relationalExpression (('==' | '!=') relationalExpression)*
    ;

relationalExpression
    : shiftExpression (('<' | '>' | '<=' | '>=') shiftExpression)*
    ;

shiftExpression
    : additiveExpression (('<<' | '>>') additiveExpression)*
    ;

additiveExpression
    : multiplicativeExpression (('+' | '-') multiplicativeExpression)*
    ;

multiplicativeExpression
    : castExpression (('*' | '/' | '%') castExpression)*
    ;

castExpression
    : unaryExpression
    | '(' typeName ')' castExpression
    ;

unaryExpression
    : postfixExpression
    | '++' unaryExpression
    | '--' unaryExpression
    | ('&' | '*' | '+' | '-' | '~' | '!') castExpression
    | 'sizeof' unaryExpression
    | 'sizeof' '(' typeName ')'
    ;

postfixExpression
    : primaryExpression
    | postfixExpression '[' expression ']'
    | postfixExpression '(' argumentExpressionList? ')'
    | postfixExpression '.' Identifier
    | postfixExpression '->' Identifier
    | postfixExpression '++'
    | postfixExpression '--'
    ;

primaryExpression
    : Identifier
    | constant
    | StringLiteral
    | '(' expression ')'
    ;

argumentExpressionList
    : assignmentExpression (',' assignmentExpression)*
    ;

/* Below is borrowed from ANTLR c99 grammar */
/* May introduce unintended features */
constant
    : IntegerConstant
    | FloatingConstant
    | EnumerationConstant
    | CharacterConstant
    ;

Identifier
    : IdentifierNondigit (IdentifierNondigit | Digit)*
    ;

fragment IdentifierNondigit
    : Nondigit
    | UniversalCharacterName
    //|   // other implementation-defined characters...
    ;

fragment Nondigit
    : [a-zA-Z_]
    ;

fragment Digit
    : [0-9]
    ;

fragment UniversalCharacterName
    : '\\u' HexQuad
    | '\\U' HexQuad HexQuad
    ;

fragment HexQuad
    : HexadecimalDigit HexadecimalDigit HexadecimalDigit HexadecimalDigit
    ;

EnumerationConstant : Identifier ;

IntegerConstant
    : DecimalConstant IntegerSuffix?
    | OctalConstant IntegerSuffix?
    | HexadecimalConstant IntegerSuffix?
    | BinaryConstant
    ;

fragment BinaryConstant
    : '0' [bB] [0-1]+
    ;

fragment DecimalConstant
    : NonzeroDigit Digit*
    ;

fragment OctalConstant
    : '0' OctalDigit*
    ;

fragment HexadecimalConstant
    : HexadecimalPrefix HexadecimalDigit+
    ;

fragment HexadecimalPrefix
    : '0' [xX]
    ;

fragment NonzeroDigit
    : [1-9]
    ;

fragment OctalDigit
    : [0-7]
    ;

fragment HexadecimalDigit
    : [0-9a-fA-F]
    ;

fragment IntegerSuffix
    : UnsignedSuffix LongSuffix?
    | UnsignedSuffix LongLongSuffix
    | LongSuffix UnsignedSuffix?
    | LongLongSuffix UnsignedSuffix?
    ;

fragment UnsignedSuffix
    : [uU]
    ;

fragment LongSuffix
    : [lL]
    ;

fragment LongLongSuffix
    : 'll'
    | 'LL'
    ;

FloatingConstant
    : DecimalFloatingConstant
    | HexadecimalFloatingConstant
    ;

fragment DecimalFloatingConstant
    : FractionalConstant ExponentPart? FloatingSuffix?
    | DigitSequence ExponentPart FloatingSuffix?
    ;

fragment HexadecimalFloatingConstant
    : HexadecimalPrefix (HexadecimalFractionalConstant | HexadecimalDigitSequence) BinaryExponentPart FloatingSuffix?
    ;

fragment FractionalConstant
    : DigitSequence? '.' DigitSequence
    | DigitSequence '.'
    ;

fragment ExponentPart
    : [eE] Sign? DigitSequence
    ;

fragment Sign
    : [+-]
    ;

DigitSequence
    : Digit+
    ;

fragment HexadecimalFractionalConstant
    : HexadecimalDigitSequence? '.' HexadecimalDigitSequence
    | HexadecimalDigitSequence '.'
    ;

fragment BinaryExponentPart
    : [pP] Sign? DigitSequence
    ;

fragment HexadecimalDigitSequence
    : HexadecimalDigit+
    ;

fragment FloatingSuffix
    : [flFL]
    ;

CharacterConstant
    : '\'' CCharSequence '\''
    | 'L\'' CCharSequence '\''
    | 'u\'' CCharSequence '\''
    | 'U\'' CCharSequence '\''
    ;

fragment CCharSequence
    : CChar+
    ;

fragment CChar
    : ~['\\\r\n]
    | EscapeSequence
    ;

fragment EscapeSequence
    : SimpleEscapeSequence
    | OctalEscapeSequence
    | HexadecimalEscapeSequence
    | UniversalCharacterName
    ;

fragment SimpleEscapeSequence
    : '\\' ['"?abfnrtv\\]
    ;

fragment OctalEscapeSequence
    : '\\' OctalDigit OctalDigit? OctalDigit?
    ;

fragment HexadecimalEscapeSequence
    : '\\x' HexadecimalDigit+
    ;

StringLiteral
    : EncodingPrefix? '"' SCharSequence? '"'
    ;

fragment EncodingPrefix
    : 'u8'
    | 'u'
    | 'U'
    | 'L'
    ;

fragment SCharSequence
    : SChar+
    ;

fragment SChar
    : ~["\\\r\n]
    | EscapeSequence
    | '\\\n'   // Added line
    | '\\\r\n' // Added line
    ;

Whitespace
    : [ \t]+ -> channel(HIDDEN)
    ;

Newline
    : ('\r' '\n'? | '\n') -> channel(HIDDEN)
    ;

MultiLineMacro
    : '#' (~[\n]*? '\\' '\r'? '\n')+ ~ [\n]+ -> channel (HIDDEN)
    ;

Directive
    : '#' ~ [\n]* -> channel (HIDDEN)
    ;

BlockComment
    : '/*' .*? '*/' -> channel(HIDDEN)
    ;

LineComment
    : '//' ~[\r\n]* -> channel(HIDDEN)
    ;