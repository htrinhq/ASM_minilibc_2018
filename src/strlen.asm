BITS 64

GLOBAL strlen:
SECTION .text

strlen:
        push    rbp
        mov     rbp, rsp
        xor     rcx, rcx

loop:
        cmp     BYTE [rdi + rcx], 0
        jz      exit
        inc     rcx
        jmp     loop

exit:
        mov     rax, rcx
        mov     rsp, rbp
        pop     rbp
        ret