/* A Bison parser, made by GNU Bison 3.0.2.  */

/* Bison implementation for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2013 Free Software Foundation, Inc.

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
#define YYBISON_VERSION "3.0.2"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1




/* Copy the first part of user declarations.  */
#line 1 "cminus.y" /* yacc.c:339  */

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


#line 102 "cminus.tab.c" /* yacc.c:339  */

# ifndef YY_NULLPTR
#  if defined __cplusplus && 201103L <= __cplusplus
#   define YY_NULLPTR nullptr
#  else
#   define YY_NULLPTR 0
#  endif
# endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 0
#endif

/* In a future release of Bison, this section will be replaced
   by #include "cminus.tab.h".  */
#ifndef YY_YY_CMINUS_TAB_H_INCLUDED
# define YY_YY_CMINUS_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 1
#endif
#if YYDEBUG
extern int yydebug;
#endif
/* "%code requires" blocks.  */
#line 37 "cminus.y" /* yacc.c:355  */

	#define MAXCHILDREN 3
	#include "types.h"
	#include "cminus.h"
    #include "toker.h"

#line 139 "cminus.tab.c" /* yacc.c:355  */

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
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

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE YYSTYPE;
union YYSTYPE
{
#line 48 "cminus.y" /* yacc.c:355  */

    TokenData * tok;
	TreeNode * tree;

#line 207 "cminus.tab.c" /* yacc.c:355  */
};
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_CMINUS_TAB_H_INCLUDED  */

/* Copy the second part of user declarations.  */

#line 222 "cminus.tab.c" /* yacc.c:358  */

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
#else
typedef signed char yytype_int8;
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
# elif ! defined YYSIZE_T
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
#   define YY_(Msgid) dgettext ("bison-runtime", Msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(Msgid) Msgid
# endif
#endif

#ifndef YY_ATTRIBUTE
# if (defined __GNUC__                                               \
      && (2 < __GNUC__ || (__GNUC__ == 2 && 96 <= __GNUC_MINOR__)))  \
     || defined __SUNPRO_C && 0x5110 <= __SUNPRO_C
#  define YY_ATTRIBUTE(Spec) __attribute__(Spec)
# else
#  define YY_ATTRIBUTE(Spec) /* empty */
# endif
#endif

#ifndef YY_ATTRIBUTE_PURE
# define YY_ATTRIBUTE_PURE   YY_ATTRIBUTE ((__pure__))
#endif

#ifndef YY_ATTRIBUTE_UNUSED
# define YY_ATTRIBUTE_UNUSED YY_ATTRIBUTE ((__unused__))
#endif

#if !defined _Noreturn \
     && (!defined __STDC_VERSION__ || __STDC_VERSION__ < 201112)
# if defined _MSC_VER && 1200 <= _MSC_VER
#  define _Noreturn __declspec (noreturn)
# else
#  define _Noreturn YY_ATTRIBUTE ((__noreturn__))
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(E) ((void) (E))
#else
# define YYUSE(E) /* empty */
#endif

#if defined __GNUC__ && 407 <= __GNUC__ * 100 + __GNUC_MINOR__
/* Suppress an incorrect diagnostic about yylval being uninitialized.  */
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN \
    _Pragma ("GCC diagnostic push") \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")\
    _Pragma ("GCC diagnostic ignored \"-Wmaybe-uninitialized\"")
# define YY_IGNORE_MAYBE_UNINITIALIZED_END \
    _Pragma ("GCC diagnostic pop")
#else
# define YY_INITIAL_VALUE(Value) Value
#endif
#ifndef YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_END
#endif
#ifndef YY_INITIAL_VALUE
# define YY_INITIAL_VALUE(Value) /* Nothing. */
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
#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
      /* Use EXIT_SUCCESS as a witness for stdlib.h.  */
#     ifndef EXIT_SUCCESS
#      define EXIT_SUCCESS 0
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's 'empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (0)
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
#   if ! defined malloc && ! defined EXIT_SUCCESS
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined EXIT_SUCCESS
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
# define YYSTACK_RELOCATE(Stack_alloc, Stack)                           \
    do                                                                  \
      {                                                                 \
        YYSIZE_T yynewbytes;                                            \
        YYCOPY (&yyptr->Stack_alloc, Stack, yysize);                    \
        Stack = &yyptr->Stack_alloc;                                    \
        yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAXIMUM; \
        yyptr += yynewbytes / sizeof (*yyptr);                          \
      }                                                                 \
    while (0)

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from SRC to DST.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(Dst, Src, Count) \
      __builtin_memcpy (Dst, Src, (Count) * sizeof (*(Src)))
#  else
#   define YYCOPY(Dst, Src, Count)              \
      do                                        \
        {                                       \
          YYSIZE_T yyi;                         \
          for (yyi = 0; yyi < (Count); yyi++)   \
            (Dst)[yyi] = (Src)[yyi];            \
        }                                       \
      while (0)
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
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  174

