;Jay Parmar
;Jay-04.CS@csu.fullerton.edu
;240-17 final program

extern printf
extern scanf
extern Input_array
extern Output_array
extern hmean
extern Sort
extern fgets
extern printf
extern scanf
extern stdin
extern strlen
global Manager

null equ 0

segment .data
    program_overview db 10, "This program will sum your array of integers", 10, 0
    first_prompt db "Enter a sequence of up to 10 float numbers that are not zero. separated by white space.", 10
                db "After the last input press enter followed by Control+D: ", 10, 0
    array_message db 10, "These number were received and placed into the array:", 10, 0
    array_sum_message db 10 , 10, "The harmonic sum of the numbers in this array is %lf.", 10, 0
    sorted_array db 10, "This is the sorted array", 10, 0
    completed db 10, 10, "This program will return execution to the main function.", 10, 10, 0
    newline db 10, 0
    floatform db "%lf", 0

segment .bss
    array resq 100
    array_size resq 10
    array_sum resq 100


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
        call hmean
        movsd xmm13, xmm0

    ;Prints the message stating the number of elements in the array and the sum.
        mov rax, 1
        mov rdi, array_sum_message
        movsd xmm0, xmm13
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
    
        mov rax, 1
        movsd xmm0, xmm13
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