BITS 64

global rindex:
extern strlen
section .text

rindex:
    push    rbp
    push    rcx
    mov     rbp, rsp
    call    strlen wrt ..plt
    mov     rcx, rax

loop:
    cmp     BYTE [rdi + rcx], sil
    je      get_char
    cmp     rcx, 0
    je      no_char
    dec     rcx
    jmp     loop

get_char:
    add     rdi, rcx
    mov     rax, rdi
    jmp     end

no_char:
    xor     rax, rax

end:
    mov     rsp, rbp
    pop     rcx
    pop     rbp
    ret