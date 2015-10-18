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

// Recursivly prints the abstract syntax tree
// Args: Tree to be printed, current count of the indent 
void printAbstractTree(TreeNode * tree, int indent_count);

// Prints the annotated syntax tree
// Args: 
void printAnnotatedTree(TreeNode * tree);

// Generates Annotated Syntax Tree
// Args: 
void semanticAnalysis(TreeNode * tree);

// TODO: placeholder Generates code
void generateCode();

// Creates a new node for the syntax tree
TreeNode * makeNode( Kind k, Type t, int line, char * svalue, TokenData * token );
TreeNode * makeParent( Kind k, Type t, int line, char * svalue );

// Adds children to an existing syntax tree node
// Args: 
//void addChildren( TreeNode * parent, int numChildren,...);

void addChild( TreeNode * parent, TreeNode * child );

void addChildren( TreeNode * parent, int numChildren, TreeNode * child1 );
void addChildren( TreeNode * parent, int numChildren, TreeNode * child1, TreeNode * child2 );
void addChildren( TreeNode * parent, int numChildren, TreeNode * child1, TreeNode * child2, TreeNode * child3 );

// Links siblings to each other, starting with the first.
// Args: (int) number of siblings, (TreeNode) siblings to link
// Return: (TreeNode) The first node passed
//TreeNode * linkSiblings( int numSiblings, TreeNode * init, ...);
TreeNode * linkSiblings( TreeNode * sib1, TreeNode * sib2 );

void applyTypeToSiblings( TreeNode * init, Type t );
void appplyTypeToChildren( TreeNode * parent, Type t );


// Allocates and zeros a new TreeNode
// Return: (TreeNode) The allocated node
TreeNode * allocNode();

std::string typeToStr( Type t );

void freeTree( TreeNode * tree );
void freeToken( TokenData * token );

void dumpTree( TreeNode * tree );
std::string applyIndents( std::string s, int indent_count );

#endif
