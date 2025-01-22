;****************************************************************************************************************************
;Program name: "Arrays".                                                                                  *
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
; Program name: Arrays
;  Programming languages X86 with two modules in C
;Purpose
;  This program will serve to store, calcualte the sum, sort, and print integer arrays from user input.
;
;Project information
;  Files: Main.c, Manager.asm, Sum.asm, Output_array.asm, Input_array.asm, isinteger.asm, Sort.c, r.sh
;  Status: The program has been tested extensively with no detectable errors.
;
;Translator information
;  Linux: nasm -f elf64 -l Input_array.lis -o Input_array.o Input_array.asm
;
;===== Begin code area ====================================================================================================================================================

;Declarations
extern scanf
extern printf
extern stdin
extern isinteger
extern atol
extern fgets
extern strlen
global Input_array
null equ 0

segment .data
    intform db "%ld", 0
    invalid_message db "An error was detected. Re-enter the number", 10, 0

segment .bss

segment .text
Input_array:
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
    
    ;Saves the array and size in the registers
    mov r14, rdi
    mov r15, rsi
    ;Sets the counter to zero
    xor r13, r13
    ;Creates sotrage space for array
    sub rsp, 320

    ;Takes the user input
    Start_code:
        ;Prompts the user for input
        mov rax, 0
        mov rdi, rsp
        mov rsi, 319
        mov rdx, [stdin]                    
        call fgets
        cdqe
            cmp eax, 0
            je finish

        ;Removes white space
        mov rax, 0
        mov rdi, rsp
        call strlen
        mov byte rsp[rax-1], byte 0

        ;Checks if the input is an integer otherwise prints invalid input message
        mov rax, 0
        mov rdi, rsp
        call isinteger
        cmp rax, -1
        je Invalid_input

        ;Converts string to integer
        mov rax, 0
        mov rdi, rsp
        call atol
        mov [r14+8*r13], rax

        ;Increments until the user has reached the max size
        inc r13
        cmp r13, r15
        jl Start_code
        jmp finish

    ;Prints the invalid input message
    Invalid_input:
        mov rax, 0
        mov rdi, invalid_message
        call printf
        jmp Start_code
    
    ;Completes running the file
    finish:
        mov rax, r13
        add rsp, 320

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
