%{
    #include<stdlib.h>
    #include<stdio.h>
    int yylex(void);
    void yyerror(char *s);
%}

%start s
%token DIGIT 
%left '+' '-'
%left '*' '/'

%%
    s : E {printf("%d" , $$);}
      ;
    E : E '+' E {$$=$1+$3;}
      ;
    E : E '-' E {$$=$1-$3;}
      ;
    E : E '*' E {$$=$1*$3;}
      ;
    E : E '/' E {$$=$1/$3;}
      ;
    E : '(' E ')' {$$=$2;}
      ;
    E : DIGIT {$$ = $1;}
      ;
%%

void yyerror(char *s){
    printf("invalid statement %s" , s);
    exit(0);
}

int main(){
    yyparse();
    return 0;
}
