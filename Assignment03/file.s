	.arch armv8-a
	.file	"file.c"
	.text
	.section	.rodata
	.align	3
.LC0:
	.string	"Choose:\n(1) Use the built-in function.\n(2) Use my function."
	.align	3
.LC1:
	.string	"%i"
	.align	3
.LC2:
	.string	"You chose %i\n"
	.align	3
.LC3:
	.string	"%i is neither 1 or 2. Try Again\n"
	.text
	.align	2
	.global	choose
	.type	choose, %function
choose:
.LFB6:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
	bl	puts
	add	x0, sp, 28
	mov	x1, x0
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
	bl	__isoc99_scanf
	bl	flush
	ldr	w0, [sp, 28]
	cmp	w0, 1
	cset	w0, eq
	and	w1, w0, 255
	ldr	w0, [sp, 28]
	cmp	w0, 2
	cset	w0, eq
	and	w0, w0, 255
	orr	w0, w1, w0
	and	w0, w0, 255
	cmp	w0, 0
	beq	.L2
	ldr	w0, [sp, 28]
	mov	w1, w0
	adrp	x0, .LC2
	add	x0, x0, :lo12:.LC2
	bl	printf
	b	.L3
.L2:
	ldr	w0, [sp, 28]
	mov	w1, w0
	adrp	x0, .LC3
	add	x0, x0, :lo12:.LC3
	bl	printf
	bl	choose
	str	w0, [sp, 28]
.L3:
	ldr	w0, [sp, 28]
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE6:
	.size	choose, .-choose
	.align	2
	.global	upper
	.type	upper, %function
upper:
.LFB7:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	x0, [sp, 24]
	str	wzr, [sp, 44]
	b	.L6
.L8:
	ldrsw	x0, [sp, 44]
	ldr	x1, [sp, 24]
	add	x0, x1, x0
	ldrb	w0, [x0]
	cmp	w0, 96
	bls	.L7
	ldrsw	x0, [sp, 44]
	ldr	x1, [sp, 24]
	add	x0, x1, x0
	ldrb	w0, [x0]
	cmp	w0, 122
	bhi	.L7
	ldrsw	x0, [sp, 44]
	ldr	x1, [sp, 24]
	add	x0, x1, x0
	ldrb	w0, [x0]
	bl	toupper
	mov	w2, w0
	ldrsw	x0, [sp, 44]
	ldr	x1, [sp, 24]
	add	x0, x1, x0
	and	w1, w2, 255
	strb	w1, [x0]
.L7:
	ldr	w0, [sp, 44]
	add	w0, w0, 1
	str	w0, [sp, 44]
.L6:
	ldrsw	x0, [sp, 44]
	ldr	x1, [sp, 24]
	add	x0, x1, x0
	ldrb	w0, [x0]
	cmp	w0, 0
	bne	.L8
	nop
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE7:
	.size	upper, .-upper
	.align	2
	.global	upper2
	.type	upper2, %function
upper2:
.LFB8:
	.cfi_startproc
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	str	x0, [sp, 8]
	str	wzr, [sp, 28]
	b	.L10
.L12:
	ldrsw	x0, [sp, 28]
	ldr	x1, [sp, 8]
	add	x0, x1, x0
	ldrb	w0, [x0]
	cmp	w0, 96
	bls	.L11
	ldrsw	x0, [sp, 28]
	ldr	x1, [sp, 8]
	add	x0, x1, x0
	ldrb	w0, [x0]
	cmp	w0, 122
	bhi	.L11
	ldrsw	x0, [sp, 28]
	ldr	x1, [sp, 8]
	add	x0, x1, x0
	ldrb	w1, [x0]
	ldrsw	x0, [sp, 28]
	ldr	x2, [sp, 8]
	add	x0, x2, x0
	sub	w1, w1, #32
	and	w1, w1, 255
	strb	w1, [x0]
.L11:
	ldr	w0, [sp, 28]
	add	w0, w0, 1
	str	w0, [sp, 28]
.L10:
	ldrsw	x0, [sp, 28]
	ldr	x1, [sp, 8]
	add	x0, x1, x0
	ldrb	w0, [x0]
	cmp	w0, 0
	bne	.L12
	nop
	add	sp, sp, 32
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE8:
	.size	upper2, .-upper2
	.section	.rodata
	.align	3
.LC4:
	.string	"Please enter the string you would like to use: "
	.align	3
.LC5:
	.string	"%31[^\n]"
	.align	3
.LC6:
	.string	"================="
	.align	3
.LC7:
	.string	"Original: %s\n"
	.align	3
.LC8:
	.string	"Output: %s\n"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
.LFB9:
	.cfi_startproc
	stp	x29, x30, [sp, -64]!
	.cfi_def_cfa_offset 64
	.cfi_offset 29, -64
	.cfi_offset 30, -56
	mov	x29, sp
	adrp	x0, .LC4
	add	x0, x0, :lo12:.LC4
	bl	printf
	add	x0, sp, 24
	mov	x1, x0
	adrp	x0, .LC5
	add	x0, x0, :lo12:.LC5
	bl	__isoc99_scanf
	bl	choose
	str	w0, [sp, 60]
	adrp	x0, .LC6
	add	x0, x0, :lo12:.LC6
	bl	puts
	add	x0, sp, 24
	mov	x1, x0
	adrp	x0, .LC7
	add	x0, x0, :lo12:.LC7
	bl	printf
	ldr	w0, [sp, 60]
	cmp	w0, 1
	bne	.L14
	add	x0, sp, 24
	bl	upper
	b	.L15
.L14:
	add	x0, sp, 24
	bl	upper2
.L15:
	add	x0, sp, 24
	mov	x1, x0
	adrp	x0, .LC8
	add	x0, x0, :lo12:.LC8
	bl	printf
	mov	w0, 0
	ldp	x29, x30, [sp], 64
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE9:
	.size	main, .-main
	.align	2
	.global	flush
	.type	flush, %function
flush:
.LFB10:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	nop
.L18:
	bl	getchar
	strb	w0, [sp, 31]
	ldrb	w0, [sp, 31]
	cmp	w0, 10
	bne	.L18
	nop
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE10:
	.size	flush, .-flush
	.ident	"GCC: (Debian 8.3.0-6) 8.3.0"
	.section	.note.GNU-stack,"",@progbits
