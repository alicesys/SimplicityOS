org 0x7e00
bits 16

%define endl 0x0d, 0x0a

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

	mov si, prompt
	call prints

%include "src/include/keyboard.asm"
%include "src/include/prints.asm"

	cli
	hlt

k_data:
	msg db 'Hello from the Simplicity Kernel! ', 0x02, endl, 0
	prompt db '>', 0