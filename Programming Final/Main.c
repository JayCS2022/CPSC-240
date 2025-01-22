//Jay Parmar
//Jay-04.CS@csu.fullerton.edu
//240-17 final program

#include <stdio.h>
#include <stdlib.h>

extern double Manager();

int main(int argc, const char *argv[]) {
    double number;
    printf("\nWelcome to the harmonic summation program.\n");
    printf("Bought to you by Jay Parmar\n\n");
    number = Manager();
    printf("The driver has recevied the number %lf \n", number);
    printf("Main will return 0 to the operating system. Bye.\n");
}