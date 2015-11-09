/* 
 * File:   semantic_errors.h
 * Author: tehlizard
 *
 * Created on November 9, 2015, 1:00 PM
 */

#ifndef SEMANTIC_ERRORS_H
#define	SEMANTIC_ERRORS_H

#include "types.h"

// TODO: implement as class to preserve context, and do error printing from external from main logic

bool isBoolean( Type t );
bool isInteger( Type t );
bool isCharacter( Type t );
bool isVoid( Type t );
bool isUndef( Type t );

bool typeCompare( Type a, Type b );


#endif	/* SEMANTIC_ERRORS_H */

