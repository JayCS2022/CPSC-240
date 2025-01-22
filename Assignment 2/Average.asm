;****************************************************************************************************************************
;Program name: "Average Driving Time".                                                                                  *
;shite space.  Copyright (C) 2024  Jay Parmar                                                                               *
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
; Program name: Average Driving Time
;  Programming languages X86 with one module in C
;Purpose
;  This program will serve to calculate the average driving time and total average speed from user input.
;
;Project information
;  Files: Driver.c, Average.asm, r.sh
;  Status: The program has been tested extensively with no detectable errors.
;
;Translator information
;  Linux: nasm -f elf64 -o Average.o Average.asm
;
;===== Begin code area ====================================================================================================================================================

;Declarations
extern fgets
extern printf
extern scanf
extern stdin
extern strlen
extern atof
extern isfloat
global Average

null equ 0

segment .data
    instruction db "Please enter your first and last names: ", 0
    stringform db "%s", 0
    title db "Please enter your title such as Lieutenant, Chief, Mr, Ms, Influencer, Chairman, Freshman, Foreman, Project Leader, etc: ", 0
    title_stringform db "%s", 0
    thank_you db "Thank you %s %s.", 10, 10, 0
    floatform db "%lf", 0
    invalid_input_message db "Invalid data detected. Try again", 10, 0
    Fullerton_to_Santa_Ana db "Enter the number of miles traveled from Fullerton to Santa Ana: ", 0
    FSA_Speed db "Enter your average speed during that leg of the trip: ", 0
    Santa_Ana_to_Long_Beach db 10, "Enter the number of miles traveled from Santa_Ana to Long_Beach: ", 0
    SLB_Speed db "Enter your average speed during that leg of the trip: ", 0
    Long_Beach_to_Fullerton db 10, "Enter the number of miles traveled from Long Beach to Fullerton: ", 0
    LBF_Speed db "Enter your average speed during that leg of the trip: ", 0
    data db 10, "The inputted data are being processed", 10, 10, 0
    total_distance db "The total distance traveled is %2.1lf miles.", 10, 0
    trip_time db "The time of the trip is %1.8lf hours", 10, 0
    average_speed db "The average speed during this trip is %2.8lf mph.", 10, 0
    locations dq 3.0, 0

segment .bss
    username resb 50
    user_title resb 40
    FSA_drive_number resb 1024
    SLB_drive_number resb 1024
    LBF_drive_number resb 1024
    FSA_Driving_Average_Speed resb 1024
    SLB_Driving_Average_Speed resb 1024
    LBF_Driving_Average_Speed resb 1024

