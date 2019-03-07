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
    dec     rcx

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
    mov     rax, 0

end:
    mov     rsp, rbp
    pop     rcx
    pop     rbp
    ret