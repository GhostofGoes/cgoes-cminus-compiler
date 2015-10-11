#ifndef _CMINUS_H_
#define _CMINUS_H_

#include <stdio.h>
#include <stdlib.h>
#include <getopt.h>
#include <string.h>
#include <stdarg.h>

#include "types.h"
#include "cminus.tab.h"


// Recursivly prints the abstract syntax tree
void printAbstractTree(TreeNode * tree, int indent_count);

// TODO: Placeholder Prints the annotated syntax tree
void printAnnotatedTree(TreeNode * tree);

// TODO: placeholder Generates Annotated Syntax Tree
void semanticAnalysis(TreeNode * tree);

// TODO: placeholder Generates code
void generateCode();

// Creates a new node for the syntax tree
// Args: 
TreeNode * makeNode( NodeKind nodekind, Kind kind, Type type, int linenumber, char * str );

// Adds children to a parent node
void addChildren( TreeNode * parent, int numChildren,...);

// Links all successive siblings to the first and each following
TreeNode * linkSiblings( int numSiblings,...);

// Allocates and zeros a new TreeNode
TreeNode * allocNode();

#endif