%{
#include <stdio.h>
#include <stdlib.h>

    // TODO: code requires needed still, or get rid of these?
#include "types.h"
#include "cminus.h"
#include "toker.h"
#include "yyerrorHelper.h"
//#include "symbolTable.h"

#define YYERROR_VERBOSE

%}

%code requires {
    #define MAXCHILDREN 3
    #include "yyerrorHelper.h"
    #include "types.h"
    #include "cminus.h"
    #include "toker.h"
}

// %define api.value.type { Treenode *tree } 
// API basically makes it a full type, which is great if i'm using a unified nodetype...
// but alas not, since this is Bison and not Bison++
%union 
{
    TokenData * tok;
    TreeNode * tree;
}

%token <tok> ID NUMCONST STRINGCONST CHARCONST  BOOLCONST
%token <tok> ADDASS SUBASS MULASS DIVASS INC DEC LESSEQ GRTEQ EQ NOTEQ STATIC INT BOOL CHAR IF ELSE WHILE FOREACH IN RETURN BREAK
%token <tok> SEMICOLON LPAREN RPAREN LBRACKET RBRACKET OR AND NOT ASSIGN PLUS MINUS MULTIPLY DIVIDE MODULUS QUESTION LTHAN GTHAN LBRACE RBRACE COMMA COLON 

%type <tok> assignop     
        
%type <tree> program
%type <tree> declaration-list
%type <tree> declaration
%type <tree> var-declaration
%type <tree> scoped-var-declaration
%type <tree> var-decl-list
%type <tree> var-decl-initialize
%type <tree> var-decl-id
%type <tree> scoped-type-specifier
%type <tree> type-specifier
%type <tree> fun-declaration
%type <tree> params
%type <tree> param-list
%type <tree> param-type-list
%type <tree> param-id-list
%type <tree> param-id
%type <tree> statement
%type <tree> compound-stmt
%type <tree> local-declarations
%type <tree> statement-list
%type <tree> expression-stmt
%type <tree> return-stmt
%type <tree> break-stmt
%type <tree> expression
%type <tree> simple-expression
%type <tree> and-expression
%type <tree> unary-rel-expression
%type <tree> rel-expression
%type <tree> relop
%type <tree> sum-expression
%type <tree> sumop
%type <tree> term
%type <tree> mulop
%type <tree> unary-expression
%type <tree> unaryop
%type <tree> factor
%type <tree> mutable
%type <tree> immutable
%type <tree> call
%type <tree> args
%type <tree> arg-list
%type <tree> constant
%type <tree> matched unmatched  
%type <tree> matched-while-stmt  matched-foreach-stmt matched-selection-stmt
%type <tree> unmatched-while-stmt unmatched-selection-stmt unmatched-foreach-stmt

%%
	
program:	
    declaration-list	
    { 
        $$ = $1; 
        syntaxTree = $$; 
    }
    ;

declaration-list: 
	declaration-list declaration
		{ $$ = linkSiblings($1, $2); }
	| declaration
		{ $$ = $1; }
	;

declaration: 
	var-declaration 
		{ $$ = $1; }
	| fun-declaration
		{ $$ = $1; }
        | error { $$ = NULL; }
	;

var-declaration:
	type-specifier var-decl-list SEMICOLON
        { 
            yyerrok;
            $$ = $2;
            applyTypeToSiblings($$, $1->nodetype);
            
        }
    | error SEMICOLON
        { 
         yyerrok;
         $$ = NULL;
         freeToken($2); 
        }            
	;

scoped-var-declaration:
    scoped-type-specifier var-decl-list SEMICOLON
     { 
        yyerrok;
        $$ = $2;
        if($1->isStatic) { $$->isStatic = true; }
        applyTypeToSiblings($$, $1->nodetype);
        
     }
     | type-specifier error { $$ = NULL; }
     | error SEMICOLON 
        { 
         yyerrok;
         $$ = NULL;
         freeToken($2); 
        }
	;

var-decl-list:
	var-decl-list COMMA var-decl-initialize
		{
            $$ = linkSiblings($1, $3);
            freeToken($2);
        }
	| var-decl-initialize 
		{ $$ = $1; }
	| error COMMA var-decl-initialize { yyerrok; }
	| var-decl-list COMMA error { $$ = NULL; }
	;				

