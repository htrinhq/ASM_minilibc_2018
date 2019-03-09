BITS 64

global memmove:
section .text

memmove:
    push    rbp
    push    rcx
    push    r8
    mov     rbp, rsp
    cmp     rdi, rsi
    jge     from_right
    xor     rcx, rcx

loop_left:
    cmp     rcx, rdx
    je      end
    mov     r8b, BYTE [rsi + rcx]
    mov     BYTE [rdi + rcx], r8b
    inc     rcx
    jmp     loop_left

from_right:
    dec     rdx

loop_right:
    cmp     rdx, 0
    jl      end
    mov     r8b, BYTE [rsi + rdx]
    mov     BYTE [rdi + rdx], r8b
    dec     rdx
    jmp     loop_right

end:
    mov     rax, rdi
    mov     rsp, rbp
    pop     r8
    pop     rcx
    pop     rbp
    ret