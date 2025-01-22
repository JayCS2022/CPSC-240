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
;  Linux: nasm -f elf64 -o ftoa.o ftoa.asm
;
;===== Begin code area ====================================================================================================================================================

;Declarations
global ftoa

section .data
    newline db 10

section .bss
    arr resb 64

section .text
ftoa:
    ; Load the floating point number into xmm0
    movsd xmm0, xmm13
    lea rdi, [arr]
    mov rsi, 64

    cvttsd2si rax, xmm0
    mov rbx, rax

    ;Convert integer part to string
    lea rdi, [arr]
    add rdi, 64
    mov byte [rdi], 0
    dec rdi

convert_integer:
    xor rdx, rdx
    mov rax, rbx
    mov rbx, 10
    div rbx
    add dl, '0'
    mov [rdi], dl
    dec rdi
    test rax, rax
    jnz convert_integer

    ; Null-terminate the array
    mov byte [rdi], 0

    ; Output the string
    mov rax, 1
    mov rdi, 1
    lea rsi, [arr]
    mov rdx, rsi

    ; Find the length of the string by checking for the null terminator
    xor rcx, rcx
find_length:
    mov al, byte [rsi + rcx]
    test al, al
    jz end_find_length
    inc rcx
    jmp find_length
end_find_length:
    mov rdx, rcx
    syscall
    mov rax, 1
    mov rdi, 1
    lea rsi, [newline]
    mov rdx, 1
    syscall
   
    mov rax, 60
    xor rdi, rdi
    syscall