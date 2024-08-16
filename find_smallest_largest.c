#include <stdio.h>

int main() {
    int N;
    int i;

    // Input the number of elements
    printf("Enter the number of elements in the array: ");
    scanf("%d", &N);

    int array[N];

    // Input the elements of the array
    printf("Enter %d elements:\n", N);
    for ( i = 0; i < N; i++) {
        scanf("%d", &array[i]);
    }

    // Assume the first element is the smallest and largest
    int smallest = array[0];
    int largest = array[0];

    // Find the smallest and largest
    for ( i = 1; i < N; i++) {
        if (array[i] < smallest) {
            smallest = array[i];
        }
        if (array[i] > largest) {
            largest = array[i];
        }
    }

    // Print results
    printf("Smallest number is: %d\n", smallest);
    printf("Largest number is: %d\n", largest);

    return 0;
}
