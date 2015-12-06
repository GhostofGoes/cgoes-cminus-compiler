#ifndef _CMINUS_H_
#define _CMINUS_H_

// cminus.h

// C/C++ headers 
#include <stdio.h>
#include <cstdlib>
#include <string>

// Local headers 
#include "types.h"
#include "cminus.tab.h"
#include "symbolTable.h"
#include "printing.h"
#include "trees.h"

// Global flags/counters 
extern int warnings;
extern int errors;
extern bool testing;

// Flex stuff
extern int yylex();	// Flex's Lexer (heh)
extern int yylineno; 	// Flex's line numbering
extern FILE * yyin;	// Input file stream for Flex

extern TreeNode * syntaxTree;
extern TreeNode * annotatedTree;

extern int global_offset;

// Creates the Annotated Syntax Tree
SymbolTable * semanticAnalysis(TreeNode * tree );
void typeResolution( TreeNode * parent, TreeNode * node, SymbolTable * symtable );
void treeParse( TreeNode * parent, TreeNode * node, SymbolTable * symtable, bool in_loop );
void generateCode( std::string output_file );

TreeNode * buildIOLibrary();
void checkArgTypes( TreeNode * call, TreeNode * func );
int memorySizing( TreeNode * tree, SymbolTable * symtable, int parOff );

#endif
