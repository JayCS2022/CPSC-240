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
;  Linux: nasm -f elf64 -l Sum.lis -o Sum.o Sum.asm
;
;===== Begin code area ====================================================================================================================================================

;Declarations
global Sum

null equ 0

segment .data

segment .bss


segment .text
    Sum:
        push rbp
        mov  rbp,rsp
        push rdi
        push rsi
        push rdx
        push rcx
        push r8
        push r9
        push r10
        push r11
        push r12
        push r13
        push r14
        push r15
        push rbx
        pushf

        xor rax, rax                                      ; Initialize sum (rax = 0)
        xor r14, r14                                      ; Initialize index (r14 = 0)

        mov r12, rdi                                      ; r12 = address of nice_array
        mov r13, rsi                                      ; r13 = count

    ;Calculates the Sum of the array received
    sumLoop:
        cmp r14, r13
        jge endLoop

        add rax, qword [r12 + r14 * 8]
        inc r14

        jmp sumLoop

    ;Sends the sum information to the Manager file
    endLoop:
        mov r14, rax
        mov qword rax, r14

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

    ret
        ret