
%{
    #include<stdlib.h>
    #include<stdio.h>
    int yylex(void);
    void yyerror(char *s);
    extern FILE *yyin;
%}

%start s
%right '='
%left '+' '-'
%left '*' '/'
%token TYPE ID RETURN NUM
%%
s   : fun {printf("Correct syntax\n");}
    ;
fun  : TYPE ID '(' param ')' '{' statements '}'
        ;
param : param ',' TYPE ID
        | TYPE ID {printf("one argument\n");}
        |
        ;

statements : statement ';' statements
            | 
            ;
statement :  param
    | RETURN E 
    | E {printf("one expression\n");}
    
    ;

E : ID '=' E
    | E '+' E
    | E '-' E
    | E '*' E
    | E '/' E
    | ID
    | NUM
    ;

%%

void yyerror(char* s){
    printf("parse error\n");
    exit(0);

}

int  main(int argc , char* argv[] )
{
    yyin = fopen(argv[1],"r");
    yyparse();
    return 0;
}
