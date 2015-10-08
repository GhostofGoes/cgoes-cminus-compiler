<<<<<<< HEAD
#include <stdlib.h>
#include <stdio.h>
#include "types.h"


TreeNode * allocNode() {
	TreeNode * tempNode = (TreeNode *)calloc(1, sizeof(TreeNode *));
	tempNode->numChildren = 0;
	tempNode->child[0] = NULL;
	tempNode->sibling = NULL;
	return tempNode;
=======
#include <stdlib.h>
#include <stdio.h>
#include "types.h"


TreeNode * allocNode() {
	TreeNode * tempNode = (TreeNode *)calloc(1, sizeof(TreeNode *));
	tempNode->numChildren = 0;
	tempNode->child[0] = NULL;
	tempNode->sibling = NULL;
	return tempNode;
>>>>>>> 428e78fdd864efc8465b608bcaa04ceaec562ed7
}