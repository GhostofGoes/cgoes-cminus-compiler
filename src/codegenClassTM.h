/* 
 * File:   codegenClassTM.h
 * Author: tehlizard
 *
 * Created on December 4, 2015, 12:40 PM
 */

#ifndef CODEGENCLASSTM_H
#define	CODEGENCLASSTM_H

#include "cminus.h"
#include "symbolTable.h"
#include "types.h"
#include <string>

using namespace std;

class codegenTM {
public:
    void generateCode();
    codegenTM( TreeNode * annotatedTree, SymbolTable * symtable, int global_offset, FILE * output_file );
    ~codegenTM();
    
private:
    void generateDeclaration( TreeNode * node );
    void generateStatement( TreeNode * node );    
    void generateExpression( TreeNode * node );
    void treeTraversal( TreeNode * tree );
    
    SymbolTable * symtab;
    int gOffset;
    TreeNode * tree;
    int tOffset;
    FILE * outfile;
    
    /* TM location number for current instruction emission */
    int emitLoc;
    
    /* Highest TM location emitted so far
    For use in conjunction with emitSkip,
    emitBackup, and emitRestore */
    int highEmitLoc;
    
    void emitComment( string s );
    void emitRO( const char *op, int r, int s, int t, const char *c);
    void emitRM( const char * op, int r, int d, int s, const char *c);
    int emitSkip( int howMany);
    void emitBackup( int loc);
    void emitRestore(void);
    void emitRM_Abs( const char *op, int r, int a, const char * c);
    
    
    /* EMIT CONSTANTS - DO NOT MODIFY! */
    const int pc = 7;
    const int mp = 6;
    const int gp = 5;
    const int ac = 0;
    const int ac1 = 1;

};

#endif	/* CODEGENCLASSTM_H */

