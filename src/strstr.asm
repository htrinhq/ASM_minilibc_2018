BITS 64

global strstr:
extern strncmp
section .text

strstr:
    push    rbp
    push    rcx
    mov     rbp, rsp
    xor     rcx, rcx

end:
    mov     rsp, rbp
    pop     rcx
    pop     rbp
