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
;  Linux: nasm -f elf64 -l isnan.lis -o isnan.o isnan.asm
;
;===== Begin code area ====================================================================================================================================================

;Declarations
global isnan

segment .data

segment .bss

segment .text
    isnan:
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

        movsd xmm15, xmm0

        ;This code checks if the number is a nan and the if the number is not a nan returns a 1
        ucomisd xmm15, xmm15
        jp nan
        mov rax, 1
        jmp exit

        ;This code returns a 0 if the number is a nan
        nan:
        mov rax, 0

        ;Completes the execution of the file
        exit:
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