/* 
 * File:   yyerrorHelper.h
 * Author: tehlizard
 *
 * Created on November 10, 2015, 1:03 PM
 */

#ifndef YYERRORHELPER_H
#define	YYERRORHELPER_H

int split(char *s, char *strs[], char breakchar);

// trim off the last character
void trim(char *s);

// WARNING: this routine must be called to initialize mapping of
// (strings returned as error message) --> (human readable strings)
//
void initTokenMaps();

// looks of pretty printed words for tokens that are
// not already in single quotes.  It uses the niceTokenNameMap table.
char *niceTokenStr(char *tokenName );

// Is this a message that we need to elaborate with the current parsed token.
// This elaboration is some what of a crap shoot since the token could
// be already overwritten with a look ahead token.   But probably not.
bool elaborate(char *s);

// A tiny sort routine for SMALL NUMBERS of
// of char * elements.  num is the total length
// of the array but only every step elements will
// be sorted.  The "up" flag is direction of sort.
// For example:
//    tinySort(str, i, 2, direction);      // sorts even number elements in array
//    tinySort(str+1, i-1, 2, direction);  // sorts odd number elements in array
//    tinySort(str, i, 1, direction);      // sorts all elements in array
//
void tinySort(char *base[], int num, int step, bool up);


// This is the yyerror called by the bison parser for errors.
// It only does errors and not warnings.   
//void yyerror(const char *msg);

#endif	/* YYERRORHELPER_H */

