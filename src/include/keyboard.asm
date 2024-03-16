; Experimental Keyboard Support
keyboard_handle_color:
	mov cx, 1     
     mov bh, 0 
	lodsb
	mov ah, 0x09
	mov al, ' '
	int 0x10
keyboard_loop:
	mov ah, 0x00
	int 0x16
	mov ah, 0x0e
	int 0x10
	jmp keyboard_handle_color