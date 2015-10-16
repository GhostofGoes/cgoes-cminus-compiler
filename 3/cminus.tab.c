/* A Bison parser, made by GNU Bison 2.5.  */

/* Bison implementation for Yacc-like parsers in C
   
      Copyright (C) 1984, 1989-1990, 2000-2011 Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output.  */
#define YYBISON 1

/* Bison version.  */
#define YYBISON_VERSION "2.5"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1

/* Using locations.  */
#define YYLSP_NEEDED 0



/* Copy the first part of user declarations.  */

/* Line 268 of yacc.c  */
#line 1 "cminus.y"

#include <stdio.h>
#include <stdlib.h>
#include <getopt.h>
#include <string.h>
#include <stdarg.h>
#include "types.h"
#include "cminus.h"
#include "toker.h"

#define YYERROR_VERBOSE

// Flex's Lexer (heh)
extern int yylex();

// Flex's line numbering
extern int yylineno; 

// Input file stream
extern FILE * yyin;

// Global abstract syntax tree pointer
TreeNode *syntaxTree = NULL;

// Global Annotated Syntax Tree pointer 
TreeNode *annotatedTree = NULL;

// Globally keep track of warnings and errors
int warnings = 0;
int errors = 0;

// Defining yyerror
static void yyerror(const char *);



/* Line 268 of yacc.c  */
#line 108 "cminus.tab.c"

/* Enabling traces.  */
#ifndef YYDEBUG
# define YYDEBUG 1
#endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 0
#endif

/* Enabling the token table.  */
#ifndef YYTOKEN_TABLE
# define YYTOKEN_TABLE 0
#endif

/* "%code requires" blocks.  */

/* Line 288 of yacc.c  */
#line 37 "cminus.y"

	#define MAXCHILDREN 3
	#include "types.h"
	#include "cminus.h"
    #include "toker.h"



/* Line 288 of yacc.c  */
#line 141 "cminus.tab.c"

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     ERROR = 258,
     ID = 259,
     NUMCONST = 260,
     STRINGCONST = 261,
     CHARCONST = 262,
     BOOLCONST = 263,
     ADDASS = 264,
     SUBASS = 265,
     MULASS = 266,
     DIVASS = 267,
     INC = 268,
     DEC = 269,
     LESSEQ = 270,
     GRTEQ = 271,
     EQ = 272,
     NOTEQ = 273,
     STATIC = 274,
     INT = 275,
     BOOL = 276,
     CHAR = 277,
     IF = 278,
     ELSE = 279,
     WHILE = 280,
     FOREACH = 281,
     IN = 282,
     RETURN = 283,
     BREAK = 284,
     SEMICOLON = 285,
     LPAREN = 286,
     RPAREN = 287,
     LBRACKET = 288,
     RBRACKET = 289,
     OR = 290,
     AND = 291,
     NOT = 292,
     ASSIGN = 293,
     PLUS = 294,
     MINUS = 295,
     MULTIPLY = 296,
     DIVIDE = 297,
     MODULUS = 298,
     QUESTION = 299,
     LTHAN = 300,
     GTHAN = 301,
     LBRACE = 302,
     RBRACE = 303,
     COMMA = 304,
     COLON = 305
   };
