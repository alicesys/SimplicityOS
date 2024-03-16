; Handle next character color
handle_color:
        mov cx, 1
        mov bh, 0
        lodsb
        mov ah, 0x09
        mov al, ' '
        int 0x10
	ret