/* YYTRANSLATE[YYX] -- Symbol number corresponding to YYX as returned
   by yylex, with out-of-bounds checking.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   305

#define YYTRANSLATE(YYX)                                                \
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[TOKEN-NUM] -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex, without out-of-bounds checking.  */
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
  /* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   107,   107,   115,   117,   122,   124,   129,   141,   152,
     156,   161,   166,   175,   179,   190,   197,   202,   206,   210,
     217,   222,   230,   233,   237,   241,   246,   256,   260,   265,
     269,   277,   279,   284,   286,   288,   290,   292,   294,   296,
     301,   303,   305,   310,   318,   323,   331,   339,   347,   355,
     363,   371,   374,   378,   381,   385,   387,   392,   396,   404,
     411,   417,   422,   427,   432,   437,   442,   447,   452,   457,
     462,   467,   472,   477,   482,   487,   492,   496,   500,   504,
     508,   512,   519,   524,   529,   533,   540,   545,   550,   554,
     558,   565,   570,   575,   579,   583,   590,   592,   597,   601,
     610,   612,   614,   619,   627,   630,   634,   638,   643,   647,
     651,   655
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || 0
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
  "mutable", "immutable", "call", "args", "arg-list", "constant", YY_NULLPTR
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[NUM] -- (External) token number corresponding to the
   (internal) symbol number NUM (which must be that of a token).  */
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

#define YYPACT_NINF -116

#define yypact_value_is_default(Yystate) \
  (!!((Yystate) == (-116)))

#define YYTABLE_NINF -1

#define yytable_value_is_error(Yytable_value) \
  0

  /* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
     STATE-NUM.  */
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

  /* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
     Performed when YYTABLE does not specify something else to do.  Zero
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

  /* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
     positive, shift that token.  If negative, reduce the rule whose
     number is the opposite.  If YYTABLE_NINF, syntax error.  */
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

  /* YYR2[YYN] -- Number of symbols on the right hand side of rule YYN.  */
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


#define yyerrok         (yyerrstatus = 0)
#define yyclearin       (yychar = YYEMPTY)
#define YYEMPTY         (-2)
#define YYEOF           0

#define YYACCEPT        goto yyacceptlab
#define YYABORT         goto yyabortlab
#define YYERROR         goto yyerrorlab


#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)                                  \
do                                                              \
  if (yychar == YYEMPTY)                                        \
    {                                                           \
      yychar = (Token);                                         \
      yylval = (Value);                                         \
      YYPOPSTACK (yylen);                                       \
      yystate = *yyssp;                                         \
      goto yybackup;                                            \
    }                                                           \
  else                                                          \
    {                                                           \
      yyerror (YY_("syntax error: cannot back up")); \
      YYERROR;                                                  \
    }                                                           \
while (0)

/* Error token number */
#define YYTERROR        1
#define YYERRCODE       256



/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)                        \
do {                                            \
  if (yydebug)                                  \
    YYFPRINTF Args;                             \
} while (0)

/* This macro is provided for backward compatibility. */
#ifndef YY_LOCATION_PRINT
# define YY_LOCATION_PRINT(File, Loc) ((void) 0)
#endif


# define YY_SYMBOL_PRINT(Title, Type, Value, Location)                    \
do {                                                                      \
  if (yydebug)                                                            \
    {                                                                     \
      YYFPRINTF (stderr, "%s ", Title);                                   \
      yy_symbol_print (stderr,                                            \
                  Type, Value); \
      YYFPRINTF (stderr, "\n");                                           \
    }                                                                     \
} while (0)


/*----------------------------------------.
| Print this symbol's value on YYOUTPUT.  |
`----------------------------------------*/

static void
yy_symbol_value_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
{
  FILE *yyo = yyoutput;
  YYUSE (yyo);
  if (!yyvaluep)
    return;
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# endif
  YYUSE (yytype);
}


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

