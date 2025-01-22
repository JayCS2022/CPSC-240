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
;  Linux: nasm -f elf64 -l Manager.lis -o Manager.o Manager.asm
;
;===== Begin code area ====================================================================================================================================================

;Declarations
extern printf
extern scanf
extern Input_array
extern Output_array
extern isinteger
extern Sum
extern Sort
extern fgets
extern printf
extern scanf
extern stdin
extern strlen
global Manager

null equ 0

segment .data
    instruction db "Please enter your names: ", 0
    program_overview db 10, "This program will sum your array of integers", 10, 0
    first_prompt db "Enter a sequence of long integers separated by white space.", 10
                db "After the last input press enter followed by Control+D: ", 10, 0
    array_message db 10, "These number were received and placed into the array:", 10, 0
    array_sum_message db 10 , 10, "The sum of the %ld numbers in this array is %ld.", 10, 0
    sorted_array db 10, "This is the sorted array", 10, 0
    completed db 10, 10, "This program will return execution to the main function.", 10, 10, 0
    newline db 10, 0

segment .bss
    username resb 50
    array resb 100
    array_size resq 10
    array_sum resb 100


segment .text
    Manager:
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

    ;Shows message prompting the user to input name
        mov qword rax, 0
        mov rdi, instruction
        call printf

    ;Takes the user input and stores that data
        mov rax, 0
        mov rdi, username
        mov rsi, 50
        mov rdx, [stdin]
        call fgets
        
    ;Remove newline for formatting output message
        mov rax, 0
        mov rdi, username
        call strlen
        mov [username+rax-1], byte 0
    
        mov rax, 0
        mov rdi, program_overview
        call printf

        mov rax, 0
        mov rdi, first_prompt
        call printf
    
    ;User input is array
        mov qword rax, 0
        mov qword rdi, array
        mov qword rsi, array_size
        call Input_array
        mov r13, rax

    ;Prints the message for the numbers in the array.
        mov rax, 0
        mov rdi, array_message
        call printf
    
    ;Calls the Output_array file to print the numbers in the array
        mov qword rax, 0
        mov qword rdi, array
        mov qword rsi, r13
        call Output_array

    ;Sends the array information to Sum file to calculate the sum of the array.
        mov qword rax, 0
        mov qword rdi, array
        mov qword rsi, r13
        call Sum
        mov r14, rax

    ;Prints the message stating the number of elements in the array and the sum.
        mov rax, 0
        mov rdi, array_sum_message
        mov rsi, r13
        mov rdx, r14
        call printf

    ;Prints the sorted array text
        mov rax, 0
        mov rdi, sorted_array
        call printf

    ;Sends the array to the Sort function to sort the array
        mov rax, 0
        mov rdi, array
        mov rsi, r13
        call Sort
    
    ;Sends the Sorted array to the Output_array file to print the sorted array
        mov rax, 0
        mov rdi, array
        mov rsi, r13
        call Output_array

    ;Prints the message stating that the file is done running
        mov rax, 0
        mov rdi, completed
        call printf
    
    ;Sends the username to the Main file
        mov rax, username
        movsd xmm0, [rsp]

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