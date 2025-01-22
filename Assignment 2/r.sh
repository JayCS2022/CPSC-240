#!/bin/bash

#Author: Jay Parmar
#Program name: Average Driving Time
#Purpose: This is a Bash script file whose purpose is to compile and run the program "Average Driving Time Program".

echo "Remove old executable files if there are any"
rm *.out
rm *.o
rm *.lis

echo "Assemble the X86 file Average.asm"
nasm -f elf64 -o Average.o Average.asm

echo "Assemble the source file isfloat.asm"
nasm -f elf64 -l isfloat.lis -o isfloat.o isfloat.asm

echo "Compile the C file Driver.c"
gcc -Wall -m64 -no-pie -o Driver.o -std=c17 -c Driver.c

echo "Link the two 'O' files Driver.o Average.o"
gcc -m64 -no-pie -o go.out Driver.o Average.o isfloat.o -std=c17 -Wall -z noexecstack -lm

echo "Next the program will run"
chmod u+x go.out
./go.out