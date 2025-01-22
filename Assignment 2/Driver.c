//=======1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3=========4=========5=========6=========7**
//Author information
//  Author name: Jay Parmar
//  Programmer CWID: 885463034

//  Author email: Jay-04.CS@csu.fullerton.edu
//
//Program information
//  Program name: Average Driving Time
//  Programming languages X86 with one module in C
//
//Purpose
//  This program will serve to calculate the average driving time and total average speed from user input.
//
//Project information
//  Files: Driver.c, Average.asm, r.sh
//  Status: The program has been tested extensively with no detectable errors.
//
//Translator information
//  Gnu compiler: gcc -Wall -m64 -no-pie -o Driver.o -std=c17 -c Driver.c
//  Gnu linker:   gcc -m64 -no-pie -o go.out Driver.o Average.o isfloat.o -std=c17 -Wall -z noexecstack -lm
//
//Execution: ./go.out
//
//References and credits
//  No references: this module is standard C
//
//===== Begin code area ===================================================================================================================================================

#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>

extern double Average();

int main() {
    double drive = 0.0;
    printf("Welcome to Average Driving Time maintained by Jay Parmar\n");
    drive = Average();
    printf("\nThe driver has received this number %1.8lf and will keep it for future use.\n", drive);
    printf("Have a great day.\n");
    printf("\nA zero will be sent to the operating system as a signal of a successful execution.\n");
    return 0;
}//End of main
//=======1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3=========4=========5=========6=========7**
