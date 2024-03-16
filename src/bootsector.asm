org 0x7c00
bits 16

%define endl 0x0d, 0x0a

main:
	xor ax, ax		; 0x0000
	mov ds, ax
	cld			; ClearDirectionFlag for lodsb
	mov ss, ax
	mov sp, 0x7c00

	mov ah, 0x00		; Set 80x25 VideoMode
	mov al, 0x03
	int 0x10

read_sectors:			; FloppyDisk
	xor ax, ax		; Re-set ax to 0x0000
	mov es, ax		; ES = 0x0000 (ES:BX)
	mov bx, 0x7e00		; BX = 0x7e00 (ES:BX)
	mov ah, 0x02
	mov al, 1
	mov ch, 0
	mov cl, 2
	mov dh, 0
	mov dl, 0
	int 0x13
	jc read_error

pre_boot:
	mov si, preboot_msg
	mov bl, 0x02
	call printc
	call handle_color

.pre_boot_jumpk:
	mov ah, 0x00		; Wait for KeyPress, then jump to kernel
	int 0x16
	jmp 0x0000:0x7e00

read_error:
     	mov ah, 0x00		; Re-Set 80x25 VideoMode
	mov al, 0x03
	int 0x10

    	mov ah, 0x0b		; Set Red ColorPalette
     	mov bx, 0x04
     	int 0x10

	mov si, error_msg	; PrintColor the error msg
	mov bl, 0x4F
	call printc
	call handle_color

	cli			; Halt and Catch Fire
	hlt

%include "src/include/printc.asm"
%include "src/include/handle_color.asm"

error_msg db '[ERROR] Disk Read Failed! :(', 0
preboot_msg db 'This is Simplicity Pre-boot!', endl,'Press any key to enter in kernel ->', 0
times 510-($-$$) db 0
dw 0xaa55
