#include <stdio.h>

int main() {
    int num, i;
    int fact = 1;  // Variable to store factorial

    printf("Enter a number: ");
    scanf("%d", &num);

    for(i = 1; i <= num; i++) {
        fact = fact * i;  // Multiply fact by each number from 1 to num
    }

    printf("Factorial of %d = %d\n", num, fact);

    return 0;
}
