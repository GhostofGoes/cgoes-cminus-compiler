// // // // // // // // // // // // // // // // // // // // 
//
// Error message printing
//
// Must make messages look nice.  For example:
// msg = "syntax error, unexpected ',', expecting BOOL or CHAR or INT or ID."
// becomes (xx marks important data):
//  0 syntax
//  1 error,
//  2 unexpected
//  3 ',',    xx
//  4 expecting
//  5 BOOL    xx
//  6 or
//  7 CHAR    xx
//  8 or
//  9 INT     xx
// 10 or
// 11 ID.     xx

// assumes a string with breakchar separating each element.
// breakchars will be replaced by null chars: '\0'
// array of pointers to strings is then returned in
// the array strs which must be allocated by the user!
// the number of strings found is returned as a value of
// the function.  This number is always at least 1.
// The array is terminated by a NULL so there must be
// enough room for all the string pointers plus one for the
// sentinal marker.

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include <map>
#include <string>

#include "cminus.tab.h"
#include "types.h"
#include "cminus.h"
#include "toker.h"
#include "yyerrorHelper.h"

int split(char *s, char *strs[], char breakchar)
{
    int num;
    
    strs[0] = s;
    num = 1;
    for (char *p = s; *p; p++) {
        if (*p==breakchar) {
            strs[num++] = p+1;
            *p = '\0';
        }
    }
    strs[num] = NULL;
    
    return num;
}


// trim off the last character
void trim(char *s)
{
    s[strlen(s)-1] = '\0';
}


// map from string to char * for storing nice translation of
// internal names for tokens.  Preserves (char *) used by
// bison.
static std::map<std::string , char *> niceTokenNameMap;    // use an ordered map (not as fast as unordered)

// WARNING: this routine must be called to initialize mapping of
// (strings returned as error message) --> (human readable strings)
//
void initTokenMaps() {
    
    niceTokenNameMap["AND"] = (char *)"'&'";
    niceTokenNameMap["OR"] = (char *)"'|'";
    niceTokenNameMap["NOT"] = (char *)"'!'";
    niceTokenNameMap["SEMICOLON"] = (char *)"';'";
    niceTokenNameMap["LPAREN"] = (char *)"'('";
    niceTokenNameMap["RPAREN"] = (char *)"')'";
    niceTokenNameMap["LBRACKET"] = (char *)"'['";
    niceTokenNameMap["RBRACKET"] = (char *)"']'";
    niceTokenNameMap["ASSIGN"] = (char *)"'='";
    niceTokenNameMap["PLUS"] = (char *)"'+'";
    niceTokenNameMap["MINUS"] = (char *)"'-'";
    niceTokenNameMap["MULTIPLY"] = (char *)"'*'";
    niceTokenNameMap["DIVIDE"] = (char *)"'/'";
    niceTokenNameMap["MODULUS"] = (char *)"'%'";
    niceTokenNameMap["QUESTION"] = (char *)"'?'";
    niceTokenNameMap["LTHAN"] = (char *)"'<'";
    niceTokenNameMap["GTHAN"] = (char *)"'>'";
    niceTokenNameMap["LBRACE"] = (char *)"'{'";
    niceTokenNameMap["RBRACE"] = (char *)"'}'";
    niceTokenNameMap["COMMA"] = (char *)"','";
    niceTokenNameMap["COLON"] = (char *)"':'";
   
    
    niceTokenNameMap["NOTEQ"] = (char *)"'!='";
    niceTokenNameMap["MULASS"] = (char *)"'*='";
    niceTokenNameMap["INC"] = (char *)"'++'";
    niceTokenNameMap["ADDASS"] = (char *)"'+='";
    niceTokenNameMap["DEC"] = (char *)"'--'";
    niceTokenNameMap["SUBASS"] = (char *)"'-='";
    niceTokenNameMap["DIVASS"] = (char *)"'/='";
    niceTokenNameMap["LESSEQ"] = (char *)"'<='";
    niceTokenNameMap["EQ"] = (char *)"'=='";
    niceTokenNameMap["GRTEQ"] = (char *)"'>='";
    niceTokenNameMap["BOOL"] = (char *)"bool";
    niceTokenNameMap["BREAK"] = (char *)"break";
    niceTokenNameMap["CHAR"] = (char *)"char";
    niceTokenNameMap["ELSE"] = (char *)"else";
    niceTokenNameMap["FOREACH"] = (char *)"foreach";
    niceTokenNameMap["IF"] = (char *)"if";
    niceTokenNameMap["IN"] = (char *)"in";
    niceTokenNameMap["INT"] = (char *)"int";
    niceTokenNameMap["RETURN"] = (char *)"return";
    niceTokenNameMap["STATIC"] = (char *)"static";
    niceTokenNameMap["WHILE"] = (char *)"while";
    niceTokenNameMap["BOOLCONST"] = (char *)"Boolean constant";
    niceTokenNameMap["NUMCONST"] = (char *)"numeric constant";
    niceTokenNameMap["ID"] = (char *)"identifier";
    niceTokenNameMap["CHARCONST"] = (char *)"character constant";
    niceTokenNameMap["STRINGCONST"] = (char *)"string constant";
    niceTokenNameMap["$end"] = (char *)"end of input";
}


