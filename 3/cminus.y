%{
#include <stdio.h>
#include <stdlib.h>
#include <getopt.h>
#include <string.h>
#include <stdarg.h>
#include "types.h"
#include "cminus.h"
#include "toker.h"

#define YYERROR_VERBOSE

// Flex's Lexer (heh)
extern int yylex();

// Flex's line numbering
extern int yylineno; 

// Input file stream
extern FILE * yyin;

// Global abstract syntax tree pointer
TreeNode *syntaxTree = NULL;

// Global Annotated Syntax Tree pointer 
TreeNode *annotatedTree = NULL;

// Globally keep track of warnings and errors
int warnings = 0;
int errors = 0;
bool testing = false;

// Defining yyerror
static void yyerror(const char *);

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
            //$$ = makeParent( VarK, $1->nodetype, $1->lineno, $2->svalue );
            $$ = $2;
            applyTypeToSiblings($$, $1->nodetype);
            //addChildren($$, 1, $2);

        }
	;

/* Note: need to keep track of scope! */
scoped-var-declaration:
	scoped-type-specifier var-decl-list SEMICOLON
        { 
            //$$ = makeParent( VarK, $1->nodetype, $1->lineno, NULL);
            $$ = $2;
            if($1->isStatic) { $$->isStatic = true; }
            applyTypeToSiblings($$, $1->nodetype);
            $$->isScoped = true; 
        }
	;

var-decl-list:
	var-decl-list COMMA var-decl-initialize
		{
            $$ = linkSiblings($1, $3);
        }
	| var-decl-initialize 
		{ $$ = $1; }
	;				

var-decl-initialize:
	var-decl-id
		{ 
            $$ = $1;
            //$$->nodekind = VarK;
        }
	| var-decl-id COLON simple-expression
		{
            $$ = $1;
            //$$->nodekind = VarK;
            //addChildren( $$, 1, $3 );
            addChild( $$, $3);
        }
	;

var-decl-id:
	ID
		{ 
            $$ = makeNode( VarK, Void, $1->lineno, $1->svalue, $1 );
        }
	| ID LBRACKET NUMCONST RBRACKET
		{ 
            $$ = makeParent( VarK, Void, $1->lineno, $1->svalue );
            $$->isArray = true;
            //addChildren( $$, 1, $3 );
        }
	;

/* TODO: issues with passing booleans up */

scoped-type-specifier:
	STATIC type-specifier
		{ 
            //$$ = makeParent( TypeK, $2->nodetype, $2->lineno, NULL);
            $$ = $2;
            $$->isStatic = true; 
            $$->isScoped = true;
           }
	| type-specifier
		{ $$ = $1; }
	;

type-specifier:
	INT 
		{ 
            $$ = makeNode( TypeK, Integer, $1->lineno, NULL, $1 );
        }
	| BOOL 
		{ 
            $$ = makeNode( TypeK, Boolean, $1->lineno, NULL, $1 );
        }
	| CHAR 
		{ 
            $$ = makeNode( TypeK, Character, $1->lineno, NULL, $1 );
        }
	;

fun-declaration:
	type-specifier ID LPAREN params RPAREN statement
		{ 
            $$ = makeParent( FunK, $1->nodetype, $2->lineno, $2->svalue );
			//addChildren( $$, 2, $4, $6 );
            addChild( $$, $4);
            addChild( $$, $6);
		}
	| ID LPAREN params RPAREN statement
		{ 
            $$ = makeParent( FunK, Void, $1->lineno, $1->svalue );
			//addChildren( $$, 2, $3, $5);
            addChild( $$, $3);
            addChild( $$, $5);
		}
	;

params:
	param-list 
		{ $$ = $1; }
	| /* empty */
		{ 
			$$ = NULL; 
			//$$ = makeParent( EmptyK, Void, 0, NULL );	
		}
	;

param-list:
	param-list SEMICOLON param-type-list 
		{  
			$$ = linkSiblings($1, $3);
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
        }
	| param-id 
		{ $$ = $1; }
	;
	
param-id:
	ID 		
		{ 
            $$ = makeNode( ParamK, Void, $1->lineno, $1->svalue, $1 );
        }
	| ID LBRACKET RBRACKET
		{ 
            $$ = makeNode( ParamK, Void, $1->lineno, $1->svalue, $1 );
            $$->isArray = true; 
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
            $$ = makeParent( IfK, Void, $1->lineno, NULL );
            //addChildren( $$, 3, $3, $5, $7 );
            addChild( $$, $3);
            addChild( $$, $5);
            addChild( $$, $7);
        }
	;

