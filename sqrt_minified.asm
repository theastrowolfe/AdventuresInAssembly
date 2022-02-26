global _start

_start:
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

