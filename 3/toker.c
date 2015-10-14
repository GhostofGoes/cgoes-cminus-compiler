#include <string.h>
#include "toker.h"
#include "cminus.h"
#include "types.h"
#include "cminus.tab.h"


int iToker(int bval, Kind tok_kind, Type tok_type, char * tok_text, int line_number, int value) {

	baseToker(bval, tok_kind, tok_type, tok_text, line_number );
	yylval.tree->token.ivalue = value;

	return bval;
}


int cToker(int bval, Kind tok_kind, Type tok_type, char * tok_text, int line_number, char value) {

	baseToker(bval, tok_kind, tok_type, tok_text, line_number );
	yylval.tree->token.cvalue = value;

	return bval;
}
int sToker(int bval, Kind tok_kind, Type tok_type, char * tok_text, int line_number, char * value) {

	baseToker(bval, tok_kind, tok_type, tok_text, line_number );
	yylval.tree->token.svalue = strdup(value);

	return bval;
}

void baseToker(int bval, Kind tok_kind, Type tok_type, char * tok_text, int line_number ) {
	yylval.tree = allocNode();
	yylval.tree->lineno = line_number;
	yylval.tree->token.num = bval; // TODO: deprecated?
	yylval.tree->bval = bval;
	yylval.tree->token.input = strdup(tok_text);
	yylval.tree->kind = tok_kind;
	yylval.tree->nodetype = tok_type;
}

int error(char * tok_text, int line_number, const char * msg) {
	yylval.tree = allocNode();
	yylval.tree->lineno = line_number;
	yylval.tree->token.num = ERROR;
	yylval.tree->bval = ERROR;
	yylval.tree->token.input = strdup(tok_text);
	yylval.tree->token.svalue = strdup(msg);
	return ERROR;
}

/*
int toker(int num, int ival ) {
	yylval.tree = allocNode();
	yylval.tree->lineno = yylineno;
	yylval.tree->token.num = num;
	yylval.tree->bval = num;
	yylval.tree->token.input = strdup(yytext);
	yylval.tree->token.ivalue = ival;
	return num;
}


int toker(int num, char * val) {
	yylval.tree = allocNode();
	yylval.tree->lineno = yylineno;
	yylval.tree->token.num = num;
	yylval.tree->bval = num;
	yylval.tree->token.input = strdup(yytext);
	yylval.tree->token.svalue = strdup(val);
	return num;
}

// Yet Another toker Clone, for Characters (YAtCC)
int toker(int num, char ch) {
	yylval.tree = allocNode();
	yylval.tree->lineno = yylineno;
	yylval.tree->token.num = num;
	yylval.tree->bval = num;
	yylval.tree->token.input = strdup(yytext);
	yylval.tree->token.ch = ch;
	return num;
}



int strconst() {
	yylval.tree = allocNode();
	yylval.tree->lineno = yylineno;
	yylval.tree->token.num = STRINGCONST;
	yylval.tree->bval = STRINGCONST;
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
	yylval.tree->bval = CHARCONST;
	yylval.tree->token.input = strdup(literalbuffer);
	yylval.tree->token.ch = ctemp;
	free(literalbuffer);
	return CHARCONST;
}
*/
