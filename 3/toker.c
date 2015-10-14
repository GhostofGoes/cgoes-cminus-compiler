#include <string.h>
#include "toker.h"
#include "cminus.h"
#include "types.h"
#include "cminus.tab.h"


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

int strconst() {
	yylval.tree = allocNode();
	yylval.tree->lineno = yylineno;
	yylval.tree->token.num = STRINGCONST;
	yylval.tree->value = STRINGCONST;
	yylval.tree->token.input = strdup(literalbuffer);
	yylval.tree->token.svalue = strdup(stringbuffer);
	free(literalbuffer);
	free(stringbuffer);
	return STRINGCONST;
}

int cconst() {
	yylval.tree = allocNode();
	yylval.tree->lineno = yylineno;
	yylval.tree->token.num = CHARCONST;
	yylval.tree->value = CHARCONST;
	yylval.tree->token.input = strdup(literalbuffer);
	yylval.tree->token.ch = ctemp;
	free(literalbuffer);
	return CHARCONST;
}
