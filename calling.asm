global _start

_start:
    call func
    mov eax, 1
    mov ebx, 0
    int 0x80

func:
    ; Prolog
    push ebp
    mov ebp, esp
    sub esp, 2
    ; Body
    mov [esp],   byte 'H'
    mov [esp+1], byte 'i'
    mov eax, 4
    mov ebx, 1
    mov ecx, esp
    mov edx, 2
    int 0x80
    ; Epilog
    mov esp, ebp
    pop ebp
    ret