unmatched-selection-stmt:
	IF LPAREN simple-expression RPAREN statement
        { 
            $$ = makeParent( IfK, Void, $1->lineno, NULL );
            //addChildren( $$, 2, $3, $5 );
            addChild( $$, $3);
            addChild( $$, $5);
        }
	| IF LPAREN simple-expression RPAREN matched ELSE unmatched 
        { 
            $$ = makeParent( IfK, Void, $1->lineno, NULL );
            //addChildren( $$, 3, $3, $5, $7 );
            addChild( $$, $3);
            addChild( $$, $5);
            addChild( $$, $7);
        }
	;
	
matched-while-stmt:
	WHILE LPAREN simple-expression RPAREN matched
        { 
            $$ = makeParent( WhileK, Void, $1->lineno, NULL );
            //addChildren( $$, 2, $3, $5 );
            addChild( $$, $3);
            addChild( $$, $5);
        }
	;

unmatched-while-stmt:
	WHILE LPAREN simple-expression RPAREN unmatched
        { 
            $$ = makeParent( WhileK, Void, $1->lineno, NULL );
            //addChildren( $$, 2, $3, $5 );
            addChild( $$, $3);
            addChild( $$, $5);
        }
	;
	
matched-foreach-stmt:
	FOREACH LPAREN mutable IN simple-expression RPAREN matched
        { 
            $$ = makeParent( ForeachK, Void, $1->lineno, NULL );
            //addChildren( $$, 3, $3, $5, $7 );
            addChild( $$, $3);
            addChild( $$, $5);
            addChild( $$, $7);
        }
	;
	
unmatched-foreach-stmt:
	FOREACH LPAREN mutable IN simple-expression RPAREN unmatched
        { 
            $$ = makeParent( ForeachK, Void, $1->lineno, NULL );
            //addChildren( $$, 3, $3, $5, $7 );
            addChild( $$, $3);
            addChild( $$, $5);
            addChild( $$, $7);
        }
	;
	
compound-stmt:
	LBRACE local-declarations statement-list RBRACE
        { 
            $$ = makeParent( CompoundK, Void, $1->lineno, NULL );
            //addChildren( $$, 2, $2, $3 );
            addChild( $$, $2);
            addChild( $$, $3);
        }
	;

local-declarations:
	local-declarations scoped-var-declaration 
		{ $$ = linkSiblings($1, $2); }
	| /* empty */ 
		{ 
			$$ = NULL; 
			//$$ = makeParent( EmptyK, Void, 0, NULL );	
		}
	;
	
statement-list:
	statement-list statement
        { 
            $$ = linkSiblings($1, $2); 
			//printf("Linking statement to statement-list\n");        
		}
	| /* empty */
		{ 
			$$ = NULL; 
			//$$ = makeParent( EmptyK, Void, 0, NULL );		
		}
	;
	
expression-stmt:
	expression SEMICOLON 
        { $$ = $1; /* does expression occur at semicolon for line counting? */ }
	| SEMICOLON /* EMPTY? */
		{ 
			$$ = NULL; 
			//$$ = makeNode( EmptyK, Void, 0, NULL, $1 );	
		}
	;
	
return-stmt:
	RETURN SEMICOLON 
        { 
            $$ = makeNode( ReturnK, Void, $1->lineno, NULL, $1 );     
        }
	| RETURN expression SEMICOLON
        {
            $$ = makeNode( ReturnK, $2->nodetype, $1->lineno, NULL, $1 );     
            //addChildren( $$, 1, $2 );
            addChild( $$, $2);
        }
	;
	
break-stmt:
	BREAK SEMICOLON
        { 
            $$ = makeNode( BreakK, Void, $1->lineno, NULL, $1 );     
        }
	;
	
