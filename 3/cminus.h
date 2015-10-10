#ifndef _CMINUS_H_
#define _CMINUS_H_

#include <stdio.h>
#include <stdlib.h>
#include <getopt.h>
#include <string.h>
#include <stdarg.h>

#include "types.h"
#include "cminus.tab.h"


// Global abstract syntax tree pointer
TreeNode *syntaxTree = NULL;

// Global Annotated Syntax Tree pointer 
TreeNode *annotatedTree = NULL;

// Defining yyerror
//static void yyerror(const char *);

// Save some printf typing
void easy( int linenum, char * svalue );

// Prints the abstract syntax tree
void printAbstractTree(TreeNode * tree, int indent_count);

// TODO: Placeholder Prints the annotated syntax tree
void printAnnotatedTree(TreeNode * tree);

// TODO: placeholder Generates Annotated Syntax Tree
void semanticAnalysis(TreeNode * tree);

// TODO: placeholder Generates code
void generateCode();

// Creates a new node for the syntax tree
// Args: (int) Number of child nodes, (TreeNode) Child nodes
TreeNode * makeNode( int value, int numChildren,...);

// Adds children to a parent node
void addChildren( TreeNode * parent, int numChildren,...);

// Links all successive siblings to the first and each following
TreeNode * linkSiblings( int numSiblings,...);

#endif