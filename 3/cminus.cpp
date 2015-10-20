#include "cminus.h"
#include "types.h"
#include <iostream>
#include <string>
#include <cstdlib>
#include <vector>
#include <string.h>

using namespace std;

// Recursively prints the abstract syntax tree
// Print spaces at end of strings, if necessary.
// Assumes we're printing to STDOUT. If we need a file, just redirect at OS level.
// TODO: output redirection?
// TODO: null characters in char and string consts, store/print properly
void printAbstractTree(TreeNode * og, int indent_count) {
	
	TreeNode * tree = og;
	int sibling_count = 0; // Keeps track of siblings

	// Output buffer (TODO: string stream better option?)
	std::string outstr;

	// Prints all nodes of the tree
	while( tree != NULL ) {

		if(sibling_count > 0) {
			outstr.append("|Sibling: ");
			outstr.append(to_string(sibling_count));
			outstr.append("  ");
			cout << applyIndents(outstr, indent_count);
			cout.flush();
			outstr.clear();
		}

		switch(tree->nodekind) {
			case OpK:
				outstr.append("Op: ");
				outstr.push_back(tree->token->cvalue);
				break;

			case ConstK:
				outstr.append("Const: ");
				if(tree->nodetype == Boolean) {
					outstr.append(iboolToString(tree->token->ivalue));
				}
				else if(tree->nodetype == Integer) {
					outstr += tree->token->ivalue;
				}
				else if(tree->nodetype == Character) {
					if(tree->token->svalue != NULL ) {
						outstr += '"';
						outstr += tree->token->svalue ? tree->token->svalue : "";
						outstr += '"';
					}
					else {
						outstr += '\'';
						outstr += (tree->token->cvalue);
						outstr += '\'';
					}
				}
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
				if(tree->nodekind == VarK)
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
			default:
				outstr.append("\nWe shouldn't get here\n");
				break;

		} // end switch

		cout << outstr << " [line: " << tree->lineno << "]" << endl;
		cout.flush();
		outstr.clear();
		
		// Check if there are children
		// TODO: check for NULL children
		if( tree->numChildren > 0 ) {
			for ( int i = 0; i < tree->numChildren; i++ ) {
				if(tree->child[i] != NULL ) {
					outstr.append("|   Child: ");
					outstr.append(to_string(i));
					outstr.append("  ");
					cout << applyIndents(outstr, indent_count);
					cout.flush();
					outstr.clear();
					printAbstractTree(tree->child[i], indent_count + 1);
				}
			}			
		}
		
		tree = tree->sibling; // Jump to the next sibling
		sibling_count++;
	} // end while
	
}

// Prints the Annotated Syntax Tree 
void printAnnotatedTree( TreeNode * tree, int indent_count ) {
	printAbstractTree(tree, indent_count);
}

// Performs semantic analysis, generating the Annotated Syntax Tree
// TODO: insertions
// TODO: lookups
void semanticAnalysis( TreeNode * tree ) {
	;
}

// TODO: placeholder Generates executable code 
void generateCode() {
	;
}

// Creates a new node for the syntax tree
// TODO: combine with make parent?
TreeNode * makeNode( Kind k, Type t, int line, char * svalue, TokenData * token ) {
	TreeNode * tempNode = allocNode();
	tempNode->nodekind = k;
	tempNode->nodetype = t;
	tempNode->lineno = line;
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
	tempNode->nodekind = k;
	tempNode->nodetype = t;
	if(svalue != NULL) {
		tempNode->svalue = strdup(svalue);
	}
	return tempNode;
}

// Adds a child to an existing syntax tree node
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

// Links siblings to each other, starting with the first
TreeNode * linkSiblings( TreeNode * sib1, TreeNode * sib2 ) {

	if(sib1 == NULL) {
		return sib2;
	}
	else if( sib2 == NULL ) {
		return sib1;
	}
	else {
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

// Applies Type t to all the siblings of TreeNode init
void applyTypeToSiblings( TreeNode * init, Type t ) {
	TreeNode * temp = init;

	while( temp != NULL) {
		temp->nodetype = t;
		temp = temp->sibling;
	}
}

// Applies Type t to all the children of TreeNode parent
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
				if(prev->child[i] != NULL ) {
					freeTree(prev->child[i]);
				}
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

std::string iboolToString( int ib ) {
	if( ib ) {
		return "true";
	}
	else {
		return "false";
	}
}

// Returns the text string version of Type t
string typeToStr( Type t ) {
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

// TODO: makes assumption about indentation
string applyIndents( string s, int indent ) {
	string temp;
	for( int i = 0; i < indent; i++ ) {
		temp.append("|   ");
	}
	temp.append(s);
	return temp;
}