expression:
	mutable ASSIGN expression
        { 
            $$ = makeNode( AssignK, Void, $2->lineno, NULL, $2 );     
            //$$ = $2;
            //addChildren( $$, 2, $1, $3 );
            addChild( $$, $1);
            addChild( $$, $3);
        }
	| mutable ADDASS expression
        { 
            $$ = makeNode( AssignK, Void, $2->lineno, NULL, $2 );     
            //addChildren( $$, 2, $1, $3 );
            addChild( $$, $1);
            addChild( $$, $3);
        }
	| mutable SUBASS expression
        { 
            $$ = makeNode( AssignK, Void, $2->lineno, NULL, $2 );     
            //addChildren( $$, 2, $1, $3 );
            addChild( $$, $1);
            addChild( $$, $3);
        }
	| mutable MULASS expression
        { 
            $$ = makeNode( AssignK, Void, $2->lineno, NULL, $2 );     
            //addChildren( $$, 2, $1, $3 );
            addChild( $$, $1);
            addChild( $$, $3);
        }
	| mutable DIVASS expression
        { 
            $$ = makeNode( AssignK, Void, $2->lineno, NULL, $2 );     
            //addChildren( $$, 2, $1, $3 );
            addChild( $$, $1);
            addChild( $$, $3);
        }
	| mutable INC
        { 
            $$ = makeNode( AssignK, Integer, $2->lineno, NULL, $2 );     
            //addChildren( $$, 1, $1 );
            addChild( $$, $1);
        }
	| mutable DEC
        { 
            $$ = makeNode( AssignK, Integer, $2->lineno, NULL, $2 );     
            //addChildren( $$, 1, $1 );
            addChild( $$, $1);
        }
	| simple-expression
		{ $$ = $1; }
	;
	
simple-expression:
	simple-expression OR and-expression 
        { 
            $$ = makeNode( OpK, Boolean, $2->lineno, NULL, $2 );     
            //addChildren( $$, 2, $1, $3 );
            addChild( $$, $1);
            addChild( $$, $3);
        }
	| and-expression 
		{ $$ = $1; }
	;
	
and-expression:
	and-expression AND unary-rel-expression
        { 
            $$ = makeNode( OpK, Boolean, $2->lineno, NULL, $2 );     
            //addChildren( $$, 2, $1, $3 );
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
            $$ = makeNode( OpK, Boolean, $1->lineno, NULL, $1 );     
            //addChildren( $$, 1, $2 );
            addChild( $$, $2);
        }
	| rel-expression 
		{ $$ = $1; }
	;
	
rel-expression:
	sum-expression relop sum-expression
        { 
            $$ = $2;
            //addChildren( $$, 2, $1, $3 );
            addChild( $$, $1);
            addChild( $$, $3);
        } 
	| sum-expression 
		{ $$ = $1; }
	;
	
relop:
	LESSEQ
		{ 
            $$ = makeNode( OpK, Boolean, $1->lineno, NULL, $1 );
        }
	| LTHAN
		{ 
            $$ = makeNode( OpK, Boolean, $1->lineno, NULL, $1 );
        }
	| GTHAN
		{ 
            $$ = makeNode( OpK, Boolean, $1->lineno, NULL, $1 );
        }
	| GRTEQ 
		{ 
            $$ = makeNode( OpK, Boolean, $1->lineno, NULL, $1 );
        }
	| EQ 
		{ 
            $$ = makeNode( OpK, Boolean, $1->lineno, NULL, $1 );
        }
	| NOTEQ 
		{ 
            $$ = makeNode( OpK, Boolean, $1->lineno, NULL, $1 );
        }
	;
	
sum-expression:
	sum-expression sumop term
        { 
            $$ = $2;
            //addChildren( $$, 2, $1, $3 );
            addChild( $$, $1);
            addChild( $$, $3);
        } 
	| term 
		{ $$ = $1; }
	;
	
sumop:
	PLUS
		{ 
            $$ = makeNode( OpK, Integer, $1->lineno, NULL, $1 );
        }
	| MINUS
		{ 
            $$ = makeNode( OpK, Integer, $1->lineno, NULL, $1 );
        }
	;
	
term:
	term mulop unary-expression
        { 
            $$ = $2;
            //addChildren( $$, 2, $1, $3 );
            addChild( $$, $1);
            addChild( $$, $3);
        }
	| unary-expression 
		{ $$ = $1; }
	;
	
mulop:
	MULTIPLY 
		{ 
            $$ = makeNode( OpK, Integer, $1->lineno, NULL, $1 );
        }
	| DIVIDE 
		{ 
            $$ = makeNode( OpK, Integer, $1->lineno, NULL, $1 );
        }
	| MODULUS 
		{ 
            $$ = makeNode( OpK, Integer, $1->lineno, NULL, $1 );
        }
	;
	
