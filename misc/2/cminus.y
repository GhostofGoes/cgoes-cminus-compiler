%{
#include <stdio.h>
#include <stdlib.h>
#include <getopt.h>
#include <string.h>
#include <stdarg.h>
#include "types.h"
#include "CuTest.h"
#define YYERROR_VERBOSE

extern int yylex();
extern int yylineno; // Use Flex for line numbers. Might be screwing me up.
extern FILE * yyin;
//extern int linenumber;
//#define MAXCHILDREN 3

int warnings = 0;
int errors = 0;

// Global abstract syntax tree pointer
TreeNode *syntaxTree = NULL;

// Global Annotated Syntax Tree pointer 
TreeNode *annotatedTree = NULL;

// Defining yyerror
static void yyerror(const char *);

// Save some printf typing
void easy( int linenum, char * svalue );

// Prints the abstract syntax tree
void printAbstractTree(TreeNode * tree, int indent_count);

// TODO: Placeholder Prints the annotated syntax tree
void printAnnotatedTree(TreeNode * tree);

// TODO: placeholder Generates Annotated Syntax Tree
void semanticAnalysis(TreeNode * tree);

// TODO: placeholder Generates code
void generateCode();

// Creates a new node for the syntax tree
// Args: (int) Number of child nodes, (TreeNode) Child nodes
TreeNode * makeNode( int value, int numChildren,...);

// Adds children to a parent node
void addChildren( TreeNode * parent, int numChildren,...);

// Links all successive siblings to the first and each following
TreeNode * linkSiblings( int numSiblings,...);
%}

%code requires {
	#define MAXCHILDREN 3
	#include "types.h"
}

%union 
{
	/* TokenData tok; */
	TreeNode *tree;
}

%token <tree> ID
%token <tree> NUMCONST
%token <tree> STRINGCONST
%token <tree> CHARCONST 
%token <tree> ERROR
%token <tree> BOOLCONST
%token <tree> ADDASS SUBASS MULASS DIVASS INC DEC LESSEQ GRTEQ EQ NOTEQ STATIC INT BOOL CHAR IF ELSE WHILE FOREACH IN RETURN BREAK
%token <tree> SEMICOLON LPAREN RPAREN LBRACKET RBRACKET OR AND NOT ASSIGN PLUS MINUS MULTIPLY DIVIDE MODULUS QUESTION LTHAN GTHAN LBRACE RBRACE COMMA COLON 

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
/*
%type <tree> selection-stmt
%type <tree> iteration-stmt
*/
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
/* need to put a error incrementer/warning incrementer for ERROR */

%%
	
program:	
	declaration-list	
		{ $$ = $1; syntaxTree = $$; }
	;

declaration-list: 
	declaration-list declaration	
		{ $$ = $1; }
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
	;

scoped-var-declaration:
	scoped-type-specifier var-decl-list SEMICOLON
	;

var-decl-list:
	var-decl-list COMMA var-decl-initialize
	| var-decl-initialize 
		{ $$ = $1; }
	;				

var-decl-initialize:
	var-decl-id
		{ $$ = $1; }
	| var-decl-id COLON simple-expression 
	;

var-decl-id:
	ID
		{ $$ = $1; }
	| ID LBRACKET NUMCONST RBRACKET 
	;

scoped-type-specifier:
	STATIC type-specifier  
	| type-specifier
		{ $1->typespecifier = true; $$ = $1; }
	;

type-specifier:
	INT 
		{ $$ = $1; }
	| BOOL 
		{ $$ = $1; }
	| CHAR 
		{ $$ = $1; }
	;

fun-declaration:
	type-specifier ID LPAREN params RPAREN statement
	| ID LPAREN params RPAREN statement 
	;

params:
	param-list 
		{ $$ = $1; }
	| /* empty */
		{ $$ = NULL; }
	;

param-list:
	param-list SEMICOLON param-type-list 
	| param-type-list
		{ $$ = $1; }
	;
	
param-type-list:
	type-specifier param-id-list 
	{ addChildren($1, 1, $2); $$ = $1; }
	;
	
param-id-list:
	param-id-list COMMA param-id 
		{ $$ = linkSiblings(2, $1, $3); }
	| param-id 
		{ $$ = $1; }
	;
	
param-id:
	ID 		{ $$ = $1; }
	| ID LBRACKET RBRACKET 
	;
	
statement:
	matched
	| unmatched
	;

matched:
	expression-stmt 
	| compound-stmt 
	| matched-selection-stmt 
	| matched-while-stmt 
	| matched-foreach-stmt
	| return-stmt 
	| break-stmt 
	;

