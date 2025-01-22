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
;  Linux: nasm -f elf64 -o faraday.o faraday.asm
;
;===== Begin code area ====================================================================================================================================================

;Declarations
extern atof
extern strlen
extern ftoa
global faraday
NULL equ 0
LF equ 10

segment .data
    instruction db 10, 10, "Please enter your full name: ", 0
    career db "Please enter the career path you are following: ", 0
    program db "Thank you. We appreciate all ", 0
    circuit_emf db 10, "Please enter the EMF of your circuit in volts: ", 0
    input db "You entered ", 0
    current_amps db "Please enter the current in this circuit in amps: ", 0
    input_two db "You entered ", 0
    circuit_resistance db "The resistance in this circuit is ", 0
    ohms db "ohms.", 0
    program_done db 10, "Thank you ", 0

segment .bss
    name resb 30
    onebyte resb 1
    career_path resb 40
    circuit_emf_number resb 100
    circuit_amps_number resb 10
    output_buffer resb 256

segment .text
    faraday:
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

        ;Calculates the length of the string
        mov rax, 0
        mov rdi, instruction
        call strlen
        mov r14, rax

        ;Prints - Please enter your full name: 
        mov rax, 1
        mov rdi, 1
        mov rsi, instruction
        mov rdx, r14
        syscall

        ;Asks for user input
        mov rax, 0
        mov rdi, 0
        mov rsi, name
        mov rdx, 30
        syscall

        ;Calculates the length of the string
        mov rax, 0
        mov rdi, career
        call strlen
        mov r14, rax

        ;Prints - Please enter the career path you are following: 
        mov rax, 1
        mov rdi, 1
        mov rsi, career
        mov rdx, r14
        syscall

        ;Asks for user input
        mov rax, 0
        mov rdi, 0
        mov rsi, career_path
        mov rdx, 40
        syscall

        ;Calculates the length of the string
        mov rax, 0
        mov rdi, program
        call strlen
        mov r14, rax

        ;Prints - Thank you. We appreciate all 
        mov rax, 1
        mov rdi, 1
        mov rsi, program
        mov rdx, r14
        syscall

        ;Prints the user input
        mov rax, 1
        mov rdi, 1
        mov rsi, career_path
        mov rdx, r14
        syscall

        ;Calculates the length of the string
        mov rax, 0
        mov rdi, circuit_emf
        call strlen
        mov r14, rax

        ;Prints - Please enter the EMF of your circuit in volts: 
        mov rax, 1
        mov rdi, 1
        mov rsi, circuit_emf
        mov rdx, r14
        syscall

        ;Asks the user to input float number
        mov rax, 0
        mov rdi, 0
        mov rsi, circuit_emf_number
        mov rdx, 100
        syscall

        ;Calculates the length of the string
        mov rax, 0
        mov rdi, input
        call strlen
        mov r14, rax

        ;Prints - You entered 
        mov rax, 1
        mov rdi, 1
        mov rsi, input
        mov rdx, r14
        syscall

        ;Converts user input from string to float number
        mov rax, 0
        mov rdi, circuit_emf_number
        call atof
        movsd xmm12, xmm0
        movsd xmm11, xmm12

        ;Prints user input number
        mov rax, 1
        movsd xmm0, xmm15
        mov r13, rdi
        mov r15, rdx
        mov rdi, 1
        mov rsi, r13
        syscall

        ;Calculates the length of the string
        mov rax, 0
        mov rdi, current_amps
        call strlen
        mov r14, rax

        ;Prints - Please enter the current in this circuit in amps: 
        mov rax, 1
        mov rdi, 1
        mov rsi, current_amps
        mov rdx, r14
        syscall

        ;Asks the user to input float number
        mov rax, 0
        mov rdi, 0
        mov rsi, circuit_amps_number
        mov rdx, 100
        syscall

        ;Calculates the length of the string
        mov rax, 0
        mov rdi, input_two
        call strlen
        mov r14, rax

        ;Prints - You entered 
        mov rax, 1
        mov rdi, 1
        mov rsi, input_two
        mov rdx, r14
        syscall

        ;Converts user input from string to float number
        mov rax, 0
        mov rdi, circuit_amps_number
        call atof
        movsd xmm13, xmm0
        movsd xmm12, xmm13

        ;Prints user input number
        mov rax, 1
        movsd xmm0, xmm13
        mov r13, rdi
        mov r15, rdx
        mov rdi, 1
        mov rsi, r13
        syscall

        ;Prints - The resistance in this circuit is 
        mov rax, 1
        mov rdi, 1
        mov rsi, circuit_resistance
        mov rdx, 34
        syscall

        ;Calculates the resistance of the circuit
        divsd xmm12, xmm11

        ;Prints the resistance of the circuit number
        mov rax, 1
        movsd xmm0, xmm12
        mov rdi, 1
        mov rsi, r13
        syscall

        ;Prints - ohms
        mov rax, 1
        mov rdi, 1
        mov rsi, ohms
        mov rdx, 6
        syscall

        ;Calculates the length of the string
        mov rax, 0
        mov rdi, program_done
        call strlen
        mov r14, rax

        ;Prints - Thank you 
        mov rax, 1
        mov rdi, 1
        mov rsi, program_done
        mov rdx, r14
        syscall
        
        ;Calculates the length of the string
        mov rax, 0
        mov rdi, name
        call strlen
        mov r14, rax

        ;Prints the name of the user
        mov rax, 1
        mov rdi, 1
        mov rsi, name
        mov rdx, r14
        syscall

        ;Sends the resistance of the circuit number to driver.asm
        mov rax, 1
        movsd xmm0, xmm12

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