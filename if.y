%{
    #include<stdlib.h>
    #include<stdio.h>
    int yylex(void);
    void yyerror(char *s);
%}

%token IF ELSE  IDEN NUM LE GE EE
%start s
%right '='
%left '>' '<'
%left '+' '-'
%left '*' '/'
%%

    s : st {printf("syntax is correct");}
      ;
    st : IF'('E2')''{'stmt'}' {printf("statement");}
        | IF'('E2')''{'stmt'}'ELSE'{'stmt'}'
    
        ;
    stmt : E | st   
          ;
    E : IDEN'='E
        | E'+'E
        | E'-'E
        | E'*'E
        | E'/'E
        | E'>'E
         | E'<'E
         | E LE E
         | E GE E
         | E EE E
        |IDEN
        |NUM
       ;

    E2 : E'>'E
         | E'<'E
         | E LE E
         | E GE E
         | E EE E
         | IDEN
         | NUM
         ;
    

%%


int main()
{
    printf("Enter the statement\n");
    yyparse();
    return 0;
}

void yyerror(char *s)
{
    printf("parsing error");

}