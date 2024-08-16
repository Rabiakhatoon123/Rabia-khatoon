#include <stdio.h>
#include <math.h>

int main() {
    float principal, rate, time, simpleInterest, compoundInterest;

    // Input principal, rate, and time
    printf("Enter principal, rate, and time: ");
    scanf("%f %f %f", &principal, &rate, &time);

    // Calculate Simple Interest
    simpleInterest = (principal * rate * time) / 100;

    // Calculate Compound Interest
    compoundInterest = principal * (pow((1 + rate / 100), time) - 1);

    // Output the results
    //.2: Specifies that the number should be rounded to two decimal places.
    printf("Simple Interest: %.2f\n", simpleInterest);
    printf("Compound Interest: %.2f\n", compoundInterest);

    return 0;
}