var-decl-initialize:
	var-decl-id
		{ $$ = $1; }
	| var-decl-id COLON simple-expression
	{
            $$ = $1;
            addChild( $$, $3);
            freeToken($2);
        }
    | error COLON simple-expression
        { 
         yyerrok;
         $$ = NULL;
         freeToken($2);
        }    
    | var-decl-id COLON error { $$ = NULL; }
    | error { $$ = NULL; }
    ;

var-decl-id:
	ID
		{ 
            $$ = makeNode( DeclK, VarK, Void, $1->lineno, $1 );
            yyerrok;
        }
	| ID LBRACKET NUMCONST RBRACKET
		{ 
            yyerrok;
            $$ = makeNode( DeclK, VarK, Void, $1->lineno, $1 );
            // TODO: handle NUMCONST!
            $$->isArray = true;
            $$->arraySize = $3->ivalue;
            freeToken($2);
            freeToken($3);
            freeToken($4);
            
        }
     | ID LBRACKET error { $$ = NULL; }
     | error RBRACKET
        { 
         $$ = NULL;
         freeToken($2);
         yyerrok; 
        }
             ;

scoped-type-specifier:
	STATIC type-specifier
	{ 
            $$ = $2;
            $$->isStatic = true; 
            //$$->isScoped = true;
            freeToken($1);
        }
	| type-specifier
		{ $$ = $1; }
	;

type-specifier:
	INT 
	{ 
            $$ = makeNode( DeclK, TypeK, Integer, $1->lineno, $1 );
        }
	| BOOL 
	{ 
            $$ = makeNode( DeclK, TypeK, Boolean, $1->lineno, $1 );
        }
	| CHAR 
	{ 
            $$ = makeNode( DeclK, TypeK, Character, $1->lineno, $1 );
        }
	;

fun-declaration:
	type-specifier ID LPAREN params RPAREN statement
	{ 
            $$ = makeNode( DeclK, FunK, $1->nodetype, $2->lineno, $2 );
            addChild( $$, $4);
            addChild( $$, $6);
            //freeToken($3);
            //freeToken($5);
	}
	| ID LPAREN params RPAREN statement
	{ 
            $$ = makeNode( DeclK, FunK, Void, $1->lineno, $1 );
            addChild( $$, $3);
            addChild( $$, $5);
            //freeToken($2);
            //freeToken($4);
	}
	| type-specifier error { $$ = NULL; }
	| type-specifier ID LPAREN error { $$ = NULL; }
	| type-specifier ID LPAREN params RPAREN error { $$ = NULL; }
	| ID LPAREN error { $$ = NULL; }
	| ID LPAREN params RPAREN error { $$ = NULL; }
	;

params:
	param-list 
		{ $$ = $1; }
	| /* empty */
		{ $$ = NULL; }
	;

param-list:
	param-list SEMICOLON param-type-list 
		{  
                    yyerrok;
                    $$ = linkSiblings($1, $3);
                    //freeToken($2);
                    
		}
	| param-type-list
		{ $$ = $1; }
	| error SEMICOLON param-type-list { yyerrok; }
	| param-list SEMICOLON error { $$ = NULL; }
	;
	
param-type-list:
	type-specifier param-id-list 
	{ 
            $$ = $2;
            applyTypeToSiblings($$, $1->nodetype);
	}
        | type-specifier error { $$ = NULL; }
	;
	
param-id-list:
	param-id-list COMMA param-id 
	{ 
            yyerrok;
            $$ = linkSiblings($1, $3);
            freeToken($2);
            
        }
	| param-id 
            { $$ = $1; }
    | error COMMA param-id 
        { 
            yyerrok; 
            $$ = NULL;
            freeToken($2);
        }
    | param-id-list COMMA error { $$ = NULL; }
	;
	
