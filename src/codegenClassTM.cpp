/* 
 * File:   codegenClassTM.cpp
 * Author: tehlizard
 * 
 * Created on December 4, 2015, 12:40 PM
 */

/* C++ Libraries */
#include <iostream>
#include <cstdlib>
#include <string>
#include <fstream>
#include <iomanip>

/* C Libraries */
#include <time.h>

/* Local headers */
#include "codegenClassTM.h"
#include "cminus.tab.h"
#include "cminus.h"
#include "types.h"
#include "symbolTable.h"

using namespace std;


/* Constructors/Destructors */
codegenTM::codegenTM ( TreeNode * t, int g, string of, string inf) 
{ 
    //symtable = s;
    aTree = t;
    
    buildTable();
    
    outfilename = of;
    infilename = inf;
    
    if(outfilename != "stdout")
        emitToFile = true;
    else
        emitToFile = false;
    
    gOffset = g;
    fOffset = 0;
    tOffset = 0;

    emitLoc = 0;
    highEmitLoc = 0;
    mainLoc = 0;
}

codegenTM::~codegenTM ( ) 
{ 
    if(emitToFile && outfile.is_open())
    {
        outfile.flush();
        outfile.close();
    }
    else
    {
        cout.flush();
    }
    
    delete symtable;
}


/* Primary public functions */

void codegenTM::generateCode()
{
    int start = 0;
    
    /* Header comments*/
    if(emitToFile)
    {
        outfile.open(outfilename, ofstream::out);
        
    }  
    
    emitComment( "File name:     \t" + outfilename );
    emitComment( "File compiled: \t" + infilename );
    emitComment( "Compiled using:\tCgoes Cminus Compiler (CCC)" );
    emitComment( "Author:        \tChristopher Goes");
    emitComment( "Generated at:  \t" + timestamp() );
    
    
    /* Instruction generation */
    start = emitSkip(1); // so we can have our jump to init
    
    treeTraversal(aTree); // Main code generation
    
    emitBackup(start); // Go back to the beginnnnning of time
    emitRMAbs("LDA", pc, highEmitLoc, "Jump to init");
    emitRestore(); // Pow! We're back to the present!
    
    initSetup(); // Do our init jam
}


/* Initialization */

void codegenTM::initSetup()
{
    emitComment("INIT");
    emitRM("LD", 0, 0, 0, "Set global pointer");
    emitRM("LDA", fp, gOffset, gp, "Set frame to end of globals");
    emitRM("ST", fp, 0, fp, "Store old frame pointer");
    
    initGlobals(); // Initialize globals and statics
    
    emitRM("LDA", val, 1, pc, "Save return address");
    emitRMAbs("LDA", pc, mainLoc, "Jump to main");
    emitRO("HALT", 0, 0, 0, "Fin."); 
    emitComment("END INIT");
}

void codegenTM::initGlobals()
{
    emitComment("INIT GLOBALS AND STATICS");
    initGlobalVars();
    emitComment("END INIT GLOBALS AND STATICS");
}

void codegenTM::initGlobalVars()
{
    for(TreeNode * tree: globalInitVec)
    {
        if(tree->isArray)
        {
            if ( tree->offsetReg == local && tree->isStatic )
            {
                emitRM("LDC", val, tree->arraySize, 0, "Load size of LocalStatic array " + svalResolve(tree));
                emitRM("ST", val, tree->location + 1, gp, "Store size of LocalStatic array " + svalResolve(tree));                    
            } 
            else if ( tree->offsetReg == global )
            {
                emitRM("LDC", val, tree->arraySize, 0, "Load size of global array " + svalResolve(tree));
                emitRM("ST", val, tree->location + 1, gp, "Store size of global array " + svalResolve(tree));
            }
            else
            {
                cout << "Fell off inside isArray if-else chain in initGlobalVars. svalue: " << svalResolve(tree) << endl;
            }
        }
        else if( tree->child[0] != NULL )
        {
            generateExpression(tree->child[0], val);
            storeVar(tree, val);          
        }
        else
        {
            cout << "Fell off primary if-else chain in initGlobalVars. svalue: " << svalResolve(tree) << endl;
        }
    }
}


/* Generate nodekinds */

