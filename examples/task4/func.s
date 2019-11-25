; char* reversedig(char* s)
; reverse digits, leave other characters in place
	section	.text
	global	reversedig
reversedig:
	; prologue
	push	ebp
	mov	ebp, esp
	push	ebx

	; body
	mov	eax, [ebp+8]; left ptr
	mov	edx, [ebp+8]; right ptr

	; move right to end
getend:
	inc	edx
	mov	ch, [edx]
	test	ch, ch
	jnz	getend
	
	dec	edx

	; find digit on left side
moveleft:
	mov	cl, [eax]
	cmp	eax, edx
	je	fin
	inc	eax
	cmp	cl, '0'
	jl	moveleft
	cmp	cl, '9'
	jg	moveleft
	; find digit on right side
moveright:
	mov	ch, [edx]
	cmp	eax, edx
	je	fin
	dec	edx
	cmp	ch, '0'
	jl	moveright
	cmp	ch, '9'
	jg	moveright
	; swap
	mov	[edx+1], cl
	mov	[eax-1], ch
	jmp	moveleft

fin:
	mov	eax, [ebp+8]

	; epilogue
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret
