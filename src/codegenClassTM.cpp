/* 
 * File:   codegenClassTM.cpp
 * Author: tehlizard
 * 
 * Created on December 4, 2015, 12:40 PM
 */

#include "codegenClassTM.h"
#include "cminus.h"
#include "types.h"
#include "emit.h"
#include <iostream>
#include <cstdlib>
#include <string>

codegenTM::codegenTM ( TreeNode * annotatedTree, SymbolTable * symtable, int global_offset ) 
{ 
    symtab = symtable;
    gOffset = global_offset;
    tree = annotatedTree;
    tmpOffset = 0;
}

codegenTM::~codegenTM ( ) 
{ 

}

void codegenTM::generateCode()
{
    
}

void codegenTM::generateStatement( TreeNode * node )
{
    TreeNode * p1, * p2, * p3;
    int savedLoc1,savedLoc2,currentLoc;
    int loc;
    switch(tree->kind) {
        case IfK:
            break;
            
        case WhileK:
            break;
            
        case ForeachK:
            break;
            
        default:
            break;
    }
}

void codegenTM::generateExpression( TreeNode * node )
{
    
}

void codegenTM::treeTraversal( TreeNode * tree )
{
    
}
