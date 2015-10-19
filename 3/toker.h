#ifndef _TOKER_H_
#define _TOKER_H_

#include "cminus.h"
#include "types.h"
#include "cminus.tab.h"

// Token creation methods
int iToker(int bval, char * tok_text, int line_number, int value);
int cToker(int bval, char * tok_text, int line_number, char value);
int sToker(int bval, char * tok_text, int line_number, char * value);
int error(char * tok_text, int line_number, const char * msg);

// Allocates and zeros a token
TokenData * allocToken(int bval, char * input_text, int line_number);

#endif