static void
yy_symbol_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
{
  YYFPRINTF (yyoutput, "%s %s (",
             yytype < YYNTOKENS ? "token" : "nterm", yytname[yytype]);

  yy_symbol_value_print (yyoutput, yytype, yyvaluep);
  YYFPRINTF (yyoutput, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

static void
yy_stack_print (yytype_int16 *yybottom, yytype_int16 *yytop)
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)                            \
do {                                                            \
  if (yydebug)                                                  \
    yy_stack_print ((Bottom), (Top));                           \
} while (0)


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

static void
yy_reduce_print (yytype_int16 *yyssp, YYSTYPE *yyvsp, int yyrule)
{
  unsigned long int yylno = yyrline[yyrule];
  int yynrhs = yyr2[yyrule];
  int yyi;
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %lu):\n",
             yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr,
                       yystos[yyssp[yyi + 1 - yynrhs]],
                       &(yyvsp[(yyi + 1) - (yynrhs)])
                                              );
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)          \
do {                                    \
  if (yydebug)                          \
    yy_reduce_print (yyssp, yyvsp, Rule); \
} while (0)

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
#ifndef YYINITDEPTH
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
static YYSIZE_T
yystrlen (const char *yystr)
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
static char *
yystpcpy (char *yydest, const char *yysrc)
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
  YYSIZE_T yysize0 = yytnamerr (YY_NULLPTR, yytname[yytoken]);
  YYSIZE_T yysize = yysize0;
  enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
  /* Internationalized format string. */
  const char *yyformat = YY_NULLPTR;
  /* Arguments of yyformat. */
  char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
  /* Number of reported tokens (one for the "unexpected", one per
     "expected"). */
  int yycount = 0;

  /* There are many possibilities here to consider:
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
                {
                  YYSIZE_T yysize1 = yysize + yytnamerr (YY_NULLPTR, yytname[yyx]);
                  if (! (yysize <= yysize1
                         && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
                    return 2;
                  yysize = yysize1;
                }
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

  {
    YYSIZE_T yysize1 = yysize + yystrlen (yyformat);
    if (! (yysize <= yysize1 && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
      return 2;
    yysize = yysize1;
  }

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

static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep)
{
  YYUSE (yyvaluep);
  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YYUSE (yytype);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}




/* The lookahead symbol.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;
/* Number of syntax errors so far.  */
int yynerrs;


/*----------.
| yyparse.  |
`----------*/

