;****************************************************************************************************************************
;Program name: "Pure Assembly".                                                                                  *
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
; Program name: Pure Assembly
;  Programming languages X86_64 Assembly
;Purpose
;  This program will serve to calculate the the resistance in an electric circuit
;
;Project information
;  Files: driver.asm, faraday.asm, strlen.asm, atof.asm, ftoa.asm
;  Status: The program has been tested extensively with no detectable errors.
;
;Translator information
;  Linux: nasm -f elf64 -o strlen.o strlen.asm
;
;===== Begin code area ====================================================================================================================================================

;Declarations
global strlen
max_length equ 2048

section .data
section .bss
section .text
strlen:
    push    rbp
    mov     rbp, rsp
    push    rbx
    push    rcx
    push    rdx
    push    rsi
    push    rdi
    push    r8 
    push    r9 
    push    r10
    push    r11
    push    r12
    push    r13
    push    r14
    push    r15
    pushf

    ; Parameters
    mov     r15, rdi

    xor     r14, r14

    ;Calculates the length of a string
count:
    cmp     byte[r15 + r14], 0
    je      exit

    inc     r14
    cmp     r14, max_length
    je      exit

    jmp     count

exit:
    mov     rax, r14

    popf          
    pop     r15
    pop     r14
    pop     r13
    pop     r12
    pop     r11
    pop     r10
    pop     r9 
    pop     r8 
    pop     rdi
    pop     rsi
    pop     rdx
    pop     rcx
    pop     rbx
    pop     rbp

    ret