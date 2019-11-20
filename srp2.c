
#include<stdlib.h>
#include<stdio.h>
#include<string.h>
char arr[50] , stk[50] , act[40];
int n;
void check(){

    for(int j=0;j<n;j++){
        if(stk[j]=='i' && stk[j+1]=='d'){

                stk[j] = 'E';
                stk[j+1] = '\0';
                printf("Reduce using E->id\n");
        }
    }
}

int main()
{
    scanf("%s" , arr);
    n = strlen(arr);
    int i,j;
    strcpy(act , "SHIFT");
    printf("statck\tinput\taction");
     printf("$\t%s" , arr);
    for(i=0,j=0;i<n;i++,j++)
    {
       printf("\t%s",act);
       stk[i] = arr[j];
       stk[i+1] = '\0';
       arr[j] = ' ';
       printf("\n$%s\t%s$\t" , stk , arr );
       check();
    }
    check();
}