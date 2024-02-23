; PrintString
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
