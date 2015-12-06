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
    void initSetup();
    void initGlobals();
    
    SymbolTable * symtable;
    TreeNode * aTree;
    
    //string infilename;
    std::string outfilename;
    std::ofstream outfile;
    bool emitToFile;
    
    /* TM location number for current instruction emission */
    int emitLoc;
    
    /* Highest TM location emitted so far. Used with: emitSkip, emitBackup, emitRestore */
    int highEmitLoc;
    
    //int emitCounter; // count number of instructions emitted thus far, for 
    
    int gOffset;
    int fOffset;
    int tOffset;
    
    void emitComment( std::string s );
    void emitRO( const char *op, int r, int s, int t, std::string c);
    void emitRM( const char * op, int r, int d, int s, std::string c);
    int emitSkip( int howMany);
    void emitBackup( int loc);
    void emitRestore();
    void emitRMAbs( const char *op, int r, int a, std::string c);
    
    
    /* REGISTERS  */
    const int SP = 0; // Global pointer 
    const int FP = 1; // Frame pointer
    const int RET = 2; // Value being returned
    const int TMP = 3; // Return pointer, calculation result, etc...
    const int AC1 = 4; // Accumulator 1
    const int AC2 = 5; // Accumulator 2
    const int AC3 = 6; // Accumulator 3
    const int PC = 7; // Program counter
    

    /* HELPER FUNCTIONS */
    std::string timestamp();
};

#endif	/* CODEGENCLASSTM_H */

