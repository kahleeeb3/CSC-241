	.arch armv8-a
	.file	"file.c"
	.text
	.align	2
	.global	distance
	.type	distance, %function
distance:
.LFB0:
	.cfi_startproc
	stp	x29, x30, [sp, -64]!
	.cfi_def_cfa_offset 64
	.cfi_offset 29, -64
	.cfi_offset 30, -56
	mov	x29, sp
	str	d8, [sp, 16]
	.cfi_offset 72, -48
	str	x0, [sp, 40]
	str	x1, [sp, 32]
	ldr	x0, [sp, 32]
	ldr	s1, [x0]
	ldr	x0, [sp, 40]
	ldr	s0, [x0]
	fsub	s0, s1, s0
	str	s0, [sp, 60]
	ldr	x0, [sp, 32]
	ldr	s1, [x0, 4]
	ldr	x0, [sp, 40]
	ldr	s0, [x0, 4]
	fsub	s0, s1, s0
	str	s0, [sp, 56]
	ldr	s0, [sp, 60]
	fcvt	d0, s0
	fmov	d1, 2.0e+0
	bl	pow
	fmov	d8, d0
	ldr	s0, [sp, 56]
	fcvt	d0, s0
	fmov	d1, 2.0e+0
	bl	pow
	fadd	d0, d8, d0
	bl	sqrt
	fcvt	s0, d0
	str	s0, [sp, 52]
	ldr	w0, [sp, 52]
	fmov	s0, w0
	ldr	d8, [sp, 16]
	ldp	x29, x30, [sp], 64
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 72
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE0:
	.size	distance, .-distance
	.align	2
	.global	area
	.type	area, %function
area:
.LFB1:
	.cfi_startproc
	stp	x29, x30, [sp, -64]!
	.cfi_def_cfa_offset 64
	.cfi_offset 29, -64
	.cfi_offset 30, -56
	mov	x29, sp
	str	x0, [sp, 24]
	ldr	x2, [sp, 24]
	ldr	x0, [sp, 24]
	add	x0, x0, 8
	mov	x1, x0
	mov	x0, x2
	bl	distance
	str	s0, [sp, 60]
	ldr	x0, [sp, 24]
	add	x2, x0, 8
	ldr	x0, [sp, 24]
	add	x0, x0, 16
	mov	x1, x0
	mov	x0, x2
	bl	distance
	str	s0, [sp, 56]
	ldr	x0, [sp, 24]
	add	x0, x0, 16
	ldr	x1, [sp, 24]
	bl	distance
	str	s0, [sp, 52]
	ldr	s1, [sp, 60]
	ldr	s0, [sp, 56]
	fadd	s1, s1, s0
	ldr	s0, [sp, 52]
	fadd	s1, s1, s0
	fmov	s0, 2.0e+0
	fdiv	s0, s1, s0
	str	s0, [sp, 48]
	ldr	s1, [sp, 48]
	ldr	s0, [sp, 60]
	fsub	s1, s1, s0
	ldr	s0, [sp, 48]
	fmul	s1, s1, s0
	ldr	s2, [sp, 48]
	ldr	s0, [sp, 56]
	fsub	s0, s2, s0
	fmul	s1, s1, s0
	ldr	s2, [sp, 48]
	ldr	s0, [sp, 52]
	fsub	s0, s2, s0
	fmul	s0, s1, s0
	fcvt	d0, s0
	bl	sqrt
	fcvt	s0, d0
	str	s0, [sp, 44]
	ldr	w0, [sp, 44]
	fmov	s0, w0
	ldp	x29, x30, [sp], 64
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE1:
	.size	area, .-area
	.section	.rodata
	.align	3
.LC0:
	.string	"The distance between point1 and point2 is %f\n"
	.align	3
.LC1:
	.string	"The area between point1, point2, and point3 is %f\n"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
.LFB2:
	.cfi_startproc
	stp	x29, x30, [sp, -80]!
	.cfi_def_cfa_offset 80
	.cfi_offset 29, -80
	.cfi_offset 30, -72
	mov	x29, sp
	fmov	s0, 1.2e+1
	str	s0, [sp, 64]
	fmov	s0, 1.0e+1
	str	s0, [sp, 68]
	fmov	s0, 1.6e+1
	str	s0, [sp, 56]
	fmov	s0, 2.4e+1
	str	s0, [sp, 60]
	fmov	s0, 8.0e+0
	str	s0, [sp, 48]
	fmov	s0, 3.0e+0
	str	s0, [sp, 52]
	ldr	x0, [sp, 64]
	str	x0, [sp, 24]
	ldr	x0, [sp, 56]
	str	x0, [sp, 32]
	ldr	x0, [sp, 48]
	str	x0, [sp, 40]
	add	x1, sp, 56
	add	x0, sp, 64
	bl	distance
	str	s0, [sp, 76]
	add	x0, sp, 24
	bl	area
	str	s0, [sp, 72]
	ldr	s0, [sp, 76]
	fcvt	d0, s0
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
	bl	printf
	ldr	s0, [sp, 72]
	fcvt	d0, s0
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
	bl	printf
	mov	w0, 0
	ldp	x29, x30, [sp], 80
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.ident	"GCC: (Debian 8.3.0-6) 8.3.0"
	.section	.note.GNU-stack,"",@progbits