#endif



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{

/* Line 293 of yacc.c  */
#line 48 "cminus.y"

    TokenData * tok;
	TreeNode * tree;



/* Line 293 of yacc.c  */
#line 215 "cminus.tab.c"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif


/* Copy the second part of user declarations.  */


/* Line 343 of yacc.c  */
#line 227 "cminus.tab.c"

#ifdef short
# undef short
#endif

#ifdef YYTYPE_UINT8
typedef YYTYPE_UINT8 yytype_uint8;
#else
typedef unsigned char yytype_uint8;
#endif

#ifdef YYTYPE_INT8
typedef YYTYPE_INT8 yytype_int8;
#elif (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
typedef signed char yytype_int8;
#else
typedef short int yytype_int8;
#endif

#ifdef YYTYPE_UINT16
typedef YYTYPE_UINT16 yytype_uint16;
#else
typedef unsigned short int yytype_uint16;
#endif

#ifdef YYTYPE_INT16
typedef YYTYPE_INT16 yytype_int16;
#else
typedef short int yytype_int16;
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif ! defined YYSIZE_T && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned int
# endif
#endif

#define YYSIZE_MAXIMUM ((YYSIZE_T) -1)

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(msgid) dgettext ("bison-runtime", msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(msgid) msgid
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(e) ((void) (e))
#else
# define YYUSE(e) /* empty */
#endif

/* Identity function, used to suppress warnings about constant conditions.  */
#ifndef lint
# define YYID(n) (n)
#else
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static int
YYID (int yyi)
#else
static int
YYID (yyi)
    int yyi;
#endif
{
  return yyi;
}
#endif

#if ! defined yyoverflow || YYERROR_VERBOSE

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#     ifndef EXIT_SUCCESS
#      define EXIT_SUCCESS 0
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's `empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (YYID (0))
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined EXIT_SUCCESS \
       && ! ((defined YYMALLOC || defined malloc) \
	     && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef EXIT_SUCCESS
#    define EXIT_SUCCESS 0
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined EXIT_SUCCESS && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined EXIT_SUCCESS && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* ! defined yyoverflow || YYERROR_VERBOSE */


#if (! defined yyoverflow \
     && (! defined __cplusplus \
	 || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yytype_int16 yyss_alloc;
  YYSTYPE yyvs_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (sizeof (yytype_int16) + sizeof (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

# define YYCOPY_NEEDED 1

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)				\
    do									\
      {									\
	YYSIZE_T yynewbytes;						\
	YYCOPY (&yyptr->Stack_alloc, Stack, yysize);			\
	Stack = &yyptr->Stack_alloc;					\
	yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAXIMUM; \
	yyptr += yynewbytes / sizeof (*yyptr);				\
      }									\
    while (YYID (0))

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from FROM to TO.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(To, From, Count) \
      __builtin_memcpy (To, From, (Count) * sizeof (*(From)))
#  else
#   define YYCOPY(To, From, Count)		\
      do					\
	{					\
	  YYSIZE_T yyi;				\
	  for (yyi = 0; yyi < (Count); yyi++)	\
	    (To)[yyi] = (From)[yyi];		\
	}					\
      while (YYID (0))
#  endif
# endif
#endif /* !YYCOPY_NEEDED */

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  12
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   210

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  51
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  51
/* YYNRULES -- Number of rules.  */
#define YYNRULES  111
/* YYNRULES -- Number of states.  */
#define YYNSTATES  174

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   305

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const yytype_uint16 yyprhs[] =
{
       0,     0,     3,     5,     8,    10,    12,    14,    18,    22,
      26,    28,    30,    34,    36,    41,    44,    46,    48,    50,
      52,    59,    65,    67,    68,    72,    74,    77,    81,    83,
      85,    89,    91,    93,    95,    97,    99,   101,   103,   105,
     107,   109,   111,   113,   121,   127,   135,   141,   147,   155,
     163,   168,   171,   172,   175,   176,   179,   181,   184,   188,
     191,   195,   199,   203,   207,   211,   214,   217,   219,   223,
     225,   229,   231,   234,   236,   240,   242,   244,   246,   248,
     250,   252,   254,   258,   260,   262,   264,   268,   270,   272,
     274,   276,   279,   281,   283,   285,   287,   289,   291,   293,
     298,   302,   304,   306,   311,   313,   314,   318,   320,   322,
     324,   326
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int8 yyrhs[] =
{
      52,     0,    -1,    53,    -1,    53,    54,    -1,    54,    -1,
      55,    -1,    62,    -1,    61,    57,    30,    -1,    60,    57,
      30,    -1,    57,    49,    58,    -1,    58,    -1,    59,    -1,
      59,    50,    84,    -1,     4,    -1,     4,    33,     5,    34,
      -1,    19,    61,    -1,    61,    -1,    20,    -1,    21,    -1,
      22,    -1,    61,     4,    31,    63,    32,    68,    -1,     4,
      31,    63,    32,    68,    -1,    64,    -1,    -1,    64,    30,
      65,    -1,    65,    -1,    61,    66,    -1,    66,    49,    67,
      -1,    67,    -1,     4,    -1,     4,    33,    34,    -1,    69,
      -1,    70,    -1,    80,    -1,    77,    -1,    71,    -1,    73,
      -1,    75,    -1,    81,    -1,    82,    -1,    72,    -1,    74,
      -1,    76,    -1,    23,    31,    84,    32,    69,    24,    69,
      -1,    23,    31,    84,    32,    68,    -1,    23,    31,    84,
      32,    69,    24,    70,    -1,    25,    31,    84,    32,    69,
      -1,    25,    31,    84,    32,    70,    -1,    26,    31,    96,
      27,    84,    32,    69,    -1,    26,    31,    96,    27,    84,
      32,    70,    -1,    47,    78,    79,    48,    -1,    78,    56,
      -1,    -1,    79,    68,    -1,    -1,    83,    30,    -1,    30,
      -1,    28,    30,    -1,    28,    83,    30,    -1,    29,    30,
      -1,    96,    38,    83,    -1,    96,     9,    83,    -1,    96,
      10,    83,    -1,    96,    11,    83,    -1,    96,    12,    83,
      -1,    96,    13,    -1,    96,    14,    -1,    84,    -1,    84,
      35,    85,    -1,    85,    -1,    85,    36,    86,    -1,    86,
      -1,    37,    86,    -1,    87,    -1,    89,    88,    89,    -1,
      89,    -1,    15,    -1,    45,    -1,    46,    -1,    16,    -1,
      17,    -1,    18,    -1,    89,    90,    91,    -1,    91,    -1,
      39,    -1,    40,    -1,    91,    92,    93,    -1,    93,    -1,
      41,    -1,    42,    -1,    43,    -1,    94,    93,    -1,    95,
      -1,    40,    -1,    41,    -1,    44,    -1,    97,    -1,    96,
      -1,     4,    -1,     4,    33,    83,    34,    -1,    31,    83,
      32,    -1,    98,    -1,   101,    -1,     4,    31,    99,    32,
      -1,   100,    -1,    -1,   100,    49,    83,    -1,    83,    -1,
       5,    -1,     7,    -1,     6,    -1,     8,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   107,   107,   115,   117,   122,   124,   129,   138,   146,
     150,   155,   157,   164,   168,   177,   183,   188,   192,   196,
     203,   208,   216,   219,   223,   227,   232,   241,   243,   248,
     252,   260,   262,   267,   268,   269,   270,   271,   272,   273,
     277,   278,   279,   283,   291,   296,   304,   312,   320,   328,
     336,   341,   344,   348,   351,   355,   357,   362,   366,   374,
     381,   387,   392,   397,   402,   407,   412,   417,   422,   427,
     432,   437,   442,   447,   452,   457,   462,   466,   470,   474,
     478,   482,   489,   494,   499,   503,   510,   515,   520,   524,
     528,   535,   540,   545,   549,   553,   560,   562,   567,   571,
     580,   582,   584,   589,   598,   601,   605,   609,   614,   618,
     622,   626
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || YYTOKEN_TABLE
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "ERROR", "ID", "NUMCONST", "STRINGCONST",
  "CHARCONST", "BOOLCONST", "ADDASS", "SUBASS", "MULASS", "DIVASS", "INC",
  "DEC", "LESSEQ", "GRTEQ", "EQ", "NOTEQ", "STATIC", "INT", "BOOL", "CHAR",
  "IF", "ELSE", "WHILE", "FOREACH", "IN", "RETURN", "BREAK", "SEMICOLON",
  "LPAREN", "RPAREN", "LBRACKET", "RBRACKET", "OR", "AND", "NOT", "ASSIGN",
  "PLUS", "MINUS", "MULTIPLY", "DIVIDE", "MODULUS", "QUESTION", "LTHAN",
  "GTHAN", "LBRACE", "RBRACE", "COMMA", "COLON", "$accept", "program",
  "declaration-list", "declaration", "var-declaration",
  "scoped-var-declaration", "var-decl-list", "var-decl-initialize",
  "var-decl-id", "scoped-type-specifier", "type-specifier",
  "fun-declaration", "params", "param-list", "param-type-list",
  "param-id-list", "param-id", "statement", "matched", "unmatched",
  "matched-selection-stmt", "unmatched-selection-stmt",
  "matched-while-stmt", "unmatched-while-stmt", "matched-foreach-stmt",
  "unmatched-foreach-stmt", "compound-stmt", "local-declarations",
  "statement-list", "expression-stmt", "return-stmt", "break-stmt",
  "expression", "simple-expression", "and-expression",
  "unary-rel-expression", "rel-expression", "relop", "sum-expression",
  "sumop", "term", "mulop", "unary-expression", "unaryop", "factor",
  "mutable", "immutable", "call", "args", "arg-list", "constant", 0
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[YYLEX-NUM] -- Internal token number corresponding to
   token YYLEX-NUM.  */
static const yytype_uint16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   288,   289,   290,   291,   292,   293,   294,
     295,   296,   297,   298,   299,   300,   301,   302,   303,   304,
     305
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,    51,    52,    53,    53,    54,    54,    55,    56,    57,
      57,    58,    58,    59,    59,    60,    60,    61,    61,    61,
      62,    62,    63,    63,    64,    64,    65,    66,    66,    67,
      67,    68,    68,    69,    69,    69,    69,    69,    69,    69,
      70,    70,    70,    71,    72,    72,    73,    74,    75,    76,
      77,    78,    78,    79,    79,    80,    80,    81,    81,    82,
      83,    83,    83,    83,    83,    83,    83,    83,    84,    84,
      85,    85,    86,    86,    87,    87,    88,    88,    88,    88,
      88,    88,    89,    89,    90,    90,    91,    91,    92,    92,
      92,    93,    93,    94,    94,    94,    95,    95,    96,    96,
      97,    97,    97,    98,    99,    99,   100,   100,   101,   101,
     101,   101
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     1,     2,     1,     1,     1,     3,     3,     3,
       1,     1,     3,     1,     4,     2,     1,     1,     1,     1,
       6,     5,     1,     0,     3,     1,     2,     3,     1,     1,
       3,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     7,     5,     7,     5,     5,     7,     7,
       4,     2,     0,     2,     0,     2,     1,     2,     3,     2,
       3,     3,     3,     3,     3,     2,     2,     1,     3,     1,
       3,     1,     2,     1,     3,     1,     1,     1,     1,     1,
       1,     1,     3,     1,     1,     1,     3,     1,     1,     1,
       1,     2,     1,     1,     1,     1,     1,     1,     1,     4,
       3,     1,     1,     4,     1,     0,     3,     1,     1,     1,
       1,     1
};

/* YYDEFACT[STATE-NAME] -- Default reduction number in state STATE-NUM.
   Performed when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       0,     0,    17,    18,    19,     0,     2,     4,     5,     0,
       6,    23,     1,     3,    13,     0,    10,    11,     0,     0,
      22,    25,    23,     0,     7,     0,     0,    29,    26,    28,
       0,     0,     0,     0,    13,     9,    98,   108,   110,   109,
     111,     0,     0,    93,    94,    95,    12,    69,    71,    73,
      75,    83,    87,     0,    92,    97,    96,   101,   102,     0,
       0,     0,     0,     0,     0,     0,    56,    52,    21,    31,
      32,    35,    40,    36,    41,    37,    42,    34,    33,    38,
      39,     0,    67,    97,    24,     0,    14,   105,     0,     0,
      72,     0,     0,    76,    79,    80,    81,    84,    85,    77,
      78,     0,     0,    88,    89,    90,     0,    91,    30,    27,
       0,     0,     0,    57,     0,    59,    54,    55,     0,     0,
       0,     0,    65,    66,     0,    20,   107,     0,   104,     0,
     100,    68,    70,    74,    82,    86,     0,     0,    98,     0,
      58,     0,    51,     0,    16,     0,    61,    62,    63,    64,
      60,   103,     0,    99,     0,     0,     0,    15,     0,    50,
      53,   106,    44,    31,    46,    47,     0,     8,     0,     0,
      43,    45,    48,    49
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     5,     6,     7,     8,   142,    15,    16,    17,   143,
      18,    10,    19,    20,    21,    28,    29,    68,    69,    70,
      71,    72,    73,    74,    75,    76,    77,   116,   145,    78,
      79,    80,    81,    82,    47,    48,    49,   101,    50,   102,
      51,   106,    52,    53,    54,    83,    56,    57,   127,   128,
      58
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -116
static const yytype_int16 yypact[] =
{
      53,    11,  -116,  -116,  -116,    25,    53,  -116,  -116,    27,
    -116,    58,  -116,  -116,    39,   -23,  -116,    19,    79,    62,
      65,  -116,    58,    96,  -116,    98,   156,    70,    55,  -116,
     107,    58,    73,    72,    74,  -116,    51,  -116,  -116,  -116,
    -116,   156,   156,  -116,  -116,  -116,    75,    81,  -116,  -116,
     164,   -27,  -116,   161,  -116,  -116,  -116,  -116,  -116,    84,
      79,    77,    94,    95,   115,    97,  -116,  -116,  -116,  -116,
    -116,  -116,  -116,  -116,  -116,  -116,  -116,  -116,  -116,  -116,
    -116,    99,    75,     9,  -116,   107,  -116,   156,   156,   108,
    -116,   156,   156,  -116,  -116,  -116,  -116,  -116,  -116,  -116,
    -116,   161,   161,  -116,  -116,  -116,   161,  -116,  -116,  -116,
     156,   156,   105,  -116,   109,  -116,    78,  -116,   156,   156,
     156,   156,  -116,  -116,   156,  -116,  -116,   110,   100,   116,
    -116,    81,  -116,    -2,   -27,  -116,    14,    26,   120,   101,
    -116,    58,  -116,    98,  -116,     4,  -116,  -116,  -116,  -116,
    -116,  -116,   156,  -116,   107,   107,   156,  -116,    -6,  -116,
    -116,  -116,  -116,   119,  -116,  -116,    33,  -116,   107,   107,
    -116,  -116,  -116,  -116
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -116,  -116,  -116,   151,  -116,  -116,    15,   145,  -116,  -116,
       0,  -116,   149,  -116,   141,  -116,   113,   -83,  -115,  -105,
    -116,  -116,  -116,  -116,  -116,  -116,  -116,  -116,  -116,  -116,
    -116,  -116,   -28,   -22,    83,   -37,  -116,  -116,    76,  -116,
      82,  -116,   -50,  -116,  -116,   -25,  -116,  -116,  -116,  -116,
    -116
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -1
static const yytype_uint8 yytable[] =
{
       9,    55,   125,   107,    46,    90,     9,    24,    36,    37,
      38,    39,    40,    89,   103,   104,   105,    55,   118,   119,
     120,   121,   122,   123,   167,    12,    25,    61,    55,    62,
      63,    14,    64,    65,    66,    41,   114,    97,    98,   163,
     164,    42,    11,    25,    43,    44,   154,   124,    45,    91,
     165,    67,   159,   170,   172,   132,   135,     1,   155,   126,
     129,    91,   160,   171,   173,   169,    55,    55,    91,    26,
      22,   162,    23,     2,     3,     4,    55,    55,     2,     3,
       4,    55,    87,    27,    88,    55,    55,   139,   136,   137,
     146,   147,   148,   149,    30,    31,   150,   141,     2,     3,
       4,    33,    34,    59,    60,    85,    86,    23,   110,   138,
      91,    36,    37,    38,    39,    40,   144,    92,   108,    36,
      37,    38,    39,    40,   161,   111,   112,   115,   156,   117,
      61,    55,    62,    63,   166,    64,    65,    66,    41,   140,
     130,   157,   151,   168,    42,   113,    41,    43,    44,   152,
     153,    45,    42,    88,    67,    43,    44,    13,   158,    45,
      36,    37,    38,    39,    40,    36,    37,    38,    39,    40,
      35,    32,    84,   109,   131,     0,     0,   133,     0,    93,
      94,    95,    96,     0,   134,     0,     0,    41,     0,     0,
       0,     0,    41,    42,     0,     0,    43,    44,     0,     0,
      45,    43,    44,    97,    98,    45,     0,     0,     0,    99,
     100
};

#define yypact_value_is_default(yystate) \
  ((yystate) == (-116))

#define yytable_value_is_error(yytable_value) \
  YYID (0)

static const yytype_int16 yycheck[] =
{
       0,    26,    85,    53,    26,    42,     6,    30,     4,     5,
       6,     7,     8,    41,    41,    42,    43,    42,     9,    10,
      11,    12,    13,    14,    30,     0,    49,    23,    53,    25,
      26,     4,    28,    29,    30,    31,    64,    39,    40,   154,
     155,    37,    31,    49,    40,    41,    32,    38,    44,    35,
     155,    47,    48,   168,   169,    92,   106,     4,    32,    87,
      88,    35,   145,   168,   169,    32,    91,    92,    35,    50,
      31,   154,    33,    20,    21,    22,   101,   102,    20,    21,
      22,   106,    31,     4,    33,   110,   111,   112,   110,   111,
     118,   119,   120,   121,    32,    30,   124,    19,    20,    21,
      22,     5,     4,    33,    49,    32,    34,    33,    31,     4,
      35,     4,     5,     6,     7,     8,   116,    36,    34,     4,
       5,     6,     7,     8,   152,    31,    31,    30,    27,    30,
      23,   156,    25,    26,   156,    28,    29,    30,    31,    30,
      32,   141,    32,    24,    37,    30,    31,    40,    41,    49,
      34,    44,    37,    33,    47,    40,    41,     6,   143,    44,
       4,     5,     6,     7,     8,     4,     5,     6,     7,     8,
      25,    22,    31,    60,    91,    -1,    -1,   101,    -1,    15,
      16,    17,    18,    -1,   102,    -1,    -1,    31,    -1,    -1,
      -1,    -1,    31,    37,    -1,    -1,    40,    41,    -1,    -1,
      44,    40,    41,    39,    40,    44,    -1,    -1,    -1,    45,
      46
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     4,    20,    21,    22,    52,    53,    54,    55,    61,
      62,    31,     0,    54,     4,    57,    58,    59,    61,    63,
      64,    65,    31,    33,    30,    49,    50,     4,    66,    67,
      32,    30,    63,     5,     4,    58,     4,     5,     6,     7,
       8,    31,    37,    40,    41,    44,    84,    85,    86,    87,
      89,    91,    93,    94,    95,    96,    97,    98,   101,    33,
      49,    23,    25,    26,    28,    29,    30,    47,    68,    69,
      70,    71,    72,    73,    74,    75,    76,    77,    80,    81,
      82,    83,    84,    96,    65,    32,    34,    31,    33,    83,
      86,    35,    36,    15,    16,    17,    18,    39,    40,    45,
      46,    88,    90,    41,    42,    43,    92,    93,    34,    67,
      31,    31,    31,    30,    83,    30,    78,    30,     9,    10,
      11,    12,    13,    14,    38,    68,    83,    99,   100,    83,
      32,    85,    86,    89,    91,    93,    84,    84,     4,    96,
      30,    19,    56,    60,    61,    79,    83,    83,    83,    83,
      83,    32,    49,    34,    32,    32,    27,    61,    57,    48,
      68,    83,    68,    69,    69,    70,    84,    30,    24,    32,
      69,    70,    69,    70
};

#define yyerrok		(yyerrstatus = 0)
#define yyclearin	(yychar = YYEMPTY)
#define YYEMPTY		(-2)
#define YYEOF		0

#define YYACCEPT	goto yyacceptlab
#define YYABORT		goto yyabortlab
#define YYERROR		goto yyerrorlab


/* Like YYERROR except do call yyerror.  This remains here temporarily
   to ease the transition to the new meaning of YYERROR, for GCC.
   Once GCC version 2 has supplanted version 1, this can go.  However,
   YYFAIL appears to be in use.  Nevertheless, it is formally deprecated
   in Bison 2.4.2's NEWS entry, where a plan to phase it out is
   discussed.  */

#define YYFAIL		goto yyerrlab
#if defined YYFAIL
  /* This is here to suppress warnings from the GCC cpp's
     -Wunused-macros.  Normally we don't worry about that warning, but
     some users do, and we want to make it easy for users to remove
     YYFAIL uses, which will produce warnings from Bison 2.5.  */
#endif

#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)					\
do								\
  if (yychar == YYEMPTY && yylen == 1)				\
    {								\
      yychar = (Token);						\
      yylval = (Value);						\
      YYPOPSTACK (1);						\
      goto yybackup;						\
    }								\
  else								\
    {								\
      yyerror (YY_("syntax error: cannot back up")); \
      YYERROR;							\
    }								\
while (YYID (0))


#define YYTERROR	1
#define YYERRCODE	256


/* YYLLOC_DEFAULT -- Set CURRENT to span from RHS[1] to RHS[N].
   If N is 0, then set CURRENT to the empty location which ends
   the previous symbol: RHS[0] (always defined).  */

#define YYRHSLOC(Rhs, K) ((Rhs)[K])
#ifndef YYLLOC_DEFAULT
# define YYLLOC_DEFAULT(Current, Rhs, N)				\
    do									\
      if (YYID (N))                                                    \
	{								\
	  (Current).first_line   = YYRHSLOC (Rhs, 1).first_line;	\
	  (Current).first_column = YYRHSLOC (Rhs, 1).first_column;	\
	  (Current).last_line    = YYRHSLOC (Rhs, N).last_line;		\
	  (Current).last_column  = YYRHSLOC (Rhs, N).last_column;	\
	}								\
      else								\
	{								\
	  (Current).first_line   = (Current).last_line   =		\
	    YYRHSLOC (Rhs, 0).last_line;				\
	  (Current).first_column = (Current).last_column =		\
	    YYRHSLOC (Rhs, 0).last_column;				\
	}								\
    while (YYID (0))
#endif


/* This macro is provided for backward compatibility. */

#ifndef YY_LOCATION_PRINT
# define YY_LOCATION_PRINT(File, Loc) ((void) 0)
#endif


/* YYLEX -- calling `yylex' with the right arguments.  */

#ifdef YYLEX_PARAM
# define YYLEX yylex (YYLEX_PARAM)
#else
# define YYLEX yylex ()
#endif

/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)			\
do {						\
  if (yydebug)					\
    YYFPRINTF Args;				\
} while (YYID (0))

# define YY_SYMBOL_PRINT(Title, Type, Value, Location)			  \
do {									  \
  if (yydebug)								  \
    {									  \
      YYFPRINTF (stderr, "%s ", Title);					  \
      yy_symbol_print (stderr,						  \
		  Type, Value); \
      YYFPRINTF (stderr, "\n");						  \
    }									  \
} while (YYID (0))


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_value_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
#else
static void
yy_symbol_value_print (yyoutput, yytype, yyvaluep)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
#endif
{
  if (!yyvaluep)
    return;
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# else
  YYUSE (yyoutput);
# endif
  switch (yytype)
    {
      default:
	break;
    }
}


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
#else
static void
yy_symbol_print (yyoutput, yytype, yyvaluep)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
#endif
{
  if (yytype < YYNTOKENS)
    YYFPRINTF (yyoutput, "token %s (", yytname[yytype]);
  else
    YYFPRINTF (yyoutput, "nterm %s (", yytname[yytype]);

  yy_symbol_value_print (yyoutput, yytype, yyvaluep);
  YYFPRINTF (yyoutput, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_stack_print (yytype_int16 *yybottom, yytype_int16 *yytop)
#else
static void
yy_stack_print (yybottom, yytop)
    yytype_int16 *yybottom;
    yytype_int16 *yytop;
#endif
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)				\
do {								\
  if (yydebug)							\
    yy_stack_print ((Bottom), (Top));				\
} while (YYID (0))


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_reduce_print (YYSTYPE *yyvsp, int yyrule)
#else
static void
yy_reduce_print (yyvsp, yyrule)
    YYSTYPE *yyvsp;
    int yyrule;
#endif
{
  int yynrhs = yyr2[yyrule];
  int yyi;
  unsigned long int yylno = yyrline[yyrule];
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %lu):\n",
	     yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr, yyrhs[yyprhs[yyrule] + yyi],
		       &(yyvsp[(yyi + 1) - (yynrhs)])
		       		       );
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)		\
do {					\
  if (yydebug)				\
    yy_reduce_print (yyvsp, Rule); \
} while (YYID (0))

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
# define YY_SYMBOL_PRINT(Title, Type, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef	YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif


#if YYERROR_VERBOSE

# ifndef yystrlen
#  if defined __GLIBC__ && defined _STRING_H
#   define yystrlen strlen
#  else
/* Return the length of YYSTR.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static YYSIZE_T
yystrlen (const char *yystr)
#else
static YYSIZE_T
yystrlen (yystr)
    const char *yystr;
#endif
{
  YYSIZE_T yylen;
  for (yylen = 0; yystr[yylen]; yylen++)
    continue;
  return yylen;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static char *
yystpcpy (char *yydest, const char *yysrc)
#else
static char *
yystpcpy (yydest, yysrc)
    char *yydest;
    const char *yysrc;
#endif
{
  char *yyd = yydest;
  const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

# ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYSIZE_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      YYSIZE_T yyn = 0;
      char const *yyp = yystr;

      for (;;)
	switch (*++yyp)
	  {
	  case '\'':
	  case ',':
	    goto do_not_strip_quotes;

	  case '\\':
	    if (*++yyp != '\\')
	      goto do_not_strip_quotes;
	    /* Fall through.  */
	  default:
	    if (yyres)
	      yyres[yyn] = *yyp;
	    yyn++;
	    break;

	  case '"':
	    if (yyres)
	      yyres[yyn] = '\0';
	    return yyn;
	  }
    do_not_strip_quotes: ;
    }

  if (! yyres)
    return yystrlen (yystr);

  return yystpcpy (yyres, yystr) - yyres;
}
# endif

/* Copy into *YYMSG, which is of size *YYMSG_ALLOC, an error message
   about the unexpected token YYTOKEN for the state stack whose top is
   YYSSP.

   Return 0 if *YYMSG was successfully written.  Return 1 if *YYMSG is
   not large enough to hold the message.  In that case, also set
   *YYMSG_ALLOC to the required number of bytes.  Return 2 if the
   required number of bytes is too large to store.  */
static int
yysyntax_error (YYSIZE_T *yymsg_alloc, char **yymsg,
                yytype_int16 *yyssp, int yytoken)
{
  YYSIZE_T yysize0 = yytnamerr (0, yytname[yytoken]);
  YYSIZE_T yysize = yysize0;
  YYSIZE_T yysize1;
  enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
  /* Internationalized format string. */
  const char *yyformat = 0;
  /* Arguments of yyformat. */
  char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
  /* Number of reported tokens (one for the "unexpected", one per
     "expected"). */
  int yycount = 0;

  /* There are many possibilities here to consider:
     - Assume YYFAIL is not used.  It's too flawed to consider.  See
       <http://lists.gnu.org/archive/html/bison-patches/2009-12/msg00024.html>
       for details.  YYERROR is fine as it does not invoke this
       function.
     - If this state is a consistent state with a default action, then
       the only way this function was invoked is if the default action
       is an error action.  In that case, don't check for expected
       tokens because there are none.
     - The only way there can be no lookahead present (in yychar) is if
       this state is a consistent state with a default action.  Thus,
       detecting the absence of a lookahead is sufficient to determine
       that there is no unexpected or expected token to report.  In that
       case, just report a simple "syntax error".
     - Don't assume there isn't a lookahead just because this state is a
       consistent state with a default action.  There might have been a
       previous inconsistent state, consistent state with a non-default
       action, or user semantic action that manipulated yychar.
     - Of course, the expected token list depends on states to have
       correct lookahead information, and it depends on the parser not
       to perform extra reductions after fetching a lookahead from the
       scanner and before detecting a syntax error.  Thus, state merging
       (from LALR or IELR) and default reductions corrupt the expected
       token list.  However, the list is correct for canonical LR with
       one exception: it will still contain any token that will not be
       accepted due to an error action in a later state.
  */
  if (yytoken != YYEMPTY)
    {
      int yyn = yypact[*yyssp];
      yyarg[yycount++] = yytname[yytoken];
      if (!yypact_value_is_default (yyn))
        {
          /* Start YYX at -YYN if negative to avoid negative indexes in
             YYCHECK.  In other words, skip the first -YYN actions for
             this state because they are default actions.  */
          int yyxbegin = yyn < 0 ? -yyn : 0;
          /* Stay within bounds of both yycheck and yytname.  */
          int yychecklim = YYLAST - yyn + 1;
          int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
          int yyx;

          for (yyx = yyxbegin; yyx < yyxend; ++yyx)
            if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR
                && !yytable_value_is_error (yytable[yyx + yyn]))
              {
                if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
                  {
                    yycount = 1;
                    yysize = yysize0;
                    break;
                  }
                yyarg[yycount++] = yytname[yyx];
                yysize1 = yysize + yytnamerr (0, yytname[yyx]);
                if (! (yysize <= yysize1
                       && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
                  return 2;
                yysize = yysize1;
              }
        }
    }

  switch (yycount)
    {
# define YYCASE_(N, S)                      \
      case N:                               \
        yyformat = S;                       \
      break
      YYCASE_(0, YY_("syntax error"));
      YYCASE_(1, YY_("syntax error, unexpected %s"));
      YYCASE_(2, YY_("syntax error, unexpected %s, expecting %s"));
      YYCASE_(3, YY_("syntax error, unexpected %s, expecting %s or %s"));
      YYCASE_(4, YY_("syntax error, unexpected %s, expecting %s or %s or %s"));
      YYCASE_(5, YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s"));
# undef YYCASE_
    }

  yysize1 = yysize + yystrlen (yyformat);
  if (! (yysize <= yysize1 && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
    return 2;
  yysize = yysize1;

  if (*yymsg_alloc < yysize)
    {
      *yymsg_alloc = 2 * yysize;
      if (! (yysize <= *yymsg_alloc
             && *yymsg_alloc <= YYSTACK_ALLOC_MAXIMUM))
        *yymsg_alloc = YYSTACK_ALLOC_MAXIMUM;
      return 1;
    }

  /* Avoid sprintf, as that infringes on the user's name space.
     Don't have undefined behavior even if the translation
     produced a string with the wrong number of "%s"s.  */
  {
    char *yyp = *yymsg;
    int yyi = 0;
    while ((*yyp = *yyformat) != '\0')
      if (*yyp == '%' && yyformat[1] == 's' && yyi < yycount)
        {
          yyp += yytnamerr (yyp, yyarg[yyi++]);
          yyformat += 2;
        }
      else
        {
          yyp++;
          yyformat++;
        }
  }
  return 0;
}
#endif /* YYERROR_VERBOSE */

/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep)
#else
static void
yydestruct (yymsg, yytype, yyvaluep)
    const char *yymsg;
    int yytype;
    YYSTYPE *yyvaluep;
#endif
{
  YYUSE (yyvaluep);

  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  switch (yytype)
    {

      default:
	break;
    }
}


/* Prevent warnings from -Wmissing-prototypes.  */
#ifdef YYPARSE_PARAM
#if defined __STDC__ || defined __cplusplus
int yyparse (void *YYPARSE_PARAM);
#else
int yyparse ();
#endif
#else /* ! YYPARSE_PARAM */
#if defined __STDC__ || defined __cplusplus
int yyparse (void);
#else
int yyparse ();
#endif
#endif /* ! YYPARSE_PARAM */


/* The lookahead symbol.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;

/* Number of syntax errors so far.  */
int yynerrs;


/*----------.
| yyparse.  |
`----------*/

#ifdef YYPARSE_PARAM
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void *YYPARSE_PARAM)
#else
int
yyparse (YYPARSE_PARAM)
    void *YYPARSE_PARAM;
#endif
#else /* ! YYPARSE_PARAM */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void)
#else
int
yyparse ()

#endif
#endif
{
    int yystate;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus;

    /* The stacks and their tools:
       `yyss': related to states.
       `yyvs': related to semantic values.

       Refer to the stacks thru separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* The state stack.  */
    yytype_int16 yyssa[YYINITDEPTH];
    yytype_int16 *yyss;
    yytype_int16 *yyssp;

    /* The semantic value stack.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs;
    YYSTYPE *yyvsp;

    YYSIZE_T yystacksize;

  int yyn;
  int yyresult;
  /* Lookahead token as an internal (translated) token number.  */
  int yytoken;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;

#if YYERROR_VERBOSE
  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYSIZE_T yymsg_alloc = sizeof yymsgbuf;
#endif

#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  yytoken = 0;
  yyss = yyssa;
  yyvs = yyvsa;
  yystacksize = YYINITDEPTH;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY; /* Cause a token to be read.  */

  /* Initialize stack pointers.
     Waste one element of value and location stack
     so that they stay on the same level as the state stack.
     The wasted elements are never initialized.  */
  yyssp = yyss;
  yyvsp = yyvs;

  goto yysetstate;

/*------------------------------------------------------------.
| yynewstate -- Push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
 yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;

 yysetstate:
  *yyssp = yystate;

  if (yyss + yystacksize - 1 <= yyssp)
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYSIZE_T yysize = yyssp - yyss + 1;

#ifdef yyoverflow
      {
	/* Give user a chance to reallocate the stack.  Use copies of
	   these so that the &'s don't force the real ones into
	   memory.  */
	YYSTYPE *yyvs1 = yyvs;
	yytype_int16 *yyss1 = yyss;

	/* Each stack pointer address is followed by the size of the
	   data in use in that stack, in bytes.  This used to be a
	   conditional around just the two extra args, but that might
	   be undefined if yyoverflow is a macro.  */
	yyoverflow (YY_("memory exhausted"),
		    &yyss1, yysize * sizeof (*yyssp),
		    &yyvs1, yysize * sizeof (*yyvsp),
		    &yystacksize);

	yyss = yyss1;
	yyvs = yyvs1;
      }
#else /* no yyoverflow */
# ifndef YYSTACK_RELOCATE
      goto yyexhaustedlab;
# else
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
	goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
	yystacksize = YYMAXDEPTH;

      {
	yytype_int16 *yyss1 = yyss;
	union yyalloc *yyptr =
	  (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
	if (! yyptr)
	  goto yyexhaustedlab;
	YYSTACK_RELOCATE (yyss_alloc, yyss);
	YYSTACK_RELOCATE (yyvs_alloc, yyvs);
#  undef YYSTACK_RELOCATE
	if (yyss1 != yyssa)
	  YYSTACK_FREE (yyss1);
      }
# endif
#endif /* no yyoverflow */

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;

      YYDPRINTF ((stderr, "Stack size increased to %lu\n",
		  (unsigned long int) yystacksize));

      if (yyss + yystacksize - 1 <= yyssp)
	YYABORT;
    }

  YYDPRINTF ((stderr, "Entering state %d\n", yystate));

  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;

/*-----------.
| yybackup.  |
`-----------*/
yybackup:

  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yypact_value_is_default (yyn))
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid lookahead symbol.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = YYLEX;
    }

  if (yychar <= YYEOF)
    {
      yychar = yytoken = YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yytable_value_is_error (yyn))
        goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);

  /* Discard the shifted token.  */
  yychar = YYEMPTY;

  yystate = yyn;
  *++yyvsp = yylval;

  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- Do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     `$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
        case 2:

/* Line 1806 of yacc.c  */
#line 108 "cminus.y"
    { 
            (yyval.tree) = (yyvsp[(1) - (1)].tree); 
            syntaxTree = (yyval.tree); 
        }
    break;

  case 3:

/* Line 1806 of yacc.c  */
#line 116 "cminus.y"
    { (yyval.tree) = linkSiblings(2, (yyvsp[(1) - (2)].tree), (yyvsp[(2) - (2)].tree)); }
    break;

  case 4:

/* Line 1806 of yacc.c  */
#line 118 "cminus.y"
    { (yyval.tree) = (yyvsp[(1) - (1)].tree); }
    break;

  case 5:

/* Line 1806 of yacc.c  */
#line 123 "cminus.y"
    { (yyval.tree) = (yyvsp[(1) - (1)].tree); }
    break;

  case 6:

/* Line 1806 of yacc.c  */
#line 125 "cminus.y"
    { (yyval.tree) = (yyvsp[(1) - (1)].tree); }
    break;

  case 7:

/* Line 1806 of yacc.c  */
#line 130 "cminus.y"
    { 
            (yyval.tree) = makeParent( VarK, (yyvsp[(1) - (3)].tree)->nodetype, (yyvsp[(1) - (3)].tree)->lineno, (yyvsp[(2) - (3)].tree)->svalue );
            addChildren((yyval.tree), 1, (yyvsp[(2) - (3)].tree));
        }
    break;

  case 8:

/* Line 1806 of yacc.c  */
#line 139 "cminus.y"
    { 
            (yyval.tree) = makeParent( VarK, (yyvsp[(1) - (3)].tree)->nodetype, (yyvsp[(1) - (3)].tree)->lineno, NULL);
            //$$->isScoped = true; 
        }
    break;

  case 9:

/* Line 1806 of yacc.c  */
#line 147 "cminus.y"
    {
            (yyval.tree) = linkSiblings(2, (yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree));
        }
    break;

  case 10:

/* Line 1806 of yacc.c  */
#line 151 "cminus.y"
    { (yyval.tree) = (yyvsp[(1) - (1)].tree); }
    break;

  case 11:

/* Line 1806 of yacc.c  */
#line 156 "cminus.y"
    { (yyval.tree) = (yyvsp[(1) - (1)].tree); }
    break;

  case 12:

/* Line 1806 of yacc.c  */
#line 158 "cminus.y"
    {
            (yyval.tree) = makeParent( IdK, (yyvsp[(3) - (3)].tree)->nodetype, (yyvsp[(1) - (3)].tree)->lineno, (yyvsp[(1) - (3)].tree)->svalue );
        }
    break;

  case 13:

/* Line 1806 of yacc.c  */
#line 165 "cminus.y"
    { 
            (yyval.tree) = makeNode( IdK, Void, (yyvsp[(1) - (1)].tok)->lineno, (yyvsp[(1) - (1)].tok)->svalue, (yyvsp[(1) - (1)].tok) );
        }
    break;

  case 14:

/* Line 1806 of yacc.c  */
#line 169 "cminus.y"
    { 
            (yyval.tree) = makeParent( IdK, Void, (yyvsp[(1) - (4)].tok)->lineno, (yyvsp[(1) - (4)].tok)->svalue );
            (yyval.tree)->isArray = true;
            addChildren( (yyval.tree), 1, (yyvsp[(3) - (4)].tok) );
        }
    break;

  case 15:

/* Line 1806 of yacc.c  */
#line 178 "cminus.y"
    { 
            (yyval.tree) = makeParent( TypeK, (yyvsp[(2) - (2)].tree)->nodetype, (yyvsp[(2) - (2)].tree)->lineno, NULL);
            (yyval.tree)->isStatic = true; 
            //$$->isScoped = true;
           }
    break;

  case 16:

/* Line 1806 of yacc.c  */
#line 184 "cminus.y"
    { (yyval.tree) = makeParent( TypeK, (yyvsp[(1) - (1)].tree)->nodetype, (yyvsp[(1) - (1)].tree)->lineno, NULL); }
    break;

  case 17:

/* Line 1806 of yacc.c  */
#line 189 "cminus.y"
    { 
            (yyval.tree) = makeNode( TypeK, Integer, (yyvsp[(1) - (1)].tok)->lineno, NULL, (yyvsp[(1) - (1)].tok) );
        }
    break;

  case 18:

/* Line 1806 of yacc.c  */
#line 193 "cminus.y"
    { 
            (yyval.tree) = makeNode( TypeK, Boolean, (yyvsp[(1) - (1)].tok)->lineno, NULL, (yyvsp[(1) - (1)].tok) );
        }
    break;

  case 19:

/* Line 1806 of yacc.c  */
#line 197 "cminus.y"
    { 
            (yyval.tree) = makeNode( TypeK, Character, (yyvsp[(1) - (1)].tok)->lineno, NULL, (yyvsp[(1) - (1)].tok) );
        }
    break;

  case 20:

/* Line 1806 of yacc.c  */
#line 204 "cminus.y"
    { 
            (yyval.tree) = makeParent( FunK, (yyvsp[(1) - (6)].tree)->nodetype, (yyvsp[(2) - (6)].tok)->lineno, (yyvsp[(2) - (6)].tok)->svalue );
			addChildren( (yyval.tree), 2, (yyvsp[(4) - (6)].tree), (yyvsp[(6) - (6)].tree) );
		}
    break;

  case 21:

/* Line 1806 of yacc.c  */
#line 209 "cminus.y"
    { 
            (yyval.tree) = makeParent( FunK, Void, (yyvsp[(1) - (5)].tok)->lineno, (yyvsp[(1) - (5)].tok)->svalue );
			addChildren( (yyval.tree), 2, (yyvsp[(3) - (5)].tree), (yyvsp[(5) - (5)].tree));
		}
    break;

  case 22:

/* Line 1806 of yacc.c  */
#line 217 "cminus.y"
    { (yyval.tree) = (yyvsp[(1) - (1)].tree); }
    break;

  case 23:

/* Line 1806 of yacc.c  */
#line 219 "cminus.y"
    { (yyval.tree) = NULL; }
    break;

  case 24:

/* Line 1806 of yacc.c  */
#line 224 "cminus.y"
    {  
			(yyval.tree) = linkSiblings(2, (yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree));
		}
    break;

  case 25:

/* Line 1806 of yacc.c  */
#line 228 "cminus.y"
    { (yyval.tree) = (yyvsp[(1) - (1)].tree); }
    break;

  case 26:

/* Line 1806 of yacc.c  */
#line 233 "cminus.y"
    { 
		/* need to apply nodetype to children i  think */
            (yyval.tree) = makeParent( ParamK, (yyvsp[(1) - (2)].tree)->nodetype, (yyvsp[(1) - (2)].tree)->lineno, (yyvsp[(2) - (2)].tree)->token->svalue );
            addChildren( (yyval.tree), 1, (yyvsp[(2) - (2)].tree) );
		}
    break;

  case 27:

/* Line 1806 of yacc.c  */
#line 242 "cminus.y"
    { (yyval.tree) = linkSiblings(2, (yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree)); }
    break;

  case 28:

/* Line 1806 of yacc.c  */
#line 244 "cminus.y"
    { (yyval.tree) = (yyvsp[(1) - (1)].tree); }
    break;

  case 29:

/* Line 1806 of yacc.c  */
#line 249 "cminus.y"
    { 
            (yyval.tree) = makeNode( IdK, Void, (yyvsp[(1) - (1)].tok)->lineno, (yyvsp[(1) - (1)].tok)->svalue, (yyvsp[(1) - (1)].tok) );
        }
    break;

  case 30:

/* Line 1806 of yacc.c  */
#line 253 "cminus.y"
    { 
            (yyval.tree) = makeNode( IdK, Void, (yyvsp[(1) - (3)].tok)->lineno, (yyvsp[(1) - (3)].tok)->svalue, (yyvsp[(1) - (3)].tok) );
            (yyval.tree)->isArray = true; 
        }
    break;

  case 31:

/* Line 1806 of yacc.c  */
#line 261 "cminus.y"
    { (yyval.tree) = (yyvsp[(1) - (1)].tree); }
    break;

  case 32:

/* Line 1806 of yacc.c  */
#line 263 "cminus.y"
    { (yyval.tree) = (yyvsp[(1) - (1)].tree); }
    break;

  case 43:

/* Line 1806 of yacc.c  */
#line 284 "cminus.y"
    { 
            (yyval.tree) = makeParent( IfK, Void, (yyvsp[(1) - (7)].tok)->lineno, NULL );
            addChildren( (yyval.tree), 3, (yyvsp[(3) - (7)].tree), (yyvsp[(5) - (7)].tree), (yyvsp[(7) - (7)].tree) );
        }
    break;

  case 44:

/* Line 1806 of yacc.c  */
#line 292 "cminus.y"
    { 
            (yyval.tree) = makeParent( IfK, Void, (yyvsp[(1) - (5)].tok)->lineno, NULL );
            addChildren( (yyval.tree), 2, (yyvsp[(3) - (5)].tree), (yyvsp[(5) - (5)].tree) );
        }
    break;

  case 45:

/* Line 1806 of yacc.c  */
#line 297 "cminus.y"
    { 
            (yyval.tree) = makeParent( IfK, Void, (yyvsp[(1) - (7)].tok)->lineno, NULL );
            addChildren( (yyval.tree), 3, (yyvsp[(3) - (7)].tree), (yyvsp[(5) - (7)].tree), (yyvsp[(7) - (7)].tree) );
        }
    break;

  case 46:

/* Line 1806 of yacc.c  */
#line 305 "cminus.y"
    { 
            (yyval.tree) = makeParent( WhileK, Void, (yyvsp[(1) - (5)].tok)->lineno, NULL );
            addChildren( (yyval.tree), 2, (yyvsp[(3) - (5)].tree), (yyvsp[(5) - (5)].tree) );
        }
    break;

  case 47:

/* Line 1806 of yacc.c  */
#line 313 "cminus.y"
    { 
            (yyval.tree) = makeParent( WhileK, Void, (yyvsp[(1) - (5)].tok)->lineno, NULL );
            addChildren( (yyval.tree), 2, (yyvsp[(3) - (5)].tree), (yyvsp[(5) - (5)].tree) );
        }
    break;

  case 48:

/* Line 1806 of yacc.c  */
#line 321 "cminus.y"
    { 
            (yyval.tree) = makeParent( ForeachK, Void, (yyvsp[(1) - (7)].tok)->lineno, NULL );
            addChildren( (yyval.tree), 3, (yyvsp[(3) - (7)].tree), (yyvsp[(5) - (7)].tree), (yyvsp[(7) - (7)].tree) );
        }
    break;

  case 49:

/* Line 1806 of yacc.c  */
#line 329 "cminus.y"
    { 
            (yyval.tree) = makeParent( ForeachK, Void, (yyvsp[(1) - (7)].tok)->lineno, NULL );
            addChildren( (yyval.tree), 3, (yyvsp[(3) - (7)].tree), (yyvsp[(5) - (7)].tree), (yyvsp[(7) - (7)].tree) );
        }
    break;

  case 50:

/* Line 1806 of yacc.c  */
#line 337 "cminus.y"
    { (yyval.tree) = linkSiblings(2, (yyvsp[(2) - (4)].tree), (yyvsp[(3) - (4)].tree)); }
    break;

  case 51:

/* Line 1806 of yacc.c  */
#line 342 "cminus.y"
    { (yyval.tree) = linkSiblings(2, (yyvsp[(1) - (2)].tree), (yyvsp[(2) - (2)].tree)); }
    break;

  case 52:

/* Line 1806 of yacc.c  */
#line 344 "cminus.y"
    { (yyval.tree) = NULL; }
    break;

  case 53:

/* Line 1806 of yacc.c  */
#line 349 "cminus.y"
    { (yyval.tree) = linkSiblings(2, (yyvsp[(1) - (2)].tree), (yyvsp[(2) - (2)].tree)); }
    break;

  case 54:

/* Line 1806 of yacc.c  */
#line 351 "cminus.y"
    { (yyval.tree) = NULL; }
    break;

  case 55:

/* Line 1806 of yacc.c  */
#line 356 "cminus.y"
    { (yyval.tree) = (yyvsp[(1) - (2)].tree); /* does expression occur at semicolon for line counting? */ }
    break;

  case 56:

/* Line 1806 of yacc.c  */
#line 358 "cminus.y"
    { (yyval.tree) = NULL; }
    break;

  case 57:

/* Line 1806 of yacc.c  */
#line 363 "cminus.y"
    { 
            (yyval.tree) = makeNode( ReturnK, Void, (yyvsp[(1) - (2)].tok)->lineno, NULL, (yyvsp[(1) - (2)].tok) );     
        }
    break;

  case 58:

/* Line 1806 of yacc.c  */
#line 367 "cminus.y"
    {
            (yyval.tree) = makeNode( ReturnK, (yyvsp[(2) - (3)].tree)->nodetype, (yyvsp[(1) - (3)].tok)->lineno, NULL, (yyvsp[(1) - (3)].tok) );     
            addChildren( (yyval.tree), 1, (yyvsp[(2) - (3)].tree) );
        }
    break;

  case 59:

/* Line 1806 of yacc.c  */
#line 375 "cminus.y"
    { 
            (yyval.tree) = makeNode( BreakK, Void, (yyvsp[(1) - (2)].tok)->lineno, NULL, (yyvsp[(1) - (2)].tok) );     
        }
    break;

  case 60:

/* Line 1806 of yacc.c  */
#line 382 "cminus.y"
    { 
            (yyval.tree) = makeNode( OpK, Void, (yyvsp[(2) - (3)].tok)->lineno, NULL, (yyvsp[(2) - (3)].tok) );     
            //$$ = $2;
            addChildren( (yyval.tree), 2, (yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree) );
        }
    break;

  case 61:

/* Line 1806 of yacc.c  */
#line 388 "cminus.y"
    { 
            (yyval.tree) = makeNode( OpK, Void, (yyvsp[(2) - (3)].tok)->lineno, NULL, (yyvsp[(2) - (3)].tok) );     
            addChildren( (yyval.tree), 2, (yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree) );
        }
    break;

  case 62:

/* Line 1806 of yacc.c  */
#line 393 "cminus.y"
    { 
            (yyval.tree) = makeNode( OpK, Void, (yyvsp[(2) - (3)].tok)->lineno, NULL, (yyvsp[(2) - (3)].tok) );     
            addChildren( (yyval.tree), 2, (yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree) );
        }
    break;

  case 63:

/* Line 1806 of yacc.c  */
#line 398 "cminus.y"
    { 
            (yyval.tree) = makeNode( OpK, Void, (yyvsp[(2) - (3)].tok)->lineno, NULL, (yyvsp[(2) - (3)].tok) );     
            addChildren( (yyval.tree), 2, (yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree) );
        }
    break;

  case 64:

/* Line 1806 of yacc.c  */
#line 403 "cminus.y"
    { 
            (yyval.tree) = makeNode( OpK, Void, (yyvsp[(2) - (3)].tok)->lineno, NULL, (yyvsp[(2) - (3)].tok) );     
            addChildren( (yyval.tree), 2, (yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree) );
        }
    break;

  case 65:

/* Line 1806 of yacc.c  */
#line 408 "cminus.y"
    { 
            (yyval.tree) = makeNode( OpK, Integer, (yyvsp[(2) - (2)].tok)->lineno, NULL, (yyvsp[(2) - (2)].tok) );     
            addChildren( (yyval.tree), 1, (yyvsp[(1) - (2)].tree) );
        }
    break;

  case 66:

/* Line 1806 of yacc.c  */
#line 413 "cminus.y"
    { 
            (yyval.tree) = makeNode( OpK, Integer, (yyvsp[(2) - (2)].tok)->lineno, NULL, (yyvsp[(2) - (2)].tok) );     
            addChildren( (yyval.tree), 1, (yyvsp[(1) - (2)].tree) );
        }
    break;

  case 67:

/* Line 1806 of yacc.c  */
#line 418 "cminus.y"
    { (yyval.tree) = (yyvsp[(1) - (1)].tree); }
    break;

  case 68:

/* Line 1806 of yacc.c  */
#line 423 "cminus.y"
    { 
            (yyval.tree) = makeNode( OpK, Boolean, (yyvsp[(2) - (3)].tok)->lineno, NULL, (yyvsp[(2) - (3)].tok) );     
            addChildren( (yyval.tree), 2, (yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree) );
        }
    break;

  case 69:

/* Line 1806 of yacc.c  */
#line 428 "cminus.y"
    { (yyval.tree) = (yyvsp[(1) - (1)].tree); }
    break;

  case 70:

/* Line 1806 of yacc.c  */
#line 433 "cminus.y"
    { 
            (yyval.tree) = makeNode( OpK, Boolean, (yyvsp[(2) - (3)].tok)->lineno, NULL, (yyvsp[(2) - (3)].tok) );     
            addChildren( (yyval.tree), 2, (yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree) );
        }
    break;

  case 71:

/* Line 1806 of yacc.c  */
#line 438 "cminus.y"
    { (yyval.tree) = (yyvsp[(1) - (1)].tree); }
    break;

  case 72:

/* Line 1806 of yacc.c  */
#line 443 "cminus.y"
    { 
            (yyval.tree) = makeNode( OpK, Boolean, (yyvsp[(1) - (2)].tok)->lineno, NULL, (yyvsp[(1) - (2)].tok) );     
            addChildren( (yyval.tree), 1, (yyvsp[(2) - (2)].tree) );
        }
    break;

  case 73:

/* Line 1806 of yacc.c  */
#line 448 "cminus.y"
    { (yyval.tree) = (yyvsp[(1) - (1)].tree); }
    break;

  case 74:

/* Line 1806 of yacc.c  */
#line 453 "cminus.y"
    { 
            (yyval.tree) = (yyvsp[(2) - (3)].tree);
            addChildren( (yyval.tree), 2, (yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree) );
        }
    break;

  case 75:

/* Line 1806 of yacc.c  */
#line 458 "cminus.y"
    { (yyval.tree) = (yyvsp[(1) - (1)].tree); }
    break;

  case 76:

/* Line 1806 of yacc.c  */
#line 463 "cminus.y"
    { 
            (yyval.tree) = makeNode( OpK, Boolean, (yyvsp[(1) - (1)].tok)->lineno, NULL, (yyvsp[(1) - (1)].tok) );
        }
    break;

  case 77:

/* Line 1806 of yacc.c  */
#line 467 "cminus.y"
    { 
            (yyval.tree) = makeNode( OpK, Boolean, (yyvsp[(1) - (1)].tok)->lineno, NULL, (yyvsp[(1) - (1)].tok) );
        }
    break;

  case 78:

/* Line 1806 of yacc.c  */
#line 471 "cminus.y"
    { 
            (yyval.tree) = makeNode( OpK, Boolean, (yyvsp[(1) - (1)].tok)->lineno, NULL, (yyvsp[(1) - (1)].tok) );
        }
    break;

  case 79:

/* Line 1806 of yacc.c  */
#line 475 "cminus.y"
    { 
            (yyval.tree) = makeNode( OpK, Boolean, (yyvsp[(1) - (1)].tok)->lineno, NULL, (yyvsp[(1) - (1)].tok) );
        }
    break;

  case 80:

/* Line 1806 of yacc.c  */
#line 479 "cminus.y"
    { 
            (yyval.tree) = makeNode( OpK, Boolean, (yyvsp[(1) - (1)].tok)->lineno, NULL, (yyvsp[(1) - (1)].tok) );
        }
    break;

  case 81:

/* Line 1806 of yacc.c  */
#line 483 "cminus.y"
    { 
            (yyval.tree) = makeNode( OpK, Boolean, (yyvsp[(1) - (1)].tok)->lineno, NULL, (yyvsp[(1) - (1)].tok) );
        }
    break;

  case 82:

/* Line 1806 of yacc.c  */
#line 490 "cminus.y"
    { 
            (yyval.tree) = (yyvsp[(2) - (3)].tree);
            addChildren( (yyval.tree), 2, (yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree) );
        }
    break;

  case 83:

/* Line 1806 of yacc.c  */
#line 495 "cminus.y"
    { (yyval.tree) = (yyvsp[(1) - (1)].tree); }
    break;

  case 84:

/* Line 1806 of yacc.c  */
#line 500 "cminus.y"
    { 
            (yyval.tree) = makeNode( OpK, Integer, (yyvsp[(1) - (1)].tok)->lineno, NULL, (yyvsp[(1) - (1)].tok) );
        }
    break;

  case 85:

/* Line 1806 of yacc.c  */
#line 504 "cminus.y"
    { 
            (yyval.tree) = makeNode( OpK, Integer, (yyvsp[(1) - (1)].tok)->lineno, NULL, (yyvsp[(1) - (1)].tok) );
        }
    break;

  case 86:

/* Line 1806 of yacc.c  */
#line 511 "cminus.y"
    { 
            (yyval.tree) = (yyvsp[(2) - (3)].tree);
            addChildren( (yyval.tree), 2, (yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree) );
        }
    break;

  case 87:

/* Line 1806 of yacc.c  */
#line 516 "cminus.y"
    { (yyval.tree) = (yyvsp[(1) - (1)].tree); }
    break;

  case 88:

/* Line 1806 of yacc.c  */
#line 521 "cminus.y"
    { 
            (yyval.tree) = makeNode( OpK, Integer, (yyvsp[(1) - (1)].tok)->lineno, NULL, (yyvsp[(1) - (1)].tok) );
        }
    break;

  case 89:

/* Line 1806 of yacc.c  */
#line 525 "cminus.y"
    { 
            (yyval.tree) = makeNode( OpK, Integer, (yyvsp[(1) - (1)].tok)->lineno, NULL, (yyvsp[(1) - (1)].tok) );
        }
    break;

  case 90:

/* Line 1806 of yacc.c  */
#line 529 "cminus.y"
    { 
            (yyval.tree) = makeNode( OpK, Integer, (yyvsp[(1) - (1)].tok)->lineno, NULL, (yyvsp[(1) - (1)].tok) );
        }
    break;

  case 91:

/* Line 1806 of yacc.c  */
#line 536 "cminus.y"
    { 
            (yyval.tree) = (yyvsp[(1) - (2)].tree);
            addChildren( (yyval.tree), 1, (yyvsp[(2) - (2)].tree) );
        }
    break;

  case 92:

/* Line 1806 of yacc.c  */
#line 541 "cminus.y"
    { (yyval.tree) = (yyvsp[(1) - (1)].tree); }
    break;

  case 93:

/* Line 1806 of yacc.c  */
#line 546 "cminus.y"
    { 
            (yyval.tree) = makeNode( OpK, Integer, (yyvsp[(1) - (1)].tok)->lineno, NULL, (yyvsp[(1) - (1)].tok) );
        }
    break;

  case 94:

/* Line 1806 of yacc.c  */
#line 550 "cminus.y"
    { 
            (yyval.tree) = makeNode( OpK, Integer, (yyvsp[(1) - (1)].tok)->lineno, NULL, (yyvsp[(1) - (1)].tok) );
        }
    break;

  case 95:

/* Line 1806 of yacc.c  */
#line 554 "cminus.y"
    { 
            (yyval.tree) = makeNode( OpK, Integer, (yyvsp[(1) - (1)].tok)->lineno, NULL, (yyvsp[(1) - (1)].tok) );
        }
    break;

  case 96:

/* Line 1806 of yacc.c  */
#line 561 "cminus.y"
    { (yyval.tree) = (yyvsp[(1) - (1)].tree); }
    break;

  case 97:

/* Line 1806 of yacc.c  */
#line 563 "cminus.y"
    { (yyval.tree) = (yyvsp[(1) - (1)].tree); }
    break;

  case 98:

/* Line 1806 of yacc.c  */
#line 568 "cminus.y"
    { 
            (yyval.tree) = makeNode( IdK, Void, (yyvsp[(1) - (1)].tok)->lineno, (yyvsp[(1) - (1)].tok)->svalue, (yyvsp[(1) - (1)].tok) );
        }
    break;

  case 99:

/* Line 1806 of yacc.c  */
#line 572 "cminus.y"
    {
            (yyval.tree) = makeNode( IdK, Void, (yyvsp[(1) - (4)].tok)->lineno, (yyvsp[(1) - (4)].tok)->svalue, (yyvsp[(1) - (4)].tok) );
            (yyval.tree)->isArray = true; 
            addChildren( (yyval.tree), 1, (yyvsp[(3) - (4)].tree) );
        }
    break;

  case 100:

/* Line 1806 of yacc.c  */
#line 581 "cminus.y"
    { (yyval.tree) = (yyvsp[(2) - (3)].tree); }
    break;

  case 101:

/* Line 1806 of yacc.c  */
#line 583 "cminus.y"
    { (yyval.tree) = (yyvsp[(1) - (1)].tree); }
    break;

  case 102:

/* Line 1806 of yacc.c  */
#line 585 "cminus.y"
    { (yyval.tree) = (yyvsp[(1) - (1)].tree); }
    break;

  case 103:

/* Line 1806 of yacc.c  */
#line 590 "cminus.y"
    { 
            (yyval.tree) = makeParent( IdK, (yyvsp[(3) - (4)].tree)->nodetype, (yyvsp[(1) - (4)].tok)->lineno, (yyvsp[(1) - (4)].tok)->svalue );
            (yyval.tree)->kind = CallK;
			addChildren((yyval.tree), 1, (yyvsp[(3) - (4)].tree));
		}
    break;

  case 104:

/* Line 1806 of yacc.c  */
#line 599 "cminus.y"
    { (yyval.tree) = (yyvsp[(1) - (1)].tree); }
    break;

  case 105:

/* Line 1806 of yacc.c  */
#line 601 "cminus.y"
    { (yyval.tree) = NULL; }
    break;

  case 106:

/* Line 1806 of yacc.c  */
#line 606 "cminus.y"
    { 
		    (yyval.tree) = linkSiblings(2, (yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree)); 
		}
    break;

  case 107:

/* Line 1806 of yacc.c  */
#line 610 "cminus.y"
    { (yyval.tree) = (yyvsp[(1) - (1)].tree); }
    break;

  case 108:

/* Line 1806 of yacc.c  */
#line 615 "cminus.y"
    { 
            (yyval.tree) = makeNode( ConstK, Integer, (yyvsp[(1) - (1)].tok)->lineno, NULL, (yyvsp[(1) - (1)].tok) );
        }
    break;

  case 109:

/* Line 1806 of yacc.c  */
#line 619 "cminus.y"
    { 
            (yyval.tree) = makeNode( ConstK, Character, (yyvsp[(1) - (1)].tok)->lineno, NULL, (yyvsp[(1) - (1)].tok) );
        }
    break;

  case 110:

/* Line 1806 of yacc.c  */
#line 623 "cminus.y"
    { 
            (yyval.tree) = makeNode( ConstK, Character, (yyvsp[(1) - (1)].tok)->lineno, (yyvsp[(1) - (1)].tok)->svalue, (yyvsp[(1) - (1)].tok) );
        }
    break;

  case 111:

/* Line 1806 of yacc.c  */
#line 627 "cminus.y"
    { 
            (yyval.tree) = makeNode( ConstK, Boolean, (yyvsp[(1) - (1)].tok)->lineno, NULL, (yyvsp[(1) - (1)].tok) );
        }
    break;



/* Line 1806 of yacc.c  */
#line 2508 "cminus.tab.c"
      default: break;
    }
  /* User semantic actions sometimes alter yychar, and that requires
     that yytoken be updated with the new translation.  We take the
     approach of translating immediately before every use of yytoken.
     One alternative is translating here after every semantic action,
     but that translation would be missed if the semantic action invokes
     YYABORT, YYACCEPT, or YYERROR immediately after altering yychar or
     if it invokes YYBACKUP.  In the case of YYABORT or YYACCEPT, an
     incorrect destructor might then be invoked immediately.  In the
     case of YYERROR or YYBACKUP, subsequent parser actions might lead
     to an incorrect destructor call or verbose syntax error message
     before the lookahead is translated.  */
  YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);

  *++yyvsp = yyval;

  /* Now `shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTOKENS] + *yyssp;
  if (0 <= yystate && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTOKENS];

  goto yynewstate;


