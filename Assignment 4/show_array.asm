;****************************************************************************************************************************
;Program name: "Non-deterministic Random Numbers".                                                                                  *
;white space.  Copyright (C) 2024  Jay Parmar                                                                               *
;This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License  *
;version 3 as published by the Free Software Foundation.                                                                    *
;This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied         *
;warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.     *
;A copy of the GNU General Public License v3 is available here:  <https://www.gnu.org/licenses/>.                           *
;****************************************************************************************************************************


;========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3=========4=========5=========6=========7**
;Author information
;  Author name: Jay Parmar
;  Programmer CWID: 885463034
;  Author email: Jay-04.CS@csu.fullerton.edu
;
;Program information
; Program name: Non-deterministic Random Numbers
;  Programming languages X86 with two modules in C
;Purpose
;  This program will serve to create numbers, normalize the numbers the program created, sort the numbers, and print the numbers.
;
;Project information
;  Files: main.c, execute.asm, fill_random_array.asm, normalize_array.asm, show_array.asm, isnan.asm, sort.c, r.sh
;  Status: The program has been tested extensively with no detectable errors.
;
;Translator information
;  Linux: nasm -f elf64 -l show_array.lis -o show_array.o show_array.asm
;
;===== Begin code area ====================================================================================================================================================

;Declarations
extern printf
global show_array

segment .data
    header db "IEEE54		   Scientific Decimal", 10, 0
    output_format dq "0x%016lx %18.13g", 10, 0
    newline db "", 10, 0

segment .bss
    align 64
    backup_storage_area resb 832

segment .text
    show_array:
        push rbp
        mov rbp, rsp
        push rbx
        push rcx
        push rdx
        push rdi
        push rsi
        push r8
        push r9
        push r10
        push r11
        push r12
        push r13
        push r14
        push r15
        pushf

        mov r15, rdi
        mov r14, rsi
        mov r13, 0

        ;Prints the header to format the output
        mov rax, 0
        mov rdi, header
        call printf

        ;This code block makes sure that the program outputs the amount of numbers in the array
        array_size_code:
            cmp r13, r14
            jl Print_code
            jmp finish

        ;This code block outputs all the numbers in the array
        Print_code:
            mov rax, 1
            mov rdi, output_format
            mov rsi, [r15 + r13 * 8]
            movsd xmm0, [r15 + r13 * 8]
            call printf

            inc r13
            jmp array_size_code

        ;Completes the execution of the file
        finish:
            mov rdi, newline
            call printf

            popf
            pop r15
            pop r14
            pop r13
            pop r12
            pop r11
            pop r10
            pop r9
            pop r8
            pop rsi
            pop rdi
            pop rdx
            pop rcx
            pop rbx
            pop rbp
            ret