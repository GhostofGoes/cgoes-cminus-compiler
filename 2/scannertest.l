%{
#include <string>
#include <stdlib.h>
#include "scannertest.tab.h"

int toker(int num, int ival );
int toker(int num, const char * val);
int toker(int num, char ch);

const char * trim_str( char * s );

%}

%option yylineno
%option noyywrap

letter 		[a-zA-Z]
digit		[0-9]
letdig		({digit}|{letter})
character	([^'])|(\\[^n])
stringbody	([^"])|(\\[^n])


%%

	/* Eat single line comments */
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

	/* Should these be using the tok type? Nah. */
	/* Unary ops */
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
{letter}{letdig}*		{ return toker(ID, yytext); }
{digit}+				{ return toker(NUMCONST, atoi(yytext)); }
"\""{stringbody}*"\""	{ return toker(STRINGCONST, trim_str(yytext)); }
"'"{character}"'"		{ return toker(CHARCONST, trim_str(yytext)); }

	/* Eat whitespace */
[ \t]		;

	/* Count lines. This might be cause of my woes... */
\n			;

	/* Shouldn't reach here. Unless its a invalid token. Then we print. */
.			{ return toker(ERROR, "Invalid input character"); }

%%

// The OG toker. Does all the yylval stuff for us.
int toker(int num, int ival ) {
	yylval.tok.linenum = yylineno;
	yylval.tok.num = num;
	yylval.tok.input = strdup(yytext);
	yylval.tok.ivalue = ival;
	return num;
}

// toker clone, for strings!
int toker(int num, const char * val) {
	yylval.tok.linenum = yylineno;
	yylval.tok.num = num;
	yylval.tok.input = strdup(yytext);
	yylval.tok.svalue = strdup(val);
	return num;
}

// Yet Another toker Clone, for Characters (YAtCC)
int toker(int num, char ch) {
	yylval.tok.linenum = yylineno;
	yylval.tok.num = num;
	yylval.tok.input = strdup(yytext);
	yylval.tok.ch = ch;
	return num;
	
}


const char * trim_str( char * s ) {
	std::string temp(s + 2, strlen(s) - 3);
	return temp.c_str();
}
