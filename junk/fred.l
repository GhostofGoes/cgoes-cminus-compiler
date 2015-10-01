%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
int num;
%}
%option noyywrap
%%
[0-9]+		{ printf("Number: %d", atoi(yytext)); }
[a-zA-Z]+	{ printf("Word, man: %s\n", yytext); }
.|\n	;
%%
int main()
{
	num = 0; // middle section is yylex, so can initialize before its executed
	yylex();
	
	return 0;
	
}

