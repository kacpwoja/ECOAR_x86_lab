; char* reverse(char* str)
; reverse big letters in sequences inside str
; Kacper Wojakowski 293064

	section	.text
	global	reverse

reverse:
	; prologue
	push	ebp
	mov	ebp, esp

	; used registers: eax, edx, ecx
	; body
	mov	eax, [ebp+8]; left ptr
	mov	edx, [ebp+8]; right ptr

	dec	eax
	push	eax
findword: ; find beginning of sequence
	; get the end of previous sequence from stack
	pop	eax
	inc	eax
	mov	cl, [eax]
	; detect end of string
	test	cl, cl
	jz	fin

	cmp	cl, ' '
	jle	findword
	mov	edx, eax
findend: ; find end of sequence
	inc	edx
	mov	ch, [edx]
	cmp	ch, ' '
	jg	findend
	push	edx ; save end of sequence on stack

	; start swapping
	dec	eax
moveleft: ; find left char for swapping
	inc	eax
	mov	cl, [eax]
	cmp	eax, edx; swapping finished for sequence
	je	findword
	cmp	cl, 'A'
	jl	moveleft
	cmp	cl, 'Z'
	jg	moveleft
moveright: ; find right char for swapping
	dec	edx
	mov	ch, [edx]
	cmp	eax, edx; swapping finished for sequence
	je	findword
	cmp	ch, 'A'
	jl	moveright
	cmp	ch, 'Z'
	jg	moveright
	; swap
	mov	[eax], ch
	mov	[edx], cl
	jmp	moveleft

fin: ; end function: return the string
	mov	eax, [ebp+8]
	
	; epilogue
	mov	esp, ebp
	pop	ebp
	ret
