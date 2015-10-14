#ifndef _TYPES_H_
#define _TYPES_H_

#define MAXCHILDREN 3

/*** TokenData ***/
typedef struct {
	int num;
	char cvalue;
	int ivalue;
	char * svalue;
	char * input;
} TokenData;


/*** Enums for treeNode ****/
// Much of the TreeNode stuff is drawn from the book.
// Source: "Compilers and Construction: Principles and Practice", by Kenneth C. Louden
typedef enum { StmtK, ExpK, DeclK } NodeKind;

typedef enum {
	OpK, ConstK, IdK, AssignK, IfK,
	CompoundK, ForeachK, WhileK, ReturnK,
	BreakK, VarK, FunK, ParamK, CallK,
	TokK
} Kind;

typedef enum {Void, Integer, Boolean, Character} Type;


/*** TREENODE ***/
// TODO: KEEP TRACK OF SCOPE!
// TreeNode
typedef struct treeNode
{
	TokenData token;
	int lineno;                            	// line number relevant to this node
	int bval;								// The value used by Bison
	char * str;
	
	// connectivity in the tree
	int numChildren; 						// Number of children for a given node
	struct treeNode *child[MAXCHILDREN];   	// children of the node
	struct treeNode *sibling;              	// siblings for the node

	NodeKind nodekind;                     	// General kind (need?)
	Kind kind;								// Precise kind (eg Return, Call, etc)
	Type nodetype;							// Type of the node
	//ExpType expType;		           		// used when ExpK for type checking
	//bool typespecifier;
	bool isStatic;                         	// is statically allocated?
	bool isArray;                          	// is this an array

	// even more semantic stuff will go here in later assignments.
	// Like, say, scope!
} TreeNode;

#endif
