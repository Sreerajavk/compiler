
number [0-9]*
%{
    #include<stdlib.h>
    #include "y.tab.h"
%}

%%

{number} {yylval = atoi(yytext); return DIGIT;}
[\t] {;}
\n return 0;
. return yytext[0];

%%

int yywrap(){ return -1;}