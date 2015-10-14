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
	typedef enum { StmtK, ExpK, DeclK } NodeKind;
	
	typedef enum { 
		OpK, ConstK, IdK, AssignK, IfK,
		CompoundK, ForeachK, WhileK, ReturnK,
		BreakK, VarK, FunK, ParamK, CallK
	} Kind;
	
	/*
	typedef enum { IfK, CompoundK, ForeachK, WhileK, ReturnK, BreakK } StmtKind;
	typedef enum { OpK, ConstK, IdK, AssignK } ExpKind;
	//typedef enum { } OpKind;
	typedef enum { VarK, FunK, ParamK } DeclKind;
	*/
	
	// Typechecking
	typedef enum {Void, Integer, Boolean, Character} Type;
	
	// TODO: KEEP TRACK OF SCOPE!
// TreeNode
	typedef struct treeNode
	{
		
		TokenData token;
		int lineno;                            	// linenum relevant to this node
		int value;
		char * str; // maybe just use the token data?
		
		// connectivity in the tree
		int numChildren; 						// Number of children for a given node
		struct treeNode *child[MAXCHILDREN];   	// children of the node
		struct treeNode *sibling;              	// siblings for the node

		//bool typespecifier;
		
		// what kind of node
		NodeKind nodekind;                     	// type of node
		Kind kind;
		/*
		union                                  	// subtype of type
		{
			DeclKind decl;                     	// used when DeclK
			StmtKind stmt;                     	// used when StmtK
			ExpKind exp;                       	// used when ExpK
		} kind;
		*/
		Type nodetype;
		//ExpType expType;		           		// used when ExpK for type checking
		bool isStatic;                         	// is staticly allocated?
		bool isArray;                          	// is this an array

		// even more semantic stuff will go here in later assignments.
	} TreeNode;

#endif
