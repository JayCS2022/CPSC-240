#!/bin/bash

#Author: Jay Parmar
#Program name: x86 assembly Hello Program
#Purpose: This is a Bash script file whose purpose is to compile and run the program "Hello Program".

echo "Remove old executable files if there are any"
rm *.out
rm *.o

echo "Assemble the X86 file hello.asm"
nasm -f elf64 -l hello.lis -o hello.o hello.asm

echo "Compile the C++ file welcome.cpp"
g++ -c -m64 -Wall -fno-pie -no-pie -l welcome.lis -o welcome.o welcome.cpp -std=c++17

echo "Link the two 'O' files welcome.o hello.o"
g++ -m64 -fno-pie -no-pie -std=c++17 -o welcome.out welcome.o hello.o 

echo "Next the program ""Hello Program"" will run"
chmod u+x welcome.out
./welcome.out