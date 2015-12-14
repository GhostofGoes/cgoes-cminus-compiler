#ifndef _TYPES_H_
#define _TYPES_H_

#define MAXCHILDREN 3

/*** TokenData ***/
typedef struct {
	int lineno;     // Token's line number
	int bval;       // Bison's special identifier for the Token (NOT a boolean!)
	char cvalue;    // Character value, if any
	int ivalue;     // Integer value, if any
	char * svalue;  // String value, if any
	char * input;   // Raw input from flex
} TokenData;


/*** Enums for treeNode ****/
// Some of the TreeNode stuff is drawn from the book.
// Source: "Compilers and Construction: Principles and Practice", by Kenneth C. Louden

typedef enum { StmtK, ExpK, DeclK, DefaultK } NodeKind;

// TODO: enum as maps so i can easily print
typedef enum {
	OpK, AssignK, VarK, FunK, ParamK,
	CompoundK, IfK, ForeachK, WhileK,
	ReturnK, BreakK, CallK,
	ConstK, IdK, TypeK, UnaryK, ReadK, WriteK, k_undef
} Kind;

typedef enum {Void, Integer, Boolean, Character, Undef } Type;

typedef enum {local, global, o_undef} Offset; // o_param, 

typedef enum {InputI, OutputI, InputB, OutputB, InputC, OutputC, OutNL, Nopeput} IO;


/*** TREENODE ***/
typedef struct treeNode
{
    /* Node metadata */
    int lineno;             // line number relevant to this node
    char * svalue;          // "name" of the node

    /* Node data */
    TokenData * token;      // Token attached to node, if applicable
    int arraySize;          // Number of elements in array, if applicable
    
    /* Tree connectivity */
    int numChildren;                        // Number of children for a given node (TODO: needed?)
    struct treeNode *child[MAXCHILDREN];    // children of the node
    struct treeNode *sibling;               // siblings for the node

    /* Node classification */
    NodeKind nodekind;  // General kind
    Kind kind;          // Precise kind (eg Return, Call, etc)
    Type nodetype;      // Type of the node

    /* Flags */
    bool isStatic;          // Statically allocated?
    bool isArray;           // Array?
    bool isIndex;           // Array index?
    bool isConstant;        // Constant?
    bool isFuncCompound;    // Super-magical function compound?
    bool isParam;
    
    /* Memory info */
    Offset offsetReg;   // offset register: global, local
    IO isIO;            // Will be set if input/output routine, otherwise Nopeput
    int size;           // size in memory
    int location;       // location in memory?
    int loc;
    
} TreeNode;

#endif
