#include <stdio.h>

int main() {
    char str[100];
    int vowels = 0, consonants = 0, i;

    // Input a string using scanf
    printf("Enter a string: ");
    scanf("%s", str); // This will read a single word (without spaces)

    // Loop through the string
    for (i = 0; str[i] != '\0'; i++) {
        char c = str[i];

        // Check for vowels
        if (c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u' ||
            c == 'A' || c == 'E' || c == 'I' || c == 'O' || c == 'U') {
            vowels++;
        }
        // Check for consonants (letters that are not vowels)
        else if ((c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z')) {
            consonants++;
        }
    }

    // Print results
    printf("Vowels: %d\n", vowels);
    printf("Consonants: %d\n", consonants);

    return 0;
}



