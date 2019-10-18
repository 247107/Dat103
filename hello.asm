
cr equ 13
lf equ 10

section .data
	melding db 'Hello World!',cr,lf
	lengde equ $ - melding

section .text
global _start
_start:
	mov edx,lengde
	mov ecx,melding
	mov ebx,1
	mov eax,4
	int 80h
	mov ebx,0
	mov eax,1
	int 80h
