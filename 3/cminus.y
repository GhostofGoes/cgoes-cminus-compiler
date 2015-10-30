%{
#include <stdio.h>
#include <stdlib.h>
#include <getopt.h>
#include <string.h>
//#include <stdarg.h>

#include "types.h"
#include "cminus.h"
#include "toker.h"
#include "symbolTable.h"

#define YYERROR_VERBOSE

%}

%code requires {
	#define MAXCHILDREN 3
	#include "types.h"
	#include "cminus.h"
    #include "toker.h"
}

// TODO: If i'm using a single type, can i just use the API?
// %define api.value.type { Treenode *tree } 
// Above would allow use of %token <TreeNode> instead of "tree". Unsure of the value, just a random thing.
%union 
{
    TokenData * tok;
	TreeNode * tree;
}

%token <tok> ERROR /* need to put a error incrementer/warning incrementer for ERROR */
%token <tok> ID NUMCONST STRINGCONST CHARCONST  BOOLCONST
%token <tok> ADDASS SUBASS MULASS DIVASS INC DEC LESSEQ GRTEQ EQ NOTEQ STATIC INT BOOL CHAR IF ELSE WHILE FOREACH IN RETURN BREAK
%token <tok> SEMICOLON LPAREN RPAREN LBRACKET RBRACKET OR AND NOT ASSIGN PLUS MINUS MULTIPLY DIVIDE MODULUS QUESTION LTHAN GTHAN LBRACE RBRACE COMMA COLON 

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
	;

var-declaration:
	type-specifier var-decl-list SEMICOLON
        { 
            $$ = $2;
            applyTypeToSiblings($$, $1->nodetype);
        }
	;

scoped-var-declaration:
	scoped-type-specifier var-decl-list SEMICOLON
        { 
            $$ = $2;
            if($1->isStatic) { $$->isStatic = true; }
            applyTypeToSiblings($$, $1->nodetype);
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
	;

var-decl-id:
	ID
		{ 
            $$ = makeNode( DeclK, VarK, Void, $1->lineno, $1 );
        }
	| ID LBRACKET NUMCONST RBRACKET
		{ 
            $$ = makeNode( DeclK, VarK, Void, $1->lineno, $1 );
            $$->isArray = true;
            freeToken($2);
           	freeToken($4);
        }
	;

/* TODO: issues with passing booleans up */

scoped-type-specifier:
	STATIC type-specifier
		{ 
            $$ = $2;
            $$->isStatic = true; 
            $$->isScoped = true;
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
            freeToken($3);
           	freeToken($5);
		}
	| ID LPAREN params RPAREN statement
		{ 
            $$ = makeNode( DeclK, FunK, Void, $1->lineno, $1 );
            addChild( $$, $3);
            addChild( $$, $5);
            freeToken($2);
           	freeToken($4);
		}
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
			$$ = linkSiblings($1, $3);
			freeToken($2);
		}
	| param-type-list
		{ $$ = $1; }
	;
	
param-type-list:
	type-specifier param-id-list 
		{ 
            $$ = $2;
            applyTypeToSiblings($$, $1->nodetype);
		}
	;
	
param-id-list:
	param-id-list COMMA param-id 
		{ 
            $$ = linkSiblings($1, $3);
            freeToken($2);
        }
	| param-id 
		{ $$ = $1; }
	;
	
param-id:
	ID 		
		{ 
            $$ = makeNode( DeclK, ParamK, Void, $1->lineno, $1 );
        }
	| ID LBRACKET RBRACKET
		{ 
            $$ = makeNode( DeclK, ParamK, Void, $1->lineno, $1 );
            $$->isArray = true; 
            freeToken($2);
           	freeToken($3);
        }
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
	;
	
compound-stmt:
	LBRACE local-declarations statement-list RBRACE
        { 
            $$ = makeNode( StmtK, CompoundK, Void, $1->lineno, $1 );
            addChild( $$, $2);
            addChild( $$, $3);
            freeToken($1);
            freeToken($4);
        }
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
	| /* empty */
		{ $$ = NULL; }
	;
	
expression-stmt:
	expression SEMICOLON 
        { 
        	$$ = $1;
         	/* does expression occur at semicolon for line counting? */ 
         	freeToken($2);
        }
	| SEMICOLON /* EMPTY? */
		{ 
			$$ = NULL; 
			freeToken($1);	
		}
	;
	
