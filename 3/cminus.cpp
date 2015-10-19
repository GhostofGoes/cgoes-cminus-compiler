#include "cminus.h"
#include "types.h"
#include <iostream>
#include <string>
#include <cstdlib>
#include <vector>
#include <string.h>

using namespace std;



// Recursively prints the abstract syntax tree
// Print spaces at end of strings if necessary.
// Assumes we're printing to STDOUT. If we need a file, just redirect at OS level.
void printAbstractTree(TreeNode * og, int indent_count) {
	
	TreeNode * tree = og;
	// Keeps track of siblings
	int sibling_count = 0;
	std::string outstr;


	// Prints all nodes of the tree
	while( tree != NULL ) {
		
		/*
		for(int i = 0; i < indent_count; i++) {
			printf("|   ");
		}
		*/

		if(sibling_count > 0) {
			outstr.append("|Sibling: ");
			outstr.append(to_string(sibling_count));
			outstr.append("  ");
			cout << applyIndents(outstr, indent_count);
			cout.flush();
			outstr.clear();
			//printf( "|Sibling: %d  ", sibling_count);
		}
		

		switch(tree->kind) {
			case OpK:
				outstr.append("Op: ");
				outstr.push_back(tree->token->cvalue);
				break;

			case ConstK:
				outstr.append("Const: ");
				outstr.append(to_string(tree->token->ivalue));
				break;

			case IdK:
				outstr.append("Id: ");
				outstr.append(tree->token->svalue ? tree->token->svalue : "");
				break;

			case AssignK:
				outstr.append("Assign: ");
				outstr.push_back(tree->token->cvalue);
				break;

			case IfK:
				outstr.append("If");
				break;

			case CompoundK:
				outstr.append("Compound");
				break;

			case ForeachK:
				outstr.append("Foreach");
				break;

			case WhileK:
				outstr.append("While");
				break;

			case ReturnK:
				outstr.append("Return");
				break;

			case BreakK:
				outstr.append("Break");
				break;

			case VarK:
			case ParamK:
				if(tree->kind == VarK)
					{ outstr.append("Var "); }
				else
					{ outstr.append("Param "); }
				outstr.append(tree->svalue ? tree->svalue : "");
				if(tree->isArray)
					{ outstr.append(" is array"); }
				outstr.append(" of type ");
				outstr.append(typeToStr(tree->nodetype));
				break;

			case FunK:
				outstr.append("Func ");
				outstr.append(tree->svalue ? tree->svalue : "");
				outstr.append(" returns type ");
				outstr.append(typeToStr(tree->nodetype));
				break;

			case CallK:
				outstr.append("Call: ");
				outstr.append(tree->svalue ? tree->svalue : "");
				break;

			case EmptyK:
				break;
			default:
				outstr.append("\nWe shouldn't get here\n");
				break;

		} // end switch

		cout << outstr << " [line: " << tree->lineno << "]" << endl;
		cout.flush();
		outstr.clear();
		//printf( " [line: %d]\n", tree->lineno );
		
		if( tree->numChildren > 0 ) {
			for ( int i = 0; i < tree->numChildren; i++ ) {
				outstr.append("|   Child: ");
				outstr.append(to_string(i));
				outstr.append("  ");
				cout << applyIndents(outstr, indent_count);
				cout.flush();
				outstr.clear();
				//printf( "|   ");
				//printf( "Child: %d  ", i);
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
TreeNode * makeNode( Kind k, Type t, int line, char * svalue, TokenData * token ) {
	TreeNode * tempNode = allocNode();
	tempNode->kind = k;
	tempNode->nodetype = t;
	tempNode->lineno = line;
	//tempNode->svalue = svalue;
	if( svalue != NULL ) {
		tempNode->svalue = strdup(svalue);
	}
	if(token != NULL) {
		tempNode->token = token;
	}

	return tempNode;
}

TreeNode * makeParent( Kind k, Type t, int l, char * svalue ) {
	TreeNode * tempNode = allocNode();
	tempNode->lineno = l;
	tempNode->kind = k;
	tempNode->nodetype = t;
	//tempNode->svalue = svalue;
	if(svalue != NULL) {
		tempNode->svalue = strdup(svalue);
	}
	return tempNode;
}

// Adds children to an existing syntax tree node
// TODO: make sure it isn't overwriting children. Don't think this is the problem tho...
/*
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
*/

void addChild( TreeNode * parent, TreeNode * child ) {
	if( parent == NULL || child == NULL ) {
		return;
	}

	if(testing) {
		cout <<
				"Adding child " << typeToStr(child->nodetype) << " at line " << child->lineno
				<< " to parent " << typeToStr(parent->nodetype) << " of line " << parent->lineno << endl;
	}


	if( parent->numChildren >= 0 && parent->numChildren < 3 ) {
		parent->child[parent->numChildren] = child;
		parent->numChildren++;
	}
}
/*
void addChildren( TreeNode * parent, int numChildren, TreeNode * child1 ) {
	if(parent->numChildren != 0) {
		cout << "Parent has more than 0 children, it has " << parent->numChildren << " children." << endl;
	}
	parent->numChildren = numChildren;
	parent->child[0] = child1;
}

void addChildren( TreeNode * parent, int numChildren, TreeNode * child1, TreeNode * child2 ) {
	if(parent->numChildren != 0) {
		cout << "Parent has more than 0 children, it has " << parent->numChildren << " children." << endl;
	}
	parent->numChildren = numChildren;
	parent->child[0] = child1;
	parent->child[1] = child2;
}

void addChildren( TreeNode * parent, int numChildren, TreeNode * child1, TreeNode * child2, TreeNode * child3 ) {
	if(parent->numChildren != 0) {
		cout << "Parent has more than 0 children, it has " << parent->numChildren << " children." << endl;
	}
	parent->numChildren = numChildren;
	parent->child[0] = child1;
	parent->child[1] = child2;
	parent->child[2] = child3;
}
*/
// Links siblings to each other, starting with the first.
// Args: (int) number of siblings, (TreeNode) siblings to link
// Return: (TreeNode) The first node passed
/*
TreeNode * linkSiblings( int numSiblings, TreeNode * init, ... ) {
	
	if( init == NULL ) // Check for dat null pointer
	{
		return NULL;
	}

	va_list siblings;
	va_start (siblings, init);
	
	TreeNode * prev;
	TreeNode * next;

	prev = init;
	next = NULL;

	while (prev->sibling != NULL ) {
		prev = prev->sibling;
	}
	
	for(int i = 1; i < numSiblings; i++) {
		next = va_arg(siblings, TreeNode*);
		if(prev != NULL) {
			prev->sibling = next;
		}
		prev = next;
	}
	//prev->sibling = NULL;
	va_end(siblings);
	
	return init;
	
}
*/

TreeNode * linkSiblings( TreeNode * sib1, TreeNode * sib2 ) {

	if(sib1 != NULL && sib2 != NULL ) {
		if(sib1->kind == EmptyK) {
			return sib2;
		}
		if(sib2->kind == EmptyK) {
			return sib1;
		}
		if(testing) {
			cout << "Linking sibling " << typeToStr(sib2->nodetype) << " of line " << sib1->lineno
					<< " to initial sibling " << typeToStr(sib1->nodetype) << " of line " << sib2->lineno << endl;
		}

		TreeNode * temp = sib1;

		while( temp->sibling != NULL ) {
			temp = temp->sibling;
		}

		temp->sibling = sib2;
	}

	return sib1;
}


void applyTypeToSiblings( TreeNode * init, Type t ) {
	TreeNode * temp = init;

	while( temp != NULL) {
		temp->nodetype = t;
		temp = temp->sibling;
	}
}

void appplyTypeToChildren( TreeNode * parent, Type t ) {
	if(parent != NULL && parent->numChildren > 0) {
		for(int i = 0; i < parent->numChildren; i++) {
			parent->child[i]->nodetype = t;
		}
	}
}


// Allocates and zeros a new TreeNode
TreeNode * allocNode() {
	TreeNode * tempNode = (TreeNode *)calloc(1, sizeof(TreeNode));
	//TreeNode *tempNode = new TreeNode;
	tempNode->token = NULL;
	tempNode->lineno = 0;
	tempNode->svalue = NULL;
	tempNode->nodetype = Void;
	tempNode->numChildren = 0;
	tempNode->sibling = NULL;
	tempNode->isStatic = false;
	tempNode->isArray = false;
	
	return tempNode;
}

std::string typeToStr( Type t ) {
	switch(t) {
		case Void:
			return("void");
			break;
		case Integer:
			return("int");
			break;
		case Boolean:
			return("bool");
			break;
		case Character:
			return("char");
			break;
	}
	return ("");
}

void freeTree( TreeNode * tree ) {
	TreeNode * prev;
	TreeNode * temp;

	prev = tree;

	while( prev != NULL ) {
		temp = prev;
		if(prev->token != NULL) {
			freeToken(prev->token);
		}

		if(prev->svalue != NULL) {
			free(prev->svalue);
		}
		// Check if there are children
		if( prev->numChildren > 0 ) {
			for ( int i = 0; i < prev->numChildren; i++ ) {
				freeTree(prev->child[i]);
			}
		}

		prev = prev->sibling;
		free(temp);
	} // end while

}

void freeToken( TokenData * token ) {
	if(token->svalue != NULL) {
		free(token->svalue);
	}

	if(token->input != NULL) {
		free(token->input);
	}

	free(token);
}

void dumpTree( TreeNode * tree ) {
	TreeNode * prev;
	prev = tree;
	int sibling_count = 0;

	while( prev != NULL ) {

		if(sibling_count > 0) {
			// two spaces after child num
			cout << "|Sibling: " << sibling_count << "  " << endl;
			//printf( "|Sibling: %d  ", sibling_count);
		}

		if(prev->token != NULL) {
			cout << "**TokenData**" << endl;
			if(tree->token->svalue != NULL) {
				cout << "\tsvalue: " << tree->token->svalue << endl;
			}
			if(tree->token->input != NULL) {
				cout << "\tsvalue: " << tree->token->svalue << endl;
			}
			cout << "\tlineno: " << tree->token->lineno << endl;
			cout << "\tcvalue: " << tree->token->cvalue << endl;
			cout << "\tivalue: " << tree->token->ivalue << endl;
		}

		if(prev->svalue != NULL) {
			cout << "\tsvalue: " << prev->svalue << endl;
		}
		// Check if there are children
		if( prev->numChildren > 0 ) {

			for ( int i = 0; i < prev->numChildren; i++ ) {
				cout << "|   ";
				dumpTree(prev->child[i]);
			}
		}

		prev = prev->sibling;
		sibling_count++;
	} // end while
	/*
	while( prev != NULL ) {

		if(sibling_count > 0) {
			// two spaces after child num
			cout << applyIndents("|Sibling: ", indent_count) << sibling_count << "  " << endl;
			//printf( "|Sibling: %d  ", sibling_count);
		}

		if(prev->token != NULL) {
			cout << applyIndents("**TokenData**", indent_count) << endl;
			if(tree->token->svalue != NULL) {
				cout << applyIndents("\tsvalue: ", indent_count) << tree->token->svalue << endl;
			}
			if(tree->token->input != NULL) {
				cout << applyIndents("\tsvalue: ", indent_count) << tree->token->svalue << endl;
			}
			cout << applyIndents("\tlineno: ", indent_count) << tree->token->lineno << endl;
			//cout << applyIndents("\tbval: ", indent_count) << tree->token->bval << endl;
			cout << applyIndents("\tcvalue: ", indent_count) << tree->token->cvalue << endl;
			cout << applyIndents("\tivalue: ", indent_count) << tree->token->ivalue << endl;
		}

		if(prev->svalue != NULL) {
			cout << applyIndents("\tsvalue: ", indent_count) << prev->svalue << endl;
		}
		// Check if there are children
		if( prev->numChildren > 0 ) {

			for ( int i = 0; i < prev->numChildren; i++ ) {
				cout << applyIndents("|   ", indent_count);
				dumpTree(prev->child[i], indent_count + 1);
			}
		}

		prev = prev->sibling;
		sibling_count++;
	} // end while
	*/

}


string applyIndents( string s, int indent ) {
	string temp;
	for( int i = 0; i < indent; i++ ) {
		temp.append("|   ");
	}
	temp.append(s);
	return temp;
}
