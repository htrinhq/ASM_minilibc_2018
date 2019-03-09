BITS 64

global memmove:
extern memcpy
section .text

memmove:
    push    rbp
    push    rcx
    push    r8
    mov     rbp, rsp
    cmp     rdi, rsi
    jge     from_right

from_right:
    dec     rdx

loop_right:
    cmp     rdx, 0
    jl      end
    mov     r8b, BYTE [rsi + rdx]
    mov     BYTE [rdi + rdx], r8b
    dec     rdx
    jmp     loop_right

loop_left:
    call    memcpy wrt ..plt

end:
    mov     rax, rdi
    mov     rsp, rbp
    pop     r8
    pop     rcx
    pop     rbp
    ret