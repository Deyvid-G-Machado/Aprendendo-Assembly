; Compilar - Transformar o programa para linguagem máquina
;   nasm -f elf64 hello.asm
; Linkeditar - Transformar o programa em linguagem de máquina para um executável
;   ld -s -o hello hello.o

section .data
    msg db 'Hello World!', 0xA, 0xD
    msg1 db 'Essa é uma mensagem aleatoria!', 0xA  
    tam equ $- msg


section .text

global _start

_start:
    mov EAX, 0x4    ; Fazer uma saida
    mov EBX, 0x1    ; Saida padrao
    mov ECX, msg    ; Mensagem
    mov EDX, tam    ; Tamanho
    int 0x80

saida:
    mov EAX, 0X1 ; SO estou terminando o programa
    mov EBX, 0X0 ; SO o valor de retorno é 0
    int 0X80