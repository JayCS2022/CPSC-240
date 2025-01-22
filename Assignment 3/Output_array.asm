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
;  Linux: nasm -f elf64 -l Output_array.lis -o Output_array.o Output_array.asm
;
;===== Begin code area ====================================================================================================================================================

;Declarations
extern printf
global Output_array


segment .data
    intform db "%ld  ", 0

segment .bss

segment .text
Output_array:
    push rbp                                          ;Backup rbp
    mov  rbp,rsp                                      ;The base pointer now points to top of stack
    push rdi                                          ;Backup rdi
    push rsi                                          ;Backup rsi
    push rdx                                          ;Backup rdx
    push rcx                                          ;Backup rcx
    push r8                                           ;Backup r8
    push r9                                           ;Backup r9
    push r10                                          ;Backup r10
    push r11                                          ;Backup r11
    push r12                                          ;Backup r12
    push r13                                          ;Backup r13
    push r14                                          ;Backup r14
    push r15                                          ;Backup r15
    push rbx                                          ;Backup rbx
    pushf                                             ;Backup rflags

    ;Sets the counter to zero
    xor r15, r15
    ;Saves the array and size in the registers
    mov r12, rdi
    mov r13, rsi

    ;Increments and prints the elements of the array until the full array has been printed
    begin_loop:
    cmp r15, r13
    jge done
    mov rax, 0
    mov rdi, intform
    mov rsi, [r12 + 8 * r15]
    call printf

    inc r15
    jmp begin_loop
    
    ;Completes running the file
    done:

    popf                                    ;Restore rflags
    pop rbx                                 ;Restore rbx
    pop r15                                 ;Restore r15
    pop r14                                 ;Restore r14
    pop r13                                 ;Restore r13
    pop r12                                 ;Restore r12
    pop r11                                 ;Restore r11
    pop r10                                 ;Restore r10
    pop r9                                  ;Restore r9
    pop r8                                  ;Restore r8
    pop rcx                                 ;Restore rcx
    pop rdx                                 ;Restore rdx
    pop rsi                                 ;Restore rsi
    pop rdi                                 ;Restore rdi
    pop rbp                                 ;Restore rbp

    ret                                     ;Pop the integer stack and jump to the address equal to the popped value.
