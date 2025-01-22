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
;  Linux: nasm -f elf64 -l fill_random_array.lis -o fill_random_array.o fill_random_array.asm
;
;===== Begin code area ====================================================================================================================================================

;Declarations
global fill_random_array

extern isnan

segment .data

segment .bss
    align 64

segment .text
    fill_random_array:
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

        mov r15, rdi    ;holds our array
        mov r14, rsi    ;holds the number of values
        mov r13, 0      ;our counter

        ;This code block makes sure that the program only creates the specified amount of numbers
        array_capacity:
            cmp r13, r14
            jl Start_code
            jmp finish

        ;This code block creates and stores the numbers
        Start_code:
            mov rax, 0
            rdrand r12
            mov rdi, r12
            push r12
            push r12
            movsd xmm15, [rsp]
            pop r12
            pop r12

            movsd xmm0, xmm15
            call isnan
            je Start_code

            movsd [r15 + r13 * 8], xmm15
            inc r13
            jmp array_capacity

        ;Completes the execution of the file
        finish:
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