void codegenTM::generateDeclaration(TreeNode* node)
{
    TreeNode * tree = node;
    if(tree == NULL)
    {
        cout << "NULL node in generateDeclaration!" << endl;
        return;
    }
    string treestr = svalResolve(tree);
    TreeNode * lhs = tree->child[0];
    TreeNode * rhs = tree->child[1];
    
    switch(tree->kind) {
        case VarK:
            if( (tree->offsetReg == local && tree->isStatic) || tree->offsetReg == global)
            {
                globalInitVec.push_back(tree);
            }
            else
            {
                if(tree->isArray) // Array size loading
                {
                    if(tree->offsetReg == local && !tree->isStatic)
                    {
                        emitRM("LDC", val, tree->arraySize, 0, "Load size of local array " + treestr);
                        emitRM("ST", val, tree->location + 1, fp, "Store size of local array " + treestr);
                    }
                    else
                    {
                        cout << "Fell off array if-else chain in generateDelcaration:VarK. svalue: " << svalResolve(tree) << endl;
                    }
                }
                else
                {
                    if( (tree->offsetReg == local && !tree->isStatic) && lhs != NULL)
                    {
                        generateExpression(lhs, val);
                        storeVar(tree,val);
                    }
                }
            }
            symtable->insert(treestr, tree);
            break;
            
        case FunK: // Function declaration
            emitComment("FUNCTION " + treestr);
            if(treestr == "main")
                mainLoc = emitSkip(0); // TODO: needed?
            tree->loc = emitSkip(0);
            symtable->insert(treestr, tree);
            emitRM("ST", val, -1, fp, "Store return address");
            
            if(tree->isIO != Nopeput)
            {
                IOroutines(tree->isIO);
                funRet();
            }
            else
            {
                symtable->enter("Function " + treestr);
                treeTraversal(tree->child[0]); // parameters, if any
                treeTraversal(tree->child[1]); // *magical* compound
                standardRet(); // redundant return in case one is never specified
                symtable->leave();
            }
            emitComment("END FUNCTION " + treestr);
            break;
            
    case ParamK:
        symtable->insert(treestr, tree);
        break;
               
        default:
            cout << "Hit default in generateDeclaration switch(kind)! treestr: " << treestr << endl;
            break;
    }
}

// TODO: SymbolTable for local redeclarations of global vars!
void codegenTM::generateStatement( TreeNode * node )
{
    TreeNode * tree = node;
    if(tree == NULL)
    {
        cout << "NULL node in generateStatement!" << endl;
        return;
    }
    string treestr = svalResolve(tree);
    
    switch (tree->kind) {
        
    case CompoundK:
        emitComment("COMPOUND");
        if ( tree->isFuncCompound == false )
            symtable->enter("Compound" + tree->lineno);

        fOffset = tree->size;

        treeTraversal(tree->child[0]); // declarations, if any
        treeTraversal(tree->child[1]); // Expressions/Statements

        if ( tree->isFuncCompound == false )
            symtable->leave();
        emitComment("END COMPOUND");
        break;

    case ReturnK:
        emitComment("\tRETURN");
        if ( tree->child[0] != NULL )
        { // Check for return value
            generateExpression(tree->child[0], val);
            emitRM("LDA", ret, 0, val, "Save result into ret");
        }
        funRet(); // Return!
        break;

    case WhileK: // TODO: while implementation
        break;

    case IfK: // TODO: if implementation ... else implemenation?
        break;

    case ForeachK: // NOTE: We're not doing foreach this time
        break;
        
    case BreakK: // TODO: break implementation
        break; // heh

    default:
        cout << "Hit default in generateStatement switch(kind)! treestr: " << treestr << endl;
        break;
    }
}

