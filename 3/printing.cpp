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

    
    printTokenData(data->token);
    
    std::cout << " |lineno: " << data->lineno;
    std::cout << " |numChildren: " << data->numChildren;
    std::cout << " |isArray: " << data->isArray;
    std::cout << " |isIndex: " << data->isIndex;
    std::cout << " |isStatic: " << data->isStatic;
    std::cout << " |isScoped: " << data->isScoped;
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
    std::cout << std::endl;
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
    std::cout << " |input: " << token->input != NULL ? token->input : "";
    std::cout << std::endl;
    
}