int
yyparse (void)
{
    int yystate;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus;

    /* The stacks and their tools:
       'yyss': related to states.
       'yyvs': related to semantic values.

       Refer to the stacks through separate pointers, to allow yyoverflow
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
  int yytoken = 0;
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

  yyssp = yyss = yyssa;
  yyvsp = yyvs = yyvsa;
  yystacksize = YYINITDEPTH;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY; /* Cause a token to be read.  */
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
      yychar = yylex ();
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
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END

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
     '$$ = $1'.

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
#line 108 "cminus.y" /* yacc.c:1646  */
    { 
            (yyval.tree) = (yyvsp[0].tree); 
            syntaxTree = (yyval.tree); 
        }
#line 1454 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 3:
#line 116 "cminus.y" /* yacc.c:1646  */
    { (yyval.tree) = linkSiblings((yyvsp[-1].tree), (yyvsp[0].tree)); }
#line 1460 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 4:
#line 118 "cminus.y" /* yacc.c:1646  */
    { (yyval.tree) = (yyvsp[0].tree); }
#line 1466 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 5:
#line 123 "cminus.y" /* yacc.c:1646  */
    { (yyval.tree) = (yyvsp[0].tree); }
#line 1472 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 6:
#line 125 "cminus.y" /* yacc.c:1646  */
    { (yyval.tree) = (yyvsp[0].tree); }
#line 1478 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 7:
#line 130 "cminus.y" /* yacc.c:1646  */
    { 
            //$$ = makeParent( VarK, $1->nodetype, $1->lineno, $2->svalue );
            (yyval.tree) = (yyvsp[-1].tree);
            applyTypeToSiblings((yyval.tree), (yyvsp[-2].tree)->nodetype);
            //addChildren($$, 1, $2);

        }
#line 1490 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 8:
#line 142 "cminus.y" /* yacc.c:1646  */
    { 
            //$$ = makeParent( VarK, $1->nodetype, $1->lineno, NULL);
            (yyval.tree) = (yyvsp[-1].tree);
            if((yyvsp[-2].tree)->isStatic) { (yyval.tree)->isStatic = true; }
            applyTypeToSiblings((yyval.tree), (yyvsp[-2].tree)->nodetype);
            (yyval.tree)->isScoped = true; 
        }
#line 1502 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 9:
#line 153 "cminus.y" /* yacc.c:1646  */
    {
            (yyval.tree) = linkSiblings((yyvsp[-2].tree), (yyvsp[0].tree));
        }
#line 1510 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 10:
#line 157 "cminus.y" /* yacc.c:1646  */
    { (yyval.tree) = (yyvsp[0].tree); }
#line 1516 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 11:
#line 162 "cminus.y" /* yacc.c:1646  */
    { 
            (yyval.tree) = (yyvsp[0].tree);
            //$$->nodekind = VarK;
        }
#line 1525 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 12:
#line 167 "cminus.y" /* yacc.c:1646  */
    {
            (yyval.tree) = (yyvsp[-2].tree);
            //$$->nodekind = VarK;
            addChildren( (yyval.tree), 1, (yyvsp[0].tree) );
        }
#line 1535 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 13:
#line 176 "cminus.y" /* yacc.c:1646  */
    { 
            (yyval.tree) = makeNode( VarK, Void, (yyvsp[0].tok)->lineno, (yyvsp[0].tok)->svalue, (yyvsp[0].tok) );
        }
#line 1543 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 14:
#line 180 "cminus.y" /* yacc.c:1646  */
    { 
            (yyval.tree) = makeParent( VarK, Void, (yyvsp[-3].tok)->lineno, (yyvsp[-3].tok)->svalue );
            (yyval.tree)->isArray = true;
            //addChildren( $$, 1, $3 );
        }
#line 1553 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 15:
#line 191 "cminus.y" /* yacc.c:1646  */
    { 
            //$$ = makeParent( TypeK, $2->nodetype, $2->lineno, NULL);
            (yyval.tree) = (yyvsp[0].tree);
            (yyval.tree)->isStatic = true; 
            (yyval.tree)->isScoped = true;
           }
#line 1564 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 16:
#line 198 "cminus.y" /* yacc.c:1646  */
    { (yyval.tree) = (yyvsp[0].tree); }
#line 1570 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 17:
#line 203 "cminus.y" /* yacc.c:1646  */
    { 
            (yyval.tree) = makeNode( TypeK, Integer, (yyvsp[0].tok)->lineno, NULL, (yyvsp[0].tok) );
        }
#line 1578 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 18:
#line 207 "cminus.y" /* yacc.c:1646  */
    { 
            (yyval.tree) = makeNode( TypeK, Boolean, (yyvsp[0].tok)->lineno, NULL, (yyvsp[0].tok) );
        }
#line 1586 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 19:
#line 211 "cminus.y" /* yacc.c:1646  */
    { 
            (yyval.tree) = makeNode( TypeK, Character, (yyvsp[0].tok)->lineno, NULL, (yyvsp[0].tok) );
        }
#line 1594 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 20:
#line 218 "cminus.y" /* yacc.c:1646  */
    { 
            (yyval.tree) = makeParent( FunK, (yyvsp[-5].tree)->nodetype, (yyvsp[-4].tok)->lineno, (yyvsp[-4].tok)->svalue );
			addChildren( (yyval.tree), 2, (yyvsp[-2].tree), (yyvsp[0].tree) );
		}
#line 1603 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 21:
#line 223 "cminus.y" /* yacc.c:1646  */
    { 
            (yyval.tree) = makeParent( FunK, Void, (yyvsp[-4].tok)->lineno, (yyvsp[-4].tok)->svalue );
			addChildren( (yyval.tree), 2, (yyvsp[-2].tree), (yyvsp[0].tree));
		}
#line 1612 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 22:
#line 231 "cminus.y" /* yacc.c:1646  */
    { (yyval.tree) = (yyvsp[0].tree); }
#line 1618 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 23:
#line 233 "cminus.y" /* yacc.c:1646  */
    { (yyval.tree) = NULL; }
#line 1624 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 24:
#line 238 "cminus.y" /* yacc.c:1646  */
    {  
			(yyval.tree) = linkSiblings((yyvsp[-2].tree), (yyvsp[0].tree));
		}
#line 1632 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 25:
#line 242 "cminus.y" /* yacc.c:1646  */
    { (yyval.tree) = (yyvsp[0].tree); }
#line 1638 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 26:
#line 247 "cminus.y" /* yacc.c:1646  */
    { 
            //$$ = makeParent( ParamK, $1->nodetype, $1->lineno, $2->token->svalue );
            (yyval.tree) = (yyvsp[0].tree);
            applyTypeToSiblings((yyval.tree), (yyvsp[-1].tree)->nodetype);
            //addChildren( $$, 1, $2 );
		}
#line 1649 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 27:
#line 257 "cminus.y" /* yacc.c:1646  */
    { 
            (yyval.tree) = linkSiblings((yyvsp[-2].tree), (yyvsp[0].tree));
        }
#line 1657 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 28:
#line 261 "cminus.y" /* yacc.c:1646  */
    { (yyval.tree) = (yyvsp[0].tree); }
#line 1663 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 29:
#line 266 "cminus.y" /* yacc.c:1646  */
    { 
            (yyval.tree) = makeNode( ParamK, Void, (yyvsp[0].tok)->lineno, (yyvsp[0].tok)->svalue, (yyvsp[0].tok) );
        }
#line 1671 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 30:
#line 270 "cminus.y" /* yacc.c:1646  */
    { 
            (yyval.tree) = makeNode( ParamK, Void, (yyvsp[-2].tok)->lineno, (yyvsp[-2].tok)->svalue, (yyvsp[-2].tok) );
            (yyval.tree)->isArray = true; 
        }
#line 1680 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 31:
#line 278 "cminus.y" /* yacc.c:1646  */
    { (yyval.tree) = (yyvsp[0].tree); }
#line 1686 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 32:
#line 280 "cminus.y" /* yacc.c:1646  */
    { (yyval.tree) = (yyvsp[0].tree); }
#line 1692 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 33:
#line 285 "cminus.y" /* yacc.c:1646  */
    { (yyval.tree) = (yyvsp[0].tree); }
#line 1698 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 34:
#line 287 "cminus.y" /* yacc.c:1646  */
    { (yyval.tree) = (yyvsp[0].tree); }
#line 1704 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 35:
#line 289 "cminus.y" /* yacc.c:1646  */
    { (yyval.tree) = (yyvsp[0].tree); }
#line 1710 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 36:
#line 291 "cminus.y" /* yacc.c:1646  */
    { (yyval.tree) = (yyvsp[0].tree); }
#line 1716 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 37:
#line 293 "cminus.y" /* yacc.c:1646  */
    { (yyval.tree) = (yyvsp[0].tree); }
#line 1722 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 38:
#line 295 "cminus.y" /* yacc.c:1646  */
    { (yyval.tree) = (yyvsp[0].tree); }
#line 1728 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 39:
#line 297 "cminus.y" /* yacc.c:1646  */
    { (yyval.tree) = (yyvsp[0].tree); }
#line 1734 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 40:
#line 302 "cminus.y" /* yacc.c:1646  */
    { (yyval.tree) = (yyvsp[0].tree); }
#line 1740 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 41:
#line 304 "cminus.y" /* yacc.c:1646  */
    { (yyval.tree) = (yyvsp[0].tree); }
#line 1746 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 42:
#line 306 "cminus.y" /* yacc.c:1646  */
    { (yyval.tree) = (yyvsp[0].tree); }
#line 1752 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 43:
#line 311 "cminus.y" /* yacc.c:1646  */
    { 
            (yyval.tree) = makeParent( IfK, Void, (yyvsp[-6].tok)->lineno, NULL );
            addChildren( (yyval.tree), 3, (yyvsp[-4].tree), (yyvsp[-2].tree), (yyvsp[0].tree) );
        }
#line 1761 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 44:
#line 319 "cminus.y" /* yacc.c:1646  */
    { 
            (yyval.tree) = makeParent( IfK, Void, (yyvsp[-4].tok)->lineno, NULL );
            addChildren( (yyval.tree), 2, (yyvsp[-2].tree), (yyvsp[0].tree) );
        }
#line 1770 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 45:
#line 324 "cminus.y" /* yacc.c:1646  */
    { 
            (yyval.tree) = makeParent( IfK, Void, (yyvsp[-6].tok)->lineno, NULL );
            addChildren( (yyval.tree), 3, (yyvsp[-4].tree), (yyvsp[-2].tree), (yyvsp[0].tree) );
        }
#line 1779 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 46:
#line 332 "cminus.y" /* yacc.c:1646  */
    { 
            (yyval.tree) = makeParent( WhileK, Void, (yyvsp[-4].tok)->lineno, NULL );
            addChildren( (yyval.tree), 2, (yyvsp[-2].tree), (yyvsp[0].tree) );
        }
#line 1788 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 47:
#line 340 "cminus.y" /* yacc.c:1646  */
    { 
            (yyval.tree) = makeParent( WhileK, Void, (yyvsp[-4].tok)->lineno, NULL );
            addChildren( (yyval.tree), 2, (yyvsp[-2].tree), (yyvsp[0].tree) );
        }
#line 1797 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 48:
#line 348 "cminus.y" /* yacc.c:1646  */
    { 
            (yyval.tree) = makeParent( ForeachK, Void, (yyvsp[-6].tok)->lineno, NULL );
            addChildren( (yyval.tree), 3, (yyvsp[-4].tree), (yyvsp[-2].tree), (yyvsp[0].tree) );
        }
#line 1806 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 49:
#line 356 "cminus.y" /* yacc.c:1646  */
    { 
            (yyval.tree) = makeParent( ForeachK, Void, (yyvsp[-6].tok)->lineno, NULL );
            addChildren( (yyval.tree), 3, (yyvsp[-4].tree), (yyvsp[-2].tree), (yyvsp[0].tree) );
        }
#line 1815 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 50:
#line 364 "cminus.y" /* yacc.c:1646  */
    { 
            (yyval.tree) = makeParent( CompoundK, Void, (yyvsp[-3].tok)->lineno, NULL );
            addChildren( (yyval.tree), 2, (yyvsp[-2].tree), (yyvsp[-1].tree) );
        }
#line 1824 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 51:
#line 372 "cminus.y" /* yacc.c:1646  */
    { (yyval.tree) = linkSiblings((yyvsp[-1].tree), (yyvsp[0].tree)); }
#line 1830 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 52:
#line 374 "cminus.y" /* yacc.c:1646  */
    { (yyval.tree) = NULL; }
#line 1836 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 53:
#line 379 "cminus.y" /* yacc.c:1646  */
    { (yyval.tree) = linkSiblings((yyvsp[-1].tree), (yyvsp[0].tree)); }
#line 1842 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 54:
#line 381 "cminus.y" /* yacc.c:1646  */
    { (yyval.tree) = NULL; }
#line 1848 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 55:
#line 386 "cminus.y" /* yacc.c:1646  */
    { (yyval.tree) = (yyvsp[-1].tree); /* does expression occur at semicolon for line counting? */ }
#line 1854 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 56:
#line 388 "cminus.y" /* yacc.c:1646  */
    { (yyval.tree) = NULL; }
#line 1860 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 57:
#line 393 "cminus.y" /* yacc.c:1646  */
    { 
            (yyval.tree) = makeNode( ReturnK, Void, (yyvsp[-1].tok)->lineno, NULL, (yyvsp[-1].tok) );     
        }
#line 1868 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 58:
#line 397 "cminus.y" /* yacc.c:1646  */
    {
            (yyval.tree) = makeNode( ReturnK, (yyvsp[-1].tree)->nodetype, (yyvsp[-2].tok)->lineno, NULL, (yyvsp[-2].tok) );     
            addChildren( (yyval.tree), 1, (yyvsp[-1].tree) );
        }
#line 1877 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 59:
#line 405 "cminus.y" /* yacc.c:1646  */
    { 
            (yyval.tree) = makeNode( BreakK, Void, (yyvsp[-1].tok)->lineno, NULL, (yyvsp[-1].tok) );     
        }
#line 1885 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 60:
#line 412 "cminus.y" /* yacc.c:1646  */
    { 
            (yyval.tree) = makeNode( OpK, Void, (yyvsp[-1].tok)->lineno, NULL, (yyvsp[-1].tok) );     
            //$$ = $2;
            addChildren( (yyval.tree), 2, (yyvsp[-2].tree), (yyvsp[0].tree) );
        }
#line 1895 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 61:
#line 418 "cminus.y" /* yacc.c:1646  */
    { 
            (yyval.tree) = makeNode( OpK, Void, (yyvsp[-1].tok)->lineno, NULL, (yyvsp[-1].tok) );     
            addChildren( (yyval.tree), 2, (yyvsp[-2].tree), (yyvsp[0].tree) );
        }
#line 1904 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 62:
#line 423 "cminus.y" /* yacc.c:1646  */
    { 
            (yyval.tree) = makeNode( OpK, Void, (yyvsp[-1].tok)->lineno, NULL, (yyvsp[-1].tok) );     
            addChildren( (yyval.tree), 2, (yyvsp[-2].tree), (yyvsp[0].tree) );
        }
#line 1913 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 63:
#line 428 "cminus.y" /* yacc.c:1646  */
    { 
            (yyval.tree) = makeNode( OpK, Void, (yyvsp[-1].tok)->lineno, NULL, (yyvsp[-1].tok) );     
            addChildren( (yyval.tree), 2, (yyvsp[-2].tree), (yyvsp[0].tree) );
        }
#line 1922 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 64:
#line 433 "cminus.y" /* yacc.c:1646  */
    { 
            (yyval.tree) = makeNode( OpK, Void, (yyvsp[-1].tok)->lineno, NULL, (yyvsp[-1].tok) );     
            addChildren( (yyval.tree), 2, (yyvsp[-2].tree), (yyvsp[0].tree) );
        }
#line 1931 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 65:
#line 438 "cminus.y" /* yacc.c:1646  */
    { 
            (yyval.tree) = makeNode( OpK, Integer, (yyvsp[0].tok)->lineno, NULL, (yyvsp[0].tok) );     
            addChildren( (yyval.tree), 1, (yyvsp[-1].tree) );
        }
#line 1940 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 66:
#line 443 "cminus.y" /* yacc.c:1646  */
    { 
            (yyval.tree) = makeNode( OpK, Integer, (yyvsp[0].tok)->lineno, NULL, (yyvsp[0].tok) );     
            addChildren( (yyval.tree), 1, (yyvsp[-1].tree) );
        }
#line 1949 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 67:
#line 448 "cminus.y" /* yacc.c:1646  */
    { (yyval.tree) = (yyvsp[0].tree); }
#line 1955 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 68:
#line 453 "cminus.y" /* yacc.c:1646  */
    { 
            (yyval.tree) = makeNode( OpK, Boolean, (yyvsp[-1].tok)->lineno, NULL, (yyvsp[-1].tok) );     
            addChildren( (yyval.tree), 2, (yyvsp[-2].tree), (yyvsp[0].tree) );
        }
#line 1964 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 69:
#line 458 "cminus.y" /* yacc.c:1646  */
    { (yyval.tree) = (yyvsp[0].tree); }
#line 1970 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 70:
#line 463 "cminus.y" /* yacc.c:1646  */
    { 
            (yyval.tree) = makeNode( OpK, Boolean, (yyvsp[-1].tok)->lineno, NULL, (yyvsp[-1].tok) );     
            addChildren( (yyval.tree), 2, (yyvsp[-2].tree), (yyvsp[0].tree) );
        }
#line 1979 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 71:
#line 468 "cminus.y" /* yacc.c:1646  */
    { (yyval.tree) = (yyvsp[0].tree); }
#line 1985 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 72:
#line 473 "cminus.y" /* yacc.c:1646  */
    { 
            (yyval.tree) = makeNode( OpK, Boolean, (yyvsp[-1].tok)->lineno, NULL, (yyvsp[-1].tok) );     
            addChildren( (yyval.tree), 1, (yyvsp[0].tree) );
        }
#line 1994 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 73:
#line 478 "cminus.y" /* yacc.c:1646  */
    { (yyval.tree) = (yyvsp[0].tree); }
#line 2000 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 74:
#line 483 "cminus.y" /* yacc.c:1646  */
    { 
            (yyval.tree) = (yyvsp[-1].tree);
            addChildren( (yyval.tree), 2, (yyvsp[-2].tree), (yyvsp[0].tree) );
        }
#line 2009 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 75:
#line 488 "cminus.y" /* yacc.c:1646  */
    { (yyval.tree) = (yyvsp[0].tree); }
#line 2015 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 76:
#line 493 "cminus.y" /* yacc.c:1646  */
    { 
            (yyval.tree) = makeNode( OpK, Boolean, (yyvsp[0].tok)->lineno, NULL, (yyvsp[0].tok) );
        }
#line 2023 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 77:
#line 497 "cminus.y" /* yacc.c:1646  */
    { 
            (yyval.tree) = makeNode( OpK, Boolean, (yyvsp[0].tok)->lineno, NULL, (yyvsp[0].tok) );
        }
#line 2031 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 78:
#line 501 "cminus.y" /* yacc.c:1646  */
    { 
            (yyval.tree) = makeNode( OpK, Boolean, (yyvsp[0].tok)->lineno, NULL, (yyvsp[0].tok) );
        }
#line 2039 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 79:
#line 505 "cminus.y" /* yacc.c:1646  */
    { 
            (yyval.tree) = makeNode( OpK, Boolean, (yyvsp[0].tok)->lineno, NULL, (yyvsp[0].tok) );
        }
#line 2047 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 80:
#line 509 "cminus.y" /* yacc.c:1646  */
    { 
            (yyval.tree) = makeNode( OpK, Boolean, (yyvsp[0].tok)->lineno, NULL, (yyvsp[0].tok) );
        }
#line 2055 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 81:
#line 513 "cminus.y" /* yacc.c:1646  */
    { 
            (yyval.tree) = makeNode( OpK, Boolean, (yyvsp[0].tok)->lineno, NULL, (yyvsp[0].tok) );
        }
#line 2063 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 82:
#line 520 "cminus.y" /* yacc.c:1646  */
    { 
            (yyval.tree) = (yyvsp[-1].tree);
            addChildren( (yyval.tree), 2, (yyvsp[-2].tree), (yyvsp[0].tree) );
        }
#line 2072 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 83:
#line 525 "cminus.y" /* yacc.c:1646  */
    { (yyval.tree) = (yyvsp[0].tree); }
#line 2078 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 84:
#line 530 "cminus.y" /* yacc.c:1646  */
    { 
            (yyval.tree) = makeNode( OpK, Integer, (yyvsp[0].tok)->lineno, NULL, (yyvsp[0].tok) );
        }
#line 2086 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 85:
#line 534 "cminus.y" /* yacc.c:1646  */
    { 
            (yyval.tree) = makeNode( OpK, Integer, (yyvsp[0].tok)->lineno, NULL, (yyvsp[0].tok) );
        }
#line 2094 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 86:
#line 541 "cminus.y" /* yacc.c:1646  */
    { 
            (yyval.tree) = (yyvsp[-1].tree);
            addChildren( (yyval.tree), 2, (yyvsp[-2].tree), (yyvsp[0].tree) );
        }
#line 2103 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 87:
#line 546 "cminus.y" /* yacc.c:1646  */
    { (yyval.tree) = (yyvsp[0].tree); }
#line 2109 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 88:
#line 551 "cminus.y" /* yacc.c:1646  */
    { 
            (yyval.tree) = makeNode( OpK, Integer, (yyvsp[0].tok)->lineno, NULL, (yyvsp[0].tok) );
        }
#line 2117 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 89:
#line 555 "cminus.y" /* yacc.c:1646  */
    { 
            (yyval.tree) = makeNode( OpK, Integer, (yyvsp[0].tok)->lineno, NULL, (yyvsp[0].tok) );
        }
#line 2125 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 90:
#line 559 "cminus.y" /* yacc.c:1646  */
    { 
            (yyval.tree) = makeNode( OpK, Integer, (yyvsp[0].tok)->lineno, NULL, (yyvsp[0].tok) );
        }
#line 2133 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 91:
#line 566 "cminus.y" /* yacc.c:1646  */
    { 
            (yyval.tree) = (yyvsp[-1].tree);
            addChildren( (yyval.tree), 1, (yyvsp[0].tree) );
        }
#line 2142 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 92:
#line 571 "cminus.y" /* yacc.c:1646  */
    { (yyval.tree) = (yyvsp[0].tree); }
#line 2148 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 93:
#line 576 "cminus.y" /* yacc.c:1646  */
    { 
            (yyval.tree) = makeNode( OpK, Integer, (yyvsp[0].tok)->lineno, NULL, (yyvsp[0].tok) );
        }
#line 2156 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 94:
#line 580 "cminus.y" /* yacc.c:1646  */
    { 
            (yyval.tree) = makeNode( OpK, Integer, (yyvsp[0].tok)->lineno, NULL, (yyvsp[0].tok) );
        }
#line 2164 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 95:
#line 584 "cminus.y" /* yacc.c:1646  */
    { 
            (yyval.tree) = makeNode( OpK, Integer, (yyvsp[0].tok)->lineno, NULL, (yyvsp[0].tok) );
        }
#line 2172 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 96:
#line 591 "cminus.y" /* yacc.c:1646  */
    { (yyval.tree) = (yyvsp[0].tree); }
#line 2178 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 97:
#line 593 "cminus.y" /* yacc.c:1646  */
    { (yyval.tree) = (yyvsp[0].tree); }
#line 2184 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 98:
#line 598 "cminus.y" /* yacc.c:1646  */
    { 
            (yyval.tree) = makeNode( IdK, Void, (yyvsp[0].tok)->lineno, (yyvsp[0].tok)->svalue, (yyvsp[0].tok) );
        }
#line 2192 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 99:
#line 602 "cminus.y" /* yacc.c:1646  */
    {
            (yyval.tree) = makeNode( IdK, Void, (yyvsp[-3].tok)->lineno, (yyvsp[-3].tok)->svalue, (yyvsp[-3].tok) );
            (yyval.tree)->isArray = true; 
            addChildren( (yyval.tree), 1, (yyvsp[-1].tree) );
        }
#line 2202 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 100:
#line 611 "cminus.y" /* yacc.c:1646  */
    { (yyval.tree) = (yyvsp[-1].tree); }
#line 2208 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 101:
#line 613 "cminus.y" /* yacc.c:1646  */
    { (yyval.tree) = (yyvsp[0].tree); }
#line 2214 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 102:
#line 615 "cminus.y" /* yacc.c:1646  */
    { (yyval.tree) = (yyvsp[0].tree); }
#line 2220 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 103:
#line 620 "cminus.y" /* yacc.c:1646  */
    { 
            (yyval.tree) = makeNode( CallK, (yyvsp[-1].tree)->nodetype, (yyvsp[-3].tok)->lineno, (yyvsp[-3].tok)->svalue, (yyvsp[-3].tok) );
			addChildren((yyval.tree), 1, (yyvsp[-1].tree));
		}
#line 2229 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 104:
#line 628 "cminus.y" /* yacc.c:1646  */
    { (yyval.tree) = (yyvsp[0].tree); }
#line 2235 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 105:
#line 630 "cminus.y" /* yacc.c:1646  */
    { (yyval.tree) = NULL; }
#line 2241 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 106:
#line 635 "cminus.y" /* yacc.c:1646  */
    { 
		    (yyval.tree) = linkSiblings((yyvsp[-2].tree), (yyvsp[0].tree)); 
		}
#line 2249 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 107:
#line 639 "cminus.y" /* yacc.c:1646  */
    { (yyval.tree) = (yyvsp[0].tree); }
#line 2255 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 108:
#line 644 "cminus.y" /* yacc.c:1646  */
    { 
            (yyval.tree) = makeNode( ConstK, Integer, (yyvsp[0].tok)->lineno, NULL, (yyvsp[0].tok) );
        }
#line 2263 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 109:
#line 648 "cminus.y" /* yacc.c:1646  */
    { 
            (yyval.tree) = makeNode( ConstK, Character, (yyvsp[0].tok)->lineno, NULL, (yyvsp[0].tok) );
        }
#line 2271 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 110:
#line 652 "cminus.y" /* yacc.c:1646  */
    { 
            (yyval.tree) = makeNode( ConstK, Character, (yyvsp[0].tok)->lineno, (yyvsp[0].tok)->svalue, (yyvsp[0].tok) );
        }
#line 2279 "cminus.tab.c" /* yacc.c:1646  */
    break;

  case 111:
#line 656 "cminus.y" /* yacc.c:1646  */
    { 
            (yyval.tree) = makeNode( ConstK, Boolean, (yyvsp[0].tok)->lineno, NULL, (yyvsp[0].tok) );
        }
#line 2287 "cminus.tab.c" /* yacc.c:1646  */
    break;


#line 2291 "cminus.tab.c" /* yacc.c:1646  */
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

  /* Now 'shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTOKENS] + *yyssp;
  if (0 <= yystate && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTOKENS];

  goto yynewstate;


/*--------------------------------------.
| yyerrlab -- here on detecting error.  |
`--------------------------------------*/
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

  /* Do not reclaim the symbols of the rule whose action triggered
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
  yyerrstatus = 3;      /* Each real token shifted decrements this.  */

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

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END


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

#if !defined yyoverflow || YYERROR_VERBOSE
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
  /* Do not reclaim the symbols of the rule whose action triggered
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
  return yyresult;
}
#line 662 "cminus.y" /* yacc.c:1906  */


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
	
    if(test_mode) {
        dumpTree(syntaxTree);
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
