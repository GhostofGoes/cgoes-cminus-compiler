// semantic_errors.cpp

#include <iostream>
#include <cstdlib>
#include <cstdio>

#include "cminus.h"
#include "semantic_errors.h"
#include "trees.h"
#include "printing.h"
#include "types.h"

bool isBoolean( Type t )
{
    if( t != Undef && t != Void )
    {
        return typeCompare( t, Boolean );
    }
    else
    {
        return false;
    }
}

bool isInteger( Type t )
{
    if( t != Undef && t != Void )
    {
        return typeCompare( t, Integer );    
    }
    else
    {
        return false;
    }    
}

bool isCharacter( Type t )
{
    if( t != Undef && t != Void )
    {
        return typeCompare( t, Character );    
    }
    else
    {
        return false;
    } 
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
    return a == b ? true : false;
}