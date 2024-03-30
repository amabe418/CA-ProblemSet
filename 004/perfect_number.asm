%include "io.inc"
section .data
    nth dw 4
    _nth dd 0
    m dd 2
    p1 dd 0
    p2 dd 0
    counter dd 0
    result dd 0

section .text
global CMAIN

CMAIN:
    mov ebp, esp             ; for correct debugging
    call swap                ;swapping nth with _nth
    call nth_perfect_number
    PRINT_DEC 2, [result]
    NEWLINE
    ret
 
is_prime:
    push ebp
    mov ebp, esp
    
    push ebx
    push ecx
    push edx
    mov eax, [m]
    
    cmp eax,1
    je .not_prime
    
    cmp eax, 2
    je .prime
    mov ecx, 2
    
    .while_prime:
        mov eax, [m]
        cmp ecx, eax
        je .prime
        xor edx, edx    ; limpiamos los residuos
        div ecx
        cmp edx, 0
        je .not_prime
        inc ecx
        jmp .while_prime
            
    .prime:
        mov eax, 1
        jmp .end_prime
        
    .not_prime:
        mov eax, 0
        jmp .end_prime
        
    .end_prime:
        pop edx
        pop ecx
        pop ebx
        pop ebp
        ret
    
nth_perfect_number:
    push ebp
    mov ebp, esp
    
    .while_perfect:
    
        call is_prime      ; llamamos a is_prime que guarda 0 o 1 en eax acorde al resultado.
        cmp eax, 0         ; verificando si m es primo
        je .next_iteration ; si m no es primo pasamos a la proxima iteracion
                           ; si m es primo hay que verificar que la formula de marsenne devuelva un numero primo tambien
        mov ecx, [m]       ; guardamos m en ecx

        ;call print_ecx
        
        call pow           ; hallamos 2^m
        
        ;call print_eax
        
        sub eax, 1        ; 2^m - 1
        
        ;call print_eax
        
        mov [p1], eax     ; lo guardamos como el primer numero
        
        ;PRINT_DEC 2, [p1]
        ;NEWLINE
        
        call is_prime    
        
        cmp eax, 0         ; verificamos que sea primo
        
        je .next_iteration ; si no es primo pasamos a la siguiente iteracion
        
        ; si llegamos hasta aqui significa que todo ok
        
        mov ecx, [m]       ; movemos m a ecx
        
        ;call print_ecx
        
        sub ecx, 1         ; m-1
        
        ;call print_ecx
        
        call pow          ; 2^(m-1)
        
        ;call print_eax
        
        mov [p2], eax    ; lo guardamos como el segundo numero
        
        ;PRINT_DEC 2, [p2]
        ;NEWLINE
        
        mov ebx, [p1]
        
        ;PRINT_DEC 2, [p1]
        ;NEWLINE
        
        imul eax, ebx
        ;call print_eax
        ;call print_edx
        
        ;call print_eax
        
        mov [result], eax
        
        ;call print_eax
        
       
        
        mov eax, [_nth]
        mov ecx, [counter]
        
        add ecx, 1
        mov [counter], ecx
        cmp eax, ecx
        je .end
        
        cmp eax, 0            ; verificamos que hayamos llegado al n-esimo perfecto
        je .end
        
        jmp .next_iteration
        
    .end:    
    mov esp, ebp
    pop ebp
    ret
    
    .next_iteration:
    mov eax, [m]
    add eax, 1
    mov [m], eax
    jmp .while_perfect
     
pow:
    mov eax, 1
    .pow_loop:
        shl eax, 1
        sub ecx, 1
        cmp ecx, 0
        je .end_pow
        jmp .pow_loop
    .end_pow:  
    ret
    
print_eax:
     PRINT_DEC 2, eax   ; revisamos eax
     NEWLINE
     ret

print_ebx:
     PRINT_DEC 2, ebx   ; revisamos ebx
     NEWLINE
     ret

print_ecx:
     PRINT_DEC 2, ecx   ; revisamos ecx
     NEWLINE
     ret
     
print_edx:
     PRINT_DEC 2, edx   ; revisamos edx
     NEWLINE
     ret

print_counter:
    PRINT_DEC 2, [counter]
    NEWLINE
    ret
    
swap:
    mov eax, [nth]
    mov [_nth], eax
    mov eax, 0
    ret
        