digit [0-9]+
alpha [a-zA-Z]+
iden [a-zA-Z][a-zA-Z0-9_]*
%{
    #include<stdlib.h>
    #include<stdio.h>
    #include "y.tab.h"
%}




%%

[ ]  {printf("space or tab\n");}
if {printf("if\n");return IF;}
else return ELSE;
{iden} {printf("identifier\n");return IDEN;}
{digit} {printf("number\n");return NUM;}
"<=" return LE;
">=" return GE;
"==" return EE;
. return yytext[0];
%%

int yywrap()
{
    return 1;
}