param-id:
	ID 		
	{ 
            yyerrok;
            $$ = makeNode( DeclK, ParamK, Void, $1->lineno, $1 );
            
        }
	| ID LBRACKET RBRACKET
		{ 
            yyerrok;
            $$ = makeNode( DeclK, ParamK, Void, $1->lineno, $1 );
            $$->isArray = true; 
            freeToken($2);
            freeToken($3);
            
        }
     | error { $$ = NULL; }
	;
	
statement:
	matched
		{ $$ = $1; }
	| unmatched
		{ $$ = $1; }
	;

matched:
	expression-stmt 
		{ $$ = $1; }
	| compound-stmt 
		{ $$ = $1; }
	| matched-selection-stmt
		{ $$ = $1; } 
	| matched-while-stmt
		{ $$ = $1; } 
	| matched-foreach-stmt
		{ $$ = $1; }
	| return-stmt 
		{ $$ = $1; }
	| break-stmt 
		{ $$ = $1; }
	| error { $$ = NULL; }
	;

unmatched:
	unmatched-selection-stmt
		{ $$ = $1; }
	| unmatched-while-stmt
		{ $$ = $1; }
	| unmatched-foreach-stmt
		{ $$ = $1; }
	;
	
matched-selection-stmt:
	IF LPAREN simple-expression RPAREN matched ELSE matched
        { 
            $$ = makeNode( StmtK, IfK, Void, $1->lineno, $1 );
            addChild( $$, $3);
            addChild( $$, $5);
            addChild( $$, $7);
            freeToken($2);
            freeToken($4);
            freeToken($6);
        }
    | IF LPAREN error RPAREN matched ELSE matched { $$ = NULL; }
	;

unmatched-selection-stmt:
	IF LPAREN simple-expression RPAREN statement
        { 
            $$ = makeNode( StmtK, IfK, Void, $1->lineno, $1 );
            addChild( $$, $3);
            addChild( $$, $5);
            freeToken($2);
            freeToken($4);
        }
	| IF LPAREN simple-expression RPAREN matched ELSE unmatched 
        { 
            $$ = makeNode( StmtK, IfK, Void, $1->lineno, $1 );
            addChild( $$, $3);
            addChild( $$, $5);
            addChild( $$, $7);
            freeToken($2);
            freeToken($4);
            freeToken($6);
        }
    | IF LPAREN error RPAREN statement { $$ = NULL; }
    | IF LPAREN error RPAREN matched ELSE unmatched { $$ = NULL; }
	;
	
matched-while-stmt:
	WHILE LPAREN simple-expression RPAREN matched
        { 
            $$ = makeNode( StmtK, WhileK, Void, $1->lineno, $1 );
            addChild( $$, $3);
            addChild( $$, $5);
            freeToken($2);
            freeToken($4);
        }
    | WHILE LPAREN error RPAREN matched { $$ = NULL; }
	;

unmatched-while-stmt:
	WHILE LPAREN simple-expression RPAREN unmatched
        { 
            $$ = makeNode( StmtK, WhileK, Void, $1->lineno, $1 );
            addChild( $$, $3);
            addChild( $$, $5);
            freeToken($2);
            freeToken($4);
        }
    | WHILE LPAREN error RPAREN unmatched { $$ = NULL; }
	;
	
matched-foreach-stmt:
	FOREACH LPAREN mutable IN simple-expression RPAREN matched
        { 
            $$ = makeNode( StmtK, ForeachK, Void, $1->lineno, $1 );
            addChild( $$, $3);
            addChild( $$, $5);
            addChild( $$, $7);
            freeToken($2);
            freeToken($4);
            freeToken($6);
        }
    | FOREACH LPAREN error RPAREN matched { $$ = NULL; }
	;
	
unmatched-foreach-stmt:
	FOREACH LPAREN mutable IN simple-expression RPAREN unmatched
        { 
            $$ = makeNode( StmtK, ForeachK, Void, $1->lineno, $1 );
            addChild( $$, $3);
            addChild( $$, $5);
            addChild( $$, $7);
            freeToken($2);
            freeToken($4);
            freeToken($6);
        }
    | FOREACH LPAREN error RPAREN unmatched { $$ = NULL; }
	;
	
