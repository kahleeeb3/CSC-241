	.arch armv8-a
	.file	"fibonacci.c"
	.text
	.align	2
	.global	fibstep
	.type	fibstep, %function
fibstep:
.LFB0:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	w0, [sp, 28]
	str	w1, [sp, 24]
	str	w2, [sp, 20]
	ldr	w0, [sp, 20]
	cmp	w0, 2
	ble	.L2
	ldr	w1, [sp, 28]
	ldr	w0, [sp, 24]
	add	w0, w1, w0
	str	w0, [sp, 44]
	ldr	w0, [sp, 20]
	sub	w0, w0, #1
	mov	w2, w0
	ldr	w1, [sp, 28]
	ldr	w0, [sp, 44]
	bl	fibstep
	b	.L1
.L2:
	ldr	w0, [sp, 28]
.L1:
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE0:
	.size	fibstep, .-fibstep
	.align	2
	.global	fibonacci
	.type	fibonacci, %function
fibonacci:
.LFB1:
	.cfi_startproc
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	str	w0, [sp, 12]
	mov	w0, 1
	str	w0, [sp, 28]
	mov	w0, 1
	str	w0, [sp, 24]
	mov	w0, 1
	str	w0, [sp, 20]
	b	.L6
.L7:
	ldr	w1, [sp, 28]
	ldr	w0, [sp, 24]
	add	w0, w1, w0
	str	w0, [sp, 20]
	ldr	w0, [sp, 28]
	str	w0, [sp, 24]
	ldr	w0, [sp, 20]
	str	w0, [sp, 28]
	ldr	w0, [sp, 12]
	sub	w0, w0, #1
	str	w0, [sp, 12]
.L6:
	ldr	w0, [sp, 12]
	cmp	w0, 2
	bgt	.L7
	ldr	w0, [sp, 20]
	add	sp, sp, 32
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE1:
	.size	fibonacci, .-fibonacci
	.section	.rodata
	.align	3
.LC0:
	.string	"Recursive: %i \n"
	.align	3
.LC1:
	.string	"Iterative: %i \n"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
.LFB2:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	mov	w0, 10
	str	w0, [sp, 28]
	ldr	w2, [sp, 28]
	mov	w1, 1
	mov	w0, 1
	bl	fibstep
	str	w0, [sp, 24]
	ldr	w0, [sp, 28]
	bl	fibonacci
	str	w0, [sp, 20]
	ldr	w1, [sp, 24]
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
	bl	printf
	ldr	w1, [sp, 20]
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
	bl	printf
	mov	w0, 0
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.ident	"GCC: (Debian 8.3.0-6) 8.3.0"
	.section	.note.GNU-stack,"",@progbits
