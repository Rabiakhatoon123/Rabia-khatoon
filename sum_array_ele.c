#include <stdio.h>

int main() {
    int N, i, sum=0;

    // Ask the user for the size of the array
    printf("Enter the size of the array (N): ");
    scanf("%d", &N);

    int arr[N]; // Declare an array of size N

    // Ask the user to input elements of the array
    printf("Enter %d elements of the array:\n", N);
    for(i = 0; i < N; i++) {
        scanf("%d", &arr[i]);
    }
     for(i = 0; i < N; i++) {
        sum=sum+arr[i];
        
    }
    printf("sum is %d", sum);
   

}    
     