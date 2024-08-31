#include <stdio.h>

int main() {
    int arr[100], n;
    int sum = 0, max, min;
    float average;

    // Input the number of elements
    printf("Enter number of elements: ");
    scanf("%d", &n);

    // Input the elements
    printf("Enter the elements:\n");
    for (int i = 0; i < n; i++) {
        scanf("%d", &arr[i]);

        // Add the current element to the total sum
        sum += arr[i];

        // For the first element, set both max and min
        if (i == 0) {
            max = min = arr[i];
        } else {
            // Update max if the current element is larger
            if (arr[i] > max) {
                max = arr[i];
            }
            // Update min if the current element is smaller
            if (arr[i] < min) {
                min = arr[i];
            }
        }
    }

    // Calculate the average
    average = (float)sum / n;

    // Print the results
    printf("Sum: %d\n", sum);
    printf("Average: %.2f\n", average);
    printf("Maximum: %d\n", max);
    printf("Minimum: %d\n", min);

    return 0;
}
