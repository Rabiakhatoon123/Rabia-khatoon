#include <stdio.h>


    int main() {
        int num1,num2,num3;
        printf("enter the first number:");
        scanf("%d",&num1);
        printf("enter the second number");
        scanf("%d",&num2);
        printf("enter the third number");
        scanf("%d",&num3);
    

        if(num1>num2&&num1>num3){
            printf("largest number is %d",num1);

        }
        else if(num2>num1&&num2>num3){
            printf("largest number is %d",num2);

        }
        else{
             printf("largest number is %d",num3);
        }
        return 0;

    }
    