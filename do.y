%{
    #include<stdlib.h>
    #include<stdio.h>
    int yylex(void);
    void yyerror(char *s);
    extern FILE *yyin;
%}

%token ID DO WHILE NUM REL
%right '='
%left '+' '-'
%left '>' '<'int yylex(void);


%%
  

s : do {printf("Correct syntax\n");}
    ;

do : DO '{' statements '}' WHILE '(' expr ')' ';'
    ;

statements : statement ';' statements
            |
            ;

statement : E {printf("expression on statement");}
            |

            ;

E : ID '=' E {printf("expression found\n");}
  | E '+' E 
  | E '-' E 
  | ID 
  | NUM

expr : expr '>' expr
      | expr '<' expr
      | expr REL expr
      | ID
      | NUM
%%

void yyerror(char* s){
    printf("parse error\n"); #include "y.tab.h"
    exit(0);

}

int  main(int argc , char* argv[] )
{
    yyin = fopen(argv[1],"r");
    yyparse();
    return 0;
}
