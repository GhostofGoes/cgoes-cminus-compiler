// cminus.cpp

/* C++ Libraries */
#include <iostream>
#include <string>
#include <cstdlib>
#include <vector>
#include <map>

/* C libraries */
#include <stdio.h>
#include <string.h>
#include <getopt.h>

/* Local headers */
#include "cminus.h"
#include "cminus.tab.h"
#include "types.h"
#include "toker.h"
#include "symbolTable.h"
#include "printing.h"
#include "trees.h"

/* Tree pointers */
TreeNode * syntaxTree = NULL;
TreeNode * annotatedTree = NULL;

// Globally keep track of warnings and errors
int warnings = 0;
int errors = 0;
bool testing = false;

bool return_found = false;
TreeNode * func = NULL;

int main ( int argc, char * argv[] )
{

    // FILE * output = stdout;
    int option;
    opterr = 0;

    // Flags
    //testing = false;
    bool abstract_tree = false;
    bool annotated_tree = false;
    bool code_generation = false;

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

    if ( annotated_tree )
    {
        annotatedTree = syntaxTree;
        semanticAnalysis(annotatedTree);

        TreeNode * io = buildIOLibrary();
        linkSiblings(io, syntaxTree);
        annotatedTree = io;

        if ( !testing )
        {
            printAnnotatedTree(annotatedTree);
        }
    }

    if ( code_generation )
    {
        //generateCode();
    }
    
    if( annotated_tree )
    {
        freeTree(annotatedTree);
    }
    else
    {
        freeTree(syntaxTree);
    }
    
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
    if ( testing )
    {
        std::cout << "Enabling typetable debug flags..." << std::endl;
        typetable->debug(true);
        std::cout << "Pre-typeResolution" << std::endl;
        typetable->print(printTreeNode);
    }

    typeResolution(tree, typetable);

    if ( testing )
    {
        std::cout << "Post-typeResolution" << std::endl;
        typetable->print(printTreeNode);
        std::cout << "Deleting typetable..." << std::endl;
    }
    delete typetable;

    // *** Semantic Analysis *** //
    if ( testing ) 
    {
        std::cout << "Enabling symtable debug flags..." << std::endl;
        symtable->debug(true);
        std::cout << "Pre-treeParse" << std::endl;
        symtable->print(printTreeNode);        
    }
    
    treeParse(NULL, tree, symtable, false);

    if ( testing )
    {
        std::cout << "Post-treeParse" << std::endl;
        symtable->print(printTreeNode);
    }

    if ( symtable->lookup("main") == NULL )
    {
        printf("ERROR(LINKER): Procedure main is not defined.");
        errors++;
    }
    
    if( testing )
    {
        std::cout << "Deleting symtable..." << std::endl;
    }
    delete symtable;
}

// Like a ninja...silent insertion into symbol table and annotating of types. Few errors.

