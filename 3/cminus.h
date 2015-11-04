#ifndef _CMINUS_H_
#define _CMINUS_H_

// cminus.h

/* C/C++ headers */
#include <stdio.h>
#include <cstdlib>
#include <string>

/* Local headers */
#include "types.h"
#include "cminus.tab.h"
#include "symbolTable.h"
#include "printing.h"
#include "trees.h"

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

// TODO: seperate files for printing and helper functions
// TODO: combine the two print tree functions, or move bulk to another function?
// Recursively prints the abstract syntax tree
void printAbstractTree(TreeNode * tree, int indent_count = 0);

// Recursively prints the annotated syntax tree
void printAnnotatedTree(TreeNode * tree, int indent_count = 0);

// Creates the Annotated Syntax Tree
void semanticAnalysis(TreeNode * tree );
void typeResolution( TreeNode * node, SymbolTable * symtable );
void treeParse( TreeNode * parent, TreeNode * node, SymbolTable * symtable );
TreeNode * buildIOLibrary();

#endif
