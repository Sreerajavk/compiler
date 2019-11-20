
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<ctype.h>
int isKeyWord(char buffer[])
{
    char key[5][10] = {"int","float","break","for","if"};
    int i=0;
    for(i=0;i<5;i++)
    {
        if(strcmp(buffer , key[i])==0)
            return 1;
    }
    return 0;
}

int main()
{
    FILE *f;
    int j=0;
    char buffer[100],ch,op[]="+-*/%=",num[100];
    f = fopen("sample.txt" , "r");

    while((ch = fgetc(f)) != EOF)
    {
        for(int i=0;i<6;i++){
            if(op[i]==ch)
                printf("%c is a operator\n" , ch);
        }
        if(isalpha(ch))
        {
            buffer[j++] = ch;

        }
        else if (ch == ' '| ch== '\n' && j!=0)
        {
            buffer[j++] = '\0';
            j=0;
            if(isKeyWord(buffer) == 1){
                printf("%s is a key word\n" , buffer);
            }
            else
            {
                printf("%s is an identifier\n",buffer);
            }
            

        }
        else if(isdigit(ch)){
            int k=0;
            // printf("%c\n" , ch);
            int flag=1;
            while(flag){
                    // printf("in\n");
                    if(ch==';' || ch==' ')
                        flag = 0;
                    else
                        num[k++] = ch;
                  ch = fgetc(f);
                //   printf("%c\n" , ch);

            }
            num[k] = '\0';
            printf("%s is a number\n" , num);

        }
}
return 0;
}