// NOTE: some expressions will obey reg, but others may use val instead!
void codegenTM::generateExpression( TreeNode * node, int reg )
{
    TreeNode * tree = node;
    if(tree == NULL)
    {
        cout << "NULL node in generateExpression!" << endl;
        return;
    }        
    TreeNode * tmp = tree;
    TreeNode * lhs = tree->child[0];
    std::string lstr = svalResolve(lhs);
    TreeNode * rhs = tree->child[1];
    std::string rstr = svalResolve(rhs);
    string treestr = svalResolve(tree);
    
    switch (tree->kind) { 
    case AssignK: 
        switch(tree->token->bval) {
        case ASSIGN:
            if ( lhs->kind == IdK && lhs->child[0] != NULL ) //lhs->isArray )
            {
                generateExpression(lhs->child[0], val); // calculate the index
                emitRM("ST", val, fOffset, fp, "Save index of array " + lstr);
                generateExpression(rhs, reg); // // Get rvalue to assign, put in val (*assumption*)
                emitRM("LD", ac1, fOffset, fp, "Retrieve index of array " + lstr);
                storeArrayVar(lhs, val, ac1); // Assign rvalue to lvalue
            } else
            {
                generateExpression(rhs, reg); // // Get rvalue to assign, put in val (*assumption*)
                storeVar(lhs, reg); // Assign rvalue to lvalue
            }
            break;
        case INC:
            break;
            
        case DEC:
            break;
            
        case DIVASS:
            break;
            
        case MULASS:
            break;
            
        case SUBASS:
            break;
            
        case ADDASS:
            break;
            
        default:
            cout << "Hit default in generateExpression AssignK:bval. treestr: " << treestr << endl;
            break;
        }
        break;
        
    case OpK:
        switch (tree->token->bval) {
        case MULTIPLY:
            generateExpression(lhs, ac1);
            generateExpression(rhs, ac2);
            multiply(reg, ac1, ac2);
            break;
            
        case DIVIDE:
            generateExpression(lhs, ac1);
            generateExpression(rhs, ac2);
            divide(reg, ac1, ac2);
            break;
            
        case MODULUS: // a mod n
            generateExpression(lhs, ac1); // a -> ac1
            generateExpression(rhs, ac2); // n -> ac2
            mod(reg, ac1, ac2); // reg = ac1 mod ac2
            break;
            
        case PLUS:
            generateExpression(lhs, ac1);
            generateExpression(rhs, ac2);
            add(reg, ac1, ac2);
            break;
            
        case MINUS:
            generateExpression(lhs, ac1);
            generateExpression(rhs, ac2);
            subtract(reg, ac1, ac2);
            break;
            
        case OR:
            generateExpression(lhs, ac1);
            generateExpression(rhs, ac2);
            logicalOr(reg, ac1, ac2);
            break;
            
        case AND:
            generateExpression(lhs, ac1);
            generateExpression(rhs, ac2);
            logicalAnd(reg, ac1, ac2);
            break;
            
        case LESSEQ:
            break;
            
        case GRTEQ:
            break;
            
        case EQ:
            break;
            
        case NOTEQ:
            break;
            
        case LTHAN:
            break;
            
        case GTHAN:
            break;
            
        default:
            cout << "Hit default in generateExpression OpK:bval. treestr: " << treestr << endl;
            break;
        }
        break;
        
    case UnaryK:
        switch (tree->token->bval) {
        case MULTIPLY:
            //tmp = idResolve(lhs);
            // TODO: remove global/static guards
            if( lhs != NULL && !lhs->isStatic && lhs->offsetReg != global ) 
            {
                loadArrayAddr(lhs, ac2);
                emitRM("LD", reg, 1, ac2, "Load size of array " + lstr); // +1 to get size                
            }
            break;
            
        case NOT: // Logical NOT
            generateExpression(lhs, reg);
            logicalNot(reg, reg); // reg = !lhs
            break;
            
        case QUESTION: // Random from 0 to n
            generateExpression(lhs, reg);
            emitRO("RND", reg, reg, 0, "Op ?");
            break;
            
        case MINUS: // Op unary -
            generateExpression(lhs, reg);
            emitRM("LDC", ac3, 0, 0, "Load 0"); // Use ac3 so we don't step on anyone's toes
            subtract(reg, ac3, reg); // reg = 0 - lhs
            break;
            
        default:
            cout << "Hit default in generateExpression UnaryK:bval. treestr: " << treestr << endl;
            break;
        } // end bval switch
        break;

    case IdK: // TODO: reevaluate this case's logic
        //tmp = idResolve(tree);
        //emitComment("EXPRESSION");
        if(lhs != NULL ) // lhs->isArray
        {
           generateExpression(lhs, reg); // calculate the index
           loadArrayVar(tree, reg, reg);
        }
        else
        {
            loadVar(tree, reg);
        }        
        break;

    case ConstK:
        //emitComment("EXPRESSION");
        // His comment names are really strange(i'm just matching them for diff purposes)
        // 'integer', 'Boolean', 'char'
        // Assuming the tokens are not NULL, since we've error checked and its all valid C- code...
        if ( tree->nodetype == Integer )
        {
            emitRM("LDC", reg, tree->token->ivalue, 0, "Load integer constant");
        }
        else if ( tree->nodetype == Boolean )
        {
            emitRM("LDC",reg, tree->token->ivalue, 0, "Load Boolean constant");
        }
        else if( tree->nodetype == Character )
        {
            emitRM("LDC",reg, tree->token->cvalue, 0, "Load char constant");
        }
        else
            cout << "Constant isn't Integer, Boolean, or Character." << endl;
        break;

    case CallK:
        emitComment("EXPRESSION");
        emitComment("\t\tBegin call to " + treestr);
        tmp = lookup(treestr);
        if(tmp == NULL)
        {
            cout << "Couldn't find function in table" << endl;
            break;
        }
        
        emitRM("ST", fp, fOffset, fp, "Store current frame pointer");
        loadParams(tree->child[0], -1 + fOffset); // Load parameters into memory
        
        emitComment("\t\tJump to " + treestr);
        emitRM("LDA", fp, fOffset, fp, "Load address of new frame");
        emitRM("LDA", val, 1, pc, "Save return address");
        emitRMAbs("LDA", pc, tmp->loc, "CALL " + treestr );
        emitRM("LDA", val, 0, ret, "Save function result");
        emitComment("\t\tEnd call to " + treestr);
        break;

    default:
        cout << "Hit default in generateExpression switch(kind)! treestr: " << treestr << endl;
        break;
    }
}



