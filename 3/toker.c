#include <string.h>
#include "toker.h"
#include "cminus.h"
#include "types.h"
#include "cminus.tab.h"


int iToker(int bval, char * tok_text, int line_number, int value) {

	//yylval.tree = allocNode();
	yylval.tok = allocToken(bval, tok_text, line_number);
	yylval.tok->ivalue = value;
	return bval;
}


int cToker(int bval, char * tok_text, int line_number, char value) {

	//yylval.tree = allocNode();
	yylval.tok = allocToken(bval, tok_text, line_number);
	yylval.tok->cvalue = value;
	return bval;
}
int sToker(int bval,  char * tok_text, int line_number, char * value) {

	//yylval.tree = allocNode();
	yylval.tok = allocToken(bval, tok_text, line_number);
	yylval.tok->svalue = strdup(value);
	return bval;
}

int error(char * tok_text, int line_number, const char * msg) {
	//yylval.tree = allocNode();
	yylval.tok= allocToken( ERROR, line_number, tok_text);
	yylval.tok->svalue = strdup(msg);
	//yylval.tree->lineno = line_number;
	//yylval.tree->token.num = ERROR;
	//yylval.tree->bval = ERROR;
	//yylval.tree->token.input = strdup(tok_text);
	//yylval.tree->token.svalue = strdup(msg);
	return ERROR;
}

TokenData * allocToken( int bval, char * input_text, int linenum ) {
	TokenData * newToken = (TokenData *)calloc(1, sizeof(TokenData));
	newToken->bval = bval;
	newToken->input = strdup(input_text);
	newToken->linenum = linenum;
	newToken->cvalue = 0;
	newToken->ivalue = 0;
	newToken->svalue = NULL;
	return newToken;
}