void typeResolution ( TreeNode * node, SymbolTable * symtable )
{
    TreeNode * tree;
    tree = node;

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
                        {
                            std::cerr << "Failed to insert DeclK:VarK:" << tree_svalue << std::endl;
                        }
                        //temp = (TreeNode *) symtable->lookup(tree_svalue);
                        //printf("ERROR(%d): Symbol '%s' is already defined at line %d.\n", line, tree_svalue.c_str(), temp->lineno);
                        //errors++;
                    }
                    break;

                  case ParamK:
                    if ( !symtable->insert(tree_svalue, tree) )
                    {
                        if(testing)
                        {
                            std::cerr << "Failed to insert DeclK:ParamK:" << tree_svalue << std::endl;                            
                        }
                        //temp = (TreeNode *) symtable->lookup(tree_svalue);
                        //printf("ERROR(%d): Symbol '%s' is already defined at line %d.\n", line, tree_svalue.c_str(), temp->lineno);
                        //errors++;
                    }
                    break;

                  case FunK:
                    if ( !symtable->insert(tree_svalue, tree) )
                    {
                        if(testing)
                        {
                            std::cerr << "Failed to insert DeclK:FunK:" << tree_svalue << std::endl;
                        }
                        //temp = (TreeNode *) symtable->lookup(tree_svalue);
                        //printf("ERROR(%d): Symbol '%s' is already defined at line %d.\n", line, tree_svalue.c_str(), temp->lineno);
                        //errors++;
                    }
                    symtable->enter("Function " + tree_svalue);
                    break;
                  case IdK:
                      if(testing)
                      {
                          std::cout << "Hit DeclK:IdK:" << tree_svalue << std::endl;
                      }
                    temp = (TreeNode *) symtable->lookup(tree_svalue);
                    if ( temp != NULL )
                    {
                        tree->nodetype = temp->nodetype;
                        if(temp->isArray )
                        {
                            tree->isArray = true;
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
                    symtable->enter("Compound" + line);
                    break;

                  case IdK:
                    temp = (TreeNode *) symtable->lookup(tree_svalue);
                    if ( temp != NULL )
                    {
                        tree->nodetype = temp->nodetype;
                        //if(temp->isArray && temp->child[0] != NULL && temp->child[0]->isIndex == false )
                        if(temp->isArray)
                        {
                            tree->isArray = true;
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
            case ExpK:
              switch (tree->kind)
                {
                  case CallK:
                    temp = (TreeNode *) symtable->lookup(tree_svalue);
                    if ( temp != NULL && temp->kind == FunK )
                    {
                        tree->nodetype = temp->nodetype;
                    } else
                    {
                        tree->nodetype = Undef;
                    }
                    break;
                  case IdK:
                    temp = (TreeNode *) symtable->lookup(tree_svalue);
                    if ( temp != NULL )
                    {
                        tree->nodetype = temp->nodetype;
                        if(temp->isArray)
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


          }

        // Check if there are children
        if ( tree->numChildren > 0 )
        {
            for (int i = 0; i < tree->numChildren; i++)
            {
                if ( tree->child[i] != NULL )
                {
                    typeResolution(tree->child[i], symtable);
                }
            }
        }

        if ( tree->kind == CompoundK || tree->kind == FunK )
        {
            if ( testing )
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
    {
        parent = tree;
    } else
    {
        parent = par;
    }

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
                    if ( tree->numChildren == 1 && tree->child[0] != NULL )
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
                        } else if ( tree->child[0]->isArray )
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
                    {
                        std::cout << "Hit default case in DeclK switch" << std::endl;
                    }
                    break;

                } // end DeclK kind switch
              break;



              // *** Node is part of a statement ***
            case StmtK:
              switch (tree->kind)
                {
                  case IfK:
                    if ( tree->numChildren == 2 && tree->child[0] != NULL )
                    {
                        if ( tree->child[0]->isArray  && tree->child[0]->isIndex == false )
                        {
                            printf("ERROR(%d): Cannot use array as test condition in if statement.\n", line);
                            errors++;
                        } else if ( tree->child[0]->nodetype != Boolean )
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
                        }
                    }
                    break;

                  case CompoundK:
                    symtable->enter("Compound" + line);
                    break;

                  case ForeachK:
                    in_loop = true;
                    if ( tree->numChildren )
                    {
                        if ( tree->child[0]->isArray )
                        {
                            printf("ERROR(%d): In foreach statement the variable to the left of 'in' must not be an array.\n", line);
                            errors++;
                        } else if ( lhs != Integer )
                        {
                            printf("ERROR(%d): If not an array, foreach requires lhs of 'in' be of type int but it is type %s.\n",
                                   line, lhs_str);
                            errors++;
                        }
                        if ( rhs != Integer )
                        {
                            printf("ERROR(%d): If not an array, foreach requires rhs of 'in' be of type int but it is type %s.\n",
                                   line, rhs_str);
                            errors++;
                        }
                        if ( lhs != rhs )
                        {
                            printf("ERROR(%d): Foreach requires operands of 'in' be the same type but lhs is type %s and rhs array is type %s.\n",
                                   line, lhs_str, rhs_str);
                            errors++;
                        }
                    }
                    break;

                  case WhileK:
                    in_loop = true;
                    if ( tree->numChildren == 2 && tree->child[0] != NULL )
                    {
                        if ( tree->child[0]->isArray && tree->child[0]->isIndex == false )
                        {
                            printf("ERROR(%d): Cannot use array as test condition in while statement.\n", line);
                            errors++;
                        } else if ( tree->child[0]->nodetype != Boolean )
                        {
                            printf("ERROR(%d): Expecting Boolean test condition in while statement but got type %s.\n", line, lhs_str);
                            errors++;
                        }
                    }
                    break;

                  case ReturnK:
                    return_found = true;
                    if ( tree->numChildren == 1 && tree->child[0] != NULL )
                    {
                        if ( tree->child[0]->isArray && tree->child[0]->isIndex == false )
                        {
                            printf("ERROR(%d): Cannot return an array.\n", line);
                            errors++;
                        }
                        tree->nodetype = tree->child[0]->nodetype;
                    }
                    if ( func != NULL )
                    {
                        if ( func->nodetype == Void && tree->nodetype != Void )
                        {
                            printf("ERROR(%d): Function '%s' at line %d is expecting no return value, but return has return value.\n",
                                   line, svalResolve(func).c_str(), func->lineno);
                            errors++;
                        } else if ( func->nodetype != Void && tree->nodetype == Void )
                        {
                            printf("ERROR(%d): Function '%s' at line %d is expecting to return type %s but return has no return value.\n",
                                   line, svalResolve(func).c_str(), func->lineno, typeToStr(func->nodetype));
                            errors++;
                        } else if ( func->nodetype != Void && func->nodetype != tree->nodetype )
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
                              if ( lhs != rhs )
                              {
                                  printf("ERROR(%d): '%s' requires operands of the same type but lhs is type %s and rhs is %s.\n",
                                         line, op.c_str(), lhs_str, rhs_str);
                                  errors++;
                              }
                              if ( (tree->child[0]->isArray && tree->child[0]->child[0] == NULL)
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
                              if ( lhs != Integer )
                              {
                                  printf("ERROR(%d): '%s' requires operands of type %s but lhs is of type %s.\n",
                                         line, op.c_str(), typeToStr(Integer), lhs_str);
                                  errors++;
                              }
                              if ( rhs != Integer )
                              {
                                  printf("ERROR(%d): '%s' requires operands of type %s but rhs is of type %s.\n",
                                         line, op.c_str(), typeToStr(Integer), rhs_str);
                                  errors++;
                              }
                              break;

                            case INC:
                            case DEC:
                              if ( lhs != Integer )
                              {
                                  printf("ERROR(%d): '%s' requires operands of type %s but lhs is of type %s.\n",
                                         line, op.c_str(), typeToStr(Integer), lhs_str);
                                  errors++;
                              }
                              break;
                          } // end assign switch
                    } else
                    {
                        if ( testing )
                        {
                            std::cerr << "Tried to access NULL token in ExpK: AssignK" << std::endl;
                        }
                    }
                    break;

                  case CallK:
                    if ( tree->svalue != NULL )
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
                        if ( (tree->child[0]->isArray && tree->child[0]->child[0] == NULL)
                             != (tree->child[1]->isArray && tree->child[1]->child[0] == NULL) )
                        {
                            printf("ERROR(%d): '%s' requires that if one operand is an array so must the other operand.\n", line, op.c_str());
                            errors++;
                        }

                        if ( tree->token != NULL )
                        {
                            switch (tree->token->bval)
                              {
                                case NOT:
                                case QUESTION:
                                  if ( testing )
                                  {
                                      std::cerr << "Shouldn't reach Unary in a OpK" << std::endl;
                                  }
                                  break;

                                case EQ:
                                case NOTEQ:
                                  if ( lhs != rhs )
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
                                  if ( lhs != Integer && lhs != Character )
                                  {
                                      printf("ERROR(%d): '%s' requires operands of type %s but lhs is of type %s.\n",
                                             line, op.c_str(), "char or int", lhs_str);
                                      errors++;
                                  }
                                  if ( rhs != Integer && rhs != Character )
                                  {
                                      printf("ERROR(%d): '%s' requires operands of type %s but rhs is of type %s.\n",
                                             line, op.c_str(), "char or int", rhs_str);
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
                                  if ( lhs != Integer )
                                  {
                                      printf("ERROR(%d): '%s' requires operands of type %s but lhs is of type %s.\n",
                                             line, op.c_str(), typeToStr(Integer), lhs_str);
                                      errors++;
                                  }
                                  if ( rhs != Integer )
                                  {
                                      printf("ERROR(%d): '%s' requires operands of type %s but rhs is of type %s.\n",
                                             line, op.c_str(), typeToStr(Integer), rhs_str);
                                      errors++;
                                  }
                                  break;
                              }
                        } else
                        {
                            if ( testing )
                            {
                                std::cerr << "Tried to access NULL token in ExpK: OpK" << std::endl;
                            }
                        }

                        if ( (tree->child[0]->isArray && tree->child[0]->child[0] == NULL) 
                              != (tree->child[1]->isArray && tree->child[1]->child[0] == NULL) )
                        {
                                printf("ERROR(%d): '%s' requires that if one operand is an array so must the other operand.\n", line, op.c_str());
                                errors++;
                        }
                    }
                    break;

                  case UnaryK:
                    if ( tree->numChildren == 1 && tree->child[0] != NULL )
                    {
                        switch (tree->token->bval)
                          {
                            case MULTIPLY:
                              if ( tree->child[0]->isArray == false )
                              {
                                  printf("ERROR(%d): The operation '%s' only works with arrays.\n",
                                         line, tree_svalue.c_str());
                                  errors++;
                              }
                              break;

                            case MINUS:
                            case QUESTION:
                              if ( lhs != Integer )
                              {
                                  printf("ERROR(%d): Unary '%s' requires an operand of type %s but was given %s.\n",
                                         line, tree_svalue.c_str(), typeToStr(Integer), lhs_str);
                                  errors++;
                              }
                              break;

                            case NOT:
                              if ( lhs != Boolean )
                              {
                                  printf("ERROR(%d): Unary '%s' requires an operand of type %s but was given %s.\n",
                                         line, tree_svalue.c_str(), typeToStr(Boolean), lhs_str);
                                  errors++;
                              }
                              break;
                          }
                    }
                    break;

                  case ParamK:
                    // TODO: paramK in expk? need to handle
                    break;

                  case IdK:
                    tmp = (TreeNode *) symtable->lookup(tree_svalue);
                    if ( tmp != NULL )
                    {
                        if ( parent->kind == CallK )
                        {
                            if ( tmp->nodetype != tree->nodetype )
                            {
                                printf("ERROR(%d): Expecting type %s in parameter %i of call to '%s' defined on line %d but got %s.\n",
                                       line, typeToStr(tmp->nodetype), sibling_count, svalResolve(parent).c_str(), parent->lineno, typeToStr(tree->nodetype));
                                errors++;
                            }
                            if ( tmp->isArray && !tree->isArray )
                            {
                                printf("ERROR(%d): Expecting array in parameter %i of call to '%s' defined on line %d.\n",
                                       line, sibling_count, svalResolve(parent).c_str(), parent->lineno);
                                errors++;
                            } else if ( !tmp->isArray && tree->isArray )
                            {
                                printf("ERROR(%d): Not expecting array in parameter %i of call to '%s' defined on line %d.\n",
                                       line, sibling_count, svalResolve(parent).c_str(), parent->lineno);
                                errors++;
                            }
                        }
                        if ( tree->child[0] != NULL && tree->child[0]->isIndex )
                        {
                            if ( tmp->isArray )
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
        
        if ( tree->kind == CompoundK || tree->kind == FunK )
        {
            if ( testing )
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
        
        if ( tree->kind == FunK && tree->nodetype != Void )
        {
            if ( return_found == false )
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