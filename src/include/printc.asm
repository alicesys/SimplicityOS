; PrintColor
printc:
	pusha
	mov cx, 1
	mov bh, 0
printc_loop:
	lodsb
	cmp al, 0
	je done
	cmp al, 32
	jb skip
	mov ah, 0x09
	int 0x10
skip:
	mov ah, 0x0e
	int 0x10
	jmp printc_loop
done:
	popa
	ret
