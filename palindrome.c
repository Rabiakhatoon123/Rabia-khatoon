#include<stdio.h>
int main(){
    int num,original_number,reverse_number=0,remainder;
    
    printf("enter the number");
    scanf("%d",&num);
    original_number=num;
        while (num!=0){
         remainder=num%10;
         reverse_number=reverse_number*10+remainder;
         num /=10;
        }
           if (original_number==reverse_number){
            printf("%d  is palindrome",original_number);
           }
        else{
        printf("%d not a palindrome number",original_number);
        }
    return 0;
}



