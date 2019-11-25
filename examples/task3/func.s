; unsigned int getdec(char* s)
; scan the first unsigned decimal number
; troche gownokod
	section	.text
	global	getdec
getdec:
	; prologue
	push	ebp
	mov	ebp, esp
	push	ebx
	
	; body
	mov	eax, [ebp+8]; last checked char
	xor	ecx, ecx; number len counter
	xor	edx, edx

findno:
	; find first number
	mov	dl, [eax]; current char
	test	dl, dl
	jz	fin
	inc	eax
	
	cmp	dl, '9'
	jg	findno
	cmp	dl, '0'
	jl	findno

nofound:
	; found number: collect all numbers
	sub	dl, '0'
	push	edx
	inc	ecx
	
	; get next number
	mov	dl, [eax]
	inc eax
	;test	dl, dl
	;jz	fin
	cmp	dl, '0'
	jl	fin
	cmp	dl, '9'
	jg	fin
	jmp	nofound

fin:
	; get numbers from stack and transform into int
	xor	eax, eax; reset eax
	mov	ebx, ecx; save int size
convert:
	test	ecx, ecx
	jz	epilogue
	pop	edx
	push	ecx
multen:;multiply by power of 10
	cmp	ecx, ebx
	je	endmul
	imul	edx, 10
	inc	ecx
	jmp	multen
endmul:
	add	eax, edx
	pop	ecx	
	dec	ecx
	jmp	convert

epilogue:
	; epilogue
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret
