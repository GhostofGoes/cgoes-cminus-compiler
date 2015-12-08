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
// TODO: fix this deep logic issue... 'numChildren'

/* Constructors/Destructors */
codegenTM::codegenTM ( TreeNode * t, SymbolTable * s, int g, string of, string inf) 
{ 
    symtable = s;
    aTree = t;
    
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
}


/* Primary public functions */

void codegenTM::generateCode()
{
    int start = 0;
    
    /* Header comments*/
    if(emitToFile)
    {
        outfile.open(outfilename, ofstream::out);
        emitComment( outfilename );
    }  
    emitComment( "Cgoes Cminus Compiler (CCC)" );
    emitComment( "Author: Christopher Goes");
    emitComment( "File compiled: " + infilename );
    emitComment( "Generated at: " + timestamp() );
    
    
    /* Instruction generation */
    start = emitSkip(1); // so we can have our jump to init
    
    treeTraversal(aTree); // Main code generation
    
    emitBackup(start); // Go back to the beginnnnning of time
    emitRMAbs( "LDA", pc, highEmitLoc, "Jump to init");
    emitRestore(); // Pow! We're back to the present!
    
    initSetup(); // Do our init jam
}


/* Initialization */

void codegenTM::initSetup()
{
    // TODO: keep track of init start
    emitComment("INIT");
    emitRM("LD", 0, 0, 0, "Set global pointer");
    
    //initGlobals(); not doing this quite yet...
    
    emitRM("LDA", fp, gOffset, gp, "Set frame to end of globals");
    emitRM("ST", fp, 0, fp, "Store old frame pointer");
    emitRM("LDA", val, 1, pc, "Save return address");
    emitRM("LDC", pc, mainLoc, pc, "Jump to main"); // cheap jump to main
    emitRO("HALT", 0, 0, 0, "Fin."); 
    emitComment("END INIT");
}

void codegenTM::initGlobals()
{
    emitComment("INIT GLOBALS/STATICS");
    emitComment("END INIT GLOBALS/STATICS");
}


/* Generate nodekinds */

void codegenTM::generateDeclaration(TreeNode* node)
{
    TreeNode * tree = node;
    if(tree == NULL)
    {
        cerr << "NULL node in generateDeclaration!" << endl;
        return;
    }
    string treestr = svalResolve(tree);
    
    switch(tree->kind) {
        case VarK: // TODO: VARIABLES!
            if(tree->isArray) // Array size loading
            {
                if(tree->offsetReg == local && !tree->isStatic)
                {
                    emitRM("LDC", val, tree->arraySize, 0, "Load size of array " + treestr);
                    emitRM("ST", val, tree->location + 1, fp, "Store size of local array " + treestr);
                }
                else
                {
                    //emitRM("LDC", val, tree->arraySize, 0, "Load size of array " + treestr);
                    //emitRM("ST", val, tree->location + 1, gp, "Store size of global array " + treestr);
                }
            }
            break;
            
        case FunK: // Function declaration
            emitComment("FUNCTION " + treestr);
            symtable->enter("Function " + treestr);
            if(treestr == "main") // Only a few functions to check, so this is fine
                mainLoc = emitSkip(0);
            // TODO: this is where i can nab the function location
            tree->loc = emitSkip(0);
            emitRM("ST", val, -1, fp, "Store return address");
            
            if(tree->isIO != Nopeput)
            {
                IOroutines(tree->isIO);
                funRet();
            }
            else
            {
                loopSiblings(DeclK, tree->child[0]); // Paramaters
                generateStatement(tree->child[1]); // *magical* Compound
                standardRet(); // "our last resort..."
            }
            symtable->leave();
            emitComment("END FUNCTION " + treestr);
            break;
        default:
            cerr << "Hit default in generateDeclaration switch(kind)! treestr: " << treestr << endl;
            break;
    }
}

