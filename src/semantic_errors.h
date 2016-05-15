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

bool hasType( Type t );

#endif	/* SEMANTIC_ERRORS_H */

