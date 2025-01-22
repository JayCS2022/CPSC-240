rm *.o
rm *.out
rm *.lis

echo "Compile the C module main.c"
gcc -c -Wall -no-pie -m64 -std=c17 -o main.o main.c

echo "Assemble series.asm"
nasm -f elf64 -l series.lis -o series.o series.asm

echo "Assemble taylor.asm"
nasm -f elf64 -l taylor.lis -o taylor.o taylor.asm

echo "Link the seven object files already created"
gcc -m64 -no-pie -o go.out main.o series.o taylor.o -std=c17 -Wall -z noexecstack -lm

echo "Run the program"
chmod u+x go.out
./go.out