void codegenTM::generateStatement( TreeNode * node )
{
    TreeNode * tree = node;
    if(tree == NULL)
    {
        cerr << "NULL node in generateStatement!" << endl;
        return;
    }
    string treestr = svalResolve(tree);
    
    switch(tree->kind) {
        case CompoundK: // TODO: function body!
            emitComment("BEGIN COMPOUND");
            if(tree->isFuncCompound == false)
                symtable->enter("Compound" + tree->lineno);
            fOffset = tree->size;
            
            if(tree->numChildren == 1) // Just expressions
            { 
                treeTraversal(tree->child[0]);
            }
            else if( tree->numChildren == 2) // Declarations then expressions
            {
                loopSiblings(DeclK, tree->child[0]);
                treeTraversal(tree->child[1]);
            }
            if(tree->isFuncCompound == false)
                symtable->leave();
            emitComment("END COMPOUND");
            break;
            
        case ReturnK: // TODO: function returns!
            emitComment("\tRETURN");
            if(tree->child[0] != NULL) { // Check for return value
                generateExpression(tree->child[0]);
                emitRM("LDA", ret, 0, val, "Save result into ret");
            }
            funRet(); // Return!
            break;
            
        default:
            cerr << "Hit default in generateStatement switch(kind)! treestr: " << treestr << endl;            
            break;
    }
}

void codegenTM::generateExpression( TreeNode * node )
{
    TreeNode * tree = node;
    if(tree == NULL)
    {
        cerr << "NULL node in generateExpression!" << endl;
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
        switch (tree->token->bval) {
        case ASSIGN:
            //tmp = idResolve(lhs);
            if ( tmp != NULL && tmp->isArray )
            {
                generateExpression(lhs->child[0]); // calculate the index
                emitRM("ST", val, fOffset, fp, "Save index of array " + lstr);
                generateExpression(rhs); // // Get rvalue to assign, put in val (*assumption*)
                emitRM("LD", ac1, fOffset, fp, "Retrieve index of array " + lstr);
                storeArrayVar(tmp, val, ac1); // Assign rvalue to lvalue
            } else
            {
                generateExpression(rhs); // // Get rvalue to assign, put in val (*assumption*)
                storeVar(lhs, val); // Assign rvalue to lvalue
            }
            break;
        default:
            break;   
        } // end bval switch
        break;
        
    case UnaryK:
        emitComment(" UNARY EXPRESSION");
        switch (tree->token->bval) {
        case MULTIPLY:
            //tmp = idResolve(lhs);
            if( tmp != NULL && !tmp->isStatic && tmp->offsetReg != global ) // TODO: remove global/static
            {
                loadArrayAddr(tmp, ac2);
                emitRM("LD", val, 1, ac2, "Load size of array " + lstr); // +1 to get size                
            }
            break;
        default:
            break;
        } // end bval switch
        break;

    case IdK:
        //tmp = idResolve(tree);

        if(tmp->isArray )
        {
           generateExpression(lhs); // calculate the index
           loadArrayVar(tmp, val, val);
        }
        else
        {
            loadVar(tmp, val);
        }        
        break;

    case ConstK:
        if ( tree->nodetype == Integer )
            emitRM("LDC", val, tree->token->ivalue, 0, "Load integer constant");
        else
            cerr << "Non-Integer constant" << endl;
        break;

    case CallK:
        emitComment(" EXPRESSION");
        emitComment("\tBEGIN Call to " + treestr);
        tmp = lookupGlobal(treestr);
        if(tmp == NULL)
        {
            cerr << "Couldn't find function in global table" << endl;
            break;
        }
        // Store old frame pointer (negative conversion hack for now))
        emitRM("ST", fp, fOffset, fp, "Store current frame pointer");
        // Load parameters into memory
        //tOffset = -1 * (tmp->size); 
        loadParams(tree->child[0], -1 + fOffset);
        emitComment("\t\tJumping to " + treestr);
        // load address of new frame into fp
        emitRM("LDA", fp, fOffset, fp, "Load address of new frame");
        emitRM("LDA", val, 1, pc, "Save return address");
        emitRM("LDC", pc, -1 * tmp->loc, 0, "Call " + treestr); // TODO: backpatch
        emitRM("LDA", val, 0, ret, "Save function result");
        emitComment("\tEND CALL to " + treestr);
        break;

    default:
        cerr << "Hit default in generateExpression switch(kind)! treestr: " << treestr << endl;
        break;
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
            generateExpression(tree);
            break;
        default:
            cerr << "Hit default in loopSiblings switch(nk)!" << endl;
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
                generateExpression(tree);
                break;
            default:
                cerr << "Hit default in treeTraversal switch(nodekind)!" << endl;
                break;
        }
        tree = tree->sibling;
    }
}

void codegenTM::loadParams( TreeNode * node, int off )
{
    TreeNode * tree = node;
    TreeNode * tmp;
    int siblingCount = 1;
    
    while(tree != NULL)
    {
        //tmp = lookupGlobal(svalResolve(tree));
        emitComment("\t\tLoad param " + to_string(siblingCount) );
        generateExpression(tree); // TODO: resolve ID after recursing on chldren? or even resolve?
        emitRM("ST", val, off - siblingCount, fp, "Store paramater " + to_string(siblingCount) );
        tree = tree->sibling;
        siblingCount++;
    }
}


