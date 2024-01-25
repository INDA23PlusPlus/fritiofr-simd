	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 14, 0	sdk_version 14, 0
	.globl	_square_floats_vectorized       ; -- Begin function square_floats_vectorized
	.p2align	2
_square_floats_vectorized:              ; @square_floats_vectorized
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #128
	.cfi_def_cfa_offset 128
	str	x0, [sp, #72]
	str	x1, [sp, #64]
	ldr	x8, [sp, #72]
	ldr	q0, [x8]
	str	q0, [sp, #32]
	ldr	q0, [sp, #32]
	str	q0, [sp, #16]
	ldr	q0, [sp, #16]
	str	q0, [sp, #48]
	ldr	q1, [sp, #48]
	ldr	q0, [sp, #48]
	str	q1, [sp, #112]
	str	q0, [sp, #96]
	ldr	q0, [sp, #112]
	ldr	q1, [sp, #96]
	fmul.4s	v0, v0, v1
	str	q0, [sp, #80]
	ldr	q0, [sp, #80]
	str	q0, [sp, #48]
	ldr	q0, [sp, #48]
	str	q0, [sp]
	ldr	x8, [sp, #64]
	ldr	q0, [sp]
	str	q0, [x8]
	add	sp, sp, #128
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_square_floats                  ; -- Begin function square_floats
	.p2align	2
_square_floats:                         ; @square_floats
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	str	x1, [sp]
	ldr	x8, [sp, #8]
	ldr	s0, [x8]
	ldr	x8, [sp, #8]
	ldr	s1, [x8]
	fmul	s0, s0, s1
	ldr	x8, [sp]
	str	s0, [x8]
	ldr	x8, [sp, #8]
	ldr	s0, [x8, #4]
	ldr	x8, [sp, #8]
	ldr	s1, [x8, #4]
	fmul	s0, s0, s1
	ldr	x8, [sp]
	str	s0, [x8, #4]
	ldr	x8, [sp, #8]
	ldr	s0, [x8, #8]
	ldr	x8, [sp, #8]
	ldr	s1, [x8, #8]
	fmul	s0, s0, s1
	ldr	x8, [sp]
	str	s0, [x8, #8]
	ldr	x8, [sp, #8]
	ldr	s0, [x8, #12]
	ldr	x8, [sp, #8]
	ldr	s1, [x8, #12]
	fmul	s0, s0, s1
	ldr	x8, [sp]
	str	s0, [x8, #12]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_benchmark_square_floats        ; -- Begin function benchmark_square_floats
	.p2align	2
_benchmark_square_floats:               ; @benchmark_square_floats
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #96
	.cfi_def_cfa_offset 96
	stp	x29, x30, [sp, #80]             ; 16-byte Folded Spill
	add	x29, sp, #80
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	adrp	x8, ___stack_chk_guard@GOTPAGE
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
	ldr	x8, [x8]
	stur	x8, [x29, #-8]
	adrp	x8, l___const.benchmark_square_floats.a@PAGE
	add	x8, x8, l___const.benchmark_square_floats.a@PAGEOFF
	ldr	q0, [x8]
	stur	q0, [x29, #-32]
	bl	_clock
	ucvtf	s0, x0
	mov	w8, #9216
	movk	w8, #18804, lsl #16
	fmov	s1, w8
	fdiv	s0, s0, s1
	stur	s0, [x29, #-36]
	str	wzr, [sp, #40]
	b	LBB2_1
LBB2_1:                                 ; =>This Inner Loop Header: Depth=1
	ldr	w8, [sp, #40]
	mov	w9, #268435455
	subs	w8, w8, w9
	cset	w8, ge
	tbnz	w8, #0, LBB2_4
	b	LBB2_2
LBB2_2:                                 ;   in Loop: Header=BB2_1 Depth=1
	sub	x1, x29, #32
	mov	x0, x1
	bl	_square_floats
	b	LBB2_3
LBB2_3:                                 ;   in Loop: Header=BB2_1 Depth=1
	ldr	w8, [sp, #40]
	add	w8, w8, #1
	str	w8, [sp, #40]
	b	LBB2_1
LBB2_4:
	bl	_clock
	ucvtf	s0, x0
	mov	w8, #9216
	movk	w8, #18804, lsl #16
	fmov	s1, w8
	fdiv	s0, s0, s1
	str	s0, [sp, #36]
	ldur	s0, [x29, #-32]
	fcvt	d3, s0
	ldur	s0, [x29, #-28]
	fcvt	d2, s0
	ldur	s0, [x29, #-24]
	fcvt	d1, s0
	ldur	s0, [x29, #-20]
	fcvt	d0, s0
	mov	x8, sp
	str	d3, [x8]
	str	d2, [x8, #8]
	str	d1, [x8, #16]
	str	d0, [x8, #24]
	adrp	x0, l_.str@PAGE
	add	x0, x0, l_.str@PAGEOFF
	bl	_printf
	ldr	s0, [sp, #36]
	ldur	s1, [x29, #-36]
	fsub	s0, s0, s1
	fcvt	d0, s0
	mov	x8, sp
	str	d0, [x8]
	adrp	x0, l_.str.1@PAGE
	add	x0, x0, l_.str.1@PAGEOFF
	bl	_printf
	ldur	x9, [x29, #-8]
	adrp	x8, ___stack_chk_guard@GOTPAGE
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
	ldr	x8, [x8]
	subs	x8, x8, x9
	cset	w8, eq
	tbnz	w8, #0, LBB2_6
	b	LBB2_5
LBB2_5:
	bl	___stack_chk_fail
LBB2_6:
	ldp	x29, x30, [sp, #80]             ; 16-byte Folded Reload
	add	sp, sp, #96
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_benchmark_square_floats_vectorized ; -- Begin function benchmark_square_floats_vectorized
	.p2align	2
_benchmark_square_floats_vectorized:    ; @benchmark_square_floats_vectorized
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #96
	.cfi_def_cfa_offset 96
	stp	x29, x30, [sp, #80]             ; 16-byte Folded Spill
	add	x29, sp, #80
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	adrp	x8, ___stack_chk_guard@GOTPAGE
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
	ldr	x8, [x8]
	stur	x8, [x29, #-8]
	adrp	x8, l___const.benchmark_square_floats_vectorized.a@PAGE
	add	x8, x8, l___const.benchmark_square_floats_vectorized.a@PAGEOFF
	ldr	q0, [x8]
	stur	q0, [x29, #-32]
	bl	_clock
	ucvtf	s0, x0
	mov	w8, #9216
	movk	w8, #18804, lsl #16
	fmov	s1, w8
	fdiv	s0, s0, s1
	stur	s0, [x29, #-36]
	str	wzr, [sp, #40]
	b	LBB3_1
LBB3_1:                                 ; =>This Inner Loop Header: Depth=1
	ldr	w8, [sp, #40]
	mov	w9, #268435455
	subs	w8, w8, w9
	cset	w8, ge
	tbnz	w8, #0, LBB3_4
	b	LBB3_2
LBB3_2:                                 ;   in Loop: Header=BB3_1 Depth=1
	sub	x1, x29, #32
	mov	x0, x1
	bl	_square_floats_vectorized
	b	LBB3_3
LBB3_3:                                 ;   in Loop: Header=BB3_1 Depth=1
	ldr	w8, [sp, #40]
	add	w8, w8, #1
	str	w8, [sp, #40]
	b	LBB3_1
LBB3_4:
	bl	_clock
	ucvtf	s0, x0
	mov	w8, #9216
	movk	w8, #18804, lsl #16
	fmov	s1, w8
	fdiv	s0, s0, s1
	str	s0, [sp, #36]
	ldur	s0, [x29, #-32]
	fcvt	d3, s0
	ldur	s0, [x29, #-28]
	fcvt	d2, s0
	ldur	s0, [x29, #-24]
	fcvt	d1, s0
	ldur	s0, [x29, #-20]
	fcvt	d0, s0
	mov	x8, sp
	str	d3, [x8]
	str	d2, [x8, #8]
	str	d1, [x8, #16]
	str	d0, [x8, #24]
	adrp	x0, l_.str@PAGE
	add	x0, x0, l_.str@PAGEOFF
	bl	_printf
	ldr	s0, [sp, #36]
	ldur	s1, [x29, #-36]
	fsub	s0, s0, s1
	fcvt	d0, s0
	mov	x8, sp
	str	d0, [x8]
	adrp	x0, l_.str.2@PAGE
	add	x0, x0, l_.str.2@PAGEOFF
	bl	_printf
	ldur	x9, [x29, #-8]
	adrp	x8, ___stack_chk_guard@GOTPAGE
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
	ldr	x8, [x8]
	subs	x8, x8, x9
	cset	w8, eq
	tbnz	w8, #0, LBB3_6
	b	LBB3_5
LBB3_5:
	bl	___stack_chk_fail
LBB3_6:
	ldp	x29, x30, [sp, #80]             ; 16-byte Folded Reload
	add	sp, sp, #96
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	w8, #0
	str	w8, [sp, #8]                    ; 4-byte Folded Spill
	stur	wzr, [x29, #-4]
	bl	_benchmark_square_floats
	bl	_benchmark_square_floats_vectorized
	ldr	w0, [sp, #8]                    ; 4-byte Folded Reload
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__literal16,16byte_literals
	.p2align	2, 0x0                          ; @__const.benchmark_square_floats.a
l___const.benchmark_square_floats.a:
	.long	0x3f800000                      ; float 1
	.long	0x40000000                      ; float 2
	.long	0x40400000                      ; float 3
	.long	0x40800000                      ; float 4

	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	" %f %f %f %f \n"

l_.str.1:                               ; @.str.1
	.asciz	"Time taken for normal version: %f\n"

	.section	__TEXT,__literal16,16byte_literals
	.p2align	2, 0x0                          ; @__const.benchmark_square_floats_vectorized.a
l___const.benchmark_square_floats_vectorized.a:
	.long	0x3f800000                      ; float 1
	.long	0x40000000                      ; float 2
	.long	0x40400000                      ; float 3
	.long	0x40800000                      ; float 4

	.section	__TEXT,__cstring,cstring_literals
l_.str.2:                               ; @.str.2
	.asciz	"Time taken for vectorized version: %f\n"

.subsections_via_symbols
