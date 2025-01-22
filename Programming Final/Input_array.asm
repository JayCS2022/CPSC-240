extern scanf
extern printf
extern stdin
extern isfloat
extern fgets
extern strlen
global Input_array
null equ 0

segment .data
    floatform db "%lf  ", 0
    invalid_message db "An error was detected. Re-enter the number", 10, 0

segment .bss

segment .text
Input_array:
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
    
    ;Saves the array and size in the registers
    mov r14, rdi
    mov r15, rsi
    ;Sets the counter to zero
    xor r13, r13
    ;Creates sotrage space for array
    sub rsp, 320

    ;Takes the user input
    Start_code:
        ;Prompts the user for input
        mov rax, 0
        mov rdi, floatform
        mov rsi, rsp
        call scanf
        cdqe
            cmp rax, -1
            je finish
        ;Checks if the input is an integer otherwise prints invalid input message
        mov rax, 0
        mov rdi, rsp
        call isfloat
        cmp rax, -1
        je Invalid_input
        mov [r14+8*r13], rax

        ;Increments until the user has reached the max size
        inc r13
        cmp r13, r15
        jl Start_code
        jmp finish

    ;Prints the invalid input message
    Invalid_input:
        mov rax, 0
        mov rdi, invalid_message
        call printf
        jmp Start_code
    
    ;Completes running the file
    finish:
        mov rax, r13
        add rsp, 320

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
