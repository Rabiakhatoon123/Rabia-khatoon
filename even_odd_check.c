#include <stdio.h>

int main() {
    
    int number,i,file;
    
    // Open the file for reading
    
    if (file == NULL) {
        printf("Error opening file.\n");
        return 1;
    }
    
    // Read and check each number
    for ( i = 0; i < 20; i++) {
      
        // Check if the number is even or odd
        if (number % 2 == 0) {
            printf("%d is even\n", number);
        } else {
            printf("%d is odd\n", number);
        }
    }

    // Close the file
    fclose(file);

    return 0;
}
