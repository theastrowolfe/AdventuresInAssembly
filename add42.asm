global add42
add42:
    ; Prolog
    push ebp
    mov ebp, esp
    
    mov eax, [ebp+8]    ; mov argument into eax (the return value)
    add eax, 42         ; add 42

    ; Epilog
    mov esp, ebp
    pop ebp
    ret
