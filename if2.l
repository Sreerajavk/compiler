ALPHA [A-Za-z]
DIGIT [0-9]
%%
[ \t\n]
if                return IF;
then                return THEN;
{DIGIT}+            return NUM;
{ALPHA}({ALPHA}|{DIGIT})*         return ID;
"<="                return LE;
">="                return GE;
"=="                return EQ;
"!="                return NE;
"||"                return OR;
"&&"                return AND;
.                return yytext[0];
%%     