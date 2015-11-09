%{
#include <string.h>
#include <stdlib.h>
#include "cminus.tab.h"

int toker(int num, int ival );
int toker(int num, char * val);
int toker(int num, char ch);
char * strip_chars(const char *string, const char *chars);

%}

%option yylineno
%option noyywrap

letter 		[a-zA-Z]
digit		[0-9]
letdig		({digit}|{letter})
character	(.|"\\".)
string		({character}*)


%%
"//".*\n 	{ }

";"			{ return toker(SINGLE, yytext[0]); }
"("			{ return toker(SINGLE, yytext[0]); }
")"			{ return toker(SINGLE, yytext[0]); }
"["			{ return toker(SINGLE, yytext[0]); }
"]"			{ return toker(SINGLE, yytext[0]); }
"|"			{ return toker(SINGLE, yytext[0]); }
"&"			{ return toker(SINGLE, yytext[0]); }
"!"			{ return toker(SINGLE, yytext[0]); }
"="			{ return toker(SINGLE, yytext[0]); }
"+"			{ return toker(SINGLE, yytext[0]); }
"-"			{ return toker(SINGLE, yytext[0]); }
"*"			{ return toker(SINGLE, yytext[0]); }
"/"			{ return toker(SINGLE, yytext[0]); }
"%"			{ return toker(SINGLE, yytext[0]); }
"?"			{ return toker(SINGLE, yytext[0]); }
"<"			{ return toker(SINGLE, yytext[0]); }
">"			{ return toker(SINGLE, yytext[0]); }
"}"			{ return toker(SINGLE, yytext[0]); }
"{"			{ return toker(SINGLE, yytext[0]); }
","			{ return toker(SINGLE, yytext[0]); }
":"			{ return toker(SINGLE, yytext[0]); }
"+="		{ return ADDASS; }
"-="		{ return SUBASS; }
"*="		{ return MULASS; }
"/="		{ return DIVASS; }
"++"		{ return INC; }
"--"		{ return DEC; }
"<="		{ return LESSEQ; }
">="		{ return GRTEQ; }
"=="		{ return EQ; }
"!="		{ return NOTEQ; }
"static"	{ return STATIC; }
"int"		{ return INT; }
"bool"		{ return BOOL; }
"char"		{ return CHAR; }
"if"		{ return IF; }
"else"		{ return ELSE; }
"while"		{ return WHILE; }
"foreach"	{ return FOREACH; }
"in"		{ return IN; }
"return"	{ return RETURN; }
"break"		{ return BREAK; }
	
	/* Booleans */
"true"		{ return toker(BOOLCONST, 1); }
"false"		{ return toker(BOOLCONST, 0); }

	/* Tokens */

{letter}{letdig}*	{ return toker(ID, yytext); }
{digit}+			{ return toker(NUMCONST, atoi(yytext)); }
\"{string}*\"		{ return toker(STRINGCONST, yytext); }
\'.\'		{ return toker(CHARCONST, strip_chars(yytext, "\"\'")); }
\'"\\".\'	{ return toker(CHARCONST, yytext); }


[ \t]		;
\n			{ }
.			{ return toker(ERROR, "Invalid input character"); }

%%

int toker(int num, int ival ) {
	yylval.tok.linenum = yylineno;
	yylval.tok.num = num;
	yylval.tok.input = strdup(yytext);
	yylval.tok.ivalue = ival;
	return num;
}

int toker(int num, char * val) {
	yylval.tok.linenum = yylineno;
	yylval.tok.num = num;
	yylval.tok.input = strdup(yytext);
	yylval.tok.svalue = strdup(val);
	return num;
}

int toker(int num, char ch) {
	yylval.tok.linenum = yylineno;
	yylval.tok.num = num;
	yylval.tok.input = strdup(yytext);
	yylval.tok.ch = ch;
	return num;
}
  /* removes all chars from string */
  /* http://rosettacode.org/wiki/Strip_a_set_of_characters_from_a_string */
char * strip_chars(const char *string, const char *chars)
{
  char * newstr = (char *)malloc(strlen(string) + 1);
  int counter = 0;
 
  for ( ; *string; string++) {
    if (!strchr(chars, *string)) {
      newstr[ counter ] = *string;
      ++ counter;
    }
  }
 
  newstr[counter] = 0;
  return newstr;
}
