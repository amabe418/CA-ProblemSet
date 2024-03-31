%include "io.inc"
section .data
A dw 2,4,3,6,8   ;Conjunto A
c_a dw 5         ;cantidad de elementos en el conjunto A
c_b dw 4         ;cantidad de elementos en el conjunto B
B dw 2,3,4,8     ;Conjunto B
indice dw 0
espacio db " ",0

section .text
global main
main:
    mov ebp, esp; for correct debugging
  
  mov cx, [indice]
  jmp cicloA
  
  cicloA: ; recorre los elementos del conjunto A y busca si se encuentra en el Conjunto B
   mov esi, A
   cmp cx, [c_a]
   je fin
   movzx eax, cx
   imul eax, eax, 2
   add esi, eax
   mov ax, [esi]
   mov dx, [indice]
   jmp cicloB
  

  cicloB: ; recorre el conjunto B revisando si sus elementos so iguales al elemento en cuestion de A hasta que lo encuentra
  cmp dx, [c_b]
      je cicloA
  mov esi, B
  movzx ebx, dx
  imul ebx, ebx, 2
  add esi, ebx
  mov bx, [esi]
  cmp ax, bx
  jne no_iguales
    PRINT_DEC 2, ax
    PRINT_STRING espacio
   inc cx
   jmp cicloA

  no_iguales:
    inc dx
    cmp dx, [c_b]
    jl cicloB
    inc cx
    jmp cicloA

fin:
    ret