/*------------------------------------.
| yyerrlab -- here on detecting error |
`------------------------------------*/
yyerrlab:
  /* Make sure we have latest lookahead translation.  See comments at
     user semantic actions for why this is necessary.  */
  yytoken = yychar == YYEMPTY ? YYEMPTY : YYTRANSLATE (yychar);

  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if ! YYERROR_VERBOSE
      yyerror (YY_("syntax error"));
#else
# define YYSYNTAX_ERROR yysyntax_error (&yymsg_alloc, &yymsg, \
                                        yyssp, yytoken)
      {
        char const *yymsgp = YY_("syntax error");
        int yysyntax_error_status;
        yysyntax_error_status = YYSYNTAX_ERROR;
        if (yysyntax_error_status == 0)
          yymsgp = yymsg;
        else if (yysyntax_error_status == 1)
          {
            if (yymsg != yymsgbuf)
              YYSTACK_FREE (yymsg);
            yymsg = (char *) YYSTACK_ALLOC (yymsg_alloc);
            if (!yymsg)
              {
                yymsg = yymsgbuf;
                yymsg_alloc = sizeof yymsgbuf;
                yysyntax_error_status = 2;
              }
            else
              {
                yysyntax_error_status = YYSYNTAX_ERROR;
                yymsgp = yymsg;
              }
          }
        yyerror (yymsgp);
        if (yysyntax_error_status == 2)
          goto yyexhaustedlab;
      }
