#include "cminus.h"
#include "types.h"
#include <iostream>
#include <string>
#include <cstdlib>
#include <vector>
#include <string.h>
#include <sstream>

using namespace std;

// Recursively prints the abstract syntax tree
// Print spaces at end of strings, if necessary.
// TODO: output redirection
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
			outstr += sibling_count;
			//outstr.append(to_string(sibling_count));
			outstr.append("  ");
			cout << applyIndents(outstr, indent_count);
			cout.flush();
			outstr.clear();
		}

		switch(tree->nodekind) {
			case OpK:
				outstr += "Op: ";
				if( tree->token->svalue != NULL ) {
					outstr += tree->token->svalue;
				}
				else {
					outstr.push_back(tree->token->cvalue);
				}
				break;

			case UnaryK:
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

				if( tree->nodetype == Void ) {
					outstr.push_back(tree->token->cvalue);
				}
				if( tree->nodetype == Integer ) {
					outstr += tree->token->svalue ? tree->token->svalue : "";
				}

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
					outstr += i;
					//outstr.append(to_string(i));
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
void semanticAnalysis( TreeNode * og ) {

	TreeNode * tree = og;
	error_messages = new vector<string>;

	return newTree;

}

void treeParse( TreeNode * parent, TreeNode * node, SymbolTable symtable ) {

	TreeNode * tree = node;
	stringstream err;
	int a[5];
	int b[8];

	if(a > b) {

	}
	while( tree != NULL ) {

		int sibling_count = 0; // Keeps track of siblings

		if(sibling_count > 0) {

		}

		// error stream
		switch(tree->nodekind) {
			case OpK:
				// TODO: typing for operations, char/int
				// TODO: proper operation printing, string/char
				string op;
				if( tree->numChildren == 2 ) {
					Type lhs, rhs;
					lhs = tree->child[0]->nodetype;
					rhs = tree->child[1]->nodetype;

					if( tree->child[0]->isArray != tree->child[1]->isArray ) {
						err << "'" << op << "' requires that if one operand is an array so must the other operand";
						printError(tree->lineno, err);
					}
					/*
					if( tree->child[0]->nodekind == FunK || tree->child[1]->nodekind == FunK ) {
						err << "Cannot use function '" <<
					}
					*/

					if( lhs != tree->nodetype ) {
						err << "'" << tree->token->cvalue << "' requires operands of type "
								<< typeToStr(tree->nodetype) << " but rhs is of type " << typeToStr(rhs);
						printError(tree->lineno, err);
					}
					if( rhs != tree->nodetype ) {
						err << "'" << tree->token->cvalue << "' requires operands of type "
								<< typeToStr(tree->nodetype) << " but lhs is of type " << typeToStr(lhs);
						printError(tree->lineno, err);
					}
					if( lhs != rhs ) {
						err << "'" << tree->token->cvalue << "' requires operands of the same type but lhs is type "
								<< typeToStr(lhs) << " and rhs is " << typeToStr(rhs);
						printError(tree->lineno, err);
					}
					if( tree->child[0]->isArray != tree->child[1]->isArray ) {
						err << "'" << tree->token->cvalue << "' requires that if one operand is an array so must the other operand";
						printError(tree->lineno, err);
					}
				}

				// TODO: works/doesn't work with arrays
				if( tree->token->svalue != NULL ) {

				}
				else
				{
				}


				break;

			case UnaryK:
				if( tree->numChildren == 1 ) {
					if( tree->child[0]->nodetype != tree->nodetype ) {
						err << "Unary '" << tree->token->cvalue << "' requires an operand of type "
								<< typeToStr(tree->nodetype) << " but was given " << typeToStr(tree->child[0]->nodetype);
						printError(tree->lineno, err);
					}
				}
				break;

			case ConstK:
				if(tree->nodetype == Boolean) {
					//outstr.append(iboolToString(tree->token->ivalue));
				}
				else if(tree->nodetype == Integer) {
					//outstr += tree->token->ivalue;
				}
				else if(tree->nodetype == Character) {
					if(tree->token->svalue != NULL ) {

					}
					else {

					}
				}
				break;

			case IdK:
				break;

			case AssignK:
				break;

			case IfK:
				break;

			case CompoundK:
				symtable.enter("Compound" + tree->lineno);
				break;

			case ForeachK:
				if( tree->numChildren)  {
					Type lhs, rhs;
					lhs = tree->child[0]->nodetype;
					rhs = tree->child[1]->nodetype;

					if( tree->child[0]->isArray ) {
						err << "In foreach statement the variable to the left of 'in' must not be an array";
						printError(tree->lineno, err);
					}
					else if ( lhs != Integer ) {
						err << "If not an array, foreach requires lhs of 'in' be of type int but it is type "
								<< typeToStr(lhs);
						printError(tree->lineno, err);
					}
					if( rhs != Integer ) {
						err << "If not an array, foreach requires rhs of 'in' be of type int but it is type "
								<< typeToStr(rhs);
						printError(tree->lineno, err);
					}
					if( lhs != rhs ) {
						err << "Foreach requires operands of 'in' to be the same type but lhs is type "
								<< typeToStr(lhs) << " and rhs array is type " << typeToStr(rhs);
						printError(tree->lineno, err);
					}
				}
				break;

			case WhileK:
				break;

			case ReturnK:
				if( tree->numChildren == 1 && tree->child[0] != NULL ) {
					if(tree->child[0]->isArray) {
						err << "Cannot return an array";
						printError(tree->lineno, err);
					}
				}
				if( parent->nodekind == FunK ) {
					if( parent->nodetype == Void && tree->nodetype != Void ) {
						err << "Function '" << parent->svalue ? parent->svalue : "" << "' at line " << parent->lineno
								<< " is expecting no return value, but return has return value";
						printError(tree->lineno, err);
					}
					else if( parent->nodetype != Void && tree->nodetype == Void ) {
						err << "Function '" << parent->svalue ? parent->svalue : "" << "' at line " << parent->lineno
								<< " is expecting to return type " << typeToStr(parent->nodetype) << " but return has no return value";
						printError(tree->lineno, err);
					}
					else if( parent->nodetype != tree->nodetype ) {
						err << "Function '" << parent->svalue ? parent->svalue : "" << "' at line " << parent->lineno
								<< " is expecting to return type " << typeToStr(parent->nodetype) << " but got "
								<< typeToStr(tree->nodetype);
						printError(tree->lineno, err);
					}
				}
				break;

			case BreakK:
				if( parent->nodekind != ForeachK || parent->nodekind != WhileK ) {
					err << "Cannot have a break statement outside of loop";
					printError(tree->lineno, err);
				}
				break;

			case VarK:
				if( tree->numChildren == 1 ) {
					if( tree->isArray ) {
						if( tree->child[0] != NULL ) {
							if( tree->child[0]->svalue == tree->svalue ) {
								err << "Array index is the unindexed array '" << tree->svalue ? tree->svalue : "" << "'";
								printError(tree->lineno, err);
							}
							else if( tree->child[0]->nodetype != Integer ) {
								err << "Array '" << tree->svalue ? tree->svalue : ""
										<< "' should be indexed by type int but got " << typeToStr(tree->child[0]->nodetype);
								printError(tree->lineno, err);
							}
						}
					}
					else { // Variables can't have children, right...?
						err << "Cannot index nonarray '" << tree->svalue ? tree->svalue : "" << "'";
						printError(tree->lineno, err);
					}
				}

				break;

			case ParamK:

				if( parent->nodekind == CallK ) {

				}
				break;

			case FunK:
				if( parent->nodekind == OpK
					|| parent->nodekind == UnaryK
					|| parent->nodekind == AssignK
					|| parent->nodekind == ReturnK
					|| parent->nodekind == ParamK )
				{
					err << "Cannot use function '" << tree->svalue ? tree->svalue : "" << "' as a simple variable";
					printError(tree->lineno, err);
				}
				if( tree->nodetype != Void ) {
					bool returnPresent = false;
					for( int i = 0; i < tree->numChildren; i++ ) {
						if( tree->child[i]->nodekind == ReturnK ) {
							returnPresent = true;
							break;
						}
					}
					if(!returnPresent) {
						err << "Expecting to return type " << typeToStr(tree->nodetype) << "but function '"
								<< tree->svalue ? tree->svalue : "" << "' has no return statement";
						printWarning(tree->lineno, err); // Warning getting a err? naming lol...
					}
				}
				break;

			case CallK:
				if( tree->svalue != NULL ) {
					TreeNode * temp = symtable.lookup(tree->svalue);
					if(temp == NULL ) {

					}
					else {
						if( temp->nodekind != FunK ) {
							err << "'" << tree->svalue << "' is a simple variable and cannot be called";
							printError(tree->lineno, err);
						}
					}
				}
				break;
			default:
				break;

		} // end switch

		// Check if there are children
		if( tree->numChildren > 0 ) {
			for ( int i = 0; i < tree->numChildren; i++ ) {
				if(tree->child[i] != NULL ) {
					treeParse(tree, tree->child[i], symtable);
				}
			}
		}

		if( tree->nodekind == CompoundK ) {
			symtable.leave();
		}
		tree = tree->sibling; // Jump to the next sibling
		sibling_count++;

	} // end while
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

void printError( int line, stringstream err) {
	cout << "ERROR(" << line << "): " << err.str() << "." << endl;
	err.str(string());
	err.clear();
	errors++;
}

void printWarning( int line, stringstream warn ) {
	cout << "WARNING(" << line << "): " << warn.str() << "." << endl;
	warn.str(string());
	warn.clear();
	warnings++;
}
