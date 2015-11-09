%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int yylex();
extern int yylineno;
extern FILE * yyin;

#define YYERROR_VERBOSE

static void yyerror(const char *);
void easy( int linenum, char * svalue );

%}

%code requires {
	typedef struct {
		int linenum;
		int num;
		char ch; 
		int ivalue;
		char * svalue;
		char * input;
	} TokenData;
}

%union 
{
	TokenData tok;
}

%token <tok> ID
%token <tok> NUMCONST
%token <tok> STRINGCONST
%token <tok> CHARCONST 
%token <tok> ERROR
%token <tok> BOOLCONST
%token <tok> SINGLE
%token <tok> ADDASS SUBASS MULASS DIVASS INC DEC LESSEQ GRTEQ EQ NOTEQ STATIC INT BOOL CHAR IF ELSE WHILE FOREACH IN RETURN BREAK

%%

start	: start statement
		| statement 
		;

statement	: ID			{ printf("Line %d Token: ID Value: %s\n", $1.linenum, $1.svalue );  }
			| NUMCONST		{ printf("Line %d Token: NUMCONST Value: %d Input: %s\n", $1.linenum, atoi($1.input), $1.input ); }
			| STRINGCONST	{ printf("Line %d Token: STRINGCONST Value of length %d: \"%s\" Input: %s\n", $1.linenum, (int)strlen($1.svalue), $1.svalue, $1.input ); }
			| CHARCONST		{ printf("Line %d Token: CHARCONST Value: '%c' Input: %s\n", $1.linenum, $1.ch, $1.input ); }
			| BOOLCONST		{ printf("Line %d Token: BOOLCONST Value: %d Input: %s\n", $1.linenum, $1.ivalue, $1.input ); }
			| ERROR			{ printf("ERROR(%d): %s: \"%s\"\n", $1.linenum, $1.svalue, $1.input); }
			| SINGLE		{ printf("Line %d Token: %c\n", $1.linenum, $1.ch ); }	
			| ADDASS		{ easy($1.linenum, "ADDASS"); }
			| SUBASS		{ easy($1.linenum, "SUBASS"); }
			| MULASS		{ easy($1.linenum, "MULASS"); }
			| DIVASS 		{ easy($1.linenum, "DIVASS"); }
			| INC 			{ easy($1.linenum, "INC"); }
			| DEC 			{ easy($1.linenum, "DEC"); }
			| LESSEQ 		{ easy($1.linenum, "LESSEQ"); }
			| GRTEQ 		{ easy($1.linenum, "GRTEQ"); }
			| EQ 			{ easy($1.linenum, "EQ"); }
			| NOTEQ 		{ easy($1.linenum, "NOTEQ"); }
			| STATIC 		{ easy($1.linenum, "STATIC"); }
			| INT 			{ easy($1.linenum, "INT"); }
			| BOOL 			{ easy($1.linenum, "BOOL"); }
			| CHAR 			{ easy($1.linenum, "CHAR"); }
			| IF 			{ easy($1.linenum, "IF"); }
			| ELSE 			{ easy($1.linenum, "ELSE"); }
			| WHILE 		{ easy($1.linenum, "WHILE"); }
			| FOREACH 		{ easy($1.linenum, "FOREACH"); }
			| IN 			{ easy($1.linenum, "IN"); }
			| RETURN 		{ easy($1.linenum, "RETURN"); }
			| BREAK 		{ easy($1.linenum, "BREAK"); }
			|
			;

%%

int main( int argc, char* argv[] ) {
	// free($1.svalue); free($1.input); 
	// If a filename passed, use that as input
	if( argc > 1 ) {
		yyin = fopen( argv[1], "r" );
	}
	
	do {
		yyparse();
	} while (!feof(yyin));
	return 0;
}


static void yyerror(const char *msg)
{
      printf("ERROR(%d): %s\n", yylineno, msg);
}

void easy( int linenum, char * svalue ){ 
	printf("Line %d Token: %s\n", linenum, svalue );
}