compound-stmt:
	LBRACE local-declarations statement-list RBRACE
        { 
            yyerrok;
            $$ = makeNode( StmtK, CompoundK, Void, $1->lineno, $1 );
            addChild( $$, $2);
            addChild( $$, $3);
            freeToken($1);
            freeToken($4);
            
        }
    | LBRACE error statement-list RBRACE { $$ = NULL; }
    | LBRACE local-declarations error RBRACE { yyerrok; }
	;

local-declarations:
	local-declarations scoped-var-declaration 
		{ $$ = linkSiblings($1, $2); }
	| /* empty */ 
		{ $$ = NULL; }
	;
	
statement-list:
	statement-list statement
        { 
            $$ = linkSiblings($1, $2); 
	}
	| statement-list error { $$ = NULL; }
	| /* empty */
		{ $$ = NULL; }
	;
	
expression-stmt:
	expression SEMICOLON 
        { 
        	$$ = $1;
         	/* does expression occur at semicolon for line counting? */ 
         	freeToken($2);
                yyerrok;
        }
        | error SEMICOLON
        { 
            yyerrok; 
            $$ = NULL;
            freeToken($2);
        }        
	| SEMICOLON
		{ 
                    $$ = NULL; 
                    freeToken($1);
                    yyerrok;
		}

	;
	
return-stmt:
	RETURN SEMICOLON 
        { 
            yyerrok;
            $$ = makeNode( StmtK, ReturnK, Void, $1->lineno, $1 );
            freeToken($2);
            
        }
	| RETURN expression SEMICOLON
        {
            yyerrok;
            $$ = makeNode( StmtK, ReturnK, $2->nodetype, $1->lineno, $1 );     
            addChild( $$, $2);
            freeToken($3);
            
        }
	;
	
break-stmt:
	BREAK SEMICOLON
        { 
            yyerrok;
            $$ = makeNode( StmtK, BreakK, Void, $1->lineno, $1 );   
            freeToken($2);
            
        }
	;
	
expression:
	mutable ASSIGN expression
        { 
            $$ = makeNode( ExpK, AssignK, Void, $2->lineno, $2 );     
            addChild( $$, $1);
            addChild( $$, $3);
        }
        | mutable assignop expression
        { 
            $$ = makeNode( ExpK, AssignK, Integer, $2->lineno, $2 );     
            addChild( $$, $1);
            addChild( $$, $3);
        }
        | error assignop expression
        { 
            yyerrok; 
            $$ = NULL;
        }        
        | mutable assignop error { $$ = NULL; }
        | error assignop error { $$ = NULL; }
        /*
	| mutable ADDASS expression
        { 
            $$ = makeNode( ExpK, AssignK, Integer, $2->lineno, $2 );     
            addChild( $$, $1);
            addChild( $$, $3);
        }
	| mutable SUBASS expression
        { 
            $$ = makeNode( ExpK, AssignK, Integer, $2->lineno, $2 );     
            addChild( $$, $1);
            addChild( $$, $3);
        }
	| mutable MULASS expression
        { 
            $$ = makeNode( ExpK, AssignK, Integer, $2->lineno, $2 );     
            addChild( $$, $1);
            addChild( $$, $3);
        }
	| mutable DIVASS expression
        { 
            $$ = makeNode( ExpK, AssignK, Integer, $2->lineno, $2 );     
            addChild( $$, $1);
            addChild( $$, $3);
        }
        */
	| mutable INC
        { 
            yyerrok;
            $$ = makeNode( ExpK, AssignK, Integer, $2->lineno, $2 );     
            addChild( $$, $1);
            
        }
        | error INC { yyerrok; }
	| mutable DEC
        { 
            yyerrok;
            $$ = makeNode( ExpK, AssignK, Integer, $2->lineno, $2 );     
            addChild( $$, $1);
            
        }
        | error DEC { yyerrok; }
	| simple-expression
		{ $$ = $1; }
	;

assignop: 
    ASSIGN
    | ADDASS
    | SUBASS
    | MULASS
    | DIVASS
    ;


