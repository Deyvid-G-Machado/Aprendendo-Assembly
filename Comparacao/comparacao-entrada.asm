; Sistema de comparacao de maior e menor com entrada de numero

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
  msgX db 'Digite o valor de X:', LF, NULL
  tamMsgX equ $ - msgX
  msgY db 'Digite o valor de Y:', LF, NULL
  tamMsgY equ $ - msgY

  resp1 db 'X maior que Y', LF, NULL
  tamResp1 equ $ - resp1
  resp2 db 'Y maior que X', LF, NULL
  tamResp2 equ $ - resp2

section .bss
  ; dword  resd 1 | Para armazenar um número de 0 a 4294967295
  x resd 1
  y resd 1

section .text

global _start

_start:
  mov eax, SYS_WRITE
  mov ebx, STD_OUT
  mov ecx, msgX
  mov edx, tamMsgX
  int SYS_CALL

  mov eax, SYS_READ
  mov ebx, STD_IN
  mov ecx, x
  mov edx, 0xF      ; O tamanho limite de caracteres de entrada
  int SYS_CALL

  mov eax, SYS_WRITE
  mov ebx, STD_OUT
  mov ecx, msgY
  mov edx, tamMsgY
  int SYS_CALL

  mov eax, SYS_READ
  mov ebx, STD_IN
  mov ecx, y
  mov edx, 0xF      ; O tamanho limite de caracteres de entrada
  int SYS_CALL

  mov eax, [x]
  mov ebx, [y]

  ; if | cmp = comparacao
  cmp eax, ebx

  ; Salto condicional
  ; je = | jne !=
  ; jg > | jge >=
  ; jl < | jle <=
  jge maior ; eax >= ebx
  mov ecx, resp2
  mov edx, tamResp2
  
  ; salto incondicional jmp
  jmp final
  

maior: ; Se ele salto e veio para ca significa que o eax e maior que o ebx, ou seja. X e maior que Y
  mov ecx, resp1
  mov edx, tamResp1

final:
  mov eax, SYS_WRITE
  mov ebx, STD_OUT
  int SYS_CALL

  mov eax, SYS_EXIT
  xor ebx, EBX      ; mov ebx, RET_EXIT
  int SYS_CALL