unary-expression:
	unaryop unary-expression
        { 
            $$ = $1;
            //addChildren( $$, 1, $2 );
            addChild($$, $2);
        }
	| factor 
		{ $$ = $1; }
	;
	
unaryop:
	MINUS
		{ 
            $$ = makeNode( OpK, Integer, $1->lineno, NULL, $1 );
        }
	| MULTIPLY
		{ 
            $$ = makeNode( OpK, Integer, $1->lineno, NULL, $1 );
        }
	| QUESTION /* Question's type? */
		{ 
            $$ = makeNode( OpK, Integer, $1->lineno, NULL, $1 );
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
            $$ = makeNode( IdK, Void, $1->lineno, $1->svalue, $1 );
        }
	| ID LBRACKET expression RBRACKET
        {
            $$ = makeNode( IdK, Void, $1->lineno, $1->svalue, $1 );
            $$->isArray = true; 
            //addChildren( $$, 1, $3 );
            addChild( $$, $3);
        }
	;
	
immutable:
	LPAREN expression RPAREN
        { $$ = $2; }
	| call
		{ $$ = $1; }	
	| constant 
		{ $$ = $1; }	
	;
	
call:
	ID LPAREN args RPAREN
		{ 
            $$ = makeNode( CallK, $3->nodetype, $1->lineno, $1->svalue, $1 );
			//addChildren($$, 1, $3);
            addChild($$, $3);
		}
	;
	
args:
	arg-list
		{ $$ = $1; }
	| /* empty */
		{ 
			$$ = NULL; 
			//$$ = makeParent( EmptyK, Void, 0, NULL );	
		}
	;
	
arg-list:
	arg-list COMMA expression 
		{ 
		    $$ = linkSiblings($1, $3); 
		}
	| expression 
		{ $$ = $1; }	
	;
	
constant:
	NUMCONST /* TODO: String/other types? */
		{ 
            $$ = makeNode( ConstK, Integer, $1->lineno, NULL, $1 );
        }
	| CHARCONST 
		{ 
            $$ = makeNode( ConstK, Character, $1->lineno, NULL, $1 );
        }
	| STRINGCONST
		{ 
            $$ = makeNode( ConstK, String, $1->lineno, $1->svalue, $1 );
        }
	| BOOLCONST
		{ 
            $$ = makeNode( ConstK, Boolean, $1->lineno, NULL, $1 );
        }
	;
	

%%

int main( int argc, char* argv[] ) {
	
	// FILE * output = stdout;
	int option;
	opterr = 0;
    
	// Flags
	testing = false;
	bool abstract_tree = false;
	bool annotated_tree = false;
	bool code_generation = false;
	
	// Command line options
	while( (option = getopt(argc, argv, "dpPtz")) != EOF ) {
		switch(option) {
			case 'd': 
				yydebug = 1;
				break;
			case 'p':
				abstract_tree = true;
				break;
			case 'P':
				annotated_tree = true;
				break;
			case 't':
                testing = true;
                break;
			default:
				break;
		}
	}
	
	// Slightly hacky way to get input filename, without using a option
	if( argc > 1 && optind < argc ) {
		yyin = fopen( argv[optind], "r" );
	}

	// Main parsing loop. Goes until end of input
	do {
		yyparse();
	} while (!feof(yyin));
	
	
	// Prints out the entire syntax tree recursivly, from the global root node
	if(abstract_tree) {
		printAbstractTree(syntaxTree, 0);
	}
	
	// TODO: build I/O library tree
	if(annotated_tree) {
		semanticAnalysis(annotatedTree);
		printAnnotatedTree(annotatedTree, 0);
	}
	
	if(code_generation) {
		// TODO import I/O library
		generateCode();
	}

    freeTree(syntaxTree);

	// How many bad things happened. TODO: when do we want to do this, or not?
	printf( "Number of warnings: %d\n", warnings );
	printf( "Number of errors: %d\n", errors );	
	
	fclose(yyin);
	return 0;
}

// Defines yyerror for bison
static void yyerror(const char *msg)
{
	fflush(stdout);
    printf("ERROR(%d): %s\n", yylineno, msg ? msg : "");
}
