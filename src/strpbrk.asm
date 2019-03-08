BITS 64

global strpbrk:
section .text

strpbrk:
    push    rbp
    push    rcx
    push    rdx
    push    r8
    mov     rbp, rsp
    xor     rcx, rcx
    cmp     BYTE [rsi], 0
    je      return_null

loop:
    xor     rdx, rdx
    cmp     BYTE [rdi + rcx], 0
    je      return_null

compare_with_rsi:
    cmp     BYTE [rsi + rdx], 0
    je      next_loop
    mov     r8b, BYTE [rdi + rcx]
    cmp     r8b, BYTE [rsi + rdx]
    je      return_index
    inc     rdx
    jmp     compare_with_rsi

next_loop:
    inc     rcx
    jmp     loop

return_index:
    mov     rax, rdi
    add     rax, rcx
    jmp     end

return_null:
    xor     rax, rax

end:
    mov     rsp, rbp
    pop     r8
    pop     rdx
    pop     rcx
    pop     rbp
    ret