# undef YYSYNTAX_ERROR
#endif
    }



  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
	 error, discard it.  */

      if (yychar <= YYEOF)
	{
	  /* Return failure if at end of input.  */
	  if (yychar == YYEOF)
	    YYABORT;
	}
      else
	{
	  yydestruct ("Error: discarding",
		      yytoken, &yylval);
	  yychar = YYEMPTY;
	}
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:

  /* Pacify compilers like GCC when the user code never invokes
     YYERROR and the label yyerrorlab therefore never appears in user
     code.  */
  if (/*CONSTCOND*/ 0)
     goto yyerrorlab;

  /* Do not reclaim the symbols of the rule which action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;	/* Each real token shifted decrements this.  */

  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
	{
	  yyn += YYTERROR;
	  if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
	    {
	      yyn = yytable[yyn];
	      if (0 < yyn)
		break;
	    }
	}

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
	YYABORT;


      yydestruct ("Error: popping",
		  yystos[yystate], yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  *++yyvsp = yylval;


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", yystos[yyn], yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;

/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;

#if !defined(yyoverflow) || YYERROR_VERBOSE
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif

yyreturn:
  if (yychar != YYEMPTY)
    {
      /* Make sure we have latest lookahead translation.  See comments at
         user semantic actions for why this is necessary.  */
      yytoken = YYTRANSLATE (yychar);
      yydestruct ("Cleanup: discarding lookahead",
                  yytoken, &yylval);
    }
  /* Do not reclaim the symbols of the rule which action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
		  yystos[*yyssp], yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
#if YYERROR_VERBOSE
  if (yymsg != yymsgbuf)
    YYSTACK_FREE (yymsg);
#endif
  /* Make sure YYID is used.  */
  return YYID (yyresult);
}



