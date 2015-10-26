#ifndef _CMINUS_H_
#define _CMINUS_H_

/* Local headers */
#include "types.h"
#include "cminus.tab.h"
#include "symbolTable.h"

/* Global flags/counters */
extern int warnings;
extern int errors;
extern bool testing;

/* Flex stuff */
extern int yylex();		// Flex's Lexer (heh)
extern int yylineno; 	// Flex's line numbering
extern FILE * yyin;		// Input file stream for Flex

extern TreeNode * syntaxTree;
extern TreeNode * annotatedTree;

static void yyerror(const char *);

// Recursively prints the abstract syntax tree
// Args: Tree to be printed, current count of the indent 
void printAbstractTree(TreeNode * tree, int indent_count);

// Prints the annotated syntax tree
void printAnnotatedTree(TreeNode * tree, int indent_count);

// Creates the Annotated Syntax Tree
void semanticAnalysis(TreeNode * tree );
void treeParse( TreeNode * parent, TreeNode * node, SymbolTable * symtable );

// TODO: placeholder Generates code
void generateCode();

// Creates a new node for the syntax tree
TreeNode * makeNode( NodeKind nk, Kind k, Type t, int line, char * svalue, TokenData * token );
TreeNode * makeParent( NodeKind nk, Kind k, Type t, int line, char * svalue );

// Adds a child to an existing syntax tree node
void addChild( TreeNode * parent, TreeNode * child );

// Links sib2 to the end of sib1's sibling chain. If sib1 is null, sib2 is returned.
TreeNode * linkSiblings( TreeNode * sib1, TreeNode * sib2 );

void applyTypeToSiblings( TreeNode * init, Type t );
void appplyTypeToChildren( TreeNode * parent, Type t );


// Allocates and zeros a new TreeNode
// Return: (TreeNode) The allocated node
TreeNode * allocNode();


// memory deallocation
void freeTree( TreeNode * tree );
void freeToken( TokenData * token );

// Printing helpers
const char * iboolToString( int ib );
std::string applyIndents( std::string s, int indent_count );
const char * typeToStr( Type t );
std::string opToStr( TokenData * tok );
std::string svalResolve( TreeNode * tree );

void printError( int line, std::string err );
void printWarning( int line, std::string warn );

#endif
