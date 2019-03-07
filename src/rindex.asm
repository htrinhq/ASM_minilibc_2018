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

end:
    mov     rsp, rbp
    pop     rcx
    pop     rbp