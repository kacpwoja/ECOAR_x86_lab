; char* removerng(char* s, char a, char b)
; removes (in place) characters from a to b in string s
	section	.text
	global	removerng
removerng:
	; prologue
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi

	; body
	mov	eax, [ebp+8]; load string into return address
	mov	esi, [ebp+8]; last char bhecked
	mov	edi, [ebp+8]; last char placed

loop:
	mov	bh, [esi]; current char
	inc	esi
	test	bh, bh; test for end of string
	jz	fin
	cmp	bh, [ebp+12]
	jl	keep
	cmp	bh, [ebp+16]
	jg	keep
	jmp	loop

keep:
	mov	[edi], bh
	inc	edi
	jmp	loop

fin:
	mov	[edi], bh

	;epilogue
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret
