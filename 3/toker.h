#ifndef _TOKER_H_
#define _TOKER_H_

#include "cminus.h"
#include "types.h"
#include "cminus.tab.h"

int iToker(int bval, Kind tok_kind, Type tok_type, char * tok_text, int line_number, int value);
int cToker(int bval, Kind tok_kind, Type tok_type, char * tok_text, int line_number, char value);
int sToker(int bval, Kind tok_kind, Type tok_type, char * tok_text, int line_number, char * value);

// Horrible for performance. Great for code maintainability!
void baseToker(int bval, Kind tok_kind, Type tok_type, char * tok_text, int line_number );

int error(char * tok_text, int line_number, const char * msg);

/*
int toker(int num, int ival );
int toker(int num, char * val);
int toker(int num, char ch);
int error(const char * msg);

// Handles string constants
int strconst();

// Handles character constants
int cconst();
*/

#endif
