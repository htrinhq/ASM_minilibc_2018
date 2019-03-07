BITS 64

global strstr:
extern strncmp
extern  strlen
section .text

strstr:
    push    rbp
    push    rcx
    push    rdx
    push    r8
    push    r9
    mov     rbp, rsp
    mov     r9, rdi
    mov     rdi, rsi
    call    strlen wrt ..plt
    mov     rdx, rax
    mov     rdi, r9
    xor     rcx, rcx

check_rsi:
    cmp     rsi, 0
    je      return_rdi

loop:
    cmp     BYTE [rdi + rcx], 0
    je      return_null
    mov     r8, rdi
    movzx   rdi, BYTE [rdi + rcx]
    call    strncmp wrt ..plt
    mov     rdi, r8
    cmp     rax, 0
    je      return_pointer
    inc     rcx
    jmp     loop

return_rdi:
    mov     rax, rdi
    jmp     end

return_pointer:
    movzx   r8, BYTE [rdi + rcx]
    mov     rax, r8
    jmp     end

return_null:
    mov     rax, 0

end:
    mov     rsp, rbp
    pop     r9
    pop     r8
    pop     rdx
    pop     rcx
    pop     rbp
    ret
