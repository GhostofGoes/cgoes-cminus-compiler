#ifndef _CMINUS_H_
#define _CMINUS_H_

/* C/C++ headers */
#include <stdio.h>
#include <cstdlib>
#include <string>

/* Local headers */
#include "types.h"
#include "cminus.tab.h"
#include "symbolTable.h"

/* Global flags/counters */
extern int warnings;
extern int errors;
extern bool testing;

/* Flex stuff */
extern int yylex();	// Flex's Lexer (heh)
extern int yylineno; 	// Flex's line numbering
extern FILE * yyin;	// Input file stream for Flex

extern TreeNode * syntaxTree;
extern TreeNode * annotatedTree;

static void yyerror(const char *);

// TODO: combine the two print tree functions, or move bulk to another function?
// Recursively prints the abstract syntax tree
void printAbstractTree(TreeNode * tree, int indent_count = 0);

// Recursively prints the annotated syntax tree
void printAnnotatedTree(TreeNode * tree, int indent_count = 0);

// Creates the Annotated Syntax Tree
void semanticAnalysis(TreeNode * tree );
void treeParse( TreeNode * parent, TreeNode * node, SymbolTable * symtable );
TreeNode * buildIOLibrary();

// Creates a new node for the syntax tree
TreeNode * makeNode( NodeKind nk, Kind k, Type t, int line, TokenData * token );
TreeNode * makeParent( NodeKind nk, Kind k, Type t, int line, const char * svalue );

// Adds a child to an existing syntax tree node
void addChild( TreeNode * parent, TreeNode * child );

// Links sib2 to the end of sib1's sibling chain. If sib1 is null, sib2 is returned.
TreeNode * linkSiblings( TreeNode * sib1, TreeNode * sib2 );

// Applies Type t to init and all its siblings
void applyTypeToSiblings( TreeNode * init, Type t );

int countSiblings( TreeNode * start );

/* Memory Management */
TreeNode * allocNode(); 		// Allocates and zeros a new TreeNode
void freeTree( TreeNode * tree );	// Recursively frees and zeroes the tree
void freeToken( TokenData * token );	// Frees and zeroes the token


/* Printing and String manipulation */
const char * iboolToString( int ib );	// Returns "true" for 1, "false" for 0
std::string applyIndents( std::string s, int indent_count );
const char * typeToStr( Type t );	// Returns literal string of type, eg "int" for Integer
std::string svalResolve( TreeNode * tree ); // Resolves the svalue of node or token as a C++ string
std::string opToStr( TokenData * tok );


/* Failed attempt as generic errors. May be revived in the future. */
void printError( int line, std::string err );
void printWarning( int line, std::string warn );

#endif
