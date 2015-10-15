%{
//#include <string.h>
//#include <stdlib.h>
#include "cminus.tab.h"
#include "cminus.h"
#include "types.h"
#include "toker.h"

// String/Character parsing buffers
char * stringbuffer;
char * sbuf_ptr;
char * literalbuffer;
char ctemp;
int clength = 0;

%}

%option yylineno
%option noyywrap

letter 		[a-zA-Z]
digit		[0-9]
letdig		({digit}|{letter})
character	([^'])|(\\[^n])
stringbody	([^"])|(\\[^n])

%x scond
%x ccond

%%

	/* Eat single line comments */
"//".*\n 	{ }

";"			{ return cToker(SEMICOLON,  yytext, yylineno, yytext[0]);}
"("			{ return cToker(LPAREN,     yytext, yylineno, yytext[0]);   }
")"			{ return cToker(RPAREN,     yytext, yylineno, yytext[0]);   }
"["			{ return cToker(LBRACKET,   yytext, yylineno, yytext[0]); }
"]"			{ return cToker(RBRACKET,   yytext, yylineno, yytext[0]); }
"|"			{ return cToker(OR,     yytext, yylineno, yytext[0]);       }
"&"			{ return cToker(AND,    yytext, yylineno, yytext[0]);      }
"!"			{ return cToker(NOT,    yytext, yylineno, yytext[0]);      }
"="			{ return cToker(ASSIGN, yytext, yylineno, yytext[0]);   }
"+"			{ return cToker(PLUS,   yytext, yylineno, yytext[0]);     }
"-"			{ return cToker(MINUS,  yytext, yylineno, yytext[0]);    }
"*"			{ return cToker(MULTIPLY,   yytext, yylineno, yytext[0]); }
"/"			{ return cToker(DIVIDE,     yytext, yylineno, yytext[0]);   }
"%"			{ return cToker(MODULUS,    yytext, yylineno, yytext[0]);  }
"?"			{ return cToker(QUESTION,   yytext, yylineno, yytext[0]); }
"<"			{ return cToker(LTHAN,  yytext, yylineno, yytext[0]);    }
">"			{ return cToker(GTHAN,  yytext, yylineno, yytext[0]);    }
"{"			{ return cToker(LBRACE,     yytext, yylineno, yytext[0]);   }
"}"			{ return cToker(RBRACE,     yytext, yylineno, yytext[0]);   }
","			{ return cToker(COMMA,  yytext, yylineno, yytext[0]);    }
":"			{ return cToker(COLON,  yytext, yylineno, yytext[0]);    }



    /*
    ";"			{ return toker(SEMICOLON, yytext[0]); }
    "("			{ return toker(LPAREN, yytext[0]); }
    ")"			{ return toker(RPAREN, yytext[0]); }
    "["			{ return toker(LBRACKET, yytext[0]); }
    "]"			{ return toker(RBRACKET, yytext[0]); }
    "|"			{ return toker(OR, yytext[0]); }
    "&"			{ return toker(AND, yytext[0]); }
    "!"			{ return toker(NOT, yytext[0]); }
    "="			{ return toker(ASSIGN, yytext[0]); }
    "+"			{ return toker(PLUS, yytext[0]); }
    "-"			{ return toker(MINUS, yytext[0]); }
    "*"			{ return toker(MULTIPLY, yytext[0]); }
    "/"			{ return toker(DIVIDE, yytext[0]); }
    "%"			{ return toker(MODULUS, yytext[0]); }
    "?"			{ return toker(QUESTION, yytext[0]); }
    "<"			{ return toker(LTHAN, yytext[0]); }
    ">"			{ return toker(GTHAN, yytext[0]); }
    "{"			{ return toker(LBRACE, yytext[0]); }
    "}"			{ return toker(RBRACE, yytext[0]); }
    ","			{ return toker(COMMA, yytext[0]); }
    ":"			{ return toker(COLON, yytext[0]); }
    */

	    /* Unary ops */
"+="		{ return sToker(ADDASS, yytext, yylineno, yytext); }
"-="		{ return sToker(SUBASS, yytext, yylineno, yytext); }
"*="		{ return sToker(MULASS, yytext, yylineno, yytext); }
"/="		{ return sToker(DIVASS, yytext, yylineno, yytext); }
"++"		{ return sToker(INC,    yytext, yylineno, yytext); }
"--"		{ return sToker(DEC,    yytext, yylineno, yytext); }
"<="		{ return sToker(LESSEQ, yytext, yylineno, yytext); }
">="		{ return sToker(GRTEQ,  yytext, yylineno, yytext); }
"=="		{ return sToker(EQ,     yytext, yylineno, yytext); }
"!="		{ return sToker(NOTEQ,  yytext, yylineno, yytext); }
"static"	{ return sToker(STATIC, yytext, yylineno, yytext); }
"int"		{ return sToker(INT,    yytext, yylineno, yytext); }
"bool"		{ return sToker(BOOL,   yytext, yylineno, yytext); }
"char"		{ return sToker(CHAR,   yytext, yylineno, yytext); }
"if"		{ return sToker(IF,     yytext, yylineno, yytext); }
"else"		{ return sToker(ELSE,   yytext, yylineno, yytext); }
"while"		{ return sToker(WHILE,  yytext, yylineno, yytext); }
"foreach"	{ return sToker(FOREACH,yytext, yylineno, yytext); }
"in"		{ return sToker(IN,     yytext, yylineno, yytext); }
"return"	{ return sToker(RETURN, yytext, yylineno, yytext); }
"break"		{ return sToker(BREAK,  yytext, yylineno, yytext); }

    /*
    "+="		{ return toker(ADDASS, yytext); }
    "-="		{ return toker(SUBASS, yytext); }
    "*="		{ return toker(MULASS, yytext); }
    "/="		{ return toker(DIVASS, yytext); }
    "++"		{ return toker(INC, yytext); }
    "--"		{ return toker(DEC, yytext); }
    "<="		{ return toker(LESSEQ, yytext); }
    ">="		{ return toker(GRTEQ, yytext); }
    "=="		{ return toker(EQ, yytext); }
    "!="		{ return toker(NOTEQ, yytext); }
    "static"	{ return toker(STATIC, yytext); }
    "int"		{ return toker(INT, yytext); }
    "bool"		{ return toker(BOOL, yytext); }
    "char"		{ return toker(CHAR, yytext); }
    "if"		{ return toker(IF, yytext); }
    "else"		{ return toker(ELSE, yytext); }
    "while"		{ return toker(WHILE, yytext); }
    "foreach"	{ return toker(FOREACH, yytext); }
    "in"		{ return toker(IN, yytext); }
    "return"	{ return toker(RETURN, yytext); }
    "break"		{ return toker(BREAK, yytext); }
    */


	/* Booleans */
"true"		{ return iToker(BOOLCONST, yytext, yylineno, 1); }
"false"		{ return iToker(BOOLCONST, yytext, yylineno, 0); }

    /*
    "true"		{ return toker(BOOLCONST, 1); }
    "false"		{ return toker(BOOLCONST, 0); }
    */

	/* Tokens */
{letter}{letdig}*	{ return sToker(ID,         yytext, yylineno, yytext); }
{digit}+			{ return iToker(NUMCONST,   yytext, yylineno, atoi(yytext)); }

	/* String Constants */
	/* TODO: proper errors */
\"			{ 
				stringbuffer = (char *)calloc(100, sizeof(char));
				sbuf_ptr = stringbuffer;
				literalbuffer = (char *)calloc(110, sizeof(char)); 
				strcat(literalbuffer, yytext);
				BEGIN(scond); 
			}
<scond>{
	\"	{
		strcat(literalbuffer, yytext);
		*sbuf_ptr = '\0';
		BEGIN(INITIAL);
        return sToker(STRINGCONST, literalbuffer, yylineno, stringbuffer);
	}
	\n 	{
		/* free(literalbuffer); */
		BEGIN(INITIAL);
		return error(yytext, yylineno, "Invalid input character");
	}
	\\n { 
		*sbuf_ptr++ = '\n';
		strcat(literalbuffer, yytext);
	}
	\\0 { 
		*sbuf_ptr++ = '\0'; 
		strcat(literalbuffer, yytext);
	}
	\\.	{ 
		*sbuf_ptr++ = yytext[1]; 
		strcat(literalbuffer, yytext);
	}
	.	{ 
		*sbuf_ptr++ = yytext[0]; 
		strcat(literalbuffer, yytext);
	}
}
	
	/* Character Constants  */
	/* TODO: ensure proper length checking */
	/* TODO: proper errors */

\'		{ 
			literalbuffer = (char *)calloc(5, sizeof(char));
			strcat(literalbuffer, yytext);
			clength = 0;
			BEGIN(ccond);
		}
<ccond>{
	\'	{
		strcat(literalbuffer, yytext);
		BEGIN(INITIAL);
        return cToker(CHARCONST, literalbuffer, yylineno, ctemp);
	}
	\n 	{
		/* free(literalbuffer); */
		BEGIN(INITIAL);
		return error(yytext, yylineno, "Invalid input character");
	}
	\\n { 
		ctemp = '\n';
		strcat(literalbuffer, yytext);
	}
	\\0 { 
		ctemp = '\0'; 
		strcat(literalbuffer, yytext);
	}
	\\.	{ 
		ctemp = yytext[1]; 
		strcat(literalbuffer, yytext);
	}
	.	{ 
		ctemp = yytext[0]; 
		strcat(literalbuffer, yytext);
	}	
}

	/* Eat whitespace */
[ \t]		;

	/* Count lines? */
\n			{  }

	/* Shouldn't reach here. Unless its a invalid token. Then we print. */
.			{ return error(yytext, yylineno, "Invalid input character"); }

%%

