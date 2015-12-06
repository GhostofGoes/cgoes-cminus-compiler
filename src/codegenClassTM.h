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
#include <fstream>

class codegenTM {
public:
    void generateCode();
    codegenTM( TreeNode * t, SymbolTable * s, int g, std::string of );
    ~codegenTM();
    
private:
    void generateDeclaration( TreeNode * node );
    void generateStatement( TreeNode * node );    
    void generateExpression( TreeNode * node );
    void treeTraversal( TreeNode * tree );
    
    SymbolTable * symtable;
    int gOffset;
    TreeNode * aTree;
    int tOffset;
    std::ofstream outfile;
    std::string outfilename;
    //string infilename;
    bool emitToFile;
    
    /* TM location number for current instruction emission */
    int emitLoc;
    
    /* Highest TM location emitted so far. Used with: emitSkip, emitBackup, emitRestore */
    int highEmitLoc;
    
    void emitComment( std::string s );
    void emitRO( const char *op, int r, int s, int t, std::string *c);
    void emitRM( const char * op, int r, int d, int s, std::string *c);
    int emitSkip( int howMany);
    void emitBackup( int loc);
    void emitRestore();
    void emitRM_Abs( const char *op, int r, int a, std::string * c);
    
    
    /* EMIT CONSTANTS - DO NOT MODIFY! */
    const int pc = 7;
    const int mp = 6;
    const int gp = 5;
    const int ac = 0;
    const int ac1 = 1;

    /* HELPER FUNCTIONS */
    std::string timestamp();
};

#endif	/* CODEGENCLASSTM_H */

