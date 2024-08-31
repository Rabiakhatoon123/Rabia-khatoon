#include <stdio.h>

int main() {
    int n1 = 0, n2 = 1, n3, i;

    printf("%d %d ", n1, n2);  // printing first two terms

    for(i = 3; i <= 10; ++i) {  // loop starts from 3 because first two terms are already printed
        n3 = n1 + n2;
        printf("%d ", n3);
        n1 = n2;
        n2 = n3;
    }

    return 0;
}
