/* 
 * File:   codeGeneration.cpp
 * Author: Christopher Goes
 *
 * Created on November 15, 2015, 8:34 PM
 */

#include "codeGeneration.h"
#include "types.h"
#include "cminus.h"

SymbolTable * symtab = NULL;

void generateTMCode( TreeNode * annotatedTree, SymbolTable * symtable, int global_offset )
{
    TreeNode * tree = annotatedTree; // Copy the pointer so we can iterate
    symtab = symtable;
    
    
}

void genStmt( TreeNode * node )
{
    
}

void genExp( TreeNode * node )
{
    
}

void treeTraversal( TreeNode * tree )
{
    
}
