/*
BEFORE REMOVING LEFT RECURSION
E –> E + T | T
T –> T * F | F
F –> ( E ) | id	
AFTER REMOVING LEFT RECURSION
E –> T E’
E’ –> + T E’ | e
T –> F T’
T’ –> * F T’ | e
F –> ( E ) | id
*/
#include<stdio.h>
#include<ctype.h>
#include<string.h>
void Tprime();
void Eprime();
void E();
void F();
void T();
char expression[10];
int count, flag;
int main()
{
    count = 0;
    flag = 0;
    printf("\nEnter an Algebraic Expression:\t");
    scanf("%s", expression);
    E();
    if((strlen(expression) == count) && (flag == 0))
    {
        printf("\nThe Expression %s is Valid\n", expression);
    }
    else
    {
        printf("\nThe Expression %s is Invalid\n", expression);
    }
}
void E()
{
    T();
    Eprime();
}
void T()
{
    F();
    Tprime();
}
void Tprime()
{
    if(expression[count] == '*')
    {
        count++;
        F();
        Tprime();
    }
}
void F()
{
    if(isalnum(expression[count]))
    {
    count++;
    }
    else if(expression[count] == '(')
    {
        count++;
        E();
        if(expression[count] == ')')
        {
            count++;
        }
        else
        {
            flag = 1;
        }
    }
    else
    {
        flag = 1;
    }
}
void Eprime()
{
    if(expression[count] == '+')
    {
    count++;
    T();
    Eprime();
    }
}