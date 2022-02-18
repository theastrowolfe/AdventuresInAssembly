global _start

section .data
    msg db  "Hello, world!", 0x0A, 0
    len equ $ - msg

section .text
_start:
    xor ecx, ecx    ; zero out ecx

l1:
    inc ecx
    push ecx        ; save counter on stack

    mov eax, 4      ; sys_write system call
    mov ebx, 1      ; stdout file descriptor
    mov ecx, msg    ; bytes to write
    mov edx, len    ; number of bytes to write
    int 0x80        ; perform system call

    pop ecx         ; load counter from stack
    cmp ecx, 40
    jl l1

exit:
    mov eax, 1
    mov ebx, 0
    int 0x80

