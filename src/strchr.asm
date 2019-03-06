BITS 64

global strchr:
section .text

strchr:
    push    rbp
    mov     rbp, rsp

loop:
    cmp BYTE [rdi], sil
    jz  get_char
    cmp BYTE [rdi], 0
    jz  no_char
    inc rdi
    jmp loop

get_char:
    mov rax, rdi
    jmp end

no_char:
    mov rax, 0

end:
    mov rsp, rbp
    pop rbp
    ret