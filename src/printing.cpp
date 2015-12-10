// printing.cpp
/* C++ Libraries */
#include <iostream>
#include <string>
#include <cstdlib>

/* C libraries */
#include <stdio.h>
#include <string.h>
#include <getopt.h>

/* Local headers */
#include "cminus.h"
#include "types.h"
#include "toker.h"
#include "symbolTable.h"
#include "printing.h"

const char * iboolToString( int ib ) {
    if (ib) {
        return "true";
    } else {
        return "false";
    }
}

// Returns the text string version of Type t
const char * typeToStr( Type t ) {
    switch (t) {
        case Void:
            return ("void");
            break;
        case Integer:
            return ("int");
            break;
        case Boolean:
            return ("bool");
            break;
        case Character:
            return ("char");
            break;
        case Undef:
            return ("undefined type");
            break;
    }
    return "";
}

const char * nodekindToStr( NodeKind nk ) {
    switch(nk) {
        case DeclK:
            return ("DeclK");
            break;
        case StmtK:
            return ("StmtK");
            break;
        case ExpK:
            return ("ExpK");
            break;
        case DefaultK:
            return ("DefaultK");
            break;
    }
    return "";
}

std::string opToStr( TokenData * tok ) {

    std::string temp;

    if (tok != NULL) {
        if (tok->svalue != NULL) {
            temp.assign(tok->svalue);
        } else if (tok->cvalue != 0) {
            temp.push_back(tok->cvalue);
        } else {
            temp += tok->ivalue;
        }
    }

    return temp;
}

// TODO: fix flex so this isn't necessary
std::string svalResolve( TreeNode * tree ) {

    std::string temp;
    
    if (tree != NULL) {
        if (tree->svalue != NULL) {
            temp.assign(tree->svalue);
        } else if (tree->token != NULL) {
            temp = opToStr(tree->token);
        }
    }
    return temp;
}

// TODO: makes assumption about indentation with "|   "
std::string applyIndents( std::string s, int indent ) {
    std::string temp;
    for (int i = 0; i < indent; i++) {
        temp.append("|   ");
    }
    temp.append(s);
    return temp;
}

void printError( int line, std::string err ) {
    std::cout << "ERROR(" << line << "): " << err << "." << std::endl;
    std::cout.flush();
    err.clear();
    errors++;
}

void printWarning( int line, std::string warn ) {
    std::cout << "WARNING(" << line << "): " << warn << "." << std::endl;
    std::cout.flush();
    warn.clear();
    warnings++;
}

void printTreeNode(void * node) {
    if(node == NULL) {
        std::cout << "TreeNode - NULL" << std::endl;
        return;
    }
        
    TreeNode * data = (TreeNode *)node;
    std::cout << "TreeNode" << std::endl;

    std::cout << " |lineno: " << data->lineno;
    std::cout << " |numChildren: " << data->numChildren;
    std::cout << " |isArray: " << data->isArray;
    std::cout << " |isIndex: " << data->isIndex;
    std::cout << " |isStatic: " << data->isStatic;
    std::cout << std::endl;
    
    std::cout << " |nodekind: " << nodekindToStr(data->nodekind);
    std::cout << " |kind: " << data->kind;
    std::cout << " |nodetype: " << typeToStr(data->nodetype);
    std::cout << std::endl;
    
    // TODO: print children?
    if( data->sibling != NULL ) {
        std::cout << " |Sibling: " 
                << data->sibling->svalue != NULL ? data->sibling->svalue : "";
        std::cout << std::endl;
    }
    
    std::cout << " |svalue: " << data->svalue != NULL ? data->svalue : "";
    std::cout << "\n\n" <<  std::endl;
    
        printTokenData(data->token);

}

void printTokenData(void * tok) {
    if(tok == NULL)
    {
        std::cout << "TokenData - NULL" << std::endl;
        return;
    }
    
    TokenData * token = (TokenData *)tok;
    std::cout << "*|TokenData|*" << std::endl;
    
    std::cout << " |Lineno: " << token->lineno;
    std::cout << " |bval: " << token->bval;
    std::cout << " |cvalue: " << token->cvalue;
    std::cout << " |ivalue: " << token->ivalue << std::endl;
    
    std::cout << " |svalue: " << token->svalue != NULL ? token->svalue : "";
    std::cout << std::endl;
    std::cout << " |input: " << token->input != NULL ? token->input : "";
    std::cout << std::endl;
    
}

