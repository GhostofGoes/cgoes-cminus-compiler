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
#include <fstream>
#include <iomanip>

using namespace std;


codegenTM::codegenTM ( TreeNode * annotatedTree, SymbolTable * symtable, int global_offset, string filename ) 
{ 
    symtab = symtable;
    tree = annotatedTree;
    outfile.open(filename, ofstream::out);
    
    gOffset = global_offset;
    tOffset = 0;

    emitLoc = 0;
    highEmitLoc = 0;
}

codegenTM::~codegenTM ( ) 
{ 
    outfile.flush();
    outfile.close();
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

// Prints a comment line with comment s in the code file
void codegenTM::emitComment( string s )
{
    outfile << "* " << s << endl;
}

/* Procedure emitRO emits a register-only
 * TM instruction
 * op = the opcode
 * r = target register
 * s = 1st source register
 * t = 2nd source register
 * c = a comment to be printed
 */
void codegenTM::emitRO( const char *op, int r, int s, int t, const char *c )
{ 
    //printf("%3d:  %5s  %d,%d,%d ",emitLoc++,op,r,s,t);
    //printf("\t%s",c) ;
    //printf("\n") ;
    
    outfile << setw(3) << emitLoc++ 
            << ":  " << setw(5) << op 
            << "  " << r << "," << s << "," << t
            << " \t" << c << endl; /* append comment */

    if (highEmitLoc < emitLoc) 
        highEmitLoc = emitLoc ;
    
} /* emitRO */

/* Procedure emitRM emits a register-to-memory
 * TM instruction
 * op = the opcode
 * r = target register
 * d = the offset
 * s = the base register
 * c = a comment to be printed
 */
void codegenTM::emitRM( const char * op, int r, int d, int s, const char *c )
{ 
    //printf("%3d:  %5s  %d,%d(%d) ",emitLoc++,op,r,d,s);
    //printf("\t%s",c) ;
    //printf("\n") ;
    
    outfile << setw(3) << emitLoc++ 
            << ":  " << setw(5) << op 
            << "  " << r << "," << d << "(" << s << ")"
            << " \t" << c << endl; /* append comment */
    
    if (highEmitLoc < emitLoc)  
        highEmitLoc = emitLoc ;
    
} /* emitRM */

/* Function emitSkip skips "howMany" code
 * locations for later backpatch. It also
 * returns the current code position
 */
int codegenTM::emitSkip( int howMany )
{  
    int i = emitLoc;
    emitLoc += howMany ;
    if (highEmitLoc < emitLoc)  
        highEmitLoc = emitLoc ;
    return i;
    
} /* emitSkip */

/* Procedure emitBackup backs up to 
 * loc = a previously skipped location
 */
void codegenTM::emitBackup( int loc )
{ 
    if (loc > highEmitLoc) 
        emitComment("BUG in emitBackup");
    
    emitLoc = loc ;
    
} /* emitBackup */

/* Procedure emitRestore restores the current 
 * code position to the highest previously
 * unemitted position
 */
void codegenTM::emitRestore()
{ 
    emitLoc = highEmitLoc;
}

/* Procedure emitRM_Abs converts an absolute reference 
 * to a pc-relative reference when emitting a
 * register-to-memory TM instruction
 * op = the opcode
 * r = target register
 * a = the absolute location in memory
 * c = a comment to be printed
 */
void codegenTM::emitRM_Abs( const char *op, int r, int a, const char * c )
{ 
    //printf("%3d:  %5s  %d,%d(%d) ", emitLoc,op,r,a-(emitLoc+1),pc);
    //++emitLoc ;
    //printf("\t%s",c) ;
    //printf("\n") ;
    
    outfile << setw(3) << emitLoc 
            << ":  " << setw(5) << op 
            << "  " << r << "," << a - (emitLoc + 1) << "(" << pc << ")"
            << " \t" << c << endl; /* append comment */
    
    emitLoc++;
    
    if (highEmitLoc < emitLoc) 
        highEmitLoc = emitLoc ;
    
} /* emitRM_Abs */
