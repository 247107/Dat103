section .text

global _start
_start:
  	mov ecx, 0
  	mov eax, 0

forloop:
	cmp ecx, 10
	jae overTi
	inc eax
	jmp slutt

overTi:
	dec eax

slutt:
	inc ecx
	cmp ecx, 20
	jb forloop
	add eax, '0'    ; gjør tall om til ascii
	mov [num], eax
	mov edx, 1
	mov ecx, num
	mov ebx, 1
	mov eax, 4
	int 80h        ; printer a

	mov edx, crlfLen
	mov ecx, crlf
	mov ebx, 1
	mov eax, 4
	int 80h		; printer linjeskift

	mov ebx, 0
	mov eax, 1
	int 80h		; sys_exit

; Datasegment
section .bss
        num resb 1

segment .data
	cr equ 13
	lf equ 10
	crlf db cr,lf
	crlfLen equ $ - crlf

