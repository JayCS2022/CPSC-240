;****************************************************************************************************************************
;Program name: "Execution Speed".                                                                                  *
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
; Program name: Execution Speed
;  Programming languages X86 with two modules in C
;Purpose
;  This program will serve to calculate the value of e^x.
;
;Project information
;  Files: main.c, series.asm, taylor.asm, r.sh
;  Status: The program has been tested extensively with no detectable errors.
;
;Translator information
;  Linux: nasm -f elf64 -l taylor.lis -o taylor.o taylor.asm
;
;===== Begin code area ====================================================================================================================================================

;Declarations
global taylor

segment .data
    
segment .bss

segment .text
    taylor:
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

    ;Receives the user input numbers
    movq xmm15, rdi
    movq xmm13, rsi
    mov rax, 1
    cvtsi2sd xmm13, rax
    movsd xmm12, xmm13
    mov r12, 1

    ;Calculates the value of e^x
    Start_code:
        cmp r12, r13
        jge finish
        inc r12
        cvtsi2sd xmm13, r12
        mulsd xmm12, xmm15
        divsd xmm12, xmm13
        addsd xmm14, xmm12
        jmp Start_code

    ;Sends the e^x value that was calcualted to the series.asm file
    finish:
        mov rax, 1
        movsd xmm0, xmm14

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