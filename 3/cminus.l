%{
//#include <string.h>
//#include <stdlib.h>
#include "cminus.tab.h"
#include "cminus.h"
#include "types.h"
#include "toker.h"

/*
int toker(int num, int ival );
int toker(int num, char * val);
int toker(int num, char ch);
int error(const char * msg);

// Handles string constants
int strconst();

// Handles character constants
int cconst();
*/

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

";"			{ return cToker(SEMICOLON,  TokK, Void, yytext, yylineno, yytext[0]);}
"("			{ return cToker(LPAREN,     TokK, Void, yytext, yylineno, yytext[0]);   }
")"			{ return cToker(RPAREN,     TokK, Void, yytext, yylineno, yytext[0]);   }
"["			{ return cToker(LBRACKET,   TokK, Void, yytext, yylineno, yytext[0]); }
"]"			{ return cToker(RBRACKET,   TokK, Void, yytext, yylineno, yytext[0]); }
"|"			{ return cToker(OR,     OpK, Void, yytext, yylineno, yytext[0]);       }
"&"			{ return cToker(AND,    OpK, Void, yytext, yylineno, yytext[0]);      }
"!"			{ return cToker(NOT,    OpK, Void, yytext, yylineno, yytext[0]);      }
"="			{ return cToker(ASSIGN, OpK, Void, yytext, yylineno, yytext[0]);   }
"+"			{ return cToker(PLUS,   OpK, Void, yytext, yylineno, yytext[0]);     }
"-"			{ return cToker(MINUS,  OpK, Void, yytext, yylineno, yytext[0]);    }
"*"			{ return cToker(MULTIPLY,   OpK, Void, yytext, yylineno, yytext[0]); }
"/"			{ return cToker(DIVIDE,     OpK, Void, yytext, yylineno, yytext[0]);   }
"%"			{ return cToker(MODULUS,    OpK, Void, yytext, yylineno, yytext[0]);  }
"?"			{ return cToker(QUESTION,   OpK, Void, yytext, yylineno, yytext[0]); }
"<"			{ return cToker(LTHAN,  OpK, Void, yytext, yylineno, yytext[0]);    }
">"			{ return cToker(GTHAN,  OpK, Void, yytext, yylineno, yytext[0]);    }
"{"			{ return cToker(LBRACE,     TokK, Void, yytext, yylineno, yytext[0]);   }
"}"			{ return cToker(RBRACE,     TokK, Void, yytext, yylineno, yytext[0]);   }
","			{ return cToker(COMMA,  TokK, Void, yytext, yylineno, yytext[0]);    }
":"			{ return cToker(COLON,  TokK, Void, yytext, yylineno, yytext[0]);    }



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
"+="		{ return sToker(ADDASS, OpK, Void, yytext, yylineno, yytext); }
"-="		{ return sToker(SUBASS, OpK, Void, yytext, yylineno, yytext); }
"*="		{ return sToker(MULASS, OpK, Void, yytext, yylineno, yytext); }
"/="		{ return sToker(DIVASS, OpK, Void, yytext, yylineno, yytext); }
"++"		{ return sToker(INC,    OpK, Void, yytext, yylineno, yytext); }
"--"		{ return sToker(DEC,    OpK, Void, yytext, yylineno, yytext); }
"<="		{ return sToker(LESSEQ, OpK, Void, yytext, yylineno, yytext); }
">="		{ return sToker(GRTEQ,  OpK, Void, yytext, yylineno, yytext); }
"=="		{ return sToker(EQ,     OpK, Void, yytext, yylineno, yytext); }
"!="		{ return sToker(NOTEQ,  OpK, Void, yytext, yylineno, yytext); }
"static"	{ return sToker(STATIC, TokK, Void, yytext, yylineno, yytext); }
"int"		{ return sToker(INT,    VarK, Integer, yytext, yylineno, yytext); }
"bool"		{ return sToker(BOOL,   VarK, Boolean, yytext, yylineno, yytext); }
"char"		{ return sToker(CHAR,   VarK, Character, yytext, yylineno, yytext); }
"if"		{ return sToker(IF,     IfK, Void, yytext, yylineno, yytext); }
"else"		{ return sToker(ELSE,   TokK, Void, yytext, yylineno, yytext); }
"while"		{ return sToker(WHILE,  WhileK, Void, yytext, yylineno, yytext); }
"foreach"	{ return sToker(FOREACH,ForeachK, Void, yytext, yylineno, yytext); }
"in"		{ return sToker(IN,     TokK, Void, yytext, yylineno, yytext); }
"return"	{ return sToker(RETURN, ReturnK, Void, yytext, yylineno, yytext); }
"break"		{ return sToker(BREAK,  BreakK, Void, yytext, yylineno, yytext); }

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
"true"		{ return iToker(BOOLCONST, TokK, Boolean, yytext, yylineno, 1); }
"false"		{ return iToker(BOOLCONST, TokK, Boolean, yytext, yylineno, 0); }

    /*
    "true"		{ return toker(BOOLCONST, 1); }
    "false"		{ return toker(BOOLCONST, 0); }
    */

	/* Tokens */
{letter}{letdig}*		{ return sToker(ID, IdK, Void, yytext, yylineno, yytext); }
{digit}+				{ return iToker(NUMCONST, ConstK, Integer, yytext, yylineno, atoi(yytext)); }

    /*
    {letter}{letdig}*		{ return toker(ID, yytext); }
    {digit}+				{ return toker(NUMCONST, atoi(yytext)); }
    */

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
		//return strconst();
        return sToker(STRINGCONST, ConstK, Void, literalbuffer, yylineno, stringbuffer);
	}
	\n 	{
		free(literalbuffer);
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
		//return cconst();
        return cToker(CHARCONST, ConstK, Character, literalbuffer, yylineno, ctemp);
	}
	\n 	{
		free(literalbuffer);
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
/*
// Rebuilt toker to use unified TreeNode type. TokenData is stored inside nodes.
int toker(int num, int ival ) {
	yylval.tree = allocNode();
	yylval.tree->lineno = yylineno;
	yylval.tree->token.num = num;
	yylval.tree->value = num;
	yylval.tree->token.input = strdup(yytext);
	yylval.tree->token.ivalue = ival;
	return num;
}


int toker(int num, char * val) {
	yylval.tree = allocNode();
	yylval.tree->lineno = yylineno;
	yylval.tree->token.num = num;
	yylval.tree->value = num;
	yylval.tree->token.input = strdup(yytext);
	yylval.tree->token.svalue = strdup(val);
	return num;
}

// Yet Another toker Clone, for Characters (YAtCC)
int toker(int num, char ch) {
	yylval.tree = allocNode();
	yylval.tree->lineno = yylineno;
	yylval.tree->token.num = num;
	yylval.tree->value = num;
	yylval.tree->token.input = strdup(yytext);
	yylval.tree->token.ch = ch;
	return num;
}

int error(const char * msg) {
	yylval.tree = allocNode();
	yylval.tree->lineno = yylineno;
	yylval.tree->token.num = ERROR;
	yylval.tree->value = ERROR;
	yylval.tree->token.input = strdup(yytext);
	yylval.tree->token.svalue = strdup(msg);
	return ERROR;
}

int strconst() {
	yylval.tree = allocNode();
	yylval.tree->lineno = yylineno;
	yylval.tree->token.num = STRINGCONST;
	yylval.tree->value = STRINGCONST;
	yylval.tree->token.input = strdup(literalbuffer);
	yylval.tree->token.svalue = strdup(stringbuffer);
	free(literalbuffer);
	free(stringbuffer);
	return STRINGCONST;
}

int cconst() {
	yylval.tree = allocNode();
	yylval.tree->lineno = yylineno;
	yylval.tree->token.num = CHARCONST;
	yylval.tree->value = CHARCONST;
	yylval.tree->token.input = strdup(literalbuffer);
	yylval.tree->token.ch = ctemp;
	free(literalbuffer);
	return CHARCONST;
}
*/