// looks of pretty printed words for tokens that are
// not already in single quotes.  It uses the niceTokenNameMap table.
char *niceTokenStr(char *tokenName ) {
    if (tokenName[0] == '\'') return tokenName;
    if (niceTokenNameMap.find(tokenName) == niceTokenNameMap.end()) {
        printf("ERROR(SYSTEM): niceTokenStr fails to find string '%s'\n", tokenName); 
        fflush(stdout);
        //exit(1);
    }
    return niceTokenNameMap[tokenName];
}


// Is this a message that we need to elaborate with the current parsed token.
// This elaboration is some what of a crap shoot since the token could
// be already overwritten with a look ahead token.   But probably not.
bool elaborate(char *s)
{
    return (strstr(s, "constant") || strstr(s, "identifier"));
}


// A tiny sort routine for SMALL NUMBERS of
// of char * elements.  num is the total length
// of the array but only every step elements will
// be sorted.  The "up" flag is direction of sort.
// For example:
//    tinySort(str, i, 2, direction);      // sorts even number elements in array
//    tinySort(str+1, i-1, 2, direction);  // sorts odd number elements in array
//    tinySort(str, i, 1, direction);      // sorts all elements in array
//
void tinySort(char *base[], int num, int step, bool up)
{
    for (int i=step; i<num; i+=step) {
        for (int j=0; j<i; j+=step) {
            if (up ^ (strcmp(base[i], base[j])>0)) {
                char *tmp;
                tmp = base[i]; base[i] = base[j]; base[j] = tmp;
            }
        }
    }
}

// This is the yyerror called by the bison parser for errors.
// It only does errors and not warnings.   
void yyerror(const char *msg)
{
    char *space;
    char *strs[100];
    int numstrs;

    // make a copy of msg string
    space = strdup(msg);

    // split out components
    numstrs = split(space, strs, ' ');
    if (numstrs>4) trim(strs[3]);

    // translate components
    for (int i=3; i<numstrs; i+=2) {
        strs[i] = niceTokenStr(strs[i]);
    }

    // print components
    printf("ERROR(%d): Syntax error, unexpected %s", yylineno, strs[3]);
    if (elaborate(strs[3])) {
        if (yytext[0]=='\'' || yytext[0]=='"') printf(" %s", yytext); 
        else printf(" \'%s\'", yytext);
    }
    if (numstrs>4) printf(",");
    tinySort(strs+5, numstrs-5, 2, true); 
    for (int i=4; i<numstrs; i++) {
        printf(" %s", strs[i]);
    }
    printf(".\n");
    fflush(stdout);   // force a dump of the error

    errors++;

    free(space);
}




