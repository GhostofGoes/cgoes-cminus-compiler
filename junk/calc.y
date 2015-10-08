%{
#include <stdio.h>
#include <stdlib.h>

extern int yylex();

#define YYERROR_VERBOSE
void yyerror(const char *msg)
{
	printf("ERROR(PARSER): %s\n", msg);
}

%}

%union {
	int lvalue;
}

%token T
%token F
%token IMPLIES
%token QUIT

%%
statementlist 	: statement statementlist
		| statement
		;

statement	: QUIT { exit(0); }
		;
%%
int main()
{
	// pre-parsing
	yyparse();
	// post-parsing
	return 0;
}
