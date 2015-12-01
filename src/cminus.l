%{
#include <stdlib.h>
#include <string.h>

#include "cminus.tab.h"
#include "cminus.h"
#include "types.h"
#include "toker.h"
#include "yyerrorHelper.h"

    
// String/Character parsing buffers
char * stringbuffer;	// Holds initial position for stringconst parsing
char * sbuf_ptr;		// keeps track of stringconst parsing
char * literalbuffer;	// Input string buffer for constant processing (strings/chars)
char ctemp = 0;				// Character constant temporary
int clength = 0;
int start_line = 0;

void warnInputChar( const char msg, const int line );
void warnCharLength( const char * msg, const int num_chars, const int line );

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

	/* TODO: return characters as strings? */
";"		{ return cToker(SEMICOLON,  yytext, yylineno, yytext[0]);}
"("		{ return cToker(LPAREN,     yytext, yylineno, yytext[0]);   }
")"		{ return cToker(RPAREN,     yytext, yylineno, yytext[0]);   }
"["		{ return cToker(LBRACKET,   yytext, yylineno, yytext[0]); }
"]"		{ return cToker(RBRACKET,   yytext, yylineno, yytext[0]); }
"|"		{ return cToker(OR,         yytext, yylineno, yytext[0]);       }
"&"		{ return cToker(AND,        yytext, yylineno, yytext[0]);      }
"!"		{ return cToker(NOT,        yytext, yylineno, yytext[0]);      }
"="		{ return cToker(ASSIGN,     yytext, yylineno, yytext[0]);   }
"+"		{ return cToker(PLUS,       yytext, yylineno, yytext[0]);     }
"-"		{ return cToker(MINUS,      yytext, yylineno, yytext[0]);    }
"*"		{ return cToker(MULTIPLY,   yytext, yylineno, yytext[0]); }
"/"		{ return cToker(DIVIDE,     yytext, yylineno, yytext[0]);   }
"%"		{ return cToker(MODULUS,    yytext, yylineno, yytext[0]);  }
"?"		{ return cToker(QUESTION,   yytext, yylineno, yytext[0]); }
"<"		{ return cToker(LTHAN,      yytext, yylineno, yytext[0]);    }
">"		{ return cToker(GTHAN,      yytext, yylineno, yytext[0]);    }
"{"		{ return cToker(LBRACE,     yytext, yylineno, yytext[0]);   }
"}"		{ return cToker(RBRACE,     yytext, yylineno, yytext[0]);   }
","		{ return cToker(COMMA,      yytext, yylineno, yytext[0]);    }
":"		{ return cToker(COLON,      yytext, yylineno, yytext[0]);    }

"+="		{ return sToker(ADDASS,     yytext, yylineno, yytext); }
"-="		{ return sToker(SUBASS,     yytext, yylineno, yytext); }
"*="		{ return sToker(MULASS,     yytext, yylineno, yytext); }
"/="		{ return sToker(DIVASS,     yytext, yylineno, yytext); }
"++"		{ return sToker(INC,        yytext, yylineno, yytext); }
"--"		{ return sToker(DEC,        yytext, yylineno, yytext); }
"<="		{ return sToker(LESSEQ,     yytext, yylineno, yytext); }
">="		{ return sToker(GRTEQ,      yytext, yylineno, yytext); }
"=="		{ return sToker(EQ,         yytext, yylineno, yytext); }
"!="		{ return sToker(NOTEQ,      yytext, yylineno, yytext); }
"static"	{ return sToker(STATIC,     yytext, yylineno, yytext); }
"int"		{ return sToker(INT,        yytext, yylineno, yytext); }
"bool"		{ return sToker(BOOL,       yytext, yylineno, yytext); }
"char"		{ return sToker(CHAR,       yytext, yylineno, yytext); }
"if"		{ return sToker(IF,         yytext, yylineno, yytext); }
"else"		{ return sToker(ELSE,       yytext, yylineno, yytext); }
"while"		{ return sToker(WHILE,      yytext, yylineno, yytext); }
"foreach"	{ return sToker(FOREACH,    yytext, yylineno, yytext); }
"in"		{ return sToker(IN,         yytext, yylineno, yytext); }
"return"	{ return sToker(RETURN,     yytext, yylineno, yytext); }
"break"		{ return sToker(BREAK,      yytext, yylineno, yytext); }

	/* Booleans */
"true"		{ return iToker(BOOLCONST,  yytext, yylineno, 1); }
"false"		{ return iToker(BOOLCONST,  yytext, yylineno, 0); }

	/* Tokens */
{letter}{letdig}*	{ return sToker(ID,         yytext, yylineno, yytext); }
{digit}+		{ return iToker(NUMCONST,   yytext, yylineno, atoi(yytext)); }

	/* String Constants */
\"	{ 
            stringbuffer = (char *)calloc(100, sizeof(char));
            sbuf_ptr = stringbuffer;
            literalbuffer = (char *)calloc(110, sizeof(char)); 
            start_line = yylineno;
            //strcat(literalbuffer, yytext);
            BEGIN(scond); 
	}
