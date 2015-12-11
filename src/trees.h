// trees.h

#ifndef _TREES_H_
#define _TREES_H_

/* C++ Libraries */
#include <iostream>
#include <string>
#include <cstdlib>

/* C libraries */

/* Local headers */
#include "cminus.h"
#include "cminus.tab.h"
#include "types.h"
#include "toker.h"
#include "printing.h"


/* Node creation */

// Creates a new node for the syntax tree
TreeNode * makeNode( NodeKind nk, Kind k, Type t, int line, TokenData * token );
TreeNode * makeParent( NodeKind nk, Kind k, Type t, int line, const char * svalue );
void copyAnnotations ( TreeNode * from, TreeNode * to ); // from -> to
// Adds a child to an existing syntax tree node
void addChild( TreeNode * parent, TreeNode * child );


/* Siblings */

// Links sib2 to the end of sib1's sibling chain. If sib1 is null, sib2 is returned.
TreeNode * linkSiblings( TreeNode * sib1, TreeNode * sib2 );

// Applies Type t to init and all its siblings
void applyTypeToSiblings( TreeNode * init, Type t );

int countSiblings( TreeNode * start );


/* Memory */

TreeNode * allocNode(); 		// Allocates and zeros a new TreeNode
void freeTree( TreeNode * tree );	// Recursively frees and zeroes the tree
void freeToken( TokenData * token );	// Frees and zeroes the token

#endif
