#include <stdlib.h>
#include <stdio.h>
#include "types.h"


TreeNode * allocNode() {
	TreeNode * tempNode = (TreeNode *)calloc(1, sizeof(TreeNode *));
	tempNode->numChildren = 0;
	tempNode->child[0] = NULL;
	tempNode->sibling = NULL;
	return tempNode;
}