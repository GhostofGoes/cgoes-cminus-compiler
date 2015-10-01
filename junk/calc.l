%{
#include <stdlib.h>
#include "calc.tab.h"

%}

%option yylineno
%option noyywrap
 
%%
[Tt] {yylval.lvalue = 1; return T; }
[Ff] {yylval.lvalue = 0; return F; }
\"[^"]*\" {yylval.svalue = strdup(yytext); printf("<<%s>>\n", yytext);return STRING; }
"|"    { return OR;      }
"&"    { return AND;     }
"+"|"^" { return XOR;     }
"!"    { return NOT;     }
"->"   { return IMPLIES; }
"if"   { return IF;      }
"then" { return THEN;    }
"else" { return ELSE;    }
"quit" { return QUIT;    }
[a-z]  {yylval.varindex = yytext[0] - 'a'; return NAME; }
[ \t]  ;
\n   { return yytext[0]; }
.    { return yytext[0]; }
%%
