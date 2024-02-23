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

%include "src/include/prints.asm"

k_data:
	msg db 'Hello from the Simplicity Kernel!', 0
