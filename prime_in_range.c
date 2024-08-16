#include <stdio.h>

int main() {
    int start, end, i, j;

    // Input the range
    printf("Enter the start of the range: ");
    scanf("%d", &start);
    printf("Enter the end of the range: ");
    scanf("%d", &end);

    printf("Prime numbers between %d and %d are: ", start, end);

    // Loop through each number in the range
    for (i = start; i <= end; i++) {
        if (i <= 1) {
            continue; // Skip numbers less than or equal to 1
        }

        // Check if the number is prime
        for (j = 2; j < i; j++) {
            if (i % j == 0) {
                break; // If divisible, not prime
            }
        }

        // If loop completes, j will equal i, meaning i is prime
        if (j == i) {
            printf("%d ", i);
        }
    }

    return 0;
}
