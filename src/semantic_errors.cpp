// semantic_errors.cpp

#include <iostream>
#include <cstdlib>
#include <cstdio>

#include "cminus.h"
#include "semantic_errors.h"
#include "trees.h"
#include "printing.h"
#include "types.h"

// TODO: don't use this for actual program logic, just error checking part!
// why? because it suppresses voids/undefs

bool isBoolean( Type t )
{
    return typeCompare( t, Boolean );
}

bool isInteger( Type t )
{
    return typeCompare( t, Integer );    
}

bool isCharacter( Type t )
{
    return typeCompare( t, Character );    
}

bool isVoid( Type t )
{
    return t == Void ? true : false;
}

bool isUndef( Type t )
{
    return t == Undef ? true : false;
}

bool typeCompare( Type a, Type b )
{
    if( a != Undef && b != Undef  )
        return a == b;
    else
        return true;
}

bool hasType( Type t )
{
    if( t != Undef  )
        return true;
    else
        return false;
}