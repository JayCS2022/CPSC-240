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
;  Linux: nasm -f elf64 -o driver.o driver.asm
;
;===== Begin code area ====================================================================================================================================================

;Declarations
extern faraday
global _start

segment .data
    program_name db "Welcome to Electricity brought to you by Jay Parmar.", 10, 0
    program_start db 10, "This program will compute the resistance in your direct current circuit.", 10, 0
    driver_number_1 db 10, "The driver received this number ", 0
    driver_number_2 db ",and will keep it until next semester.", 0
    operating_system db 10, "A zero will be returned to the Operating System", 10, 0

segment .bss

segment .text
    _start:
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

        ;Prints - Welcome to Electricity brought to you by Jay Parmar.
        mov rax, 1
        mov rdi, 1
        mov rsi, program_name
        mov rdx, 52
        syscall
        
        ;Prints - This program will compute the resistance in your direct current circuit.
        mov rax, 1
        mov rdi, 1
        mov rsi, program_start
        mov rdx, 73
        syscall

        ;Calls the faraday.asm file
        mov rax, 1
        call faraday
        movsd xmm15, xmm0

        ;Prints - The driver received this number 
        mov rax, 1
        mov rdi, 1
        mov rsi, driver_number_1
        mov rdx, 33
        syscall
        
        ;Prints - The circuit resistance number
        mov rax, 1
        mov rdi, 1
        movsd xmm0, xmm15
        mov rdx, r12
        syscall

        ;Prints - ,and will keep it until next semester.
        mov rax, 1
        mov rdi, 1
        mov rsi, driver_number_2
        mov rdx, 38
        syscall

        ;Prints - A zero will be returned to the Operating System
        mov rax, 1
        mov rdi, 1
        mov rsi, operating_system
        mov rdx, 50
        syscall

        mov        rax, 60
        mov        rdi, 0
        syscall