unmatched:
	unmatched-selection-stmt
	| unmatched-while-stmt
	| unmatched-foreach-stmt
	;
	
matched-selection-stmt:
	IF LPAREN simple-expression RPAREN matched ELSE matched 
	;

unmatched-selection-stmt:
	IF LPAREN simple-expression RPAREN statement
	| IF LPAREN simple-expression RPAREN matched ELSE unmatched 
	;
	
matched-while-stmt:
	WHILE LPAREN simple-expression RPAREN matched
	;

unmatched-while-stmt:
	WHILE LPAREN simple-expression RPAREN unmatched
	;
	
matched-foreach-stmt:
	FOREACH LPAREN mutable IN simple-expression RPAREN matched
	;
	
unmatched-foreach-stmt:
	FOREACH LPAREN mutable IN simple-expression RPAREN unmatched
	;
	
compound-stmt:
	LBRACE local-declarations statement-list RBRACE
	;

local-declarations:
	local-declarations scoped-var-declaration 
		{ $$ = linkSiblings(2, $1, $2); }
	| /* empty */ 
		{ $$ = NULL; }
	;
	
statement-list:
	statement-list statement 
	| /* empty */
		{ $$ = NULL; }
	;
	
expression-stmt:
	expression SEMICOLON 
	| SEMICOLON
		{ $$ = $1; }
	;

	/*
	selection-stmt:
		IF LPAREN simple-expression RPAREN statement 
		| IF LPAREN simple-expression RPAREN statement ELSE statement 
		;
	*/

	/*
	iteration-stmt:
		WHILE LPAREN simple-expression RPAREN statement 
		| FOREACH LPAREN mutable IN simple-expression RPAREN statement 
		;
	*/
	
return-stmt:
	RETURN SEMICOLON 
	| RETURN expression SEMICOLON 
	;
	
break-stmt:
	BREAK SEMICOLON 
	;
	
expression:
	mutable ASSIGN expression
	| mutable ADDASS expression
	| mutable SUBASS expression
	| mutable MULASS expression
	| mutable DIVASS expression
	| mutable INC
	| mutable DEC
	| simple-expression
		{ $$ = $1; }
	;
	
simple-expression:
	simple-expression OR and-expression 
	| and-expression 
		{ $$ = $1; }
	;
	
and-expression:
	and-expression AND unary-rel-expression 
	| unary-rel-expression 
		{ $$ = $1; }
	;
	
unary-rel-expression:
	NOT unary-rel-expression
	| rel-expression 
		{ $$ = $1; }
	;
	
rel-expression:
	sum-expression relop sum-expression 
	| sum-expression 
		{ $$ = $1; }
	;
	
relop:
	LESSEQ
		{ $$ = $1; }
	| LTHAN
		{ $$ = $1; }
	| GTHAN
		{ $$ = $1; }
	| GRTEQ 
		{ $$ = $1; }
	| EQ 
		{ $$ = $1; }
	| NOTEQ 
		{ $$ = $1; }
	;
	
sum-expression:
	sum-expression sumop term 
	| term 
		{ $$ = $1; }
	;
	
sumop:
	PLUS
		{ $$ = $1; }
	| MINUS
		{ $$ = $1; }
	;
	
term:
	term mulop unary-expression
	| unary-expression 
		{ $$ = $1; }
	;
	
mulop:
	MULTIPLY 
		{ $$ = $1; }
	| DIVIDE 
		{ $$ = $1; }
	| MODULUS 
		{ $$ = $1; }
	;
	
unary-expression:
	unaryop unary-expression 
	| factor 
		{ $$ = $1; }
	;
	
unaryop:
	MINUS
		{ $$ = $1; }
	| MULTIPLY
		{ $$ = $1; }
	| QUESTION
		{ $$ = $1; }
	;
	
factor:
	immutable 
		{ $$ = $1; }
	| mutable 
		{ $$ = $1; }
	;
	
mutable:
	ID
		{ $$ = $1; }
	| ID LBRACKET expression RBRACKET
	;
	
immutable:
	LPAREN expression RPAREN
	| call
		{ $$ = $1; }	
	| constant 
		{ $$ = $1; }	
	;
	
call:
	ID LPAREN args RPAREN
		{ $1->str = strdup("Call"); $1->nodekind = ExpK; addChildren($1, 1, $3); $$ = $1; }
	;
	
args:
	arg-list
		{ $$ = $1; }
	| /* empty */
		{ $$ = NULL; }
	;
	
arg-list:
	arg-list COMMA expression
		{ $$ = linkSiblings(2, $1, $3); }
	| expression
		{ $$ = $1; }	
	;
	
