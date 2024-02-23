org 0x7c00
bits 16

main:
	xor ax, ax		; 0x0000
	mov ds, ax
	mov ss, ax
	mov sp, 0x7c00

read_sectors:			; FloppyDisk
	mov es, ax		; 0x0000:0x7e00 (ES:BX)
	mov bx, 0x7e00
	mov ah, 0x02
	mov al, 1
	mov ch, 0
	mov cl, 2
	mov dh, 0
	mov dl, 0
	int 0x13
	jc read_error
	jmp 0x0000:0x7e00

read_error:
	mov si, error_msg
	call prints
	cli
	hlt

%include "src/include/prints.asm"

error_msg db '[ERROR] Disk Read Failed!', 0
times 510-($-$$) db 0
dw 0xaa55
