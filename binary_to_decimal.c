#include <stdio.h>
#include <math.h>

int main() {
    int binary, decimal = 0, base = 1, lastDigit;

    printf("Enter a binary number: ");
    scanf("%d", &binary);

    while (binary > 0) {
        lastDigit = binary % 10;
        decimal = decimal + lastDigit * base;
        binary = binary / 10;
        base = base * 2;
    }

    printf("Decimal equivalent = %d\n", decimal);

    return 0;
}
