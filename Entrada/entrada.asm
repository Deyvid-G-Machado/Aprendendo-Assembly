segment .data
  LF        equ 0xA     ; Line feed
  NULL      equ 0xD     ; Final da String
  SYS_CALL  equ 0x80    ; Envia informacao ao SO

  ; EAX
  SYS_EXIT  equ 0x1     ; Codigo de chamada para finalizar
  SYS_READ  equ 0x3     ; Operacao de leitura
  SYS_WRITE equ 0x4     ; Operacao de escrita

  ; EBX
  RET_EXIT  equ 0x0     ; Operacao realizada com sucesso
  STD_IN    equ 0x0     ; Entrada padrao
  STD_OUT   equ 0x1     ; Saida padrao

section .data
  msg db "Entre com seu nome:", LF, NULL
  tam equ $- msg    ; Pegar o tamanho

section .bss
  ; byte resb 1  | Para armazenar um número de 0 a 255
  ; word resw 1  | Para armazenar um número de 0 a 65535
  ; dword  resd 1 | Para armazenar um número de 0 a 4294967295
  nome resb 1   ; Eu falo que ela e uma entrada de byte

section .text

global _start

_start:
  mov eax, SYS_WRITE
  mov ebx, STD_OUT
  mov ecx, msg
  mov edx, tam
  int SYS_CALL

  mov eax, SYS_READ
  mov ebx, STD_IN
  mov ecx, nome
  mov edx, 0xA      ; O tamanho limite de caracteres de entrada
  int SYS_CALL

  mov eax, SYS_EXIT
  mov ebx, RET_EXIT
  int SYS_CALL