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
;  Linux: nasm -f elf64 -o atof.o atof.asm
;
;===== Begin code area ====================================================================================================================================================

;Declarations
global atof

section .data
    neg_mask dq 0x8000000000000000

section .bss
    align 64
    storedata resb 832

section .text
atof:
    ; Back up
    push    rbp
    mov     rbp, rsp
    push    rbx
    push    rcx
    push    rdx
    push    rsi
    push    rdi
    push    r8 
    push    r9 
    push    r10
    push    r11
    push    r12
    push    r13
    push    r14
    push    r15
    pushf

    mov     r15, rdi

    ; Find where the radix point is
    xor     r14, r14
find_radix_loop:
    cmp     byte[r15 + r14], '.'
    je      found_radix_point

    inc     r14
    jmp     find_radix_loop

found_radix_point:
    ; Set up registers for integer part parsing
    xor     r13, r13
    mov     r12, 1
    mov     r11, r14
    dec     r11
    xor     r10, r10

parse_integer:
    mov     al, byte[r15 + r11]
    cmp     al, '+'
    je      finish_parse_integer
    cmp     al, '-'
    je      parse_integer_negative

    ; Convert the ASCII character to in integer and add it to the total
    sub     al, '0'
    imul    rax, r12
    add     r13, rax
    imul    r12, 10

    dec     r11
    cmp     r11, 0
    jge     parse_integer    
    jmp     finish_parse_integer

parse_integer_negative:
    mov     r10, 1

finish_parse_integer:
    ; Set up values for decimal part parsing  
    mov     rax, 10
    cvtsi2sd xmm11, rax
    xorpd   xmm13, xmm13
    movsd   xmm12,xmm11
    inc     r14

parse_decimal:
    mov     al, byte [r15 + r14]
    sub     al, '0'

    ; Convert the ASCII character to decimal value
    cvtsi2sd xmm0, rax
    divsd   xmm0, xmm12
    addsd   xmm13, xmm0
    mulsd   xmm12, xmm11

    inc     r14
    cmp     byte[r15 + r14], 0
    jne     parse_decimal

    ; Add the parsed integer and decimal part together
    cvtsi2sd xmm0, r13
    addsd   xmm0, xmm13

    ; Check the negative flag 0 = positive, 1 = negative
    cmp     r10, 0
    je      return

    movsd xmm1, [neg_mask]
    xorpd xmm0, xmm1 

return:
    push    qword 0
    movsd   [rsp], xmm0

    movsd   xmm0, [rsp]
    pop     rax

    ; Restore
    popf          
    pop     r15
    pop     r14
    pop     r13
    pop     r12
    pop     r11
    pop     r10
    pop     r9 
    pop     r8 
    pop     rdi
    pop     rsi
    pop     rdx
    pop     rcx
    pop     rbx
    pop     rbp

    ret