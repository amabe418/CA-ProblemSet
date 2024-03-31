; dados una recta y un par de coordenadas, devolver "T" si el punto pertenece a la recta, si no, "F"

%include "io.inc"
section .data
m dw 1
n dw 0
P dw 1,1
pertenece db 'T', 0   
no_pertenece db 'F', 0


section .text
global main
main:
    mov AX, [P]  ;  ax almacena el valor de x
    mov BX, [P+2]; bx almacena el valor de y
    imul AX, [m]  ; se multiplica x*m
    add AX, [n] ; a x*m se le suma n
    cmp AX, BX ; se compara el valor obtenido con el valor de y
    je numero_pertenece ; si pertenece, se imprime "T"
    jmp numero_no_pertenece ; si no pertenece, se imprime "F"
    
    numero_pertenece:
    PRINT_STRING pertenece
    jmp fin
    
    numero_no_pertenece:
    PRINT_STRING no_pertenece
    jmp fin
    
    fin:
    ret