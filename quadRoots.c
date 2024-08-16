#include <stdio.h>
#include <math.h>

int main() {
    float a, b, c, discriminant, root1, root2;

    // Input coefficients a, b, and c
    printf("Enter coefficients a, b, and c: ");
    scanf("%f %f %f", &a, &b, &c);

    // Calculate the discriminant
    discriminant = b * b - 4 * a * c;

    // Calculate roots based on the discriminant
    /*If the discriminant is positive, it calculates and prints two real roots.
If the discriminant is zero, it calculates and prints one real root.
If the discriminant is negative, it simply notifies that the roots are complex.
    */
    if (discriminant > 0) {
        root1 = (-b + sqrt(discriminant)) / (2 * a);
        root2 = (-b - sqrt(discriminant)) / (2 * a);
        printf("Roots are: %.2f and %.2f\n", root1, root2);
    }
    else if (discriminant == 0) {
        root1 = -b / (2 * a);
        printf("Root is: %.2f\n", root1);
    }
    else {
        printf("The equation has complex roots.\n");
    }
    
   

    return 0;
}
