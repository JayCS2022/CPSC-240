;****************************************************************************************************************************
;Program name: "X86 Assembly Programming".                                                                                  *
;Copyright (C) 2024  Jay Parmar                                                                               *
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
; Program name: X86 Assembly Programming
;Purpose
;  This program is being used to practice basics of x86 assembly syntax.
;
;Project information
;  Files: welcome.cpp, hello.asm, r.sh
;
;Translator information
;  Linux: nasm -f elf64 -l hello.lis -o hello.o hello.asm
;
;===== Begin code area ====================================================================================================================================================

;Declarations
extern fgets
extern printf
extern scanf
extern stdin
extern strlen
global hello

null equ 0

segment .data
    instruction db "Please enter your first and last names: ", 0
    stringform db "%s", 0
    title db "Please enter your title (Ms, Mr, Engineer, Programmer, Mathematician, Genius, etc): ", 0
    title_stringform db "%s", 0
    day_hello db "Hello %s ", 0
    day db "%s. How has your day been so far? ", 0
    nice db "%s is really nice.", 10, 0
    salary db "What is your salary in dollars: ", 0
    floatform db "%lf", 0
    nice_salary db "Oh, $%9.2lf is very nice too for a %s.",10, 0
    complete_program db "This concludes the demonstration of the Hello program written in x86 assembly.",10, 0


segment .bss
    username resb 50
    user_title resb 40
    user_day resb 100
    day_status resb 50
    done_program resb 50

segment .text
    hello:
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
        mov rdi, stringform
        mov rsi, instruction
        call printf

    ;Takes the user input and stores that data
        mov rax, 0
        mov rdi, username
        mov rsi, 50
        mov rdx, [stdin]
        call fgets
    
    ;Shows message prompting the user to input title
        mov rax, 0
        mov rdi, title_stringform
        mov rsi, title
        call printf

    ;Takes the user input and stores that data
        mov rax, 0
        mov rdi, user_title
        mov rsi, 50
        mov rdx, [stdin]
        call fgets
        
    ;Remove newline for formatting output message
        mov rax, 0
        mov rdi, user_title
        call strlen
        mov [user_title+rax-1], byte 0

        mov rax, 0
        mov rdi, username
        call strlen
        mov [username+rax-1], byte 0

    ;Outputs the message for user name and title and also asks for how the day was
        mov rax, 0
        mov rdi, day_hello
        mov rsi, user_title
        call printf
        mov rdi, day
        mov rsi, username
        call printf
    
    ;Takes the user input and stores that data
        mov rax, 0
        mov rdi, user_day
        mov rsi, 48
        mov rdx, [stdin]
        call fgets

    ;Remove newline for formatting output message
        mov rax, 0
        mov rdi, user_day
        call strlen
        mov [user_day+rax-1], byte 0
    
    ;Output day status
        mov rax, 0
        mov rdi, nice
        mov rsi, user_day
        call printf
    
    ;Shows message prompting the user to input salary
        mov rax, 0
        mov rdi, salary
        mov rsi, floatform
        call printf

    ;Takes the user input for the salary and stores that data
        mov rax, 0
        mov rdi, floatform
        mov rsi, rsp
        call scanf
        movsd xmm10, [rsp]

    ;Output salary status
        mov rax, 1
        mov rdi, nice_salary
        mov rsi, user_title
        movsd xmm0, xmm10
        call printf

    ;Shows message for x86 hello program complete
        mov rax, 0
        mov rdi, complete_program
        mov rsi, done_program
        call printf

    ;Sends the user name string data to welcome.cpp
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