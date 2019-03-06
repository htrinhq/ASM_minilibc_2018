BITS 64

section .text
global strlen:

strlen:
        push    rbp
        push    rcx
        mov     rbp, rsp
        xor     rcx, rcx

loop:
        cmp     BYTE [rdi + rcx], 0
        je      exit
        inc     rcx
        jmp     loop

exit:
        mov     rax, rcx
        mov     rsp, rbp
        pop     rcx
        pop     rbp
        ret