//****************************************************************************************************************************
//Program name: "X86 Assembly Programming".                                                                                  *
//Copyright (C) 2024  Jay Parmar                                                                           *
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
//  Author email: Jay-04.CS@csu.fullerton.edu
//
//Program information
//  Program name: X86 Assembly Programming
//
//Purpose
//  Practice basics of x86 assembly syntax
//
//Project information
//  Files: welcome.cpp, hello.asm, r.sh
//
//Translator information
//  Gnu compiler: g++ -c -m64 -Wall -fno-pie -no-pie -l welcome.lis -o welcome.o welcome.cpp -std=c++17
//  Gnu linker:   g++ -m64 -fno-pie -no-pie -std=c++17 -o welcome.out welcome.o hello.o 
//
//Execution: ./welcome.out
//
//===== Begin code area ===================================================================================================================================================

#include <iostream>
#include <stdio.h>

extern "C" char * hello();

int main() {
    char * name;
    std::cout << "Welcome to friendly 'Hello' program created by Jay Parmar." << std::endl;
    name = hello();
    printf("Have a nice day %s.\n", name);
    std::cout << "Bye. The integer zero will now be returned to the operating system." << std::endl;
    return 0;
}//End of main
//=======1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3=========4=========5=========6=========7**
