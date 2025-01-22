//****************************************************************************************************************************
//Program name: "Non-deterministic Random Numbers".                                                                                  *
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
//  Program name: Non-deterministic Random Numbers
//  Programming languages X86 with two modules in C
//
//Purpose
//  This program will serve to create numbers, normalize the numbers the program created, sort the numbers, and print the numbers.
//
//Project information
//  Files: main.c, execute.asm, fill_random_array.asm, normalize_array.asm, show_array.asm, isnan.asm, sort.c, r.sh
//  Status: The program has been tested extensively with no detectable errors.
//
//Translator information
//  Gnu compiler: gcc -c -Wall -no-pie -m64 -std=c17 -o sort.o sort.c
//  Gnu linker:   gcc -m64 -no-pie -o go.out execute.o main.o fill_random_array.o show_array.o normalize_array.o sort.c isnan.o -std=c17 -Wall -z noexecstack -lm
//
//Execution: ./go.out
//
//References and credits
//  No references: this module is standard C
//
//===== Begin code area ===================================================================================================================================================

#include <stdio.h>
#include <stdlib.h>
#include <math.h>

//Function for Sorting the array
void sort(long array[], int count) {
    long array_number;
    for (int i = 0; i < count; i++) {
      for (int j=0; j<count-i-1; j++){
        if (array[j] > array[j+1]){
          array_number=array[j];
          array[j]=array[j+1];
          array[j+1]=array_number;
        }
      } 
    }
}//End of sort
//=======1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3=========4=========5=========6=========7
