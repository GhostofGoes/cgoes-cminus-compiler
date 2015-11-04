// trees.cpp

/* C++ Libraries */
#include <iostream>
#include <string>
#include <cstdlib>
#include <vector>
#include <map>

/* C libraries */
#include <stdio.h>
#include <string.h>
#include <getopt.h>

/* Local headers */
#include "cminus.h"
#include "cminus.tab.h"
#include "types.h"
#include "toker.h"
#include "symbolTable.h"
#include "printing.h"
#include "trees.h"

// Creates a new node for the syntax tree
// TODO: combine with make parent?
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

// Adds a child to an existing syntax tree node
void addChild(TreeNode * parent, TreeNode * child) {
    if (parent == NULL || child == NULL) {
        return;
    }

    if (parent->numChildren >= 0 && parent->numChildren < 3) {
        parent->child[parent->numChildren] = child;
        parent->numChildren++;
    }
}

// Links siblings to each other, starting with the first
TreeNode * linkSiblings( TreeNode * sib1, TreeNode * sib2 ) {

    if (sib1 == NULL) {
        return sib2;
    } else if (sib2 == NULL) {
        return sib1;
    } else {
        TreeNode * temp = sib1;

        while (temp->sibling != NULL) {
            temp = temp->sibling;
        }
        temp->sibling = sib2;
    }

    return sib1;
}

// Applies Type t to all the siblings of TreeNode init
void applyTypeToSiblings( TreeNode * init, Type t ) {
	TreeNode * temp = init;

	while( temp != NULL) {
		temp->nodetype = t;
		temp = temp->sibling;
	}
}

// Returns number of siblings the node has
int countSiblings( TreeNode * start ) {
    int sib_count = 0;
    
    if( start != NULL) {
        TreeNode * temp= start->sibling;
        while(temp != NULL) {
            sib_count++;
            temp = temp->sibling;

        }
    }
    return sib_count;
}

// Allocates and zeros a new TreeNode
TreeNode * allocNode() {
    //TreeNode * tempNode = (TreeNode *)calloc(1, sizeof(TreeNode));
    TreeNode * tempNode = (TreeNode *)new TreeNode;
    tempNode->token = NULL;
    tempNode->lineno = 0;
    tempNode->svalue = NULL;
    tempNode->nodetype = Void;
    tempNode->nodekind = DefaultK;
    tempNode->child[0] = NULL;
    tempNode->child[1] = NULL;
    tempNode->child[2] = NULL;
    tempNode->numChildren = 0;
    tempNode->sibling = NULL;
    tempNode->isStatic = false;
    tempNode->isArray = false;
    tempNode->isIndex = false;

    return tempNode;
}

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
        delete(temp);
        temp = NULL;
        //free(temp);
    } // end while
    tree = NULL;
}

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
}
