BITS 64

global strncmp:
section .text

strcmp:
    push    rbp
    push    rcx
    mov     rbp, rsp
    xor     rcx, rcx

loop:
    cmp     rcx, rdx
    je      end
    cmp     BYTE [rdi + rcx], 0
    je      end
    cmp     BYTE [rsi + rcx], 0
    je      end
    mov     r8b, [rsi + rcx]
    cmp     BYTE [rdi + rcx], r8b
    jne     end
    inc     rcx
    jmp     loop

end:
    movzx   rax, BYTE [rdi + rcx]
    sub     rax, r8
    mov     rsp, rbp
    pop     rcx
    pop     rbp
    ret