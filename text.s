	.cpu arm7tdmi
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 18, 4
	.file	"text.c"
	.text
	.align	2
	.global	drawChar
	.type	drawChar, %function
drawChar:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	add	r2, r2, r2, asl #1
	sub	sp, sp, #12
	mov	r7, r2, asl #4
	str	r0, [sp, #4]
	ldr	r9, .L9
	mov	fp, r1
	mov	sl, r3
	sub	r7, r7, #1
	mov	r6, #0
.L2:
	ldr	r3, .L9+4
	add	r5, r3, r7
	ldr	r3, [sp, #4]
	mov	r4, #0
	add	r8, r6, r3
	b	.L4
.L3:
	add	r4, r4, #1
	cmp	r4, #6
	beq	.L8
.L4:
	ldrb	r3, [r5, #1]!	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3
	add	r1, r4, fp
	mov	r0, r8
	mov	r2, sl
	add	r4, r4, #1
	mov	lr, pc
	bx	r9
	cmp	r4, #6
	bne	.L4
.L8:
	add	r6, r6, #1
	cmp	r6, #8
	add	r7, r7, #6
	bne	.L2
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L10:
	.align	2
.L9:
	.word	setPixel3
	.word	fontdata_6x8
	.size	drawChar, .-drawChar
	.align	2
	.global	drawString
	.type	drawString, %function
drawString:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	mov	r5, r2
	ldrb	r2, [r2, #0]	@ zero_extendqisi2
	cmp	r2, #0
	mov	r6, r0
	mov	r4, r1
	mov	r7, r3
	beq	.L11
.L13:
	mov	r1, r4
	mov	r0, r6
	mov	r3, r7
	bl	drawChar
	ldrb	r2, [r5, #1]!	@ zero_extendqisi2
	cmp	r2, #0
	add	r4, r4, #6
	bne	.L13
.L11:
	ldmfd	sp!, {r3, r4, r5, r6, r7, lr}
	bx	lr
	.size	drawString, .-drawString
	.comm	gamesLost,4,4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