void codegenTM::loadParams( TreeNode * tree, int off )
{
    int siblingCount = 1;
    
    while(tree != NULL)
    {
        emitComment("\t\t\tLoad param " + to_string(siblingCount) );
        generateExpression(tree, val);
        emitRM("ST", val, off - siblingCount, fp, "Store paramater " + to_string(siblingCount) );
        tree = tree->sibling;
        siblingCount++;
    }
}

void codegenTM::storeVar(TreeNode* var, int reg) // ST reg->var
{
    TreeNode * tmp = idResolve(var);
    if ( tmp == NULL )
    {
        cout << "tmp is null in storeVar" << endl;
        return;
    }
    if ( tmp->offsetReg == local && !tmp->isStatic )
    {
        emitRM("ST", reg, tmp->location, fp, "Store Local variable " + svalResolve(tmp));
    }
    else if (tmp->offsetReg == local && tmp->isStatic )
    {
        emitRM("ST", reg, tmp->location, gp, "Store LocalStatic variable " + svalResolve(tmp));
    }
    else if (tmp->offsetReg == global)
    {
        emitRM("ST", reg, tmp->location, gp, "Store Global variable " + svalResolve(tmp));
    }
    else
    {
        cout << "Fell off if-else chain in storeVar. svalue: " << svalResolve(tmp) << endl;
    }
}

// USES: ac3
void codegenTM::storeArrayVar(TreeNode* arr, int reg, int index)
{
    TreeNode * tmp = idResolve(arr);
    if(tmp == NULL)
        return;
        
    loadArrayAddr(tmp, ac3);
    emitRO("SUB", ac3, ac3, index, "Calculate offset using index");
    
    if ( tmp->offsetReg == local && !tmp->isStatic )
    {
        emitRM("ST", reg, 0, ac3, "Store reg(" + to_string(reg) + ") into local array " + svalResolve(tmp));
    } 
    else if( tmp->offsetReg == local && tmp->isStatic)
    {
        emitRM("ST", reg, 0, ac3, "Store reg(" + to_string(reg) + ") into LocalStatic array " + svalResolve(tmp));
    }
    else if ( tmp->offsetReg == global )
    {
        emitRM("ST", reg, 0, ac3, "Store reg(" + to_string(reg) + ") into global array " + svalResolve(tmp));
    }
    else
    {
        cout << "Fell off if-else chain in storeArrayVar. svalue: " << svalResolve(tmp) << endl;
    }    
}


