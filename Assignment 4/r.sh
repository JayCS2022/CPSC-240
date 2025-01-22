rm *.o
rm *.out
rm *.lis

echo "Compile the C module main.c"
gcc -c -Wall -no-pie -m64 -std=c17 -o main.o main.c

echo "Assemble execute.asm"
nasm -f elf64 -l execute.lis -o execute.o execute.asm

echo "Assemble fill_random_array.asm"
nasm -f elf64 -l fill_random_array.lis -o fill_random_array.o fill_random_array.asm

echo "Assemble isnan.asm"
nasm -f elf64 -l isnan.lis -o isnan.o isnan.asm

echo "Assemble normalize_array.asm"
nasm -f elf64 -l normalize_array.lis -o normalize_array.o normalize_array.asm

echo "Assemble show_array.asm"
nasm -f elf64 -l show_array.lis -o show_array.o show_array.asm

echo "Compile the C module sort.c"
gcc -c -Wall -no-pie -m64 -std=c17 -o sort.o sort.c

echo "Link the seven object files already created"
gcc -m64 -no-pie -o go.out execute.o main.o fill_random_array.o show_array.o normalize_array.o sort.c isnan.o -std=c17 -Wall -z noexecstack -lm

echo "Run the program"
chmod u+x go.out
./go.out