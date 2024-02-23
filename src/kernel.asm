org 0x7e00
bits 16

k_main:
	xor ax, ax
	mov ds, ax
	mov es, ax
	mov ss, ax
	mov sp, 0x7e00

	mov si, msg
	call prints

	cli
	hlt

prints:
	pusha
.prints_loop:
	mov al, [si]
	cmp al, 0
	jne .putchar
	popa
	ret
.putchar:
	mov ah, 0x0e
	int 0x10
	add si, 1
	jmp .prints_loop

k_data:
	msg db 'Hello from the Simplicity Kernel!', 0
