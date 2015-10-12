#ifndef _CMINUS_H_
#define _CMINUS_H_

#include <stdio.h>
#include <stdlib.h>
#include <getopt.h>
#include <string.h>
#include <stdarg.h>

#include "types.h"
#include "cminus.tab.h"
#include "symbolTable.h"


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
// Args:
// Return: (TreeNode) The created node
TreeNode * makeNode( NodeKind nodekind, Kind kind, Type type, int linenumber, char * str );

// Adds children to an existing syntax tree node
// Args: 
void addChildren( TreeNode * parent, int numChildren,...);

// Links siblings to each other, starting with the first.
// Args: (int) number of siblings, (TreeNode) siblings to link
// Return: (TreeNode) The first node passed
TreeNode * linkSiblings( int numSiblings,...);

// Allocates and zeros a new TreeNode
// Return: (TreeNode) The allocated node
TreeNode * allocNode();

#endif