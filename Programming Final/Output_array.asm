;Jay Parmar
;Jay-04.CS@csu.fullerton.edu
;240-17 final program
extern printf
global Output_array


segment .data
    floatform db "%lf  ", 0

segment .bss

segment .text
Output_array:
    push rbp                                          ;Backup rbp
    mov  rbp,rsp                                      ;The base pointer now points to top of stack
    push rdi                                          ;Backup rdi
    push rsi                                          ;Backup rsi
    push rdx                                          ;Backup rdx
    push rcx                                          ;Backup rcx
    push r8                                           ;Backup r8
    push r9                                           ;Backup r9
    push r10                                          ;Backup r10
    push r11                                          ;Backup r11
    push r12                                          ;Backup r12
    push r13                                          ;Backup r13
    push r14                                          ;Backup r14
    push r15                                          ;Backup r15
    push rbx                                          ;Backup rbx
    pushf                                             ;Backup rflags

    ;Sets the counter to zero
    xor r15, r15
    ;Saves the array and size in the registers
    mov r12, rdi
    mov r13, rsi

    ;Increments and prints the elements of the array until the full array has been printed
    begin_loop:
    cmp r15, r13
    jge done
    mov rax, 1
    mov rdi, floatform
    movsd xmm0,  [r12 + r15 * 8]
    call printf

    inc r15
    jmp begin_loop
    
    ;Completes running the file
    done:

    popf                                    ;Restore rflags
    pop rbx                                 ;Restore rbx
    pop r15                                 ;Restore r15
    pop r14                                 ;Restore r14
    pop r13                                 ;Restore r13
    pop r12                                 ;Restore r12
    pop r11                                 ;Restore r11
    pop r10                                 ;Restore r10
    pop r9                                  ;Restore r9
    pop r8                                  ;Restore r8
    pop rcx                                 ;Restore rcx
    pop rdx                                 ;Restore rdx
    pop rsi                                 ;Restore rsi
    pop rdi                                 ;Restore rdi
    pop rbp                                 ;Restore rbp

    ret                                     ;Pop the integer stack and jump to the address equal to the popped value.
