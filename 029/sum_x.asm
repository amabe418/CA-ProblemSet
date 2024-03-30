%include "io.inc"

section .data
x db 200
n dd 6
array db 100, 4, 5, 6,2 ,100
sum db 0
string db " ", 0

section .text
global main

main:
mov ebp, esp    ; for correct debugging
push dword [n]  ; guardamos en la pila el tamaño del array
call sum_x      ; llamamos a la funcion
add esp, 4
ret

sum_x:
; ecx: indice i
; edx: indice j
; [ebp + 4]: |L|
; eax: |L| - 1

mov ebp, esp
mov ecx, 0                      ; inicializamos i = 0
mov eax, [ebp + 4]  
dec eax

    .while_1:
    cmp ecx, eax                ; comparamos i con |L| - 1
    je .not_x                   ; si son iguales terminamos el ciclo
    
    mov bh, byte[array + ecx]   ; asignamos ai en BH
    
    mov [sum], bh               ; guardamos ai en sum
    mov edx, ecx                ; inicializamos j = i + 1
    inc edx

        .while_2:                        
        cmp edx, [ebp+4]            ; comparamos j con |L|
        je .increase_i              ; si son iguales pasamos a la proxima iteracion de i
        mov bl, byte[array + edx]   ; asignamos aj en BL
        add bl, bh                  ; sumamos bl y bh
        cmp bl, [x]                 ; comparamos el resultado con el numero deseado
        je .end                     ; si son iguales devolvemos indices
        jmp .increase_j             ; si no, pasamos a la proxima iteracion
        
    jmp .increase_i                 ; aumentamos i en 1
    
.increase_i:
inc ecx
jmp .while_1

.increase_j:
inc edx
jmp .while_2

.not_x:
mov eax, [ebp+4]
inc eax
PRINT_DEC 1, eax
ret

.end:
PRINT_DEC 1, ecx
PRINT_STRING string
PRINT_DEC 1, edx
ret

print:
PRINT_DEC 2, eax
NEWLINE