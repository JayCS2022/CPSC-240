//****************************************************************************************************************************
//Program name: "Arrays".                                                                                  *
//white space.  Copyright (C) 2024  Jay Parmar                                                                               *
//This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License  *
//version 3 as published by the Free Software Foundation.                                                                    *
//This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied         *
//warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.     *
//A copy of the GNU General Public License v3 is available here:  <https://www.gnu.org/licenses/>.                           *
//****************************************************************************************************************************

//=======1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3=========4=========5=========6=========7**
//Author information
//  Author name: Jay Parmar
//  Programmer CWID: 885463034
//
//  Author email: Jay-04.CS@csu.fullerton.edu
//
//Program information
//  Program name: Arrays
//  Programming languages X86 with two modules in C
//
//Purpose
//  This program will serve to store, calculate the sum, sort, and print integer arrays from user input.
//
//Project information
//  Files: Main.c, Manager.asm, Sum.asm, Output_array.asm, Input_array.asm, isinteger.asm, Sort.c, r.sh
//  Status: The program has been tested extensively with no detectable errors.
//
//Translator information
//  Gnu compiler: gcc -c -Wall -no-pie -m64 -std=c17 -o Main.o Main.c
//  Gnu linker:   gcc -m64 -no-pie -o arrays.out Manager.o Main.o Input_array.o Output_array.o Sum.o Sort.c isinteger.o -std=c17 -Wall -z noexecstack -lm
//
//Execution: ./arrays.out
//
//References and credits
//  No references: this module is standard C
//
//===== Begin code area ===================================================================================================================================================
#include <stdio.h>
#include <stdlib.h>

extern char * Manager();

int main(int argc, const char *argv[]) {
    char * name;
    printf("\nWelcome to Arrays\n");
    printf("Bought to you by Jay Parmar\n\n");
    name = Manager();
    printf("I hope you liked your arrays %s \n", name);
    printf("Main will return 0 to the operating system. Bye.\n");
}//End of main
//=======1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3=========4=========5=========6=========7**
