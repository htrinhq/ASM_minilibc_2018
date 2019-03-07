BITS 64

global strncmp:
section .text

strncmp:
    push    rbp
    push    rcx
    push    r8
    push    r9
    mov     rbp, rsp
    xor     rcx, rcx

loop:
    cmp     rcx, rdx
    je      end
    movzx   r8, BYTE [rsi + rcx]
    movzx   r9, BYTE [rdi + rcx]
    cmp     r8b, 0
    je      end

compare:
    cmp     r9b, r8b
    jne     end
    inc     rcx
    jmp     loop

end:
    movzx   rax, BYTE [rdi + rcx]
    movzx   r8, BYTE [rsi + rcx]
    sub     rax, r8
    mov     rsp, rbp
    pop     r9
    pop     r8
    pop     rcx
    pop     rbp
    ret