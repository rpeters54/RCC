grammar C;

translationUnit
    : externalDeclaration* EOF
    ;

externalDeclaration
    : functionDefinition
    | declaration
    ;

functionDefinition
    : retType=declarationSpecifier* name=declarator args=declaration* body=compoundStatement
    ;

declaration
    : typeDeclaraion
    | type=declarationSpecifier+ initDeclaratorList? ';'
    ;

typeDeclaraion
    : 'typedef' declarationSpecifier+ initDeclaratorList ';'
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
    | Identifier
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
    | declarator? ':' constantExpressionList
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
    | Identifier '=' constantExpressionList
    ;

declarator
    : pointer? directDeclarator
    ;

directDeclarator    //function declarations
    : Identifier
    | '(' declarator ')'
    | directDeclarator '[' constantExpressionList? ']'
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
    : expression
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
    : '[' constantExpressionList? ']'
    | '(' parameterTypeList? ')'
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
    : Identifier ':' statement                      #LabelStatement
    | 'case' constantExpressionList ':' statement   #CaseStatement
    | 'default' ':' statement                       #DefaultCaseStatement
    ;

expressionStatement
    : expressionList? ';'
    ;

compoundStatement
    : '{' declaration* statement* '}'
    ;

selectionStatement
    : 'if' '(' expressionList ')' statement                                             #IfSolo
    | 'if' '(' expressionList ')' statement 'else' statement                            #IfElse
    | 'switch' '(' expressionList ')' statement                                         #Switch
    ;

iterationStatement
    : 'while' '(' expressionList ')' statement                                          #While
    | 'do' statement 'while' '(' expressionList ')' ';'                                 #Do
    | 'for' '(' expressionList? ';' expressionList? ';' expressionList? ')' statement   #For
    ;

jumpStatement
    : 'goto' Identifier ';'             #Goto
    | 'continue' ';'                    #Continue
    | 'break' ';'                       #Break
    | 'return' expressionList? ';'      #Return
    ;

/* K&R Definition is a mess of nested Expression defintions so this I what I came up with to fix it */
constantExpressionList : expressionList;

expressionList
    : expression (',' expression)*
    ;

expression
    : arr=expression '[' index=expression ']'                           #IndexExpr
    | func=expression '(' args=expressionList? ')'                      #ApplicationExpr
    | operand=expression op='.' member=Identifier                       #DotExpr
    | operand=expression op='->' member=Identifier                      #ArrowExpr
    | operand=expression op=('++'|'--')                                 #PostIncDecExpr
    | op=('++'|'--') operand=expression                                 #PreIncDecExpr
    | op=('&' | '*' | '+' | '-' | '~' | '!') operand=expression         #PrefixExpr
    | 'sizeof' '(' type=typeName ')'                                    #SizeofTypeExpr
    | 'sizeof' operand=expression                                       #SizeofExprExpr
    | '(' type=typeName ')' operand=expression                          #CastExpr
    | left=expression op=('*' | '/' | '%') right=expression             #BinaryExpr
    | left=expression op=('+' | '-') right=expression                   #BinaryExpr
    | left=expression op=('<<' | '>>') right=expression                 #BinaryExpr
    | left=expression op=('<' | '>' | '<=' | '>=') right=expression     #BinaryExpr
    | left=expression op=('==' | '!=') right=expression                 #BinaryExpr
    | left=expression op='&' right=expression                           #BinaryExpr
    | left=expression op='^' right=expression                           #BinaryExpr
    | left=expression op='|' right=expression                           #BinaryExpr
    | left=expression op='&&' right=expression                          #BinaryExpr
    | left=expression op='||' right=expression                          #BinaryExpr
    | guard=expression op='?' then=expression ':' other=expression       #ConditionalExpr
    | left=expression op=('='|'*='|'/='|'%='|'+='|'-='|'<<='|'>>='|'&='|'^='|'|=') right=expression  #AssignmentExpr
    | Identifier                                                        #IdentifierExpr
    | IntegerConstant                                                   #IntegerExpr
    | FloatingConstant                                                  #FloatExpr
    | EnumerationConstant                                               #EnumExpr
    | CharacterConstant                                                 #CharExpr
    | StringLiteral                                                     #LiteralExpr
    | '(' expression ')'                                                #NestedExpr
    ;


/* Below is borrowed from ANTLR c99 grammar */
/* May introduce unintended features */

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