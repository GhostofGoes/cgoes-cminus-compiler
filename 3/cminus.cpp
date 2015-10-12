
#include "cminus.h"


// Recursively prints the abstract syntax tree
// Print spaces at end of strings if necessary.
// Assumes we're printing to STDOUT. If we need a file, just redirect at OS level.
void printAbstractTree(TreeNode * tree, int indent_count) {
	
	// Keeps track of siblings
	int sibling_count = 0;

	// Prints all nodes of the tree
	while( tree != NULL ) {
		
		for(int i = 0; i < indent_count; i++) {
			printf("|   ");
		}
		if(sibling_count > 0) {
			// two spaces after child num
			printf( "|Sibling: %d  ", sibling_count);
		}
		
		// Statement
		if( tree->nodekind == StmtK ) {
			
		}
		// Expression
		else if( tree->nodekind == ExpK ) {
			
		}
		// Declaration
		else if (tree->nodekind == DeclK ) { 
			
		}
		// We shouldn't get here. Error!
		else { 
			// error wtf. not wtf wtf.
		}
		
		
		// Print the line number + newline
		printf( "[line: %d]\n", tree->lineno );
		
		// Check if there are children
		if( tree->numChildren > 0 ) {
			// "tab" space for children
			printf( "   ");
			
			for ( int i = 0; i < tree->numChildren; i++ ) {
				// Two spaces after child num
				printf( "Child: %d  ", i);
				printAbstractTree(tree->child[i], indent_count + 1);
			}			
		}
		
		tree = tree->sibling;
		sibling_count++;
		
	} // end while
	
}

// Prints the Annotated Syntax Tree 
void printAnnotatedTree( TreeNode * tree ) {
	;
}

// Performs semantic analysis, generating the Annotated Syntax Tree
void semanticAnalysis( TreeNode * tree ) {
	;
}


// TODO: placeholder Generates executable code 
void generateCode() {
	;
}

// Creates a new node for the syntax tree
// Args:
// Return: (TreeNode) The created node
TreeNode * makeNode( NodeKind nk, Kind k, Type t, int ln, char * s ) {
	
	// Allocate a new node
	TreeNode * tempNode = allocNode();
		
	tempNode->lineno = ln;
	tempNode->nodekind = nk; 
	tempNode->kind = k; 
	tempNode->nodetype = t; 
	tempNode->str = s;

	return tempNode;
}

// Adds children to an existing syntax tree node
// Args: 
void addChildren( TreeNode * parent, int numChildren,...) {
	
	// Attach children
	parent->numChildren = numChildren;
	if(numChildren > 0) { // Congratulations, its a TreeNode pointer!
		va_list children; 
		va_start (children, numChildren); // Load children from arguments
		
		for(int i = 0; i < numChildren; i++) {
			parent->child[i] = va_arg(children, TreeNode*);
		}
		
		va_end(children); // End var list
	}
}

// Links siblings to each other, starting with the first.
// Args: (int) number of siblings, (TreeNode) siblings to link
// Return: (TreeNode) The first node passed
TreeNode * linkSiblings( int numSiblings, ... ) {
	
	va_list siblings;
	va_start (siblings, numSiblings);
	
	TreeNode * prev = va_arg(siblings, TreeNode*);
	TreeNode * temp = prev;
	TreeNode * next = NULL;
	if(temp == NULL ) {
		// ERROR;
		return NULL;
	}
	while (prev->sibling != NULL ) { prev = prev->sibling; }
	
	for(int i = 0; i < numSiblings; i++) {
		next = va_arg(siblings, TreeNode*);
		if(prev != NULL) {
			prev->sibling = next;
		}
		prev = next;
	}
	prev->sibling = NULL;
	va_end(siblings);
	
	return temp;
	
}

// Allocates and zeros a new TreeNode
// Return: (TreeNode) The allocated node
TreeNode * allocNode() {
	TreeNode * tempNode = (TreeNode *)calloc(1, sizeof(TreeNode *));
	tempNode->numChildren = 0;
	tempNode->sibling = NULL;
	return tempNode;
}
