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

class codegenTM {
public:
    void generateCode();
    codegenTM( TreeNode * annotatedTree, SymbolTable * symtable, int global_offset );
    ~codegenTM();
private:
    void generateStatement( TreeNode * node );    
    void generateExpression( TreeNode * node );
    void treeTraversal( TreeNode * tree );
    SymbolTable * symtab;
    int gOffset;
    TreeNode * tree;
    int tmpOffset;

};

#endif	/* CODEGENCLASSTM_H */

