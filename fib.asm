global main
extern printf

section .data
    fmt_str db "%i", 0x0A, 0x00

section .text:
main:
    ; Prolog
    push ebp
    mov ebp, esp

    xor ecx, ecx    ; zero out counter
    mov ebx, 0      ; fist fib
    push 1          ; second fib
l1:
    push ecx        ; save counter
    push ebx        ; arg 2: value for specifier
    push fmt_str    ; arg 1: format_string
    call printf     ; printf()
    add esp, 8      ; clean up printf
    pop ecx         ; load counter

    pop eax         ; eax = prev fib
    push ebx        ; prev value for next iter
    add ebx, eax    ; current fib

    inc ecx         ; increment counter
    cmp ecx, 40     ; if counter < 40 then jump
    jl l1

    mov eax, 0      ; return value

    ; Epilog
    mov esp, ebp
    pop ebp
    ret

