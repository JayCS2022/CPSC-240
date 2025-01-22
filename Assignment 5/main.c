//****************************************************************************************************************************
//Program name: "Execution Speed".                                                                                  *
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
//  Program name: Execution Speed
//  Programming languages X86 with two modules in C
//
//Purpose
//  This program will serve to calculate the value of e^x.
//
//Project information
//  Files: main.c, series.asm, taylor.asm, r.sh
//  Status: The program has been tested extensively with no detectable errors.
//
//Translator information
//  Gnu compiler: gcc -c -Wall -no-pie -m64 -std=c17 -o main.o main.c
//  Gnu linker:   gcc -m64 -no-pie -o go.out main.o series.o taylor.o -std=c17 -Wall -z noexecstack -lm
//
//Execution: ./go.out
//
//References and credits
//  No references: this module is standard C
//
//===== Begin code area ===================================================================================================================================================

#include <stdio.h>
#include <stdlib.h>

extern double series();

int main(int argc, const char *argv[]) {
    double number;
    printf("\nWelcome to Taylor Series by Jay Parmar\n");
    printf("This software will compute any power of e that you may need.\n");
    number = series();
    printf("\nThe driver received this number %lf and will keep it.\n\n", number);
    printf("Good-bye\n");
}//End of main
//=======1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3=========4=========5=========6=========7**
