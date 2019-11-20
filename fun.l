number [0-9]+
id [_a-zA-Z][_a-zA-Z0-9]*
%{
    #include<stdlib.h>
    #include "y.tab.h"
%}

%%
return {return RETURN;}
int |
float |
char |
void  {printf("%s is Type\n",yytext);return TYPE;}

{id} {
    {printf("%s is Identifier\n",yytext);return ID;}
}
{number} {printf("%s is Number\n",yytext);return NUM;}
[ \t\n] 
[()}{] {printf("%s is symbol\n" , yytext);return yytext[0];}
. return *yytext;
%%

int yywrap(){return 0;}
