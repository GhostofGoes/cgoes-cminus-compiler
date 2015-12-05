/****************************************************/
/* File: code.h                                     */
/* Code emitting utilities for the TINY compiler    */
/* and interface to the TM machine                  */
/* Compiler Construction: Principles and Practice   */
/* Kenneth C. Louden                                */
/****************************************************/

#ifndef _CODE_H_
#define _CODE_H_

#include <string>

using namespace std;

// pc = program counter
#define  pc 7

// mp = "memory pointer"
// points to top of memory (for temp storage)
#define  mp 6

// gp = "global pointer" 
// points to bottom of memory for (global) variable storage
#define gp 5

// accumulator
#define  ac 0

// 2nd accumulator
#define  ac1 1

// code emitting utilities //

// Prints a comment line with comment c in the code file
//void emitComment( const char * c );
void emitComment( string s );

/* Procedure emitRO emits a register-only
 * TM instruction
 * op = the opcode
 * r = target register
 * s = 1st source register
 * t = 2nd source register
 * c = a comment to be printed if TraceCode is TRUE
 */
void emitRO( const char *op, int r, int s, int t, const char *c);

/* Procedure emitRM emits a register-to-memory
 * TM instruction
 * op = the opcode
 * r = target register
 * d = the offset
 * s = the base register
 * c = a comment to be printed if TraceCode is TRUE
 */
void emitRM( const char * op, int r, int d, int s, const char *c);

// Skips "howMany" code locations for later backpatch. 
// Returns the current code position
int emitSkip( int howMany);

// Backs up to loc = a previously skipped location
void emitBackup( int loc);

// Restores the current code position to the highest previously unemitted position
void emitRestore(void);

/* Procedure emitRM_Abs converts an absolute reference 
 * to a pc-relative reference when emitting a
 * register-to-memory TM instruction
 * op = the opcode
 * r = target register
 * a = the absolute location in memory
 * c = a comment to be printed if TraceCode is TRUE
 */
void emitRM_Abs( const char *op, int r, int a, const char * c);

#endif
