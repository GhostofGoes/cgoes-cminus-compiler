%{
#include <stdio.h>
#include <math.h>
#include <stdlib.h>
int num = 1;
int w = 1;
%}
%option noyywrap
letter [a-zA-Z]
%%
[0-9]+          { printf("NUM: %s\n", yytext); printf("Num of NUM: %d\n", num); num++; }
{letter}+       { printf("WORD: %s\n", yytext); printf("Num of WORD: %d\n", w); w++; }
.|\n            ;
%%
int main()
{
        yylex();
        return 0;
}


