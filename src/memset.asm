BITS 64

global memset:
section .text

memset:
    push    rbp
    push    rcx
    mov     rbp, rsp
    xor     rcx, rcx

loop:
    cmp     rcx, rdx
    je      end
    mov     BYTE [rdi + rcx], sil
    inc     rcx
    jmp     loop

end:
    mov     rax, rdi
    mov     rsp, rbp
    pop     rcx
    pop     rbp
    ret