simple-expression:
	simple-expression OR and-expression 
        { 
            $$ = makeNode( ExpK, OpK, Boolean, $2->lineno, $2 );
            addChild( $$, $1);
            addChild( $$, $3);
            if( $1 != NULL && $3 != NULL && $1->isConstant && $3->isConstant ) {
                $$->isConstant = true;
            }
        }
	| and-expression 
		{ $$ = $1; }
        | error OR and-expression
        { 
            yyerrok; 
            $$ = NULL;
            freeToken($2);
        }        
        | simple-expression OR error { $$ = NULL; }
        | error OR error { $$ = NULL; }
	;
	
and-expression:
	and-expression AND unary-rel-expression
        { 
            $$ = makeNode( ExpK, OpK, Boolean, $2->lineno, $2 );     
            addChild( $$, $1);
            addChild( $$, $3);
            if( $1 != NULL && $3 != NULL && $1->isConstant && $3->isConstant ) {
                $$->isConstant = true;
            }
        }
	| unary-rel-expression 
		{ $$ = $1; }
        | error AND unary-rel-expression
        { 
            yyerrok; 
            $$ = NULL;
            freeToken($2);
        }        
        | and-expression AND error { $$ = NULL; }
        | error AND error { $$ = NULL; }
	;
	/* remember, void here would be children's type, type checker to compare the children */
unary-rel-expression:
	NOT unary-rel-expression
        { 
            $$ = makeNode( ExpK, UnaryK, Boolean, $1->lineno, $1 );     
            addChild( $$, $2);
            if( $2 != NULL && $2->isConstant ) {
                $$->isConstant = true;
            }            
        }
	| rel-expression 
		{ $$ = $1; }
        | NOT error { $$ = NULL; }
	;
	
rel-expression:
	sum-expression relop sum-expression
        { 
            $$ = $2;
            addChild( $$, $1);
            addChild( $$, $3);
            if( $1 != NULL && $3 != NULL && $1->isConstant && $3->isConstant ) {
                $$->isConstant = true;
            }            
        } 
	| sum-expression 
		{ $$ = $1; }
        | error relop sum-expression
        { 
            yyerrok; 
            $$ = NULL;
        }        
        | sum-expression relop error { $$ = NULL; }
        | error relop error { $$ = NULL; }
	;
	
relop:
	LESSEQ
	{ 
            $$ = makeNode( ExpK, OpK, Boolean, $1->lineno, $1 );
        }
	| LTHAN
	{ 
            $$ = makeNode( ExpK, OpK, Boolean, $1->lineno, $1 );
        }
	| GTHAN
	{ 
            $$ = makeNode( ExpK, OpK, Boolean, $1->lineno, $1 );
        }
	| GRTEQ 
	{ 
            $$ = makeNode( ExpK, OpK, Boolean, $1->lineno, $1 );
        }
	| EQ 
	{ 
            $$ = makeNode( ExpK, OpK, Boolean, $1->lineno, $1 );
        }
	| NOTEQ 
	{ 
            $$ = makeNode( ExpK, OpK, Boolean, $1->lineno, $1 );
        }
	;
	
sum-expression:
	sum-expression sumop term
        { 
            $$ = $2;
            addChild( $$, $1);
            addChild( $$, $3);
            if( $1 != NULL && $3 != NULL && $1->isConstant && $3->isConstant ) {
                $$->isConstant = true;
            }            
        } 
	| term 
            { $$ = $1; }
        | error sumop term
        { 
            yyerrok; 
            $$ = NULL;
        }        
        | sum-expression sumop error { $$ = NULL; }
        | error sumop error { $$ = NULL; }
	;
	
sumop:
	PLUS
	{ 
            $$ = makeNode( ExpK, OpK, Integer, $1->lineno, $1 );
        }
	| MINUS
	{ 
            $$ = makeNode( ExpK, OpK, Integer, $1->lineno, $1 );
        }
	;
	
term:
	term mulop unary-expression
        { 
            $$ = $2;
            addChild( $$, $1);
            addChild( $$, $3);
            if( $1 != NULL && $3 != NULL && $1->isConstant && $3->isConstant ) {
                $$->isConstant = true;
            }
        }
	| unary-expression 
            { $$ = $1; }
        | error mulop unary-expression
        { 
            yyerrok; 
            $$ = NULL;
        }        
        | term mulop error { $$ = NULL; }
        | error mulop error { $$ = NULL; }
	;
	