// LD val<-var
// If array, calcuate index, LD val<-array[index]
void codegenTM::loadVar(TreeNode* var, int reg )
{
    TreeNode * tmp = idResolve(var);
    if(tmp == NULL)
        return;
    
    if ( tmp->offsetReg == local && !tmp->isStatic )
    {
        emitRM("LD", reg, tmp->location, fp, "Load local variable " + svalResolve(tmp));
    }
    else if( tmp->offsetReg == local && tmp->isStatic)
    {
        emitRM("LD", reg, tmp->location, gp, "Load LocalStatic variable " + svalResolve(tmp));
    }
    else if( tmp->offsetReg == global )
    {
        emitRM("LD", reg, tmp->location, gp, "Load Global variable " + svalResolve(tmp));
    }
    else
    {
        cout << "Fell off if-else chain in storeVar. svalue: " << svalResolve(tmp) << endl;
    }
}

// USES: ac3
void codegenTM::loadArrayVar(TreeNode* arr, int reg, int index)
{
    TreeNode * tmp = idResolve(arr);
    if(tmp == NULL)
        return;
    
    loadArrayAddr(tmp, ac3);
    emitRO("SUB", ac3, ac3, index, "Calculate offset using index"); // assumes index is positive
    
    if ( tmp->offsetReg == local && !tmp->isStatic )
    {
        emitRM("LD", reg, 0, ac3, "Load local array variable " + svalResolve(tmp));
    }
    else if (tmp->offsetReg == local && tmp->isStatic )
    {      
        emitRM("LD", reg, 0, ac3, "Load LocalStatic array variable " + svalResolve(tmp));
    }
    else if(tmp->offsetReg == global )
    {
        emitRM("LD", reg, 0, ac3, "Load global array variable " + svalResolve(tmp));
    }
    else
    {
        cout << "Fell off if-else chain in loadArrayVar. svalue: " << svalResolve(tmp) << endl;
    }    
}

// LDA reg<-arr
void codegenTM::loadArrayAddr( TreeNode* arr, int reg )
{
    TreeNode * tmp = idResolve(arr);
    if(tmp == NULL)
        return;

    if ( tmp->offsetReg == local && !tmp->isStatic )
    {
        emitRM("LDA", reg, tmp->location, fp, "Load local array address of  " + svalResolve(tmp));
    }
    else if (tmp->offsetReg == local && tmp->isStatic)
    {
        emitRM("LDA", reg, tmp->location, gp, "Load LocalStatic array address of " + svalResolve(tmp)); 
    }
    else if( tmp->offsetReg == global)
    {
        emitRM("LDA", reg, tmp->location, gp, "Load global array address of " + svalResolve(tmp)); 
    }
    else
    {
        cout << "Fell off if-else chain in loadArrayAddr. svalue: " << svalResolve(tmp) << endl;
    }
}



/* Macros */

void codegenTM::add( int res, int reg1, int reg2 )
{
    emitRO("ADD", res, reg1, reg2, "Op +" );
}

void codegenTM::subtract( int res, int reg1, int reg2 )
{
    emitRO("SUB", res, reg1, reg2, "Op -" );
}

void codegenTM::multiply( int res, int reg1, int reg2 )
{
    emitRO("MUL", res, reg1, reg2, "Op *" );
}

void codegenTM::divide( int res, int reg1, int reg2 )
{
    emitRO("DIV", res, reg1, reg2, "Op /" );
}

// TODO: ensure proper implementation of logical and vs. bitwise operators
void codegenTM::logicalAnd(int res, int reg1, int reg2)
{
    emitRO("AND", res, reg1, reg2, "Op AND" );
}

void codegenTM::logicalOr(int res, int reg1, int reg2)
{
    emitRO("OR", res, reg1, reg2, "Op OR" );    
}

void codegenTM::logicalNot(int res, int reg1)
{
    emitRO("NOT", res, reg1, 0, "Op NOT" );
}

void codegenTM::mod(int res, int reg1, int reg2)
{
    // r = a - (n * trunc(a/n))
    emitComment("\t\tModulus");
    divide( res, reg1, reg2);   // res = trunc(a/n)
    multiply( res, reg2, res ); // res = n * res
    subtract( res, reg1, res);  // res = a - res
}



void codegenTM::standardRet() // comment, zero out return, funRet
{
    emitComment("\tFailsafe return");
    emitRM("LDC", ret, 0, 0, "Set return to 0");
    funRet();
}

void codegenTM::funRet() // Load ret addr, adjust FP, return
{
    emitRM("LD", val, -1, fp, "Load return address");
    emitRM("LD", fp, 0, fp, "Adjust fp");
    emitRM("LDA", pc, 0, val, "Return");
}