segment .text
    Average:
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
        jmp try_again
    
    ;=================================================================================================================================================
    ;These below code blocks are called in the try_again code blocks if the user input is invalid for any of 
    ;the prompts asking for the number of miles driven or the average speed.
    ;When these code blocks are run, the program will output an error message asking the user to type a valid input.
    invalid_input1:
        mov rax, 0
        mov rdi, invalid_input_message
        call printf
        jmp try_again
    
    invalid_input1.1:
        mov rax, 0
        mov rdi, invalid_input_message
        call printf
        jmp try_again1.1

    invalid_input2:
        mov rax, 0
        mov rdi, stringform
        mov rsi, invalid_input_message
        call printf
        jmp try_again2
    
    invalid_input2.1:
        mov rax, 0
        mov rdi, invalid_input_message
        call printf
        jmp try_again2.1
    
    invalid_input3:
        mov rax, 0
        mov rdi, stringform
        mov rsi, invalid_input_message
        call printf
        jmp try_again3
    
    invalid_input3.1:
        mov rax, 0
        mov rdi, stringform
        mov rsi, invalid_input_message
        call printf
        jmp try_again3.1
    ;The above code blocks are called in the try_again code blocks if the user input is invalid for any of 
    ;the prompts asking for the number of miles driven or the average speed.
    ;When these code blocks are run, the program will output an error message asking the user to type a valid input.
    ;=================================================================================================================================================

    try_again:
    ;Shows message prompting the user to input miles
        mov rax, 0
        mov rdi, Fullerton_to_Santa_Ana
        call printf

    ;Takes the user input for the number of miles
        mov rax, 0
        mov rdi, FSA_drive_number
        mov rsi, 1024
        mov rdx, [stdin]
        call fgets
    
    ;Remove new line
        mov rax, 0
        mov rdi, FSA_drive_number
        call strlen
        mov [FSA_drive_number+rax-1], byte 0
    
    ;Validate new input
        mov rax, 0
        mov rdi, FSA_drive_number
        call isfloat
        
        cmp rax, 0
        je invalid_input1

    ;Convert string to real float
        mov rax, 1
        mov rdi, FSA_drive_number
        call atof
        movsd xmm10, xmm0
        movsd xmm13, xmm10
        movsd xmm15, xmm13

    try_again1.1:
    ;Shows message prompting the user to input average speed
        mov qword rax, 0
        mov rdi, FSA_Speed
        mov rsi, FSA_Driving_Average_Speed
        call printf

    ;Takes the user input for the average speed
        mov rax, 0
        mov rdi, FSA_Driving_Average_Speed
        mov rsi, 1024
        mov rdx, [stdin]
        call fgets
    
    ;Remove new line
        mov rax, 0
        mov rdi, FSA_Driving_Average_Speed
        call strlen
        mov [FSA_Driving_Average_Speed+rax-1], byte 0

    ;Validate new input
        mov rax, 0
        mov rdi, FSA_Driving_Average_Speed
        call isfloat

        cmp rax, 0
        je invalid_input1.1
    
    ;Convert string to real float
        mov rax, 1
        mov rdi, FSA_Driving_Average_Speed
        call atof
        movsd xmm11, xmm0
        divsd xmm10, xmm11
        addsd xmm12, xmm10
        addsd xmm15, xmm11
    
    try_again2:
    ;Shows message prompting the user to input miles
        mov rax, 0
        mov rdi, Santa_Ana_to_Long_Beach
        call printf

    ;Takes the user input for the number of miles
        mov rax, 0
        mov rdi, SLB_drive_number
        mov rsi, 1024
        mov rdx, [stdin]
        call fgets
    
    ;Remove new line
        mov rax, 0
        mov rdi, SLB_drive_number
        call strlen
        mov [SLB_drive_number+rax-1], byte 0
    
    ;Validate new input
        mov rax, 0
        mov rdi, SLB_drive_number
        call isfloat

        cmp rax, 0
        je invalid_input2
    
    ;Convert string to real float
        mov rax, 1
        mov rdi, SLB_drive_number
        call atof
        movsd xmm10, xmm0
        addsd xmm13, xmm10
        movsd xmm15, xmm13
    
    try_again2.1:
    ;Shows message prompting the user to input average speed
        mov qword rax, 0
        mov rdi, SLB_Speed
        mov rsi, SLB_Driving_Average_Speed
        call printf

    ;Takes the user input for the average speed
        mov rax, 0
        mov rdi, SLB_Driving_Average_Speed
        mov rsi, 1024
        mov rdx, [stdin]
        call fgets
    
    ;Remove new line
        mov rax, 0
        mov rdi, SLB_Driving_Average_Speed
        call strlen
        mov [SLB_Driving_Average_Speed+rax-1], byte 0
    
    ;Validate new input
        mov rax, 0
        mov rdi, SLB_Driving_Average_Speed
        call isfloat
        cmp rax, 0
        je invalid_input2.1
    
    ;Convert string to real float
        mov rax, 1
        mov rdi, SLB_Driving_Average_Speed
        call atof
        movsd xmm11, xmm0
        divsd xmm10, xmm11
        addsd xmm12, xmm10
        addsd xmm15, xmm10

    try_again3:
    ;Shows message prompting the user to input miles
        mov rax, 0
        mov rdi, Long_Beach_to_Fullerton
        call printf

    ;Takes the user input for the number of miles
        mov rax, 0
        mov rdi, LBF_drive_number
        mov rsi, 1024
        mov rdx, [stdin]
        call fgets
    
    ;Remove new line
        mov rax, 0
        mov rdi, LBF_drive_number
        call strlen
        mov [LBF_drive_number+rax-1], byte 0
    
    ;Validate new input
        mov rax, 0
        mov rdi, LBF_drive_number
        call isfloat

        cmp rax, 0
        je invalid_input3
    
    ;Convert string to real float
        mov rax, 1
        mov rdi, LBF_drive_number
        call atof
        movsd xmm10, xmm0
        addsd xmm13, xmm10
        movsd xmm15, xmm13
    
    try_again3.1:
    ;Shows message prompting the user to input average speed
        mov qword rax, 0
        mov rdi, LBF_Speed
        call printf

    ;Takes the user input for the average speed
        mov rax, 0
        mov rdi, LBF_Driving_Average_Speed
        mov rsi, 1024
        mov rdx, [stdin]
        call fgets
    
    ;Remove new line
        mov rax, 0
        mov rdi, LBF_Driving_Average_Speed
        call strlen
        mov [LBF_Driving_Average_Speed+rax-1], byte 0
    
    ;Validate new input
        mov rax, 0
        mov rdi, LBF_Driving_Average_Speed
        call isfloat

        cmp rax, 0
        je invalid_input3.1
    
    ;Convert string to real float
        mov rax, 1
        mov rdi, LBF_Driving_Average_Speed
        call atof
        movsd xmm11, xmm0
        divsd xmm10, xmm11
        addsd xmm12, xmm10
        addsd xmm15, xmm0

    ;Output data process message
        mov qword rax, 0
        mov rdi, data
        call printf

    ;Output total distance traveled message
        mov qword rax, 1
        mov rdi, total_distance
        movsd xmm0, xmm13
        call printf
    
    ;Output total trip time message
        mov qword rax, 1
        mov rdi, trip_time
        movsd xmm0, xmm12
        call printf
    
        divsd xmm13, xmm12
        movsd xmm14, xmm13
    
    ;Calculate Average Speed
        divsd xmm15, xmm12

    ;Output total average speed traveled message
        mov qword rax, 1
        mov rdi, average_speed
        movsd xmm0, xmm14
        call printf
    
    ;Sends the Average Speed number to the C file
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