global main
extern printf

section .text:
message:
    db "Hello, World!", 0x0A, 0x00

main:
    ; Prolog
    push ebp
    mov ebp, esp

    mov esi, message
    mov edi, buffer
    mov ecx, 13
reverse:
    mov al, [esi+ecx-1]
    mov [edi], al
    inc edi
    loop reverse

    push buffer
    call printf
    add esp, 4

    mov eax, 0

    ; Epilog
    mov esp, ebp
    pop ebp
    ret

section .data
buffer:
    times 13 db (0)
    db 0x0A, 0x00
