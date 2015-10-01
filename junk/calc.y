%{ 
#include <stdio.h>
#include <stdlib.h>

int vars[26];

extern int yylex();

#define YYERROR_VERBOSE
void yyerror(const char *msg)
{
      printf("ERROR(PARSER): %s\n", msg);
}
%}

%union {
        int lvalue;
        char *svalue;
        int varindex;
}

%token <lvalue> T
%token <lvalue> F
%token <varindex> NAME
%token <svalue> STRING
%token OR AND XOR IMPLIES NOT IF THEN ELSE QUIT

%type <lvalue> assign
%type <lvalue> iterm
%type <lvalue> oterm
%type <lvalue> aterm
%type <lvalue> varortf
%%
statementlist : statement statementlist
              | statement 
              ;

statement : assign '\n'      { printf("ANS: %s\n", $1 ? "T" : "F");  }
          | STRING '\n'      { printf("*%s*\n", $1 ); }
          | QUIT '\n'        { exit(0); }
          ;

assign : NAME '=' assign     { vars[$1] = $3; $$ = $3; }
       | iterm               { $$ = $1; }
       ;

iterm : iterm IMPLIES oterm  { $$ = (1-$1) | $3; }
      | oterm                { $$ = $1; }
      ;

oterm: oterm OR aterm        { $$ = $1 | $3; }
    | oterm XOR aterm        { $$ = $1 ^ $3; }
    | aterm                  { $$ = $1; }
    ;

aterm : aterm AND varortf    { $$ = $1 & $3; }
     | varortf               { $$ = $1; }
     ;

varortf : T                  { $$ = $1; }
        | F                  { $$ = $1; }
        | NAME               { $$ = vars[$1]; }
        | '(' assign ')'     { $$ = $2; }
        | '(' IF assign THEN assign ELSE assign ')' { $$ = ($3 ? $5 : $7); }
        | '(' IF assign THEN assign ')'             { $$ = ($3 ? $5 : 0); }
        | NOT varortf        { $$ =  (1-$2); }
        ;

%%

main()
{
        int i;

        for (i=0; i<26; i++) vars[i] = 0;
        yyparse();
}
