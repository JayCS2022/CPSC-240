;Jay Parmar
;Jay-04.CS@csu.fullerton.edu
;240-17 final program

global hmean

null equ 0

segment .data
    one dq 1.0

segment .bss


segment .text
    hmean:
        push rbp
        mov  rbp,rsp
        push rdi
        push rsi
        push rdx
        push rcx
        push r8
        push r9
        push r10
        push r11
        push r12
        push r13
        push r14
        push r15
        push rbx
        pushf

        xor rax, rax
        xor r14, r14
        mov r12, rdi
        mov r13, rsi

        movsd xmm13, qword [one]
        pxor xmm15, xmm15
    ;Calculates the Sum of the array received
    sumLoop:
        cmp r14, r13
        jge endLoop

        movsd xmm14, qword [r12 + r14 * 8]
        divsd xmm13, xmm14
        addsd xmm15, xmm13
        inc r14

        jmp sumLoop

    ;Sends the sum information to the Manager file
    endLoop:
        movsd xmm0, xmm15

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

    ret
        ret