#include <stdio.h>

int main() {
    int N, i, searchElement, found = 0;

    // Ask the user for the size of the array
    printf("Enter the size of the array (N): ");
    scanf("%d", &N);

    int arr[N]; // Declare an array of size N

    // Ask the user to input elements of the array
    printf("Enter %d elements of the array:\n", N);
    for(i = 0; i < N; i++) {
        scanf("%d", &arr[i]);
    }

    // Ask for the element to search
    printf("Enter the element to search: ");
    scanf("%d", &searchElement);

    // Search for the element in the array
    for(i = 0; i < N; i++) {
        if(arr[i] == searchElement) {
            printf("Element  found at position %d\n ",searchElement);
            found = 1; // Mark that the element is found
            break;
        }
    }

    // If the element is not found, print a message
    if(!found) {
        printf("Element %d not found in the array\n");
    }

    return 0;
}