<scond>{
	\"  {
		//strcat(literalbuffer, yytext);
		*sbuf_ptr = '\0';
                yytext = strdup(stringbuffer);
                sToker(STRINGCONST, literalbuffer, start_line, stringbuffer);
                free(literalbuffer);
                free(stringbuffer);
                BEGIN(INITIAL);
                return STRINGCONST;
	}
	\n  {
                // TODO: should we be returning on newline?
                //yytext = strdup(stringbuffer);
                warnInputChar('\"', start_line);
                //warnInputChar(yytext[0], yylineno);
                //sToker(STRINGCONST, literalbuffer, yylineno, stringbuffer);                
		free(literalbuffer);
                free(stringbuffer);
		BEGIN(INITIAL);
                //return STRINGCONST;
	}
	\\n { 
		*sbuf_ptr++ = '\n';
		strcat(literalbuffer, yytext);
	}
	\\0 { 
		*sbuf_ptr++ = '\0'; 
		strcat(literalbuffer, yytext);
	}
	\\. { 
		*sbuf_ptr++ = yytext[1]; 
		strcat(literalbuffer, yytext);
	}
	.   { 
		*sbuf_ptr++ = yytext[0]; 
		strcat(literalbuffer, yytext);
	}
}
	
	/* Character Constants  */

\'		{ 
                    // buffer size was causing problems. oh, wish i could use a C++ string...
                    literalbuffer = (char *)calloc(100, sizeof(char)); 
                    //strcat(literalbuffer, yytext);
                    clength = 0;
                    start_line = yylineno;
                    BEGIN(ccond);
		}
<ccond>{
	\'  {
                if( clength < 2 ) // ALL GOOD MATE
                {
                    strcat(literalbuffer, yytext);
                    yytext = strdup(literalbuffer);
                    cToker(CHARCONST, literalbuffer, start_line, ctemp);
                    free(literalbuffer);
                    BEGIN(INITIAL);
                    return CHARCONST;
                }
                else // OH NO, TOO MANY CHARACTERS!
                {
                    //strcat(literalbuffer, yytext);
                    yytext = strdup(literalbuffer);
                    warnCharLength(yytext, clength, yylineno);
                    cToker(CHARCONST, literalbuffer, start_line, ctemp);
                    free(literalbuffer);
                    BEGIN(INITIAL);
                    return CHARCONST;
                }
            }
	\n  {
                warnInputChar('\'', start_line);
                free(literalbuffer);
                BEGIN(INITIAL);
            }
	\\n { 

		if(clength < 1)
                    ctemp = '\n';
		strcat(literalbuffer, yytext);
                clength++;
	}
	\\0 {
		if(clength < 1) 
                    ctemp = '\0'; 
		strcat(literalbuffer, yytext);
                clength++;
	}
	\\. {
		if(clength < 1)
                    ctemp = yytext[1]; 
                strcat(literalbuffer, yytext);
                clength++;
	}
	.   {
		if(clength < 1)            
                    ctemp = yytext[0]; 
		strcat(literalbuffer, yytext);
                clength++;
        }	
}

	/* Eat whitespace */
[ \t]	;

	/* Count lines? */
\n	{  }

	/* If we reach the catch-all, it is an invalid character */
.       { warnInputChar(yytext[0], yylineno); }

%%
        
void warnInputChar( const char msg, const int line )
{
    printf("WARNING(%d): Invalid input character: \'%c\'.  Character ignored.\n", line, msg);
    warnings++;
    fflush(stdout);
    
}

void warnCharLength( const char * msg, const int num_chars, const int line )
{
    printf("WARNING(%d): character is %d characters and not a single character: \'%s\'\n", 
            line, num_chars, msg);
    warnings++;
    fflush(stdout);
}
