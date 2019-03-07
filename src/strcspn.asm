BITS 64

global strcspn:
section .text

strcspn:
    push    rbp
    push    rcx
    push    rdx
    mov     rbp, rsp
    xor     rcx, rcx

loop:
    cmp     BYTE [rdi + rcx], 0
    je     return_null


return_null:
    mov     rax, 0

end:
    mov     rsp, rbp
    pop     rdx
    pop     rcx
    pop     rbp