void codegenTM::IOroutines(IO io)
{
    switch (io) {
        case Nopeput: // It's not a IO routine
            break;

        case InputI:
            emitRO("IN", ret, 2, 2, "Grab int input");
            break;

        case OutputI:
            emitRM("LD", val, -2, fp, "Load parameter");
            emitRO("OUT", val, 3, 3, "Output integer");
            emitRM("LDC", ret, 0, ac1, "Set return to 0"); // ac3 is zero at this point, so we can do this
            break;

        case InputB:
            emitRO("INB", ret, 2, 2, "Grab bool input");
            break;

        case OutputB:
            emitRM("LD", val, -2, fp, "Load parameter");
            emitRO("OUTB", val, 3, 3, "Output bool");
            emitRM("LDC", ret, 0, ac1, "Set return to 0");
            break;

        case InputC:
            emitRO("INC", ret, 2, 2, "Grab char input");
            break;

        case OutputC:
            emitRM("LD", val, -2, fp, "Load parameter");
            emitRO("OUTC", val, 3, 3, "Output char");
            emitRM("LDC", ret, 0, ac1, "Set return to 0");
            break;

        case OutNL:
            emitRO("OUTNL", val, 3, 3, "Output a newline");
            break;

        default:
            cout << "Hit default in IOroutines switch(isIO)!" << endl;
            break;
    }    
}

/* Helper functions */

TreeNode* codegenTM::idResolve(TreeNode* node)
{
    //return node;
    TreeNode * tmp = NULL;
    if(node == NULL)
    {
        cout << "NULL treenode passed to idResolve!" << endl;
        return node;        
    }
    else if ( node->kind != IdK )  
    {
        return node;
    }
    else 
    {
        //tmp = (TreeNode *) symtable->lookup(svalResolve(node));
        //tmp = (TreeNode *) symtable->lookupGlobal(treestr);
        tmp = lookup(svalResolve(node));
        if ( tmp == NULL )
        {
            cout << "NULL symbolTable lookup on " << svalResolve(node) << endl;
        }
        return tmp;
    }    
}

TreeNode * codegenTM::lookup( string s )
{
    return (TreeNode *)symtable->lookup(s);
}

/* Helper procedures / Boilerplate stuff I'm not going to touch much */

string codegenTM::timestamp()
{
    // Getting current local time because ADHD
    // Source: http://www.cplusplus.com/reference/ctime/localtime/
    time_t rawtime;
    struct tm * timeinfo;
    time (&rawtime);
    timeinfo = localtime (&rawtime);
    string ts = asctime(timeinfo);
    
    return ts;
}

void codegenTM::buildTable()
{
    symtable = new SymbolTable();
    TreeNode * temp = aTree;
    tableRecurse(temp);
}

void codegenTM::tableRecurse(TreeNode * node)
{
    std::string str;
    TreeNode * tmp;
    
    while(node != NULL)
    {
        str = svalResolve(node);
        switch(node->kind)
        {
        case VarK:
        case ParamK:
            symtable->insert(str, node);
            break;
            
        case FunK:
            symtable->insert(str, node);
            symtable->enter("Function " + str);
            for(int i = 0; i < 3; i++)
                tableRecurse(node->child[i]);
            symtable->leave();
            break;
            
        case CompoundK:
            symtable->enter("Compound" + node->lineno);
            for(int i = 0; i < 3; i++)
                tableRecurse(node->child[i]);            
            symtable->leave();
            break;
            
        case IdK:
            tmp = (TreeNode *) symtable->lookup(str);
            copyAnnotations(tmp, node); // tmp -> node            
            break;
            
        default: // TODO: is this where this should be?
            for (int i = 0; i < 3; i++)
                tableRecurse(node->child[i]);
            break;
        }
        node = node->sibling;
    }    
}


// TODO: This should be a prototype for most of my code lmao...how do in c++ tho?
void codegenTM::loopSiblings( NodeKind nk, TreeNode * node )
{
    TreeNode * tree;
    tree = node;
    int siblingCount = 1;
    
    while(tree != NULL)
    {
        switch(nk) {
        case DeclK:
            generateDeclaration(tree);
            break;
        case StmtK:
            generateStatement(tree);
            break;
        case ExpK:
            generateExpression(tree, val);
            break;
        default:
            cout << "Hit default in loopSiblings switch(nk)!" << endl;
            break;
        }
        tree = tree->sibling;
        siblingCount++;
    }
}


