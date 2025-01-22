clear

rm *.o
rm *.out
rm *.lis

echo "Assemble driver.asm"
nasm -f elf64 -o driver.o driver.asm

echo "Assemble faraday.asm"
nasm -f elf64 -o faraday.o faraday.asm

echo "Assemble strlen.asm"
nasm -f elf64 -o strlen.o strlen.asm

echo "Assemble atof.asm"
nasm -f elf64 -o atof.o atof.asm

echo "Assemble ftoa.asm"
nasm -f elf64 -o ftoa.o ftoa.asm

echo "Link the seven object files already created"
ld -o go.out driver.o faraday.o strlen.o atof.o ftoa.o -g

echo "Run the program"
chmod u+x go.out
./go.out