// trees.cpp

/* C++ Libraries */
#include <iostream>
#include <string>
#include <cstdlib>

/* C libraries */
#include <stdio.h>
#include <string.h>

/* Local headers */
#include "cminus.h"
#include "cminus.tab.h"
#include "types.h"
#include "toker.h"
#include "printing.h"
#include "trees.h"

// Creates a new node for the syntax tree
// TODO: combine with make parent?
// TODO: c++ strings
TreeNode * makeNode( NodeKind nk, Kind k, Type t, int line, TokenData * token ) {
	TreeNode * tempNode = allocNode();
	tempNode->nodekind = nk;
	tempNode->kind = k;
	tempNode->nodetype = t;
	tempNode->lineno = line;

	if(token != NULL) {
		tempNode->token = token;
	}

	return tempNode;
}

TreeNode * makeParent( NodeKind nk, Kind k, Type t, int l, const char * svalue ) {
	TreeNode * tempNode = allocNode();
	tempNode->nodekind = nk;
	tempNode->kind = k;
	tempNode->nodetype = t;
	tempNode->lineno = l;
	if(svalue != NULL) {
		tempNode->svalue = strdup(svalue);
	}
	return tempNode;
}

void copyAnnotations( TreeNode * from, TreeNode * to ) // from -> to
{
    if(from == NULL || to == NULL)
    {
        std::cerr << "NULL node passed to copyAnnotations" << std::endl;
    }
    to->isStatic = from->isStatic;
    to->isArray = from->isArray;
    to->arraySize = from->arraySize;
    to->size = from->size;
    to->location = from->location;
    to->offsetReg = from->offsetReg;
    to->isIO = from->isIO;
}

// Adds a child to an existing syntax tree node
// TODO: add children to their specific order in the array, not as a "stack"
// TODO: Remove numChildren
void addChild(TreeNode * parent, TreeNode * child) {
    if (parent == NULL || child == NULL) {
        return;
    } else if (parent->numChildren >= 0 && parent->numChildren < 3) {
        parent->child[parent->numChildren] = child;
        parent->numChildren++;
    }
}

// Links siblings to each other, starting with the first
TreeNode * linkSiblings( TreeNode * sib1, TreeNode * sib2 ) {

    if (sib1 == NULL) {
        return sib2;
    }
    if (sib2 == NULL) {
        return sib1;
    } 
    else if(sib1 != NULL && sib2 != NULL)
    {
        TreeNode * temp = sib1;

        if(testing)
        {
            std::cout << "Temp\n";
            printTreeNode(temp);
            std::cout << std::endl;
            std::cout << "temp->sibling\n";
            printTreeNode(temp->sibling);
            std::cout << std::endl;
        }
        while (temp != NULL && temp->sibling != NULL) {
            temp = temp->sibling;
        }
        temp->sibling = sib2;
    }

    return sib1;
}

// Applies Type t to all the siblings of TreeNode init
void applyTypeToSiblings( TreeNode * init, Type t ) {
	TreeNode * temp = init;
    
    // Apply static flag to all siblings, just like type...
    // TODO: make seperate isStatic function?
    bool st = false;
    if(temp != NULL)
    {
        if(temp->isStatic)
            st = true;
    }
    
	while( temp != NULL) {
		temp->nodetype = t;
        temp->isStatic = st;
		temp = temp->sibling;
        
	}
}

// Returns number of siblings the node has
int countSiblings( TreeNode * start ) {
    int sib_count = 0;
    
    if( start != NULL) {
        TreeNode * temp = start->sibling;
        while(temp != NULL) {
            sib_count++;
            temp = temp->sibling;
        }
    }
    return sib_count;
}

// Allocates and zeros a new TreeNode
// TODO: should do as a class, put this into constructor, have destructor for things like token
TreeNode * allocNode() {
    //TreeNode * tempNode = (TreeNode *)calloc(1, sizeof(TreeNode));
    TreeNode * tempNode = (TreeNode *)new TreeNode;
    
    // Initialize values
    tempNode->token = NULL;
    tempNode->lineno = 0;
    tempNode->svalue = NULL;
    tempNode->nodetype = Undef;
    tempNode->nodekind = DefaultK;
    tempNode->kind = k_undef;
    tempNode->child[0] = NULL;
    tempNode->child[1] = NULL;
    tempNode->child[2] = NULL;
    tempNode->numChildren = 0;
    tempNode->sibling = NULL;
    tempNode->isStatic = false;
    tempNode->isArray = false;
    tempNode->isIndex = false;
    tempNode->isConstant = false;
    tempNode->isFuncCompound = false;
    tempNode->arraySize = 0;
    tempNode->size = 0;
    tempNode->location = 0;
    tempNode->offsetReg = o_undef;
    tempNode->isIO = Nopeput;
    tempNode->loc = 0;
    
    return tempNode; // Return the allocated node...
}

// TODO: destructor version
void freeTree( TreeNode * tree ) {
    if (tree == NULL) {
        return;
    }

    TreeNode * prev;
    TreeNode * temp;
    prev = tree;

    while (prev != NULL) {
        temp = prev;
        if (prev->token != NULL) {
            freeToken(prev->token);
            prev->token = NULL;
        }

        if (prev->svalue != NULL) {
            free(prev->svalue);
            prev->svalue = NULL;
        }
        // Check if there are children
        if (prev->numChildren > 0) {
            //for ( int i = 0; i < prev->numChildren; i++ ) {
            for (int i = 0; i < MAXCHILDREN; i++) {
                if (prev->child[i] != NULL) {
                    freeTree(prev->child[i]);
                }
            }
        }

        prev = prev->sibling;
        delete(temp); // TODO: *temp?
        temp = NULL;
    } // end while
    tree = NULL;
}

// TODO: use new instead?
void freeToken( TokenData * token ) {
    if (token == NULL) {
        return;
    }

    if (token->svalue != NULL) {
        free(token->svalue);
        token->svalue = NULL;
    }

    if (token->input != NULL) {
        free(token->input);
        token->input = NULL;
    }

    free(token);
    token = NULL;
}