void codegenTM::treeTraversal( TreeNode * node )
{
    TreeNode * tree = node;
    
    while( tree != NULL )
    {
        switch (tree->nodekind) {
            case DeclK:
                generateDeclaration(tree);
                break;
            case StmtK:
                generateStatement(tree);
                break;
            case ExpK:
                generateExpression(tree, val);
                break;
            default:
                cout << "Hit default in treeTraversal switch(nodekind)!" << endl;
                break;
        }
        tree = tree->sibling;
    }
}


/*** Emit stuff ***/

// Prints a comment line with comment s in the code file
void codegenTM::emitComment( string s )
{
    if(emitToFile)
        outfile << "* " << s << endl;
    else
        cout << "* " << s << endl;
}

/* Procedure emitRO emits a register-only
 * TM instruction
 * op = the opcode
 * r = target register
 * s = 1st source register
 * t = 2nd source register
 * c = a comment to be printed
 */
void codegenTM::emitRO( const char *op, int r, int s, int t, string c )
{ 
    if(emitToFile)
    {
    outfile << setw(3) << emitLoc++ 
            << ":  " << setw(5) << op 
            << "  " << r << "," << s << "," << t
            << " \t" << c << endl; /* append comment */
    }
    else
    {
    cout << setw(3) << emitLoc++ 
            << ":  " << setw(5) << op 
            << "  " << r << "," << s << "," << t
            << " \t" << c << endl; /* append comment */        
    }

    if (highEmitLoc < emitLoc) 
        highEmitLoc = emitLoc ;
    
} /* emitRO */

/* Procedure emitRM emits a register-to-memory
 * TM instruction
 * op = the opcode
 * r = target register
 * d = the offset
 * s = the base register
 * c = a comment to be printed
 */
void codegenTM::emitRM( const char * op, int r, int d, int s, string c )
{ 
    if(emitToFile)
    {
    outfile << setw(3) << emitLoc++ 
            << ":  " << setw(5) << op 
            << "  " << r << "," << d << "(" << s << ")"
            << " \t" << c << endl; /* append comment */
    }
    else
    {
    cout << setw(3) << emitLoc++ 
            << ":  " << setw(5) << op 
            << "  " << r << "," << d << "(" << s << ")"
            << " \t" << c << endl; /* append comment */        
    }
    
    if (highEmitLoc < emitLoc)  
        highEmitLoc = emitLoc ;
    
} /* emitRM */

/* Function emitSkip skips "howMany" code
 * locations for later backpatch. It also
 * returns the current code position
 */
int codegenTM::emitSkip( int howMany )
{  
    int i = emitLoc;
    emitLoc += howMany ;
    if (highEmitLoc < emitLoc)  
        highEmitLoc = emitLoc ;
    return i;
    
} /* emitSkip */

/* Procedure emitBackup backs up to 
 * loc = a previously skipped location
 */
void codegenTM::emitBackup( int loc )
{ 
    if (loc > highEmitLoc) 
        emitComment("BUG in emitBackup");
    
    emitLoc = loc ;
    
} /* emitBackup */

/* Procedure emitRestore restores the current 
 * code position to the highest previously
 * unemitted position
 */
void codegenTM::emitRestore()
{ 
    emitLoc = highEmitLoc;
}

/* Procedure emitRM_Abs converts an absolute reference 
 * to a pc-relative reference when emitting a
 * register-to-memory TM instruction
 * op = the opcode
 * r = target register
 * a = the absolute location in memory
 * c = a comment to be printed
 */
void codegenTM::emitRMAbs( const char *op, int r, int a, string c )
{ 
    if(emitToFile)
    {
    outfile << setw(3) << emitLoc 
            << ":  " << setw(5) << op 
            << "  " << r << "," << a - (emitLoc + 1) << "(" << pc << ")"
            << " \t" << c << endl; /* append comment */
    }
    else
    {
    cout << setw(3) << emitLoc 
            << ":  " << setw(5) << op 
            << "  " << r << "," << a - (emitLoc + 1) << "(" << pc << ")"
            << " \t" << c << endl; /* append comment */        
    }
    emitLoc++;
    
    if (highEmitLoc < emitLoc) 
        highEmitLoc = emitLoc ;
    
} /* emitRMAbs */


