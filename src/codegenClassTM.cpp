/* 
 * File:   codegenClassTM.cpp
 * Author: tehlizard
 * 
 * Created on December 4, 2015, 12:40 PM
 */

#include "codegenClassTM.h"
#include "cminus.h"
#include "types.h"
//#include "emit.h"
#include <iostream>
#include <cstdlib>
#include <string>
#include <fstream>
#include <iomanip>
#include <time.h>

using namespace std;

/* Constructors/Destructors */
codegenTM::codegenTM ( TreeNode * t, SymbolTable * s, int g, string of) 
{ 
    symtable = s;
    aTree = t;
    
    outfilename = of;
    //infilename = input_filename;
    
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
    //int currLoc = -99;
    
    /* Header comments*/
    if(emitToFile)
    {
        outfile.open(outfilename, ofstream::out);
        emitComment( outfilename );
    }  
    emitComment( "Cgoes Cminus Compiler (CCC)" );
    emitComment( "Author: Christopher Goes");
    //emitComment( "File compiled: " + infilename );
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
    saveRetA();
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
    TreeNode * tree;
    
    if(node != NULL)
        tree = node;
    else
    {
        cerr << "NULL node in generateDeclaration!" << endl;
        return;
    }
    
    TreeNode * p1, * p2, * p3;
    int savedLoc1,savedLoc2,currentLoc;
    int loc;
    
    string treestr = svalResolve(tree);
    
    switch(tree->kind) {
        case VarK:
            // TODO: VARIABLES!
            break;
            
        case FunK:
            emitComment("FUNCTION " + treestr);
            // We're not doing a lot of functions, so this is fine
            if(treestr == "main") 
                mainLoc = emitSkip(0);
            emitRM("ST", val, -1, fp, "Store return address");
            
            if(tree->isIO != Nopeput)
            {
                IOroutines(tree->isIO);
                funRet();
            }
            else
            {
                // TODO: any more function code?
                generateDeclaration(tree->child[0]); // Paramaters
                generateStatement(tree->child[1]); // Compound
                standardRet();
            }
            
            emitComment("END FUNCTION " + treestr);
            break;
            
        case ParamK:
            // TODO: PARAMATERS!
            break;
            
        default:
            cerr << "Hit default in generateDeclaration switch(kind)!" << endl;
            break;
    }
}

void codegenTM::generateStatement( TreeNode * node )
{
    TreeNode * tree;
    
    if(node != NULL)
        tree = node;
    else
    {
        cerr << "NULL node in generateStatement!" << endl;
        return;
    }
    
    TreeNode * p1, * p2, * p3;
    int savedLoc1,savedLoc2,currentLoc;
    int loc;
    
    
    switch(tree->kind) {
        case IfK:
            break;
            
        case WhileK:
            break;
            
        case ForeachK:
            break;
            
        case CompoundK:
            emitComment("COMPOUND");
            // TODO: function body!
            emitComment("END COMPOUND");
            break;
            
        case ReturnK: // TODO: function returns!
            emitComment("\tReturn definition");
            
            // Check for return value
            if(tree->child[0] != NULL) {
                generateExpression(tree->child[0]);
                emitRM("LDA", ret, 0, val, "Save expression result into ret");
            }
            
            // Return!
            funRet();
            break;
            
        case BreakK:
            break;
            
        default:
            cerr << "Hit default in generateStatement switch(kind)!" << endl;            
            break;
    }
}

void codegenTM::generateExpression( TreeNode * node )
{
    TreeNode * tree;
    
    if(node != NULL)
        tree = node;
    else
    {
        cerr << "NULL node in generateExpression!" << endl;
        return;
    }    
    
    int loc;
    TreeNode * p1, * p2;
    string treestr = svalResolve(tree);
    
    switch(tree->kind) { 
        case AssignK:
            // TODO: variable assignment
            break;
            
        case OpK:
            
            switch(tree->token->bval) {
                default:
                    break;
            }
            break;   
            
        case UnaryK:
            
            switch(tree->token->bval) {
                case MULTIPLY:
                    // TODO: unary *
                    break;
                    
                case NOT:
                    break;
                    
                case QUESTION:
                    break;
                    
                case MINUS:
                    break;
                    
                default:
                    break;
            }
            break;
            
        case IdK: // TODO: variable substitution, params
            break;
            
        case ConstK:
            break;
            
        case CallK: // TODO: function calls
            emitComment("\tCALL " + treestr);
            // Store old frame pointer
            // Load paramaters
                // load variable
                // store parameter for use by callee
            // load address of new frame into fp
            saveRetA(); // save return address
            // call the function
            emitRM("LDA", val, 0, ret, "Save function result in val");
            emitComment("\tEND CALL " + treestr);
            break; 
            
        default:            
            cerr << "Hit default in generateExpression switch(kind)!" << endl;
            break;
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


/* Helper functions */

void codegenTM::saveRetA() // save return addr
{
    emitRM("LDA", 3, 1, pc, "Save return address");
}

void codegenTM::standardRet() // comment, zero out return, funRet
{
    emitComment("\tFailsafe return");
    emitRM("LDC", 2, 0, 0, "Zero out return value");
    funRet();

}

void codegenTM::funRet() // Load ret addr, adjust FP, return
{
    emitRM("LD", 3, -1, fp, "Load return address");
    emitRM("LD", 1, 0, fp, "Adjust frame pointer");
    emitRM("LDA", 7, 0, val, "Return!");
}

void codegenTM::IOroutines(IO io)
{
    switch (io) {
        case Nopeput:
            break;

        case InputI:
            emitRO("IN", 2, 2, 2, "Input integer");
            break;

        case OutputI:
            emitRM("LD", 3, -2, fp, "Load param");
            emitRO("OUT", 3, 3, 3, "Output integer");
            emitRM("LDC", 2, 0, ac1, "Set return to 0"); // ac3 is zero at this point, so we can do this
            break;

        case InputB:
            emitRO("INB", 2, 2, 2, "Input boolean");
            break;

        case OutputB:
            emitRM("LD", 3, -2, fp, "Load param");
            emitRO("OUTB", 3, 3, 3, "Output boolean");
            emitRM("LDC", 2, 0, ac1, "Set return to 0");
            break;

        case InputC:
            emitRO("INC", 2, 2, 2, "Input character");
            break;

        case OutputC:
            emitRM("LD", 3, -2, fp, "Load param");
            emitRO("OUTC", 3, 3, 3, "Output character");
            emitRM("LDC", 2, 0, ac1, "Set return to 0");
            break;

        case OutNL:
            emitRO("OUTNL", 3, 3, 3, "Output newline");
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
    //printf("%3d:  %5s  %d,%d,%d ",emitLoc++,op,r,s,t);
    //printf("\t%s",c) ;
    //printf("\n") ;
    
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
    //printf("%3d:  %5s  %d,%d(%d) ",emitLoc++,op,r,d,s);
    //printf("\t%s",c) ;
    //printf("\n") ;
    
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
    //printf("%3d:  %5s  %d,%d(%d) ", emitLoc,op,r,a-(emitLoc+1),pc);
    //++emitLoc ;
    //printf("\t%s",c) ;
    //printf("\n") ;
    
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


