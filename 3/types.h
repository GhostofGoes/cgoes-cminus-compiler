#ifndef _TREENODE_H_
#define _TREENODE_H_

#define MAXCHILDREN 3

// TokenData
// Used for tokens...
	typedef struct {
//		int linenum;
		int num;
		char ch; 
		int ivalue;
		char * svalue;
		char * input;
	} TokenData;

/* Enums for treeNode */
	// Much of the TreeNode stuff is drawn from the book. 
	// Source: "Compilers and Construction: Principles and Practice", by Kenneth C. Louden
	typedef enum { StmtK, ExpK } NodeKind;
	typedef enum { IfK, CompoundK, ForeachK, WhileK,  } StmtKind;
	typedef enum { OpK, ConstK, IdK, AssignK } ExpKind;
	typedef enum { } OpKind;
	typedef enum { } DeclKind;
// Typechecking
	typedef enum {Void, Integer, Boolean} ExpType;
	
// TreeNode
	typedef struct treeNode
	{
		
		TokenData token;
		int lineno;                            	// linenum relevant to this node
		int value;
		char * str;
		
		// connectivity in the tree
		int numChildren; 						// Number of children for a given node
		struct treeNode *child[MAXCHILDREN];   	// children of the node
		struct treeNode *sibling;              	// siblings for the node

		bool typespecifier;
		
		// what kind of node
		NodeKind nodekind;                     	// type of node
		union                                  	// subtype of type
		{
			DeclKind decl;                     	// used when DeclK
			StmtKind stmt;                     	// used when StmtK
			ExpKind exp;                       	// used when ExpK
		} kind;
		
		// extra properties about the node depending on type of the node
		union                                  	// relevant data to type -> attr
		{
			OpKind op;                         	// type of token (same as in bison)
			int value;                         	// used when an integer constant or boolean
			unsigned char cvalue;               // used when a character
			char *string;                      	// used when a string constant
			char *name;                        	// used when IdK (ID kind, not I don't know)
		} attr;
		ExpType expType;		           		// used when ExpK for type checking
		bool isStatic;                         	// is staticly allocated?
		bool isArray;                          	// is this an array

		// even more semantic stuff will go here in later assignments.
	} TreeNode;

	TreeNode * allocNode();

#endif