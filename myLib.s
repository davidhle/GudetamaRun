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
	.file	"myLib.c"
	.text
	.align	2
	.global	setPixel3
	.type	setPixel3, %function
setPixel3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L2
	rsb	r0, r0, r0, asl #4
	add	r0, r1, r0, asl #4
	ldr	r3, [r3, #0]
	mov	r0, r0, asl #1
	strh	r2, [r3, r0]	@ movhi
	bx	lr
.L3:
	.align	2
.L2:
	.word	.LANCHOR0
	.size	setPixel3, .-setPixel3
	.align	2
	.global	setPixel4
	.type	setPixel4, %function
setPixel4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	rsb	r0, r0, r0, asl #4
	add	r3, r1, r0, asl #4
	ldr	r0, .L7
	add	r3, r3, r3, lsr #31
	ldr	ip, [r0, #0]
	bic	r3, r3, #1
	tst	r1, #1
	ldrh	r1, [ip, r3]
	andne	r1, r1, #255
	andeq	r1, r1, #65280
	orrne	r2, r1, r2, asl #8
	orreq	r2, r1, r2
	strh	r2, [ip, r3]	@ movhi
	bx	lr
.L8:
	.align	2
.L7:
	.word	.LANCHOR0
	.size	setPixel4, .-setPixel4
	.align	2
	.global	waitForVBlank
	.type	waitForVBlank, %function
waitForVBlank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
.L10:
	ldrh	r3, [r2, #6]
	cmp	r3, #160
	bhi	.L10
	mov	r2, #67108864
.L12:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L12
	bx	lr
	.size	waitForVBlank, .-waitForVBlank
	.align	2
	.global	flipPage
	.type	flipPage, %function
flipPage:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	ldrh	r3, [r3, #0]
	tst	r3, #16
	movne	r2, #100663296
	ldreq	r2, .L19
	ldrne	r1, .L19
	addne	r2, r2, #40960
	moveq	r1, #100663296
	strne	r2, [r1, #0]
	streq	r1, [r2, #0]
	eor	r3, r3, #16
	mov	r2, #67108864
	strh	r3, [r2, #0]	@ movhi
	bx	lr
.L20:
	.align	2
.L19:
	.word	.LANCHOR0
	.size	flipPage, .-flipPage
	.align	2
	.global	DMANow
	.type	DMANow, %function
DMANow:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	ip, .L22
	stmfd	sp!, {r4, r5}
	ldr	ip, [ip, #4]
	add	r0, r0, r0, asl #1
	add	r4, ip, r0, asl #2
	orr	r3, r3, #-2147483648
	mov	r5, #0
	str	r5, [r4, #8]
	str	r1, [ip, r0, asl #2]
	str	r2, [r4, #4]
	str	r3, [r4, #8]
	ldmfd	sp!, {r4, r5}
	bx	lr
.L23:
	.align	2
.L22:
	.word	.LANCHOR0
	.size	DMANow, .-DMANow
	.align	2
	.global	loadPalette
	.type	loadPalette, %function
loadPalette:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, r0
	mov	r2, #83886080
	mov	r0, #3
	mov	r3, #256
	b	DMANow
	.size	loadPalette, .-loadPalette
	.align	2
	.global	drawFullscreenImage4
	.type	drawFullscreenImage4, %function
drawFullscreenImage4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L26
	ldr	r2, [r3, #0]
	mov	r1, r0
	mov	r3, #19200
	mov	r0, #3
	b	DMANow
.L27:
	.align	2
.L26:
	.word	.LANCHOR0
	.size	drawFullscreenImage4, .-drawFullscreenImage4
	.align	2
	.global	drawFullscreenImage3
	.type	drawFullscreenImage3, %function
drawFullscreenImage3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L29
	ldr	r2, [r3, #0]
	mov	r1, r0
	mov	r3, #38400
	mov	r0, #3
	b	DMANow
.L30:
	.align	2
.L29:
	.word	.LANCHOR0
	.size	drawFullscreenImage3, .-drawFullscreenImage3
	.align	2
	.global	drawImage4
	.type	drawImage4, %function
drawImage4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	subs	sl, r2, #0
	mov	r8, r3
	ldr	fp, [sp, #40]
	ble	.L31
	add	r9, r3, r3, lsr #31
	rsb	r0, r0, r0, asl #4
	mov	r4, #0
	ldr	r7, .L35
	mov	r9, r9, asr #1
	add	r5, r1, r0, asl #4
	mov	r6, r4
.L33:
	add	r1, r4, r4, lsr #31
	add	r3, r5, r5, lsr #31
	ldr	r2, [r7, #0]
	bic	r3, r3, #1
	bic	r1, r1, #1
	add	r2, r2, r3
	mov	r0, #3
	add	r1, fp, r1
	mov	r3, r9
	add	r6, r6, #1
	bl	DMANow
	cmp	sl, r6
	add	r4, r4, r8
	add	r5, r5, #240
	bgt	.L33
.L31:
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L36:
	.align	2
.L35:
	.word	.LANCHOR0
	.size	drawImage4, .-drawImage4
	.align	2
	.global	drawImage3
	.type	drawImage3, %function
drawImage3:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	subs	sl, r2, #0
	mov	r8, r3
	ble	.L37
	rsb	r0, r0, r0, asl #4
	add	r6, r1, r0, asl #4
	ldr	r7, .L41
	ldr	r5, [sp, #32]
	mov	r6, r6, asl #1
	mov	r9, r3, asl #1
	mov	r4, #0
.L39:
	ldr	r2, [r7, #0]
	mov	r1, r5
	add	r2, r2, r6
	mov	r0, #3
	mov	r3, r8
	add	r4, r4, #1
	bl	DMANow
	cmp	sl, r4
	add	r6, r6, #480
	add	r5, r5, r9
	bgt	.L39
.L37:
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	bx	lr
.L42:
	.align	2
.L41:
	.word	.LANCHOR0
	.size	drawImage3, .-drawImage3
	.align	2
	.global	fillScreen4
	.type	fillScreen4, %function
fillScreen4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	sub	sp, sp, #20
	strb	r0, [sp, #7]
	ldrb	r3, [sp, #7]	@ zero_extendqisi2
	ldrb	r2, [sp, #7]	@ zero_extendqisi2
	add	r1, sp, #16
	orr	r3, r3, r2, asl #8
	ldr	r2, .L44
	strh	r3, [r1, #-2]!	@ movhi
	mov	r3, #16777216
	mov	r0, #3
	ldr	r2, [r2, #0]
	add	r3, r3, #19200
	bl	DMANow
	add	sp, sp, #20
	ldr	lr, [sp], #4
	bx	lr
.L45:
	.align	2
.L44:
	.word	.LANCHOR0
	.size	fillScreen4, .-fillScreen4
	.align	2
	.global	fillScreen3
	.type	fillScreen3, %function
fillScreen3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	ldr	r2, .L47
	sub	sp, sp, #12
	add	r1, sp, #8
	mov	r3, #16777216
	strh	r0, [r1, #-2]!	@ movhi
	ldr	r2, [r2, #0]
	mov	r0, #3
	add	r3, r3, #38400
	bl	DMANow
	add	sp, sp, #12
	ldr	lr, [sp], #4
	bx	lr
.L48:
	.align	2
.L47:
	.word	.LANCHOR0
	.size	fillScreen3, .-fillScreen3
	.align	2
	.global	drawRect4
	.type	drawRect4, %function
drawRect4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub	sp, sp, #36
	ldrb	ip, [sp, #72]	@ zero_extendqisi2
	ldrb	r4, [sp, #72]	@ zero_extendqisi2
	subs	sl, r2, #0
	orr	ip, ip, r4, asl #8
	str	r1, [sp, #4]
	mov	r7, r3
	strh	ip, [sp, #30]	@ movhi
	ble	.L49
	ldr	ip, [sp, #4]
	mov	r2, r3, asr #1
	add	r1, r3, r3, lsr #31
	mov	r4, r0
	mov	r1, r1, asr #1
	sub	r0, r2, #1
	sub	r3, ip, #1
	rsb	r6, r4, r4, asl #4
	orr	r2, r2, #16777216
	orr	r0, r0, #16777216
	orr	r1, r1, #16777216
	add	r3, r3, r7
	ldr	r8, .L61
	and	r9, ip, #1
	str	r2, [sp, #12]
	str	r0, [sp, #20]
	str	r1, [sp, #16]
	add	r6, ip, r6, asl #4
	mov	r5, #0
	and	fp, r7, #1
	str	r3, [sp, #8]
	b	.L58
.L60:
	cmp	fp, #0
	beq	.L52
	ldrb	r2, [sp, #72]	@ zero_extendqisi2
	mov	r0, r4
	ldr	r1, [sp, #4]
	bl	setPixel4
	cmp	r7, #1
	ble	.L53
	add	r2, r6, #1
	ldr	r3, [r8, #0]
	add	r2, r2, r2, lsr #31
	bic	r2, r2, #1
	add	r2, r3, r2
	mov	r0, #3
	add	r1, sp, #30
	ldr	r3, [sp, #12]
	bl	DMANow
.L53:
	add	r5, r5, #1
	cmp	sl, r5
	add	r4, r4, #1
	add	r6, r6, #240
	ble	.L49
.L58:
	cmp	r9, #0
	bne	.L60
	cmp	fp, #0
	beq	.L55
	cmp	r7, #1
	ble	.L57
	ldr	r3, [r8, #0]
	add	r2, r6, r6, lsr #31
	bic	r2, r2, #1
	add	r2, r3, r2
	mov	r0, #3
	add	r1, sp, #30
	ldr	r3, [sp, #12]
	bl	DMANow
.L57:
	mov	r0, r4
	ldrb	r2, [sp, #72]	@ zero_extendqisi2
	ldr	r1, [sp, #8]
	add	r5, r5, #1
	bl	setPixel4
	cmp	sl, r5
	add	r4, r4, #1
	add	r6, r6, #240
	bgt	.L58
.L49:
	add	sp, sp, #36
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L52:
	ldrb	r2, [sp, #72]	@ zero_extendqisi2
	mov	r0, r4
	ldr	r1, [sp, #4]
	bl	setPixel4
	cmp	r7, #2
	ble	.L57
	add	r2, r6, #1
	ldr	r3, [r8, #0]
	add	r2, r2, r2, lsr #31
	bic	r2, r2, #1
	add	r2, r3, r2
	mov	r0, #3
	add	r1, sp, #30
	ldr	r3, [sp, #20]
	bl	DMANow
	b	.L57
.L55:
	ldr	r3, [r8, #0]
	add	r2, r6, r6, lsr #31
	bic	r2, r2, #1
	add	r2, r3, r2
	mov	r0, #3
	add	r1, sp, #30
	ldr	r3, [sp, #16]
	bl	DMANow
	b	.L53
.L62:
	.align	2
.L61:
	.word	.LANCHOR0
	.size	drawRect4, .-drawRect4
	.align	2
	.global	drawRect3
	.type	drawRect3, %function
drawRect3:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
	subs	r8, r2, #0
	ble	.L63
	rsb	r0, r0, r0, asl #4
	add	r5, r1, r0, asl #4
	ldr	r7, .L67
	orr	sl, r3, #16777216
	mov	r5, r5, asl #1
	mov	r4, #0
	add	r6, sp, #32
.L65:
	ldr	r2, [r7, #0]
	mov	r0, #3
	add	r2, r2, r5
	mov	r1, r6
	mov	r3, sl
	add	r4, r4, #1
	bl	DMANow
	cmp	r8, r4
	add	r5, r5, #480
	bgt	.L65
.L63:
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
	bx	lr
.L68:
	.align	2
.L67:
	.word	.LANCHOR0
	.size	drawRect3, .-drawRect3
	.align	2
	.global	collision
	.type	collision, %function
collision:
	@ Function supports interworking.
	@ args = 16, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5}
	ldr	ip, [sp, #8]
	ldr	r5, [sp, #16]
	sub	r4, ip, #1
	add	r4, r4, r5
	cmp	r4, r0
	ldr	r4, [sp, #12]
	ble	.L73
	sub	r0, r0, #1
	add	r2, r0, r2
	cmp	ip, r2
	blt	.L74
.L73:
	mov	r0, #0
.L70:
	ldmfd	sp!, {r4, r5}
	bx	lr
.L74:
	ldr	r2, [sp, #20]
	sub	r0, r4, #1
	add	r2, r0, r2
	cmp	r2, r1
	ble	.L73
	sub	r0, r1, #1
	add	r0, r0, r3
	cmp	r4, r0
	movge	r0, #0
	movlt	r0, #1
	b	.L70
	.size	collision, .-collision
	.global	videoBuffer
	.global	dma
	.comm	gamesLost,4,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.type	dma, %object
	.size	dma, 4
dma:
	.word	67109040
	.ident	"GCC: (devkitARM release 31) 4.5.0"