constant:
	NUMCONST 
		{ $$ = $1; }
	| CHARCONST 
		{ $$ = $1; }
	| STRINGCONST
		{ $$ = $1; }
	| BOOLCONST
		{ $$ = $1; }
	;
	

%%

int main( int argc, char* argv[] ) {
	
	// FILE * output = stdout;
	int option;
	opterr = 0;
	
	// Flags
	bool test_mode = false;
	bool abstract_tree = false;
	bool annotated_tree = false;
	bool code_generation = false;
	
	// Command line options. Only handles "-d" debug option currently.
	while( (option = getopt(argc, argv, "dpPt")) != EOF ) {
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
				test_mode = true;
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
	
	if(annotated_tree) {
		semanticAnalysis(annotatedTree);
		printAnnotatedTree(annotatedTree);
	}
	
	if(code_generation) {
		// TODO import I/O library
		generateCode();
	}
	
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
    printf("ERROR(%d): %s\n", yylineno, msg);
}

// Silly "typing saving" helper function
void easy( int linenum, char * svalue ) { 
	printf("Line %d Token: %s\n", linenum, svalue );
}


// Print spaces at end of strings if neccessary. 
// Assumes we're printing to STDOUT. If we need a file, just redirect at OS level.
void printAbstractTree(TreeNode * tree, int indent_count) {
	
	// Keeps track of siblings
	int sibling_count = 0;

	// Prints all nodes of the tree
	while( tree != NULL ) {
		
		for(int i = 0; i < indent_count; i++) {
			printf("|   ");
		}
		if(sibling_count > 0) {
			// two spaces after child num
			printf( "|Sibling: %d  ", sibling_count);
		}
		
		if( tree->typespecifier ) {
			if( tree->value == ID ) {
				
			}
		}
		/*
		// Statement?
		if( tree->nodekind == StmtK ) {
			
		}
		// Expression?
		else if( tree->nodekind == ExpK ) {
			
		}
		// Wtf?
		else {
			// error wtf. not wtf wtf.
		}
		*/
		
		// Print the line number + newline
		printf( "[line: %d]\n", tree->lineno );
		
		// Check if there are children
		if( tree->numChildren > 0 ) {
			// "tab" space for children
			printf( "   ");
			
			for ( int i = 0; i < tree->numChildren; i++ ) {
				// Two spaces after child num
				printf( "Child: %d  ", i);
				printAbstractTree(tree->child[i], indent_count + 1);
			}			
		}
		
		tree = tree->sibling;
		sibling_count++;
		
	} // end while
	
}

// TODO: placeholder Prints the Annotated Syntax Tree 
void printAnnotatedTree( TreeNode * tree ) {
	;
}

// TODO: placeholder Performs semantic analysis, generating the Annotated Syntax Tree
void semanticAnalysis( TreeNode * tree ) {
	;
}


// TODO: placeholder Generates executable code 
void generateCode() {
	;
}


TreeNode * makeNode( int value, int numChildren, ... ) {
	
	// Allocate a new node
	TreeNode * tempNode = allocNode();
	
	// Attach children
	tempNode->numChildren = numChildren;
	if(numChildren > 0) { // Congratulations, its a TreeNode pointer!
		va_list children; 
		va_start (children, numChildren); // Load children from arguments
		
		for(int i = 0; i < numChildren; i++) {
			tempNode->child[i] = va_arg(children, TreeNode*);
		}
		
		va_end(children); // End var list
	}
	
	return tempNode;
}


// Creates a new node for the syntax tree
void addChildren( TreeNode * parent, int numChildren,...) {
	
	// Attach children
	parent->numChildren = numChildren;
	if(numChildren > 0) { // Congratulations, its a TreeNode pointer!
		va_list children; 
		va_start (children, numChildren); // Load children from arguments
		
		for(int i = 0; i < numChildren; i++) {
			parent->child[i] = va_arg(children, TreeNode*);
		}
		
		va_end(children); // End var list
	}
}

TreeNode * linkSiblings( int numSiblings, ... ) {
	
	va_list siblings;
	va_start (siblings, numSiblings);
	
	TreeNode * prev = va_arg(siblings, TreeNode*);
	TreeNode * temp = prev;
	TreeNode * next = NULL;
	if(temp = NULL; )
	while (prev->sibling != NULL ) { prev = prev->sibling; }
	
	for(int i = 0; i < numSiblings; i++) {
		next = va_arg(siblings, TreeNode*);
		if(prev != NULL) {
			prev->sibling = next;
		}
		prev = next;
	}
	prev->sibling = NULL;
	va_end(siblings);
	
	return temp;
	
}