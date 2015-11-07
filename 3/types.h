#ifndef _TYPES_H_
#define _TYPES_H_

#define MAXCHILDREN 3

/*** TokenData ***/
typedef struct {
	int lineno;
	int bval;
	char cvalue;
	int ivalue;
	char * svalue;
	char * input;
} TokenData;


/*** Enums for treeNode ****/
// Much of the TreeNode stuff is drawn from the book.
// Source: "Compilers and Construction: Principles and Practice", by Kenneth C. Louden

typedef enum { StmtK, ExpK, DeclK, DefaultK } NodeKind;

// TODO: enum as maps so i can easily print
typedef enum {
	OpK, AssignK, VarK, FunK, ParamK,
	CompoundK, IfK, ForeachK, WhileK,
	ReturnK, BreakK, CallK,
	ConstK, IdK, TypeK, UnaryK
} Kind;

typedef enum {Void, Integer, Boolean, Character, Undef } Type;


/*** TREENODE ***/
typedef struct treeNode
{
	TokenData * token;
	int lineno;                            	// line number relevant to this node
	char * svalue;
	
	// connectivity in the tree
	int numChildren; 			// Number of children for a given node
	struct treeNode *child[MAXCHILDREN];   	// children of the node
	struct treeNode *sibling;              	// siblings for the node

	NodeKind nodekind;                     	// General kind
	Kind kind;								// Precise kind (eg Return, Call, etc)
	Type nodetype;							// Type of the node
	//ExpType expType;		           		// used when ExpK for type checking
	bool isStatic;                         	// is statically allocated? TODO: needed?
	bool isArray;                          	// Array?
	bool isIndex;							// Array index?
	bool isScoped;  // TODO: needed?
        bool isConstant;

} TreeNode;

#endif
