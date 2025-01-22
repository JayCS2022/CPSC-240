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
;  Linux: nasm -f elf64 -l execute.lis -o execute.o execute.asm
;
;===== Begin code area ====================================================================================================================================================

;Declarations
extern fgets
extern printf
extern scanf
extern stdin
extern strlen
extern isnan
extern fill_random_array
extern normalize_array
extern show_array
extern sort
global execute

segment .data
    instruction db "Please enter your name: ", 0
    stringform db "%s", 0
    title db "Please enter your title (Mr,Ms,Sargent,Chief,Project Leader,etc): ", 0
    title_stringform db "%s", 0
    thank_you db "Nice to meet you %s %s.", 10, 0
    floatform db "%lf", 0
    intform db "%ld", 0
    program_numbers db 10, "This program will generate 64-bit IEEE float numbers", 0
    numbers db 10, "How many numbers do you want. Today's limit is 100 per customer. ", 0
    error db "Please enter a number that is larger than 0 and less than 100.", 10, 0
    array_storage db "Your numbers have been stored in an array. Here is that array.", 10, 10, 0
    array_range db "The array will now be normalized to the range 1.0 to 2.0 Here is the normalized array", 10, 10, 0
    sort_array_message db "The array will now be sorted", 10, 10, 0
    program_complete db "Good bye Freshman. You are welcome any time.", 10, 10, 0

segment .bss
    align 64
    username resb 50
    user_title resb 40
    float_numbers resq 100

segment .text
    execute:
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

    ;Shows thank you text
        mov rax, 0
        mov rdi, thank_you
        mov rsi, user_title
        mov rdx, username
        call printf
    
    ;prints message - This program will generate 64-bit IEEE float numbers
        mov qword rax, 0
        mov rdi, program_numbers
        call printf
    
    array_numbers:
    ;prints message - How many numbers do you want. Today's limit is 100 per customer. 
        mov qword rax, 0
        mov rdi, numbers
        call printf

        mov qword rax, 0
        mov rdi, intform
        mov rsi, rsp
        call scanf
        mov r15, [rsp]

    ;Checks the user input to make sure that the number is not less than 0 otherwise asks for user input
        cmp r15, 0
        jl wrong_size

    ;Checks the user input to make sure that the number is not greater than 100 otherwise asks for user input
        cmp r15, 100
        jg wrong_size

    ;If the user input is correct then continues with the rest of the program
        jmp continue

    ;Prints - Please enter a number that is larger than 0 and less than 100.
        wrong_size:
        mov rax, 0
        mov rdi, error
        call printf
        jmp array_numbers


    ;If the user input is greater than 0 and less than 100 then the program will create numbers
    continue:
        mov qword rax, 0
        mov rdi, float_numbers
        mov rsi, r15
        call fill_random_array
    
    ;prints message - Your numbers have been stored in an array. Here is that array.
        mov qword rax, 0
        mov rdi, array_storage
        call printf

    ;Prints the array that the program created
        mov qword rax, 0
        mov rdi, float_numbers
        mov rsi, r15
        call show_array

    ; Prints - The array will now be normalized to the range 1.0 to 2.0 Here is the normalized array
        mov qword rax, 0
        mov rdi, array_range
        call printf

    ;Program normalizes the array
        mov qword rax, 0
        mov rdi, float_numbers
        mov rsi, r15
        call normalize_array

    ;Program prints the normalized array
        mov qword rax, 0
        mov rdi, float_numbers
        mov rsi, r15
        call show_array

    ;Prints - The array will now be sorted
        mov qword rax, 0
        mov rdi, sort_array_message
        call printf

    ;Program sorts the array
        mov qword rax, 0
        mov rdi, float_numbers
        mov rsi, r15
        call sort

    ;Program prints the sorted array
        mov qword rax, 0
        mov rdi, float_numbers
        mov rsi, r15
        call show_array

    ;Prints - Good bye Freshman. You are welcome any time.
        mov qword rax, 0
        mov rdi, program_complete
        call printf

    ;Program sends the username to the main file
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