// Recursively prints the abstract syntax tree
// TODO: null characters in char and string consts, store/print properly (check treeParse for solution, make function)
void printAbstractTree ( TreeNode * og, int indent_count )
{

    TreeNode * tree = og;
    int sibling_count = 0; // Keeps track of siblings

    // Output buffer 
    // TODO: string stream better option?
    std::string outstr;

    // Prints all nodes of the tree
    while (tree != NULL)
    {

        if ( sibling_count > 0 )
        {
            outstr.append("|Sibling: ");
            outstr.append(std::to_string(sibling_count));
            outstr.append("  ");
            std::cout << applyIndents(outstr, indent_count);
            std::cout.flush();
            outstr.clear();
        }

        switch (tree->kind)
          {
            case OpK:
              outstr += "Op: ";
              outstr += svalResolve(tree);
              break;

            case UnaryK:
              outstr.append("Op: ");
              outstr.append(svalResolve(tree));
              break;

            case ConstK:
              outstr.append("Const: ");
              if ( tree->nodetype == Boolean )
              {
                  outstr.append(iboolToString(tree->token->ivalue));
              } else if ( tree->nodetype == Integer )
              {
                  outstr.append(std::to_string(tree->token->ivalue));
              } else if ( tree->nodetype == Character )
              {
                  if ( tree->token->svalue != NULL )
                  { //  could use isArray here for stringconsts
                      outstr += '"';
                      outstr += tree->token->svalue;
                      //fwrite( tree->token->svalue, sizeof(char), sizeof(tree->token->svalue), stdout);
                      outstr += '"';
                  } else
                  {
                      outstr += '\'';
                      outstr += tree->token->cvalue;
                      outstr += '\'';
                  }
              }
              break;

            case IdK:
              outstr.append("Id: ");
              outstr.append(svalResolve(tree));
              break;

            case AssignK:
              outstr.append("Assign: ");

              if ( tree->nodetype == Void )
              {
                  outstr.append(svalResolve(tree));
              }
              if ( tree->nodetype == Integer )
              {
                  outstr += svalResolve(tree);
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
              if ( tree->kind == VarK )
              {
                  outstr.append("Var ");
              } else
              {
                  outstr.append("Param ");
              }
              outstr.append(svalResolve(tree));
              if ( tree->isArray )
              {
                  outstr.append("is array");
              }
              outstr.append(" of type ");
              outstr.append(typeToStr(tree->nodetype));
              break;

            case FunK:
              outstr.append("Func ");
              outstr.append(svalResolve(tree));
              outstr.append(" returns type ");
              outstr.append(typeToStr(tree->nodetype));
              break;

            case CallK:
              outstr.append("Call: ");
              outstr.append(svalResolve(tree));
              break;
            default:
              outstr.append("\nWe shouldn't get here\n");
              break;

          } // end switch

        std::cout << outstr << " [line: " << tree->lineno << "]" << std::endl;
        std::cout.flush();
        outstr.clear();

        // Check if there are children
        if ( tree->numChildren > 0 )
        {
            for (int i = 0; i < tree->numChildren; i++)
            {
                if ( tree->child[i] != NULL )
                {
                    outstr.append("|   Child: ");
                    outstr.append(std::to_string(i));
                    outstr.append("  ");
                    std::cout << applyIndents(outstr, indent_count);
                    std::cout.flush();
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
// TODO: put into a class, seperate codegen and other steps. template functions?
// TODO: combine print tree functions, pass an enum 'flag' to turn on different printing features
void printAnnotatedTree ( TreeNode * og, int indent_count )
{

    TreeNode * tree = og;
    int sibling_count = 0; // Keeps track of siblings
    std::string outstr; // Output buffer

    // Prints all nodes of the tree
    while (tree != NULL)
    {

        if ( sibling_count > 0 )
        {
            outstr.append("|Sibling: ");
            outstr.append(std::to_string(sibling_count));
            outstr.append("  ");
            std::cout << applyIndents(outstr, indent_count);
            std::cout.flush();
            outstr.clear();
        }

        switch (tree->kind)
          {
            case OpK:
              outstr += "Op: ";
              outstr += opToStr(tree->token);
              outstr += (" Type: ");
              outstr += typeToStr(tree->nodetype);
              break;

            case UnaryK:
              outstr.append("Op: ");
              outstr.append(svalResolve(tree));
              outstr += (" Type: ");
              outstr += typeToStr(tree->nodetype);
              break;

            case ConstK:
              outstr.append("Const: ");
              if ( tree->nodetype == Boolean )
              {
                  outstr.append(iboolToString(tree->token->ivalue));
              } else if ( tree->nodetype == Integer )
              {
                  outstr.append(std::to_string(tree->token->ivalue));
              } else if ( tree->nodetype == Character )
              {
                  if ( tree->token->svalue != NULL )
                  {
                      outstr += '"';
                      outstr += tree->token->svalue;
                      outstr += '"';
                  } else
                  {
                      outstr += '\'';
                      outstr += tree->token->cvalue;
                      outstr += '\'';
                  }
              }

              outstr.append(" Type: ");
              if ( tree->isArray )
              {
                  outstr.append("is array of ");
              }
              outstr.append(typeToStr(tree->nodetype));
              break;

            case IdK:
              outstr.append("Id: ");
              outstr.append(svalResolve(tree));
              outstr += (" Type: ");
              if ( tree->isArray )
              {
                  outstr.append("is array of ");
              }
              outstr += typeToStr(tree->nodetype);
              break;

            case AssignK:
              outstr.append("Assign: ");
              outstr += opToStr(tree->token);
              outstr += (" Type: ");
              if ( tree->isArray )
              {
                  outstr.append("is array of ");
              }
              outstr += typeToStr(tree->nodetype);
              break;

            case IfK:
              outstr.append("If");
              break;

            case CompoundK:
              outstr.append("Compound");
              outstr += " with size ";
              outstr += std::to_string(tree->size);
              outstr += " at end of it's declarations";                     
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

            case VarK: // TODO: negative sizes??
              outstr.append("Var ");
              outstr.append(svalResolve(tree));
              if ( tree->isArray )
              {
                  outstr.append(" is array of");
              }
              outstr += " ";
              outstr.append(typeToStr(tree->nodetype));
              outstr += " allocated as ";
              if( tree->offsetReg == global )
                  outstr += "Global";
              else
                  outstr += "Local";
              if(tree->isStatic)
                  outstr += "Static";
              outstr += " of size ";
              outstr += std::to_string(tree->size);
              outstr += " and data location ";
              outstr += std::to_string(tree->location);
              break;

            case ParamK:
              outstr.append("Param ");
              outstr.append(svalResolve(tree));
              if ( tree->isArray )
              {
                  outstr.append(" is array of");
              }
              outstr += " ";
              outstr.append(typeToStr(tree->nodetype));
              outstr += " allocated as ";
              outstr += "Parameter";
              outstr += " of size ";
              outstr += std::to_string(tree->size);
              outstr += " and data location ";
              outstr += std::to_string(tree->location);
              break;

            case FunK:
              outstr.append("Func ");
              outstr.append(svalResolve(tree));
              outstr.append(" returns type ");
              outstr.append(typeToStr(tree->nodetype));
              outstr += " allocated as ";
              if( tree->offsetReg == global )
                  outstr += "Global";
              else
                  outstr += "Local";
              outstr += " of size -"; // TODO: printing as negative for now, ask in class?
              outstr += std::to_string(tree->size);
              outstr += " and exec location ";
              outstr += std::to_string(tree->location);              
              break;

            case CallK:
              outstr.append("Call: ");
              outstr.append(svalResolve(tree));
              outstr += (" Type: ");
              outstr += typeToStr(tree->nodetype);
              break;

            default:
              outstr.append("\nWe shouldn't get here\n");
              break;

          } // end switch

        std::cout << outstr << " [line: " << tree->lineno << "]" << std::endl;
        std::cout.flush();
        outstr.clear();

        // Check if there are children
        if ( tree->numChildren > 0 )
        {
            for (int i = 0; i < tree->numChildren; i++)
            {
                if ( tree->child[i] != NULL )
                {
                    outstr.append("|   Child: ");
                    outstr.append(std::to_string(i));
                    outstr.append("  ");
                    std::cout << applyIndents(outstr, indent_count);
                    std::cout.flush();
                    outstr.clear();
                    printAnnotatedTree(tree->child[i], indent_count + 1);
                }
            }
        }

        tree = tree->sibling; // Jump to the next sibling
        sibling_count++;
    } // end while

}


