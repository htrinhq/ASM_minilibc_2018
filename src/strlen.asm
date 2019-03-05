BITS 64

SECTION .text

strlen:
        PUSH    RBP
        MOV     RBP, RSP
        XOR     RCX, RCX

loop:
        CMP     BYTE [RDI + RCX], 0
        JZ      end
        INC     RCX
        JMP     loop

end:
        MOV     RAX, RCX
        MOV     RSP, RBP
        POP     RBP
        RET