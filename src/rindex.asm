BITS 64

global rindex:
section .text

rindex:
    push    rbp
    mov     rbp, rsp

end:
    mov     rsp, rbp
    pop     rbp