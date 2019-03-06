BITS 64

global strcasecmp:
section .text

strcasecmp:
    push    rbp
    push    rcx
    mov     rbp, rsp
    xor     rcx, rcx
    mov     r8, rdi
    mov     r9, rsi
    jmp     loop_1

loop_1:
    cmp     BYTE [r8 + rcx], 0
    je      end
    cmp     BYTE [r9 + rcx], 0
    je      end

compare_upper_first:
    cmp     BYTE [r8 + rcx], 'A'
    jae     compare_upper_z
    jmp     loop_2

compare_upper_z:
    cmp     BYTE [r8 + rcx], 'Z'
    jbe     to_lower_first
    jmp     loop_2

to_lower_first:
    xor     BYTE [r8 + rcx], 32

compare_upper_sec:
    cmp     BYTE [r9 + rcx], 'A'
    jae     compare_z_sec
    jmp     loop_2

compare_z_sec:
    cmp     BYTE [r9 + rcx], 'Z'
    jbe     to_lower_sec
    jmp     loop_2

to_lower_sec:
    xor     BYTE [r9 + rcx], 32

loop_2:
    mov     dl, [r9 + rcx]
    cmp     BYTE [r8 + rcx], dl
    jne     end
    inc     rcx
    jmp     loop_1

end:
    movzx   rax, BYTE [rdi + rcx]
    movzx   r9, BYTE [rsi + rcx]
    sub     rax, r9
    mov     rsp, rbp
    pop     rcx
    pop     rbp
    ret