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
#include <vector>
#include <stack>

class codegenTM {
public:
    void generateCode(); // This actually generates code. wow.
    codegenTM( TreeNode * t, int g, std::string of, std::string inf );
    ~codegenTM(); // destructor: closes file, few misc cleanup tasks
    
private:
    /* Initialization */
    void initSetup();
    void initGlobals();
    void initGlobalVars();
    void IOroutines( IO io ); // generates IO routines based on io
    std::vector<TreeNode *> globalInitVec;
    
    /* Generate by nodekind */
    void generateDeclaration( TreeNode * node );            // generic decleration 
    void generateStatement( TreeNode * node );              // generic statement
    void generateExpression( TreeNode * node, int tOff );   // generic expression
    
    /* Emit functions */
    void storeVar( TreeNode * var, int reg ); // ST reg->var
    void storeArrayVar( TreeNode * arr, int reg, int index ); // USES: ac3
    void loadVar( TreeNode * var, int reg );
    void loadArrayVar( TreeNode * arr, int reg, int index ); // USES: ac3
    void loadArrayAddr( TreeNode * arr, int reg ); // LDA reg<-arr
    void loadParams( TreeNode * node, int off ); // loads params before function call
    void loadConst( int reg, int c );
        
    /* Emit macros */
    void standardRet(); // zero out return first
    void funRet();      // Load ret addr, adjust FP, return 
    
    /* General generation */
    void loopSiblings( NodeKind nk, TreeNode * node );    
    void treeTraversal( TreeNode * tree ); // loopsiblings without nk selection
    
    /* SymbolTable creation + copying node values */
    void buildTable();
    void tableRecurse(TreeNode * node);
    
    /* Helper functions */
    std::string timestamp(); // returns a timestamp for current local time
    TreeNode * idResolve(TreeNode * node);
    TreeNode * lookup(std::string s);
    
    /* Parsed food for generation */
    SymbolTable * symtable;
    TreeNode * aTree;
    
    /* IO stuff */
    std::string infilename;
    std::string outfilename;
    std::ofstream outfile; // this is opened if emitToFile = true
    bool emitToFile; // true = emit to outfile, false = emit to cout
    
    
    /*** Emit stuff ***/
    
    /* Emit locations */
    int emitLoc; // Location for current instruction emission  
    int highEmitLoc; // Highest location emitted thus far. Used with: emitSkip, emitBackup, emitRestore
    int mainLoc;
    int tempLoc;
    std::stack<int> loopBreak;
    
    /* Offsets */
    int gOffset;
    int fOffset;
    
    /* Emit methods */
    // TODO: default blank string for args
    void emitComment( std::string s );
    void emitRO( const char *op, int r, int s, int t, std::string c);
    void emitRM( const char * op, int r, int d, int s, std::string c);
    int emitSkip( int howMany);
    void emitBackup( int loc);
    void emitRestore();
    void emitRMAbs( const char *op, int r, int a, std::string c);
    
    
    /* REGISTERS  */
    const int gp = 0; // Global pointer 
    const int fp = 1; // Frame pointer
    const int ret = 2; // Value being returned
    const int val = 3; // Return pointer, calculation result, etc...
    const int ac1 = 4; // Accumulator 1
    const int ac2 = 5; // Accumulator 2
    const int ac3 = 6; // Accumulator 3
    const int pc = 7; // Program counter
    
};

#endif	/* CODEGENCLASSTM_H */

