/* A Bison parser, made by GNU Bison 3.0.  */

/* Bison interface for Yacc-like parsers in C

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

#ifndef YY_YY_SCANNERTEST_TAB_H_INCLUDED
# define YY_YY_SCANNERTEST_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 1
#endif
#if YYDEBUG
extern int yydebug;
#endif
/* "%code requires" blocks.  */
#line 21 "scannertest.y" /* yacc.c:1909  */

	typedef struct {
		int linenum;
		int num;
		char ch; 
		int ivalue;
		char * svalue;
		char * input;
	} TokenData;

#line 55 "scannertest.tab.h" /* yacc.c:1909  */

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    ID = 258,
    NUMCONST = 259,
    STRINGCONST = 260,
    CHARCONST = 261,
    ERROR = 262,
    BOOLCONST = 263,
    SINGLE = 264,
    ADDASS = 265,
    SUBASS = 266,
    MULASS = 267,
    DIVASS = 268,
    INC = 269,
    DEC = 270,
    LESSEQ = 271,
    GRTEQ = 272,
    EQ = 273,
    NOTEQ = 274,
    STATIC = 275,
    INT = 276,
    BOOL = 277,
    CHAR = 278,
    IF = 279,
    ELSE = 280,
    WHILE = 281,
    FOREACH = 282,
    IN = 283,
    RETURN = 284,
    BREAK = 285
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE YYSTYPE;
union YYSTYPE
{
#line 33 "scannertest.y" /* yacc.c:1909  */

	TokenData tok;

#line 102 "scannertest.tab.h" /* yacc.c:1909  */
};
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_SCANNERTEST_TAB_H_INCLUDED  */
