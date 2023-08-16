; Sistema de comparacao de maior, porem tem que colocar os valores pelo codigo

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
  x dd 50   ; db = define byte (1 byte) | dw = define word (2 bytes - ele seria mais o menos correspodente a um 'char')
  y dd 10   ; dd = define double word (4 bytes - pode se dizer que é um inteiro ou um short) | dq = define quad word (4 bytes) | dt = define ten word (10 bytes)

  msg1 db 'X maior que Y', LF, NULL
  tam1 equ $ - msg1
  msg2 db 'Y maior que X', LF, NULL
  tam2 equ $ - msg2

section .text

global _start

_start:
  mov eax, DWORD[x]
  mov ebx, dword[y]

  ; if | cmp = comparacao
  cmp eax, ebx

  ; Salto condicional
  ; je = | jne !=
  ; jg > | jge >=
  ; jl < | jle <=
  jge maior ; eax >= ebx
  mov ecx, msg2
  mov edx, tam2
  
  ; salto incondicional jmp
  jmp final
  

maior: ; Se ele salto e veio para ca significa que o eax e maior que o ebx, ou seja. X e maior que Y
  mov ecx, msg1
  mov edx, tam1

final:
  mov eax, SYS_WRITE
  mov ebx, STD_OUT
  int SYS_CALL

  mov eax, SYS_EXIT
  xor ebx, EBX      ; mov ebx, RET_EXIT
  int SYS_CALL