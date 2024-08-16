#include <stdio.h>

int main() {
    int N, i, pos, value;

    // Get the size of the array
    printf("Enter the size of the array (N): ");
    scanf("%d", &N);

     int arr[N+1];// Create an array with one extra space

    // Input the elements of the array
    printf("Enter %d elements of the array:\n", N);
    for(i = 0; i < N; i++) {
        scanf("%d", &arr[i]);
    }

    // Get the position where to insert the new element
    printf("Enter the position (1 to %d) where you want to insert the element: ", N);
    scanf("%d", &pos);

    // Validate the position
    if(pos < 1 || pos > N+1) {
        printf("Invalid position! Please enter a position between 1 and %d\n", N+1);
        return 1;
    }

    // Get the value to be inserted
    printf("Enter the value to be inserted: ");
    scanf("%d", &value);

    // Shift elements to the right to make space for the new element
   // for(i = N; i >= pos; i--) {
      //  arr[i] = arr[i-1];
   // }

    // Insert the new element
    arr[pos-1] = value;

    // Increase the size of the array by 1
    N++;

    // Print the updated array
    printf("Array after insertion:\n");
    for(i = 0; i < N; i++) {
        printf("%d ", arr[i]);
    }

    return 0;
}
