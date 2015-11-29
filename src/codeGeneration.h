/* 
 * File:   codeGeneration.h
 * Author: Christopher Goes
 *
 * Created on November 15, 2015, 8:35 PM
 */

#ifndef CODEGENERATION_H
#define	CODEGENERATION_H

#include "types.h"
#include "cminus.h"

void generateTMCode( TreeNode * tree, SymbolTable symtable, int global_offset );

#endif	/* CODEGENERATION_H */

