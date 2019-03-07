BITS 64

global strcspn:
extern strlen
section .text

strcspn:
    push    rbp
    push    rcx
    push    rdx
    push    r8
    mov     rbp, rsp
    xor     rcx, rcx
    cmp     BYTE [rsi], 0
    je      return_strlen

loop:
    xor     rdx, rdx
    cmp     BYTE [rdi + rcx], 0
    je      return_strlen

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
    mov     rax, rcx
    jmp     end

return_strlen:
    call    strlen wrt ..plt

end:
    mov     rsp, rbp
    pop     r8
    pop     rdx
    pop     rcx
    pop     rbp
    ret