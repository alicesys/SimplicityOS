org 0x7e00
bits 16

k_main:
	xor ax, ax
	mov ds, ax
	mov es, ax
	mov ss, ax
	mov sp, 0x7e00

	mov ah, 0x00		; Re-set 80x25 VideoMode
	mov al, 0x03
	int 0x10

	mov si, msg
	call prints

	cli
	hlt

%include "src/include/prints.asm"

k_data:
	msg db 'Hello from the Simplicity Kernel!', 0