return-stmt:
	RETURN SEMICOLON 
        { 
            $$ = makeNode( StmtK, ReturnK, Void, $1->lineno, $1 );
            freeToken($2);    
        }
	| RETURN expression SEMICOLON
        {
            $$ = makeNode( StmtK, ReturnK, $2->nodetype, $1->lineno, $1 );     
            addChild( $$, $2);
            freeToken($3);
        }
	;
	
break-stmt:
	BREAK SEMICOLON
        { 
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
	| mutable INC
        { 
            $$ = makeNode( ExpK, AssignK, Integer, $2->lineno, $2 );     
            addChild( $$, $1);
        }
	| mutable DEC
        { 
            $$ = makeNode( ExpK, AssignK, Integer, $2->lineno, $2 );     
            addChild( $$, $1);
        }
	| simple-expression
		{ $$ = $1; }
	;
	
simple-expression:
	simple-expression OR and-expression 
        { 
            $$ = makeNode( ExpK, OpK, Boolean, $2->lineno, $2 );
            addChild( $$, $1);
            addChild( $$, $3);
        }
	| and-expression 
		{ $$ = $1; }
	;
	
and-expression:
	and-expression AND unary-rel-expression
        { 
            $$ = makeNode( ExpK, OpK, Boolean, $2->lineno, $2 );     
            addChild( $$, $1);
            addChild( $$, $3);
        }
	| unary-rel-expression 
		{ $$ = $1; }
	;
	/* remember, void here would be children's type, type checker to compare the children */
unary-rel-expression:
	NOT unary-rel-expression
        { 
            $$ = makeNode( ExpK, UnaryK, Boolean, $1->lineno, $1 );     
            addChild( $$, $2);
        }
	| rel-expression 
		{ $$ = $1; }
	;
	
rel-expression:
	sum-expression relop sum-expression
        { 
            $$ = $2;
            addChild( $$, $1);
            addChild( $$, $3);
        } 
	| sum-expression 
		{ $$ = $1; }
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
        } 
	| term 
		{ $$ = $1; }
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
        }
	| unary-expression 
		{ $$ = $1; }
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
        }
	| factor 
		{ $$ = $1; }
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
            $$ = makeNode( ExpK, IdK, Void, $1->lineno, $1 );
        }
	| ID LBRACKET expression RBRACKET
        {
            $$ = makeNode( ExpK, IdK, Void, $1->lineno, $1 );
            $$->isArray = true; 
            $3->isIndex = true;
            addChild( $$, $3);
            freeToken($2);
            freeToken($4);
        }
	;
	
immutable:
	LPAREN expression RPAREN
        { 
        	$$ = $2;
			freeToken($1);
			freeToken($3);        
         }
	| call
		{ $$ = $1; }	
	| constant 
		{ $$ = $1; }	
	;
	
call:
	ID LPAREN args RPAREN
		{ 
			if($3 != NULL) {
	            $$ = makeNode( ExpK, CallK, $3->nodetype, $1->lineno, $1 );
    	        addChild($$, $3);

			}
			else {
				$$ = makeNode( ExpK, CallK, Void, $1->lineno, $1 );
			}	
			freeToken($2);
           	freeToken($4);
		}
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
		    $$ = linkSiblings($1, $3); 
		    freeToken($2);
		}
	| expression 
		{ $$ = $1; }	
	;
	
constant:
	NUMCONST
		{ 
            $$ = makeNode( ExpK, ConstK, Integer, $1->lineno, $1 );
        }
	| CHARCONST 
		{ 
            $$ = makeNode( ExpK, ConstK, Character, $1->lineno, $1 );
        }
	| STRINGCONST
		{ 
            $$ = makeNode( ExpK, ConstK, Character, $1->lineno, $1 );
        }
	| BOOLCONST
		{ 
            $$ = makeNode( ExpK, ConstK, Boolean, $1->lineno, $1 );
        }
	;
	

%%

// Defines yyerror for bison
static void yyerror(const char *msg)
{
	fflush(stdout);
    printf("ERROR(%d): %s\n", yylineno, msg ? msg : "");
}
