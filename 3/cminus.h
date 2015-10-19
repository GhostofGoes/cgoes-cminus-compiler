#ifndef _CMINUS_H_
#define _CMINUS_H_

#include <stdio.h>
#include <stdlib.h>
#include <getopt.h>
#include <stdarg.h>
#include <string>

#include "types.h"
#include "cminus.tab.h"
#include "symbolTable.h"

extern int warnings;
extern int errors;
extern bool testing;

// Recursively prints the abstract syntax tree
// Args: Tree to be printed, current count of the indent 
void printAbstractTree(TreeNode * tree, int indent_count);

// Prints the annotated syntax tree
void printAnnotatedTree(TreeNode * tree);

// Generates Annotated Syntax Tree
void semanticAnalysis(TreeNode * tree);

// TODO: placeholder Generates code
void generateCode();

// Creates a new node for the syntax tree
TreeNode * makeNode( Kind k, Type t, int line, char * svalue, TokenData * token );
TreeNode * makeParent( Kind k, Type t, int line, char * svalue );

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
std::string applyIndents( std::string s, int indent_count );
std::string typeToStr( Type t );

#endif
