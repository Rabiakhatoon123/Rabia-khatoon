#include <stdio.h>

int main() {
    int num, i;
    int isPrime = 1;  // Assume number is prime

    printf("Enter a number: ");
    scanf("%d", &num);

    if (num <= 1) {
        isPrime = 0;  // Numbers less than or equal to 1 are not prime
    }

    for(i = 2; i < num; i++) {  // Start from 2 to less than num
        if(num % i == 0) {
            isPrime = 0;  // If divisible by any number other than 1 and itself
            break;
        }
    }

    if (isPrime == 1)
        printf("%d is a prime number.\n", num);
    else
        printf("%d is not a prime number.\n", num);

    return 0;
}
