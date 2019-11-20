number [0-9]+
id [_a-zA-Z][_a-zA-Z0-9]*
rel ("<="|">="|"=="|"!=")
%{
    #include<stdlib.h>
    #include "y.tab.h"
%}


%%  
do {
    printf("%s is Do\n" , yytext);
    return DO;
}
while {
    printf("%s is while\n" , yytext);
    return WHILE;
}

{rel} {
    printf("%s is Relation operator\n" , yytext);
    return REL;
}

{id} {
    printf("%s is identifier\n" , yytext);
    return ID;
}

{number} {
    printf("%s is number\n" , yytext);
    return NUM;
}

[ \t\n] 
[}{();] {
    return yytext[0];
}
. return yytext[0];
%%


int yywrap(){return 0;}