digit [0-9]
letter [A-Za-z]
identifier {letter}({letter}|{digit})*
%{
    int lineno;
    int count;
%}

%%
int |
return {printf("%s is a Key word\n" , yytext);}
{identifier} {printf("%s is identifier\n" , yytext);}
{identifier}\( {printf("%s is a function\n" , yytext);}
\{ {printf("block begins");}
\} {printf("block ends");}
({digit})* {printf("%s is a digit\n" , yytext);}
= {printf("%s is an assignment operator\n" , yytext);}
[ ] {}
%%

int main(int argc  ,    char *argv[]){
    yyin = fopen(argv[1] , "r");
    yylex();
    fclose(yyin);
    printf("%d" , count);
    return 0;
}