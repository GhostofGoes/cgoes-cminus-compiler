%{
#include <string.h>
#include <stdlib.h>
#include "cminus.tab.h"

//extern int linenumber = 0;

int toker(int num, int ival );
int toker(int num, char * val);
int toker(int num, char ch);
int error(const char * msg);

TreeNode * allocNode();

char * strip_chars(const char *string, const char *chars);


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
"//".*\n 	{ /* linenumber++; */ }

";"			{ return toker(SEMICOLON, yytext[0]); }
"("			{ return toker(LPAREN, yytext[0]); }
")"			{ return toker(RPAREN, yytext[0]); }
"["			{ return toker(LBRACKET, yytext[0]); }
"]"			{ return toker(RBRACKET, yytext[0]); }
"|"			{ return toker(OR, yytext[0]); }
"&"			{ return toker(AND, yytext[0]); }
"!"			{ return toker(NOT, yytext[0]); }
"="			{ return toker(ASSIGN, yytext[0]); }
"+"			{ return toker(PLUS, yytext[0]); }
"-"			{ return toker(MINUS, yytext[0]); }
"*"			{ return toker(MULTIPLY, yytext[0]); }
"/"			{ return toker(DIVIDE, yytext[0]); }
"%"			{ return toker(MODULUS, yytext[0]); }
"?"			{ return toker(QUESTION, yytext[0]); }
"<"			{ return toker(LTHAN, yytext[0]); }
">"			{ return toker(GTHAN, yytext[0]); }
"{"			{ return toker(LBRACE, yytext[0]); }
"}"			{ return toker(RBRACE, yytext[0]); }
","			{ return toker(COMMA, yytext[0]); }
":"			{ return toker(COLON, yytext[0]); }


	/* Should these be using the tok type? Nah. */
	/* Unary ops */
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
	
	/* Booleans */
"true"		{ return toker(BOOLCONST, 1); }
"false"		{ return toker(BOOLCONST, 0); }

	/* Tokens */
{letter}{letdig}*		{ return toker(ID, yytext); }
{digit}+				{ return toker(NUMCONST, atoi(yytext)); }
"\""{stringbody}*"\""	{ return toker(STRINGCONST, yytext); }
"'"{character}"'"		{ return toker(CHARCONST, strip_chars(yytext, "\"\'")); }

	/* Eat whitespace */
[ \t]		;

	/* Count lines. This might be cause of my woes... */
\n			{ /* linenumber++; */ }

	/* Shouldn't reach here. Unless its a invalid token. Then we print. */
.			{ return error("Invalid input character"); }

%%

// Rebuilt toker to use unified TreeNode type. TokenData is stored inside nodes.
int toker(int num, int ival ) {
	yylval.tree = allocNode();
	yylval.tree->lineno = yylineno;
	yylval.tree->token.num = num;
	yylval.tree->value = num;
	yylval.tree->token.input = strdup(yytext);
	yylval.tree->token.ivalue = ival;
	return num;
}


int toker(int num, char * val) {
	yylval.tree = allocNode();
	yylval.tree->lineno = yylineno;
	yylval.tree->token.num = num;
	yylval.tree->value = num;
	yylval.tree->token.input = strdup(yytext);
	yylval.tree->token.svalue = strdup(val);
	return num;
}

// Yet Another toker Clone, for Characters (YAtCC)
int toker(int num, char ch) {
	yylval.tree = allocNode();
	yylval.tree->lineno = yylineno;
	yylval.tree->token.num = num;
	yylval.tree->value = num;
	yylval.tree->token.input = strdup(yytext);
	yylval.tree->token.ch = ch;
	return num;
}

int error(const char * msg) {
	yylval.tree = allocNode();
	yylval.tree->lineno = yylineno;
	yylval.tree->token.num = ERROR;
	yylval.tree->value = ERROR;
	yylval.tree->token.input = strdup(yytext);
	yylval.tree->token.svalue = strdup(msg);
	return ERROR;
}

/*
// The OG toker. Does all the yylval stuff for us.
int toker(int num, int ival ) {
	yylval.tok.linenum = yylineno;
	yylval.tok.num = num;
	yylval.tok.input = strdup(yytext);
	yylval.tok.ivalue = ival;
	return num;
}

// toker clone, for strings!
int toker(int num, char * val) {
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
*/

/*
TreeNode * allocNode() {
	TreeNode * tempNode = (TreeNode *)calloc(1, sizeof(TreeNode *));
	tempNode->numChildren = 0;
	tempNode->child = NULL;
	tempNode->sibling = NULL;
	return tempNode;
}
*/

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
