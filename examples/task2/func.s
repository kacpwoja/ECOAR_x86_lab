; char* remnth(char* s, int n)
; removes every nth character
	section	.text
	global	remnth
remnth:
	; prologue
	push	ebp
	mov	ebp, esp
	push	ebx

	; body
	mov	eax, [ebp+8]; last checked
	mov	ebx, [ebp+8]; last placed

skip:
	; reset counter and don't place the char
	mov	ecx, [ebp+12]; put n into counter

loop:
	mov	dh, [eax]; current char
	test	dh, dh; end of string
	jz	fin

	inc	eax
	dec	ecx
	test	ecx, ecx
	jz	skip

	mov	[ebx], dh
	inc	ebx
	jmp	loop

fin:
	mov	[ebx], dh; add terminator
	mov	eax, [ebp+8]; place string in return register

	; epilogue
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret
