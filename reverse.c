#include <stdio.h>

int main() {
    int num, reversed = 0;

    printf("Enter a number: ");
    scanf("%d", &num);

    while(num != 0) {
        int digit = num % 10;  // Extract the last digit
        reversed = reversed * 10 + digit;  // Build the reversed number
        num = num / 10;  // Remove the last digit from num
    }

    printf("Reversed number = %d", reversed);

    return 0;
}
