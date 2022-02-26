; Name: Joshua Wolfe
; Date: 26 Feb 2022
; Description:
;   Use integers results only
;   Perfect square in EAX
;   Square root in EBX

global main
extern printf

section .data
    msg db "sqrt of %i is %i", 0x0A, 0x00 ; format string, newline, null byte

main:
    ; Prolog
    push ebp
    mov  ebp, esp

    ; def sqrt(eax)
    mov eax, 49
    mov ebx, eax
    ; if eax == 0 or eax == 1 return ebx
    cmp eax, 0
    je done
    cmp eax, 1
    je done
    ; from 1 to eax test until ebx * ebx == eax
    mov ebx, 1
    mov ecx, 1
test:
    cmp ecx, eax
    jg return
    inc ebx
    mov ecx, ebx
    imul ecx, ecx
    jmp test
return:
    dec ebx
done:
    ; Arguments are pushed onto the stack in REVERSE order
    push ebx
    push eax
    push msg
    call printf

    mov eax, 0 ; Return value for main function
    ; Epilog
    mov esp, ebp
    pop ebp
    ret

