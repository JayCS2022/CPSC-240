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
;  Linux: nasm -f elf64 -l series.lis -o series.o series.asm
;
;===== Begin code area ====================================================================================================================================================

;Declarations
extern fgets
extern printf
extern scanf
extern stdin
extern strlen
extern taylor
global series

segment .data
    instruction db 10, "Please enter a float number value for x: ", 0
    stringform db "%s", 0
    sum db 10, "Please enter the number of terms to include in the Taylor sum: ", 0
    floatform db "%lf", 0
    intform db "%ld", 0
    clock db 10, "The time on the clock is now %ld tics and taylor has been called", 10, 0
    program db 10, "Thank you for waiting", 10, 0
    clock_time db 10, "The time on the clock when Taylor terminated was %ld tics", 10, 0
    time db 10, "The execution time was %ld tics.", 10, 0
    computation db 10, "The computed approximation of e^x is %lf with precision of 8 digits right of the point.", 10, 0
    calculator db 10, "Thank you for using the Eyere exponential calculator.", 10, 0
    complete db 10, "Please return another day. The computed value will be set to the caller functions", 10, 0

segment .bss
   
segment .text
    series:
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

        ;Prints - Please enter a float number value for x:
        mov rax, 0
        mov rdi, stringform
        mov rsi, instruction
        call printf

        ;Asks user for float number input
        mov rax, 1
        mov rdi, floatform
        mov rsi, rsp
        call scanf
        movsd xmm15, [rsp]

        ;Prints - Please enter the number of terms to include in the Taylor sum:
        mov rax, 0
        mov rdi, sum
        call printf

        ;Asks user for number input
        mov rax, 1
        mov rdi, floatform
        mov rsi, rsp
        call scanf
        movsd xmm13, [rsp]

        ;Sends the two number inputs to the taylor.asm file to calculate the value for e^x
        rdtsc
        shl rdx, 32
        add rax, rdx
        mov rax, 1
        movq rdi, xmm15
        movq rsi, xmm13
        call taylor
        rdtsc
        shl rdx, 32
        add rax, rdx

        ;Calculates the number of tics
        mov rax, 0
        mov rdx, 0
        cpuid
        rdtsc
        shl rdx, 32
        add rax, rdx
        mov r12, rax

        ;Prints - The time on the clock is now %ld tics and taylor has been called
        mov rax, 0
        mov rdi, clock
        mov rsi, r12
        call printf

        ;Prints - Thank you for waiting
        mov rax, 0
        mov rdi, program
        call printf

        ;Calculates the number of tics
        mov rax, 0
        mov rdx, 0
        cpuid
        rdtsc
        shl rdx, 32
        add rax, rdx
        mov r13, rax

        ;Prints - The time on the clock when Taylor terminated was %ld tics
        mov rax, 0
        mov rdi, clock_time
        mov rsi, r13
        call printf

        ;Calculates the number of tics
        mov rax, 0
        mov rdx, 0
        cpuid
        rdtsc
        shl rdx, 32
        add rax, rdx
        mov r14, rax

        ;The execution time was %ld tics.
        mov qword rax, 0
        mov rdi, time
        mov rsi, r14
        call printf

        ;Prints - The computed approximation of e^x is %lf with precision of 8 digits right of the point.
        mov rax, 1
        mov rdi, computation
        movsd xmm0, xmm14
        call printf

        ;Prints - Thank you for using the Eyere exponential calculator.
        mov rax, 0
        mov rdi, calculator
        call printf

        ;Prints - Please return another day. The computed value will be set to the caller functions
        mov rax, 0
        mov rdi, complete
        call printf

        ;Sends the e^x value to the main.c file
        mov rax, 1
        movsd xmm0, xmm14

    ;Restores the stack
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