/* Line 2067 of yacc.c  */
#line 633 "cminus.y"


int main( int argc, char* argv[] ) {
	
	// FILE * output = stdout;
	int option;
	opterr = 0;
	
	// Flags
	bool test_mode = false;
	bool abstract_tree = false;
	bool annotated_tree = false;
	bool code_generation = false;
	
	// Command line options. Only handles "-d" debug option currently.
	while( (option = getopt(argc, argv, "dpPt")) != EOF ) {
		switch(option) {
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
				test_mode = true;
				break;
			default:
				break;
		}
	}
	
	// Slightly hacky way to get input filename, without using a option
	if( argc > 1 && optind < argc ) {
		yyin = fopen( argv[optind], "r" );
	}

	// Main parsing loop. Goes until end of input
	do {
		yyparse();
	} while (!feof(yyin));
	
	
	// Prints out the entire syntax tree recursivly, from the global root node
	if(abstract_tree) {
		printAbstractTree(syntaxTree, 0);
	}
	
	if(annotated_tree) {
		semanticAnalysis(annotatedTree);
		printAnnotatedTree(annotatedTree);
	}
	
	if(code_generation) {
		// TODO import I/O library
		generateCode();
	}
	
    freeTree(syntaxTree);

	// How many bad things happened. TODO: when do we want to do this, or not?
	printf( "Number of warnings: %d\n", warnings );
	printf( "Number of errors: %d\n", errors );	
	
	fclose(yyin);
	return 0;
}

// Defines yyerror for bison
static void yyerror(const char *msg)
{
	fflush(stdout);
    printf("ERROR(%d): %s\n", yylineno, msg ? msg : "");
}