mulop:
	MULTIPLY 
	{ 
            $$ = makeNode( ExpK, OpK, Integer, $1->lineno, $1 );
        }
	| DIVIDE 
	{ 
            $$ = makeNode( ExpK, OpK, Integer, $1->lineno, $1 );
        }
	| MODULUS 
	{ 
            $$ = makeNode( ExpK, OpK, Integer, $1->lineno, $1 );
        }
	;
	
unary-expression:
	unaryop unary-expression
        { 
            $$ = $1;
            addChild($$, $2);
            if( $2 != NULL && $2->isConstant )
            {
                $$->isConstant = true;
            }
            else
            {
                $$->isConstant = false;
            }
        }
	| factor 
            { $$ = $1; }
        | unaryop error { $$ = NULL; }
	;
	
unaryop:
	MINUS
        { 
            $$ = makeNode( ExpK, UnaryK, Integer, $1->lineno, $1 );
        }
	| MULTIPLY
            { 
            $$ = makeNode( ExpK, UnaryK, Integer, $1->lineno, $1 );
            }
	| QUESTION /* Question's type? */
		{ 
            $$ = makeNode( ExpK, UnaryK, Integer, $1->lineno, $1 );
        }
	;
	
factor:
	immutable 
            { $$ = $1; }
	| mutable 
            { $$ = $1; }
	;
	
mutable:
	ID
        {
            yyerrok;    
            $$ = makeNode( ExpK, IdK, Void, $1->lineno, $1 );
        }
	| ID LBRACKET expression RBRACKET
        {
            yyerrok;
            $$ = makeNode( ExpK, IdK, Void, $1->lineno, $1 );
            //$$->isArray = true; 
            $3->isIndex = true;
            addChild( $$, $3);
            freeToken($2);
            freeToken($4);
        }
        | ID LBRACKET error { $$ = NULL; }
        | error RBRACKET
        {
            yyerrok;
            $$ = NULL;
        }
	;
	
immutable:
	LPAREN expression RPAREN
        { 
            yyerrok;
            $$ = $2;
            freeToken($1);
            freeToken($3);
            
         }
	| call
            { $$ = $1; }	
	| constant 
            { $$ = $1; }	
        | LPAREN error { $$ = NULL; }
	;
	
call:
	ID LPAREN args RPAREN
            { 
                yyerrok;
		if ( $3 != NULL ) {
                    $$ = makeNode( ExpK, CallK, $3->nodetype, $1->lineno, $1 );
                    addChild($$, $3);
		}
		else {
                    $$ = makeNode( ExpK, CallK, Void, $1->lineno, $1 );
		}	
                freeToken($2);
                freeToken($4);
                
            }
        | ID LPAREN error { $$ = NULL; }
	;
	
args:
	arg-list
		{ $$ = $1; }
	| /* empty */
		{ $$ = NULL; }
	;
	
arg-list:
	arg-list COMMA expression 
		{ 
                    yyerrok;
		    $$ = linkSiblings($1, $3); 
		    freeToken($2);
                    
		}
	| expression 
		{ $$ = $1; }	
        | error COMMA expression
        {
            yyerrok;
            $$ = NULL;
            freeToken($2);
        }        
        | arg-list COMMA error { $$ = NULL; }
	;
	
constant:
	NUMCONST
	{ 
    yyerrok;        
    $$ = makeNode( ExpK, ConstK, Integer, $1->lineno, $1 );
            $$->isConstant = true;
            
        }
	| CHARCONST 
	{ 
            yyerrok;
            $$ = makeNode( ExpK, ConstK, Character, $1->lineno, $1 );
            $$->isConstant = true;
            
        }
	| STRINGCONST
	{ 
            yyerrok;
            $$ = makeNode( ExpK, ConstK, Character, $1->lineno, $1 );
            $$->isArray = true;
            $$->isConstant = true;
            
        }
	| BOOLCONST
	{ 
            yyerrok;
            $$ = makeNode( ExpK, ConstK, Boolean, $1->lineno, $1 );
            $$->isConstant = true;         
        }
	;
	

%%
