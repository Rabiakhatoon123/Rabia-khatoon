#include <stdio.h>

int main() {
    int num1, num2, temp1, temp2, hcf, lcm;

    // Input the two numbers
    printf("Enter the first number: ");
    scanf("%d", &num1);
    printf("Enter the second number: ");
    scanf("%d", &num2);

    // Store the original numbers for LCM calculation
    temp1 = num1;
    temp2 = num2;

    // Calculate HCF using the Euclidean algorithm
    while (num2 != 0) {
        int remainder = num1 % num2;
        num1 = num2;
        num2 = remainder;
    }
    hcf = num1; // HCF is the remaining number

    // Calculate LCM using the formula
    lcm = (temp1 * temp2) / hcf;

    // Print results
    printf("HCF is: %d\n", hcf);
    printf("LCM is: %d\n", lcm);

    return 0;
}
12
