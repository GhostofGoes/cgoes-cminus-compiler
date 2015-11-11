
// cminus.cpp
// Author:  Christopher Goes     
// Contact: goes8945@vandals.uidaho.edu
// Github: https://github.com/GhostofGoes/cgoes-cs445.git
/* License: GPLv3
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/
// TODO: add comments attributing heckendorn's code to him
// TODO: ensure licencing for h's code is gucci

// C++ Libraries
#include <iostream>
#include <string>
#include <cstdlib>
#include <vector>
#include <map>

// C libraries
#include <stdio.h>
#include <string.h>
#include <getopt.h>

// Local headers
#include "cminus.h"
#include "cminus.tab.h"
#include "types.h"
#include "toker.h"
#include "symbolTable.h"
#include "printing.h"
#include "trees.h"
#include "semantic_errors.h"

// Tree pointers
TreeNode * syntaxTree = NULL;
TreeNode * annotatedTree = NULL;

// Globally keep track of warnings and errors
int warnings = 0;
int errors = 0;
bool testing = false;
bool debugging = false;

bool return_found = false;
TreeNode * func = NULL;

// TODO: put different error types into their own methods in a "errors.cpp" file.
// TODO: free tokens matched by error terminal in bison
int main ( int argc, char * argv[] )
{

    // FILE * output = stdout;
    int option;
    opterr = 0;

    // Flags
    //testing = false;
    bool abstract_tree = false;
    bool annotated_tree = false;
    bool error_checking = true;
    bool code_generation = false;
    
    initTokenMaps();

    // Command line options
    while ((option = getopt(argc, argv, "dpPtz")) != EOF)
    {
        switch (option)
          {
            case 'd':
              yydebug = 1;
              break;
            case 'p':
              abstract_tree = true;
              break;
            case 'P':
              annotated_tree = true;
              break;
            case 't':
              testing = true;
              break;
            case 'z':
              debugging = true;
              break;
            case 'e':
                error_checking = true;
                break;
            case 'g':
                code_generation = true;
                break;
            default:
              break;
          }
    }

    // Slightly hacky way to get input filename, without using a option
    if ( argc > 1 && optind < argc )
    {
        yyin = fopen(argv[optind], "r");
    }

    // Main parsing loop. Goes until end of input
    do
    {
        yyparse();
    } while (!feof(yyin));

    if ( abstract_tree )
    {
        printAbstractTree(syntaxTree);
    }
    
    //annotated_tree = true;
    if ( error_checking && (errors == 0) )
    {
        //annotatedTree = syntaxTree;
        //semanticAnalysis(annotatedTree);

        TreeNode * io = buildIOLibrary();
        linkSiblings(io, syntaxTree);
        annotatedTree = io;
        semanticAnalysis(annotatedTree);

        if ( annotated_tree )
        {
            printAnnotatedTree(annotatedTree);
        }
    }

    
    if ( code_generation )
    {
        //generateCode();
    }

    //freeTree(annotatedTree);
    //freeTree(syntaxTree);
    
    printf("Number of warnings: %d\n", warnings);
    printf("Number of errors: %d\n", errors);

    fclose(yyin);
    return 0;
}

// Performs semantic analysis, generating the Annotated Syntax Tree

void semanticAnalysis ( TreeNode * og )
{
    // add return?
    SymbolTable * symtable = new SymbolTable();
    SymbolTable * typetable = new SymbolTable();
    TreeNode * tree = og;

    // *** Type annotation *** //
    if ( debugging )
    {
        std::cout << "Enabling typetable debug flags..." << std::endl;
        typetable->debug(true);
        std::cout << "Pre-typeResolution" << std::endl;
        typetable->print(printTreeNode);
    }

    typeResolution(NULL, tree, typetable);

    if ( debugging )
    {
        std::cout << "Post-typeResolution" << std::endl;
        typetable->print(printTreeNode);
        std::cout << "Deleting typetable..." << std::endl;
    }
    delete typetable;

    // *** Semantic Analysis *** //
    if ( debugging ) 
    {
        std::cout << "Enabling symtable debug flags..." << std::endl;
        symtable->debug(true);
        std::cout << "Pre-treeParse" << std::endl;
        symtable->print(printTreeNode);        
    }
    
    treeParse(NULL, tree, symtable, false);

    if ( debugging )
    {
        std::cout << "Post-treeParse" << std::endl;
        symtable->print(printTreeNode);
    }

    if ( symtable->lookup("main") == NULL )
    {
        printf("ERROR(LINKER): Procedure main is not defined.\n");
        errors++;
    }
    
    if( debugging )
    {
        std::cout << "Deleting symtable..." << std::endl;
    }
    delete symtable;
}

// Like a ninja...silent insertion into symbol table and annotating of types. Few errors.

void typeResolution ( TreeNode * par, TreeNode * node, SymbolTable * symtable )
{
    TreeNode * tree;
    tree = node;

    TreeNode * parent;
    if ( par == NULL )
    {
        parent = tree;
    } else
    {
        parent = par;
    }

    while (tree != NULL)
    {
        TreeNode * temp; // Temporary TreeNode
        int sibling_count = 0; // Keeps track of siblings
        int line = tree->lineno; // Node's line number

        Type lhs = Void; // Left hand side (child[0])'s type
        Type rhs = Void; // Right hand side (child[1])'s type

        std::string child0_sval;
        std::string child1_sval;
        std::string tree_svalue = svalResolve(tree);
        std::string op = opToStr(tree->token);

        if ( tree->child[0] != NULL )
        {
            lhs = tree->child[0]->nodetype;
            child0_sval = svalResolve(tree->child[0]);
        }
        if ( tree->child[1] != NULL )
        {
            rhs = tree->child[1]->nodetype;
            child1_sval = svalResolve(tree->child[1]);
        }

        const char * lhs_str;
        const char * rhs_str;
        const char * tree_type_str;
        tree_type_str = typeToStr(tree->nodetype);
        lhs_str = typeToStr(lhs);
        rhs_str = typeToStr(rhs);


        switch (tree->nodekind)
          {
            case DeclK:
              switch (tree->kind)
                {
                  case VarK:
                    if ( !symtable->insert(tree_svalue, tree) )
                    {
                        if(testing)
                            std::cout << "Failed to insert DeclK:VarK:" << tree_svalue << std::endl;
                    }
                    break;

                  case ParamK:
                    if ( !symtable->insert(tree_svalue, tree) )
                    {
                        if(testing)
                            std::cout << "Failed to insert DeclK:ParamK:" << tree_svalue << std::endl;                            
                    }                 
                    break;

                  case FunK:
                    if ( !symtable->insert(tree_svalue, tree) )
                    {
                        if(testing)
                            std::cout << "Failed to insert DeclK:FunK:" << tree_svalue << std::endl;
                    }
                    symtable->enter("Function " + tree_svalue);
                    break;
                  case IdK:
                    if ( testing )
                    {
                        std::cout << "Hit DeclK:IdK:" << tree_svalue << std::endl;
                    }
                    temp = (TreeNode *) symtable->lookup(tree_svalue);
                    if ( temp != NULL )
                    {
                        tree->nodetype = temp->nodetype;
                        if ( temp->isArray )
                        {
                            tree->isArray = true;
                        }
                        if(temp->isIndex)
                        {
                            tree->isIndex = true;
                        }
                        if ( temp->isStatic )
                        {
                            tree->isStatic = true;
                        }

                    } else
                    {
                        tree->nodetype = Undef;
                    }
                    break;

                }
              break;

            case StmtK:
              switch (tree->kind)
                {
                  case CompoundK:
                    if(parent->kind != FunK)
                        symtable->enter("Compound" + line);
                    break;

                  case IdK:
                    temp = (TreeNode *) symtable->lookup(tree_svalue);
                    if ( temp != NULL )
                    {
                        tree->nodetype = temp->nodetype;
                        if(temp->isArray)
                            tree->isArray = true;
                        if(temp->isIndex)
                            tree->isIndex = true;
                        if ( temp->isStatic )
                            tree->isStatic = true;
                    } else
                    {
                        tree->nodetype = Undef;
                    }
                    break;
                }
              break;
            case ExpK:
              switch (tree->kind)
                {
                  case CallK:
                    temp = (TreeNode *) symtable->lookup(tree_svalue);
                    if ( temp != NULL && temp->kind == FunK )
                        tree->nodetype = temp->nodetype;
                    else
                        tree->nodetype = Undef;
                    break;
                  case IdK:
                    temp = (TreeNode *) symtable->lookup(tree_svalue);
                    if ( temp != NULL )
                    {
                        tree->nodetype = temp->nodetype;
                        if ( temp->isArray )
                            tree->isArray = true;
                        if ( temp->isIndex )
                            tree->isIndex = true;
                        if ( temp->isStatic )
                            tree->isStatic = true;                      
                    } else
                    {
                        tree->nodetype = Undef;
                    }
                    break;
                }
              break;


          }

        // Check if there are children
        if ( tree->numChildren > 0 )
        {
            for (int i = 0; i < tree->numChildren; i++)
            {
                if ( tree->child[i] != NULL )
                {
                    typeResolution(tree, tree->child[i], symtable);
                }
            }
        }

        if ( (tree->kind == CompoundK && parent->kind != FunK) || tree->kind == FunK )
        //if ( tree->kind == FunK )
        {
            if ( debugging )
            {
                symtable->print(printTreeNode);
            }
            symtable->leave();
        }

        tree = tree->sibling; // Jump to the next sibling
        sibling_count++;
    } // end while
}

void treeParse ( TreeNode * par, TreeNode * node, SymbolTable * symtable, bool in_loop )
{

    TreeNode * tree;
    tree = node;

    TreeNode * parent;
    if ( par == NULL )
        parent = tree;
    else
        parent = par;

    while (tree != NULL)
    {

        TreeNode * tmp; // Temporary TreeNode
        int sibling_count = 0; // Keeps track of siblings
        int line = tree->lineno; // Node's line number

        Type lhs = Void; // Left hand side (child[0])'s type
        Type rhs = Void; // Right hand side (child[1])'s type

        std::string child0_sval;
        std::string child1_sval;
        std::string tree_svalue = svalResolve(tree);
        std::string op = opToStr(tree->token);

        if ( tree->child[0] != NULL )
        {
            lhs = tree->child[0]->nodetype;
            child0_sval = svalResolve(tree->child[0]);
        }
        if ( tree->child[1] != NULL )
        {
            rhs = tree->child[1]->nodetype;
            child1_sval = svalResolve(tree->child[1]);
        }

        const char * lhs_str;
        const char * rhs_str;
        const char * tree_type_str;
        tree_type_str = typeToStr(tree->nodetype);
        lhs_str = typeToStr(lhs);
        rhs_str = typeToStr(rhs);


        // Switch on NodeKind (Declaration, Statement, Expression), then Kind
        switch (tree->nodekind)
          {
            case DeclK: // *** Node is part of a declaration ***
              switch (tree->kind)
                {
                  case VarK:
                    if ( !symtable->insert(tree_svalue, tree) )
                    {
                        tmp = (TreeNode *) symtable->lookup(tree_svalue);
                        printf("ERROR(%d): Symbol '%s' is already defined at line %d.\n", line, tree_svalue.c_str(), tmp->lineno);
                        errors++;
                    }
                    else if ( tree->numChildren == 1 && tree->child[0] != NULL )
                    {
                        if ( tree->isArray )
                        {
                            if ( tree->nodetype != Character )
                            {
                                printf("ERROR(%d): Array '%s' must be of type char to be initialized, but is of type %s.\n",
                                       line, tree_svalue.c_str(), tree_type_str);
                                errors++;
                            }
                            else if ( lhs != Character )
                            {
                                printf("ERROR(%d): Initializer for array variable '%s' must be a string, but is of nonarray type %s.\n",
                                       line, tree_svalue.c_str(), lhs_str);
                                errors++;
                            }
                        } else if ( tree->child[0]->isIndex )
                        {
                            printf("ERROR(%d): Cannot index nonarray '%s'.\n", line, tree_svalue.c_str());
                            errors++;
                        } else if ( tree->child[0]->isArray && tree->child[0]->child[0] == NULL )
                        {
                            printf("ERROR(%d): Initializer for nonarray variable '%s' of type %s cannot be initialized with an array.\n",
                                   line, tree_svalue.c_str(), tree_type_str);
                            errors++;
                        //} else if ( tree->child[0]->kind != ConstK )
                        } else if ( tree->child[0]->isConstant != true )
                        {
                            printf("ERROR(%d): Initializer for variable '%s' is not a constant expression.\n",
                                   line, tree_svalue.c_str());
                            errors++;
                        } else if ( lhs != tree->nodetype )
                        {
                            printf("ERROR(%d): Variable '%s' is of type %s but is being initialized with an expression of type %s.\n",
                                   line, tree_svalue.c_str(), tree_type_str, lhs_str);
                            errors++;
                        }
                    }

                    break;

                  case ParamK:
                    if ( !symtable->insert(tree_svalue, tree) )
                    {
                        tmp = (TreeNode *) symtable->lookup(tree_svalue);
                        printf("ERROR(%d): Symbol '%s' is already defined at line %d.\n", line, tree_svalue.c_str(), tmp->lineno);
                        errors++;
                    }
                    break;

                  case FunK:
                    if ( !symtable->insert(tree_svalue, tree) )
                    {
                        tmp = (TreeNode *) symtable->lookup(tree_svalue);
                        printf("ERROR(%d): Symbol '%s' is already defined at line %d.\n", line, tree_svalue.c_str(), tmp->lineno);
                        errors++;
                    }
                    symtable->enter("Function " + tree_svalue);
                    func = tree;
                    break;

                  default:
                    if ( testing )
                        std::cout << "Hit default case in DeclK switch" << std::endl;
                    break;

                } // end DeclK kind switch
              break;



              // *** Node is part of a statement ***
            case StmtK:
              switch (tree->kind)
                {
                  case IfK:
                    if ( tree->numChildren > 0 && tree->child[0] != NULL )
                    {
                        if ( tree->child[0]->isArray && tree->child[0]->child[0] == NULL )
                        {
                            printf("ERROR(%d): Cannot use array as test condition in if statement.\n", line);
                            errors++;
                        } else if ( isBoolean(lhs) == false )
                        {
                            printf("ERROR(%d): Expecting Boolean test condition in if statement but got type %s.\n", line, lhs_str);
                            errors++;
                        }
                    }
                    else
                    {
                        if(testing)
                        {
                            std::cout << "Less than 2 children in a IfK..." << std::endl;
                            printTreeNode(tree);
                        }
                    }
                    break;

                  case CompoundK:
                    if(parent->kind != FunK)
                        symtable->enter("Compound" + line);
                    break;

                    // TODO: change all if statements to use error checking methods
                  case ForeachK:
                    in_loop = true;
                    if ( tree->numChildren > 1 && tree->child[0] != NULL && tree->child[1] != NULL )
                    {
                        if ( tree->child[0]->isArray && tree->child[0]->child[0] == NULL )
                        {
                            printf("ERROR(%d): In foreach statement the variable to the left of 'in' must not be an array.\n", line);
                            errors++;
                        }
                        if ( tree->child[1]->isArray == false || 
                                ( tree->child[1]->isArray && tree->child[1]->child[0] != NULL ) )
                        {
                            if ( !isInteger(lhs) )
                            {
                                printf("ERROR(%d): If not an array, foreach requires lhs of 'in' be of type int but it is type %s.\n",
                                       line, lhs_str);
                                errors++;
                            }
                            if ( !isInteger(rhs) )
                            {
                                printf("ERROR(%d): If not an array, foreach requires rhs of 'in' be of type int but it is type %s.\n",
                                       line, rhs_str);
                                errors++;
                            }
                        } else if ( !typeCompare(lhs, rhs) )
                        {
                            printf("ERROR(%d): Foreach requires operands of 'in' be the same type but lhs is type %s and rhs array is type %s.\n",
                                   line, lhs_str, rhs_str);
                            errors++;
                        }
                    }
                    else if (testing)
                    {
                        std::cout << "Foreach didn't have 2 children!" << std::endl;
                        printTreeNode(tree);
                    }
                        
                    break;

                  case WhileK:
                    in_loop = true;
                    if ( tree->numChildren > 0 && tree->child[0] != NULL )
                    {
                        if ( lhs != Undef &&  tree->child[0]->isArray && tree->child[0]->child[0] == NULL )
                        {
                            printf("ERROR(%d): Cannot use array as test condition in while statement.\n", line);
                            errors++;
                        } else if ( lhs != Undef && lhs != Boolean )
                        {
                            printf("ERROR(%d): Expecting Boolean test condition in while statement but got type %s.\n", line, lhs_str);
                            errors++;
                        }
                    }
                    else if (testing)
                    {
                        std::cout << "While didn't have 2 children!" << std::endl;
                        printTreeNode(tree);
                    }
                    break;

                  case ReturnK:
                    return_found = true;
                    if ( tree->numChildren == 1 && tree->child[0] != NULL )
                    {
                        if ( lhs != Undef && tree->child[0]->isArray && tree->child[0]->child[0] == NULL )
                        {
                            printf("ERROR(%d): Cannot return an array.\n", line);
                            errors++;
                        }
                        tree->nodetype = tree->child[0]->nodetype;
                    }
                    if ( func != NULL )
                    {
                        if ( func->nodetype == Void && tree->nodetype != Void && tree->nodetype != Undef )
                        {
                            printf("ERROR(%d): Function '%s' at line %d is expecting no return value, but return has return value.\n",
                                   line, svalResolve(func).c_str(), func->lineno);
                            errors++;
                        } else if ( func->nodetype != Void && tree->nodetype == Void && tree->nodetype != Undef )
                        {
                            printf("ERROR(%d): Function '%s' at line %d is expecting to return type %s but return has no return value.\n",
                                   line, svalResolve(func).c_str(), func->lineno, typeToStr(func->nodetype));
                            errors++;
                        } else if ( func->nodetype != Void && func->nodetype != Undef && tree->nodetype != Undef && func->nodetype != tree->nodetype )
                        {
                            printf("ERROR(%d): Function '%s' at line %d is expecting to return type %s but got %s.\n",
                                   line, svalResolve(func).c_str(), func->lineno, typeToStr(func->nodetype), typeToStr(tree->nodetype));
                            errors++;
                        }
                    }
                    break;

                  case BreakK:
                    if ( in_loop == false )
                    {
                        printf("ERROR(%d): Cannot have a break statement outside of loop.\n", line);
                        errors++;
                    }
                    break;

                  default:
                    if ( testing )
                    {
                        std::cout << "Hit default case in StmtK switch" << std::endl;
                    }
                    break;
                } // end StmtK kind switch
              break;


              // *** Node is part of an expression ***
            case ExpK:
              switch (tree->kind)
                {
                  case AssignK:
                    if ( tree->token != NULL )
                    {
                        switch (tree->token->bval)
                          {
                            case ASSIGN:
                              if ( !typeCompare(lhs, rhs) )
                              {
                                  printf("ERROR(%d): '%s' requires operands of the same type but lhs is type %s and rhs is %s.\n",
                                         line, op.c_str(), lhs_str, rhs_str);
                                  errors++;
                              }
                              if ( lhs != Undef && rhs != Undef && (tree->child[0]->isArray && tree->child[0]->child[0] == NULL)
                                   != (tree->child[1]->isArray && tree->child[1]->child[0] == NULL) )
                              {
                                  printf("ERROR(%d): '%s' requires that if one operand is an array so must the other operand.\n",
                                         line, op.c_str());
                                  errors++;
                              }
                              break;

                            case ADDASS:
                            case SUBASS:
                            case MULASS:
                            case DIVASS:
                              if ( ( tree->child[0]->isArray && tree->child[0]->child[0] == NULL)
                                || ( tree->child[1]->isArray && tree->child[1]->child[0] == NULL) )
                              {
                                  printf("ERROR(%d): The operation '%s' does not work with arrays.\n",
                                         line, op.c_str());
                                  errors++;
                              }                                
                              if (  lhs != Void && lhs != Undef && lhs != Integer )
                              {
                                  printf("ERROR(%d): '%s' requires operands of type %s but lhs is of type %s.\n",
                                         line, op.c_str(), typeToStr(Integer), lhs_str);
                                  errors++;
                              }
                              if ( rhs != Void && rhs != Undef && rhs != Integer )
                              {
                                  printf("ERROR(%d): '%s' requires operands of type %s but rhs is of type %s.\n",
                                         line, op.c_str(), typeToStr(Integer), rhs_str);
                                  errors++;
                              }
                              break;
                              // TODO: lhs != rhs checking?

                            case INC:
                            case DEC:
                              if ( lhs != Undef && lhs != Integer )
                              {
                                  printf("ERROR(%d): Unary '%s' requires operands of type %s but lhs is of type %s.\n",
                                         line, op.c_str(), typeToStr(Integer), lhs_str);
                                  errors++;
                              }
                              break;
                          } // end assign switch
                    } else
                    {
                        if ( testing )
                        {
                            std::cout << "Tried to access NULL token in ExpK: AssignK" << std::endl;
                        }
                    }
                    break;

                  case CallK:
                    if ( tree_svalue != "" )
                    {
                        tmp = (TreeNode *) symtable->lookup(tree_svalue);
                        if ( tmp == NULL )
                        {
                            printf("ERROR(%d): Symbol '%s' is not defined.\n", line, tree_svalue.c_str());
                            errors++;
                            tree->nodetype = Undef;
                        } else
                        {
                            if ( tmp->kind != FunK )
                            {
                                printf("ERROR(%d): '%s' is a simple variable and cannot be called.\n",
                                       line, svalResolve(tmp).c_str());
                                errors++;
                            } else
                            {
                                int treesibs = countSiblings(tree->child[0]);
                                int tempsibs = countSiblings(tmp->child[0]);

                                if ( treesibs < tempsibs )
                                {
                                    printf("ERROR(%d): Too few parameters passed for function '%s' defined on line %d.\n",
                                           line, svalResolve(tmp).c_str(), tmp->lineno);
                                    errors++;
                                } else if ( treesibs > tempsibs )
                                {
                                    printf("ERROR(%d): Too many parameters passed for function '%s' defined on line %d.\n",
                                           line, svalResolve(tmp).c_str(), tmp->lineno);
                                    errors++;
                                }
                                checkArgTypes(tree, tmp);
                            }
    
                        }
                    }
                    break;

                  case FunK:
                    printf("ERROR(%d): Cannot use function '%s' as a simple variable.\n", line, tree_svalue.c_str());
                    errors++;
                    break;

                  case OpK:
                    if ( tree->numChildren == 2 )
                    {
                        if ( tree->token != NULL )
                        {
                            switch (tree->token->bval)
                              {
                                case NOT:
                                case QUESTION:
                                  if ( testing )
                                  {
                                      std::cout << "Shouldn't reach Unary in a OpK" << std::endl;
                                  }
                                  break;

                                case EQ:
                                case NOTEQ:
                                  if ( (tree->child[0]->isArray && tree->child[0]->child[0] == NULL)
                                    != (tree->child[1]->isArray && tree->child[1]->child[0] == NULL) )
                                  {
                                      printf("ERROR(%d): '%s' requires that if one operand is an array so must the other operand.\n", line, op.c_str());
                                      errors++;
                                  }                                  
                                  if( !typeCompare(lhs, rhs) )
                                  {
                                      printf("ERROR(%d): '%s' requires operands of the same type but lhs is type %s and rhs is %s.\n",
                                             line, op.c_str(), lhs_str, rhs_str);
                                      errors++;
                                  }                                   
                                  break;                                  

                                case LESSEQ:
                                case LTHAN:
                                case GRTEQ:
                                case GTHAN:
                                  if ( (!isInteger(lhs) && !isCharacter(lhs))
                                    || (!isInteger(rhs) && !isCharacter(rhs)) )
                                  {
                                      if ( !isInteger(lhs) && !isCharacter(lhs) )
                                      {
                                          printf("ERROR(%d): '%s' requires operands of type %s but lhs is of type %s.\n",
                                                 line, op.c_str(), "char or int", lhs_str);
                                          errors++;
                                      }
                                      if ( !isInteger(rhs) && !isCharacter(rhs) )
                                      {
                                          printf("ERROR(%d): '%s' requires operands of type %s but rhs is of type %s.\n",
                                                 line, op.c_str(), "char or int", rhs_str);
                                          errors++;
                                      }
                                  }
                                  if ( !typeCompare(lhs, rhs) )
                                  {
                                      printf("ERROR(%d): '%s' requires operands of the same type but lhs is type %s and rhs is %s.\n",
                                             line, op.c_str(), lhs_str, rhs_str);
                                      errors++;
                                  }
                                  if ( (tree->child[0]->isArray && tree->child[0]->child[0] == NULL)
                                       || (tree->child[1]->isArray && tree->child[1]->child[0] == NULL) )
                                  {
                                      printf("ERROR(%d): The operation '%s' does not work with arrays.\n",
                                             line, op.c_str());
                                      errors++;
                                  }
                                  break;

                                case MULTIPLY:
                                case PLUS:
                                case MINUS:
                                case DIVIDE:
                                case MODULUS:
                                  if ( !isInteger(lhs) || !isInteger(rhs) )
                                  {
                                      if ( !isInteger(lhs) )
                                      {
                                          printf("ERROR(%d): '%s' requires operands of type %s but lhs is of type %s.\n",
                                                 line, op.c_str(), typeToStr(Integer), lhs_str);
                                          errors++;
                                      }
                                      if ( !isInteger(rhs) )
                                      {
                                          printf("ERROR(%d): '%s' requires operands of type %s but rhs is of type %s.\n",
                                                 line, op.c_str(), typeToStr(Integer), rhs_str);
                                          errors++;
                                      }
                                  } else if ( !typeCompare(lhs, rhs) )
                                  {
                                      printf("ERROR(%d): '%s' requires operands of the same type but lhs is type %s and rhs is %s.\n",
                                             line, op.c_str(), lhs_str, rhs_str);
                                      errors++;
                                  }
                                  if ( (tree->child[0]->isArray && tree->child[0]->child[0] == NULL)
                                       || (tree->child[1]->isArray && tree->child[1]->child[0] == NULL) )
                                  {
                                      printf("ERROR(%d): The operation '%s' does not work with arrays.\n",
                                             line, op.c_str());
                                      errors++;
                                  }                                  
                                  break;
                                  
                                case AND:
                                case OR:
                                  if ( !isBoolean(lhs) )
                                  {
                                      printf("ERROR(%d): '%s' requires operands of type %s but lhs is of type %s.\n",
                                             line, op.c_str(), typeToStr(Integer), lhs_str);
                                      errors++;
                                  }
                                  if ( !isBoolean(rhs) )
                                  {
                                      printf("ERROR(%d): '%s' requires operands of type %s but rhs is of type %s.\n",
                                             line, op.c_str(), typeToStr(Integer), rhs_str);
                                      errors++;
                                  }
                                  if ( (tree->child[0]->isArray && tree->child[0]->child[0] == NULL)
                                       || (tree->child[1]->isArray && tree->child[1]->child[0] == NULL) )
                                  {
                                      printf("ERROR(%d): The operation '%s' does not work with arrays.\n",
                                             line, op.c_str());
                                      errors++;
                                  }                                      
                                    break;
                              }
                           
                        } else
                        {
                            if ( testing )
                            {
                                std::cout << "Tried to access NULL token in ExpK: OpK, or something like that" << std::endl;
                            }
                        }
                    }
                    break;

                  case UnaryK:
                    if ( tree->numChildren == 1 && tree->child[0] != NULL )
                    {
                        switch (tree->token->bval)
                          {
                            case MULTIPLY:
                              if ( tree->child[0]->isArray == false || 
                                 ( tree->child[0]->isArray && tree->child[0]->child[0] != NULL ) )
                              {
                                  printf("ERROR(%d): The operation '%s' only works with arrays.\n",
                                         line, tree_svalue.c_str());
                                  errors++;
                              }
                              break;

                            case MINUS:
                              if ( !isInteger(lhs) )
                              {
                                  printf("ERROR(%d): Unary '%s' requires an operand of type %s but was given %s.\n",
                                         line, tree_svalue.c_str(), typeToStr(Integer), lhs_str);
                                  errors++;
                              }
                              break;
                            case QUESTION:
                              if ( !isInteger(lhs) )
                              {
                                  printf("ERROR(%d): Unary '%s' requires an operand of type %s but was given %s.\n",
                                         line, tree_svalue.c_str(), typeToStr(Integer), lhs_str);
                                  errors++;
                              }
                              if ( tree->child[0]->isArray && tree->child[0]->child[0] == NULL )
                              {
                                  printf("ERROR(%d): The operation '%s' does not work with arrays.\n",
                                         line, op.c_str());
                                  errors++;
                              }
                              break;

                            case NOT:
                              if ( lhs != Undef && lhs != Boolean )
                              {
                                  printf("ERROR(%d): Unary '%s' requires an operand of type %s but was given %s.\n",
                                         line, tree_svalue.c_str(), typeToStr(Boolean), lhs_str);
                                  errors++;
                              }
                              if ( tree->child[0]->isArray && tree->child[0]->child[0] == NULL )
                              {
                                  printf("ERROR(%d): The operation '%s' does not work with arrays.\n",
                                         line, op.c_str());
                                  errors++;
                              }                              
                              break;
                          }
                    }
                    break;

                  case ParamK:
                      if (testing)
                      {
                          std::cout << "ExpK:ParamK...wat?" << std::endl;
                          printTreeNode(tree);
                      }
                    break;

                  case IdK:
                    tmp = (TreeNode *) symtable->lookup(tree_svalue);
                    if ( tmp != NULL )
                    {
                        if ( tree->child[0] != NULL && tree->child[0]->isIndex )
                        {
                            if ( tmp->isArray ) // TODO: possible subtle error, if add "child[0] == null" check we have...issues. do everything05.c-
                            {
                                if ( child0_sval == tree_svalue )
                                {
                                    printf("ERROR(%d): Array index is the unindexed array '%s'.\n", line, tree_svalue.c_str());
                                    errors++;
                                } else if ( lhs != Integer )
                                {
                                    printf("ERROR(%d): Array '%s' should be indexed by type int but got %s.\n",
                                           line, tree_svalue.c_str(), lhs_str);
                                    errors++;
                                }
                            } else
                            {
                                printf("ERROR(%d): Cannot index nonarray '%s'.\n",
                                       line, tree_svalue.c_str());
                                errors++;
                            }
                        }
                    } else
                    {
                        printf("ERROR(%d): Symbol '%s' is not defined.\n", line, tree_svalue.c_str());
                        errors++;
                        tree->nodetype = Undef;
                    }
                    break;

                  default:
                    break;
                } // end ExpK kind switch
              break;

            default:
              if ( testing )
              {
                  std::cout << "Hit default case in ExpK switch" << std::endl;
                  printTreeNode(tree);
              }
              break;
          } // end nodekind switch


        // Check if there are children
        if ( tree->numChildren > 0 )
        {
            for (int i = 0; i < tree->numChildren; i++)
            {
                if ( tree->child[i] != NULL )
                {
                    treeParse(tree, tree->child[i], symtable, in_loop );
                }
            }
        }
        
        if ( (tree->kind == CompoundK && parent->kind != FunK) || tree->kind == FunK )
        //if ( tree->kind == FunK )
        {
            if ( debugging )
            {
                std::cout << "Leaving symtable..." << std::endl;
                symtable->print(printTreeNode);
            }

            symtable->leave();
        }

        if(tree->kind == WhileK || tree->kind == ForeachK)
        {
            in_loop = false;
        }
        
        if ( tree->kind == FunK && tree->lineno > -1 )
        {
            if ( tree->nodetype != Void && return_found == false )
            {
                printf("WARNING(%d): Expecting to return type %s but function '%s' has no return statement.\n",
                       line, tree_type_str, tree_svalue.c_str());
                warnings++;
            }
            return_found = false;
            func = NULL;
        } 

        tree = tree->sibling; // Jump to the next sibling
        sibling_count++;

    } // end while
}

// Creates the tree of IO functions

TreeNode * buildIOLibrary ( )
{

    TreeNode * in;
    TreeNode * out;
    TreeNode * inputb;
    TreeNode * outputb;
    TreeNode * inputc;
    TreeNode * outputc;
    TreeNode * outnl;
    TreeNode * idummy;
    TreeNode * bdummy;
    TreeNode * cdummy;

    in = makeParent(DeclK, FunK, Integer, -1, "input");
    out = makeParent(DeclK, FunK, Void, -1, "output");
    idummy = makeParent(ExpK, ParamK, Integer, -1, "*dummy*");
    addChild(out, idummy);
    linkSiblings(in, out);
    inputb = makeParent(DeclK, FunK, Boolean, -1, "inputb");
    linkSiblings(in, inputb);
    outputb = makeParent(DeclK, FunK, Void, -1, "outputb");
    bdummy = makeParent(ExpK, ParamK, Boolean, -1, "*dummy*");
    addChild(outputb, bdummy);
    linkSiblings(in, outputb);
    inputc = makeParent(DeclK, FunK, Character, -1, "inputc");
    linkSiblings(in, inputc);
    outputc = makeParent(DeclK, FunK, Void, -1, "outputc");
    cdummy = makeParent(ExpK, ParamK, Character, -1, "*dummy*");
    addChild(outputc, cdummy);
    linkSiblings(in, outputc);
    outnl = makeParent(DeclK, FunK, Void, -1, "outnl");
    linkSiblings(in, outnl);

    return in;
}

void checkArgTypes( TreeNode * call, TreeNode * func)
{
    if(call == NULL || func == NULL )
    {
        if(testing)
        {
            std::cout << "NULL passed to checkArgTypes" << std::endl;
        }
        return;
    }
    
    if(testing)
    {
        std::cout << "Entering checkArgTypes..." << std::endl;
    }
    TreeNode * temp_call = call->child[0];
    TreeNode * temp_func = func->child[0];
    //TreeNode * tmp = NULL;
    int sibling_count = 1;
    
    while( temp_call != NULL && temp_func != NULL)
    {
        if(testing)
        {
            std::cout << "checkArgTypes:sibling:" << sibling_count << std::endl;
        }
        if ( temp_func->nodetype != temp_call->nodetype )
        {
            printf("ERROR(%d): Expecting type %s in parameter %i of call to '%s' defined on line %d but got %s.\n",
                   call->lineno, typeToStr(temp_func->nodetype), sibling_count, svalResolve(func).c_str(), func->lineno, typeToStr(temp_call->nodetype));
            errors++;
        }
        if ( temp_func->isArray && (!temp_call->isArray || (temp_call->isArray && temp_call->child[0] != NULL)) )
        {
            printf("ERROR(%d): Expecting array in parameter %i of call to '%s' defined on line %d.\n",
                   call->lineno, sibling_count, svalResolve(func).c_str(), func->lineno);
            errors++;
        }
        if ( !temp_func->isArray && (temp_call->isArray && temp_call->child[0] == NULL) )
        {
            printf("ERROR(%d): Not expecting array in parameter %i of call to '%s' defined on line %d.\n",
                   call->lineno, sibling_count, svalResolve(func).c_str(), func->lineno);
            errors++;
        }
        
        sibling_count++;
        temp_call = temp_call->sibling;
        temp_func = temp_func->sibling;
    }
    
    
}