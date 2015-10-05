%{
#include <string.h>
#include <stdlib.h>
#include "cminus.tab.h"

int toker(int num, int ival );
int toker(int num, char * val);
int toker(int num, char ch);
int strconst();
int cconst();
int customError(const char * msg, const char * input);

char * stringbuffer;
char * sbuf_ptr;

char * literalbuffer;

char ctemp;
int clength = 0;


%}

%option yylineno
%option noyywrap

letter 		[a-zA-Z]
digit		[0-9]
letdig		({digit}|{letter})
character	([^'])|(\\[^n])
string		({character}*)

%x scond
%x ccond

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


"+="		{ return toker(ADDASS, yytext); }
"-="		{ return toker(SUBASS, yytext); }
"*="		{ return toker(MULASS, yytext); }
"/="		{ return toker(DIVASS, yytext); }
"++"		{ return toker(INC, yytext); }
"--"		{ return toker(DEC, yytext); }
"<="		{ return toker(LESSEQ, yytext); }
">="		{ return toker(GRTEQ, yytext); }
"=="		{ return toker(EQ, yytext); }
"!="		{ return toker(NOTEQ, yytext); }
"static"	{ return toker(STATIC, yytext); }
"int"		{ return toker(INT, yytext); }
"bool"		{ return toker(BOOL, yytext); }
"char"		{ return toker(CHAR, yytext); }
"if"		{ return toker(IF, yytext); }
"else"		{ return toker(ELSE, yytext); }
"while"		{ return toker(WHILE, yytext); }
"foreach"	{ return toker(FOREACH, yytext); }
"in"		{ return toker(IN, yytext); }
"return"	{ return toker(RETURN, yytext); }
"break"		{ return toker(BREAK, yytext); }

	/*
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
	*/

	/* Booleans */
"true"		{ return toker(BOOLCONST, 1); }
"false"		{ return toker(BOOLCONST, 0); }

	/* Tokens */
\"			{ 
				stringbuffer = (char *)calloc(100, sizeof(char));
				sbuf_ptr = stringbuffer;
				literalbuffer = (char *)calloc(110, sizeof(char)); 
				strcat(literalbuffer, yytext);
				BEGIN(scond); 
			}
<scond>{
	\"	{
		strcat(literalbuffer, yytext);
		*sbuf_ptr = '\0';
		BEGIN(INITIAL);
		return strconst();
	}
	\n 	{
		free(literalbuffer);
		BEGIN(INITIAL);
		return customError("Invalid input character", "\"");
		//return toker(ERROR, "Invalid input character");
	}
	\\n { 
		*sbuf_ptr++ = '\n';
		strcat(literalbuffer, yytext);
	}
	\\0 { 
		*sbuf_ptr++ = '\0'; 
		strcat(literalbuffer, yytext);
	}
	\\.	{ 
		*sbuf_ptr++ = yytext[1]; 
		strcat(literalbuffer, yytext);
	}
	.	{ 
		*sbuf_ptr++ = yytext[0]; 
		strcat(literalbuffer, yytext);
	}
}

\'		{ 
			literalbuffer = (char *)calloc(5, sizeof(char));
			strcat(literalbuffer, yytext);
			clength = 0;
			BEGIN(ccond);
		}
<ccond>{
	\'	{
		strcat(literalbuffer, yytext);
		BEGIN(INITIAL);
		return cconst();
	}
	\n 	{
		free(literalbuffer);
		BEGIN(INITIAL);
		return customError("Invalid input character", "'");
		//return toker(ERROR, "Invalid input character");
	}
	\\n { 
		ctemp = '\n';
		strcat(literalbuffer, yytext);
	}
	\\0 { 
		ctemp = '\0'; 
		strcat(literalbuffer, yytext);
	}
	\\.	{ 
		ctemp = yytext[1]; 
		strcat(literalbuffer, yytext);
	}
	.	{ 
		ctemp = yytext[0]; 
		strcat(literalbuffer, yytext);
	}	
}

{letter}{letdig}*	{ return toker(ID, yytext); }
{digit}+			{ return toker(NUMCONST, atoi(yytext)); }

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

int customError(const char * msg, const char * input) {
	int temp = ERROR;
	yylval.tok.linenum = yylineno;
	yylval.tok.num = temp;
	yylval.tok.input = strdup(input);
	yylval.tok.svalue = strdup(msg);
	return temp;
}

int strconst() {
	yylval.tok.linenum = yylineno;
	yylval.tok.num = STRINGCONST;
	yylval.tok.input = strdup(literalbuffer);
	free(literalbuffer);
	yylval.tok.svalue = strdup(stringbuffer);
	free(stringbuffer);
	return STRINGCONST;
}

int cconst() {
	yylval.tok.linenum = yylineno;
	yylval.tok.num = CHARCONST;
	yylval.tok.input = strdup(literalbuffer);
	free(literalbuffer);
	yylval.tok.ch = ctemp;
	return CHARCONST;
}