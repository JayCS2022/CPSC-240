rm *.o
rm *.lis
rm *.out

echo "Compile the C module Main.c"
gcc -c -Wall -no-pie -m64 -std=c17 -o Main.o Main.c

echo "Assemble the module Manager.asm"
nasm -f elf64 -l Manager.lis -o Manager.o Manager.asm

echo "Assemble the module Input_array.asm"
nasm -f elf64 -l Input_array.lis -o Input_array.o Input_array.asm

echo "Assemble the module Output_array.asm"
nasm -f elf64 -l Output_array.lis -o Output_array.o Output_array.asm

echo "Assemble the module hmean.asm"
nasm -f elf64 -l Sum.lis -o hmean.o hmean.asm

echo "Assemble the module isfloat.asm"
nasm -f elf64 -l isfloat.lis -o isfloat.o isfloat.asm 

echo "Compile the C module Sort.c"
gcc -c -Wall -no-pie -m64 -std=c17 -o Sort.o Sort.c

echo "Link the six object files already created"
gcc -m64 -no-pie -o arrays.out Manager.o Main.o Input_array.o Output_array.o hmean.o Sort.c isfloat.o -std=c17 -Wall -z noexecstack -lm

echo "Run the program Array of Integers Program"
chmod u+x arrays.out
./arrays.out
