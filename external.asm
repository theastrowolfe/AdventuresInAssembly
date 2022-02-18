global main
extern printf

section .data
    msg db "Testing %i...", 0x0A, 0x00 ; format string, newline, null byte

main:
    ; Prolog
    push ebp
    mov  ebp, esp

    ; Arguments are pushed onto the stack in REVERSE order
    push 123
    push msg
    call printf

    mov eax, 0 ; Return value for main function

    ; Epilog
    mov esp, ebp
    pop ebp
    ret

