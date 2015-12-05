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

using namespace std;


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

void codegenTM::generateDeclaration(TreeNode* node)
{
    TreeNode * p1, * p2, * p3;
    int savedLoc1,savedLoc2,currentLoc;
    int loc;
    
    string treestr = svalResolve(tree);
    
    switch(tree->kind) {
        case VarK:
            break;
            
        case FunK:
            emitComment("FUNCTION " + treestr);
            break;
            
        case ParamK:
            break;
            
        default:
            break;
    }
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
            
        case CompoundK:
            break;
            
        case ReturnK:
            break;
            
        case BreakK:
            break;
            
        default:
            break;
    }
}

void codegenTM::generateExpression( TreeNode * node )
{
    int loc;
    TreeNode * p1, * p2;
    
    
    switch(tree->kind) { 
        case AssignK:
            break;
            
        case OpK:
            
            switch(tree->token->bval) {
                default:
                    break;
            }
            break;   
            
        case UnaryK:
            
            switch(tree->token->bval) {
                case MULTIPLY:
                    break;
                    
                case NOT:
                    break;
                    
                case QUESTION:
                    break;
                    
                case MINUS:
                    break;
                    
                default:
                    break;
            }
            break;
            
        case IdK:
            break;
            
        case ConstK:
            break;
            
        case CallK:
            break; 
            
        default:
            break;
    }
}

void codegenTM::treeTraversal( TreeNode * node )
{
    TreeNode * tree = node;
    
    while( tree != NULL )
    {
        switch (tree->nodekind) {
            case DeclK:
                generateDeclaration(tree);
                break;
            case StmtK:
                generateStatement(tree);
                break;
            case ExpK:
                generateExpression(tree);
                break;
            default:
                break;
        }
        tree = tree->sibling;
    }
}