// ST reg->var
void codegenTM::storeVar(TreeNode* var, int reg)
{
    //TreeNode * tmp = idResolve(var);
    TreeNode * tmp = var;
    if ( tmp == NULL )
        return;

    if ( tmp->offsetReg == local && !tmp->isStatic )
    {
        emitRM("ST", reg, tmp->location, fp, "Store Local variable " + svalResolve(tmp));
    }
    else if (tmp->offsetReg == local && tmp->isStatic )
    {
        emitRM("ST", reg, tmp->location, gp, "Store LocalStatic variable " + svalResolve(tmp));  
    }
    else
    {
        emitRM("ST", reg, tmp->location, gp, "Store Global variable " + svalResolve(tmp));
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
    else
    {
        emitRM("ST", reg, 0, ac3, "Store reg(" + to_string(reg) + ") into global array " + svalResolve(tmp));
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
    else
    {
        emitRM("LD", reg, tmp->location, gp, "Load Global variable " + svalResolve(tmp));
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
    else
    {      
        emitRM("LD", reg, 0, ac3, "Load global array variable " + svalResolve(tmp));
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
    else
    {
        emitRM("LDA", reg, tmp->location, gp, "Load 'global' array address of " + svalResolve(tmp)); 
    }
}


/* Helper functions */

TreeNode* codegenTM::idResolve(TreeNode* node)
{
    return node;
    
    TreeNode * tmp = NULL;
    if(node == NULL)
    {
        //cerr << "NULL treenode passed to idResolve!" << endl;
        return node;        
    }
    else if ( node->kind != IdK )  
    {
        return node;
    }
    else {
        tmp = lookupLocal(svalResolve(node));
        if ( tmp == NULL )
        {
            tmp = lookupGlobal(svalResolve(node));
            //cerr << "NULL lookup in idResolve!" << endl;
            return tmp;
        }
        else
            return tmp;
    }    
}


TreeNode* codegenTM::lookupLocal(std::string treestr)
{
    TreeNode * tmp = (TreeNode *) symtable->lookup(treestr);
    if ( tmp == NULL )
    {
        cerr << "NULL symbolTable lookup on " << treestr << endl;
    }    
    return tmp;
}

TreeNode* codegenTM::lookupGlobal(std::string treestr)
{
    TreeNode * tmp = (TreeNode *) symtable->lookupGlobal(treestr);
    if ( tmp == NULL )
    {
        cerr << "NULL GLOBAL symbolTable lookup on " << treestr << endl;
    }    
    return tmp;
}


void codegenTM::standardRet() // comment, zero out return, funRet
{
    emitComment("\tFailsafe return");
    emitRM("LDC", ret, 0, 0, "Zero out return value");
    funRet();
}

void codegenTM::funRet() // Load ret addr, adjust FP, return
{
    emitRM("LD", val, -1, fp, "Load return address");
    emitRM("LD", fp, 0, fp, "Adjust frame pointer");
    emitRM("LDA", pc, 0, val, "Return!");
}

void codegenTM::IOroutines(IO io)
{
    switch (io) {
        case Nopeput:
            break;

        case InputI:
            emitRO("IN", ret, 2, 2, "Input integer");
            break;

        case OutputI:
            emitRM("LD", val, -2, fp, "Load param");
            emitRO("OUT", val, 3, 3, "Output integer");
            emitRM("LDC", ret, 0, ac1, "Set return to 0"); // ac3 is zero at this point, so we can do this
            break;

        case InputB:
            emitRO("INB", ret, 2, 2, "Input boolean");
            break;

        case OutputB:
            emitRM("LD", val, -2, fp, "Load param");
            emitRO("OUTB", val, 3, 3, "Output boolean");
            emitRM("LDC", ret, 0, ac1, "Set return to 0");
            break;

        case InputC:
            emitRO("INC", ret, 2, 2, "Input character");
            break;

        case OutputC:
            emitRM("LD", val, -2, fp, "Load param");
            emitRO("OUTC", val, 3, 3, "Output character");
            emitRM("LDC", ret, 0, ac1, "Set return to 0");
            break;

        case OutNL:
            emitRO("OUTNL", val, 3, 3, "Output newline");
            break;

        default:
            cerr << "Hit default in IOroutines switch(isIO)!" << endl;
            break;
    }    
}

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


