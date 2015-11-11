#include <string.h>
#include <stdlib.h>

#include "toker.h"
#include "cminus.h"
#include "types.h"
#include "cminus.tab.h"


int iToker(int bval, char * tok_text, int line_number, int value) {
	yylval.tok = allocToken(bval, tok_text, line_number);
	yylval.tok->ivalue = value;
	return bval;
}

int cToker(int bval, char * tok_text, int line_number, char value) {
	yylval.tok = allocToken(bval, tok_text, line_number);
	yylval.tok->cvalue = value;
	return bval;
}

int sToker(int bval,  char * tok_text, int line_number, char * value) {
	yylval.tok = allocToken(bval, tok_text, line_number);
	//yylval.tok->svalue = value;
	if(value != NULL) {
            //yylval.tok->svalue = (char *)malloc(sizeof(value));
            //memcpy( yylval.tok->svalue, value, sizeof(value));
            yylval.tok->svalue = strdup(value);
	}
	return bval;
}

/*int error(char * tok_text, int line_number, const char * msg) {
	yylval.tok = allocToken( ERROR, tok_text, line_number );
	if(msg != NULL) {
		yylval.tok->svalue = strdup(msg);
	}
	return ERROR;
}*/

TokenData * allocToken(int bval, char * input_text, int linenum) {
    TokenData * newToken = (TokenData *) calloc(1, sizeof (TokenData));
    newToken->bval = bval;
    if (input_text != NULL) {
        //newToken->input = (char *) malloc(sizeof (input_text));
        //memcpy(newToken->input, input_text, sizeof (input_text));
        newToken->input = strdup(input_text);
    } else {
        newToken->input = NULL;
    }
    newToken->lineno = linenum;
    newToken->cvalue = 0;
    newToken->ivalue = 0;
    newToken->svalue = NULL;
    //newToken->input = NULL; why would i do this after strduping it. ugh.
    return newToken;
}
