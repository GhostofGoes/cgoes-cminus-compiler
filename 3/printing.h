// printing.h
#ifndef _PRINTING_H_
#define _PRINTING_H_

/* C/C++ headers */
#include <stdio.h>
#include <cstdlib>
#include <string>

/* Local headers */
#include "types.h"
#include "cminus.h"
#include "cminus.tab.h"
#include "symbolTable.h"


/* Printing and String manipulation */
const char * iboolToString( int ib );	// Returns "true" for 1, "false" for 0
std::string applyIndents( std::string s, int indent_count );
const char * typeToStr( Type t );	// Returns literal string of type, eg "int" for Integer
const char * nodekindToStr( NodeKind nk );
std::string svalResolve( TreeNode * tree ); // Resolves the svalue of node or token as a C++ string
std::string opToStr( TokenData * tok );


/* Failed attempt as generic errors. May be revived in the future. */
void printError( int line, std::string err );
void printWarning( int line, std::string warn );

void printTreeNode( void * node );
void printTokenData( void * token );

// TODO: combine the two print tree functions, or move bulk to another function?
// Recursively prints the abstract syntax tree
void printAbstractTree(TreeNode * tree, int indent_count = 0);

// Recursively prints the annotated syntax tree
void printAnnotatedTree(TreeNode * tree, int indent_count = 0);

#endif
