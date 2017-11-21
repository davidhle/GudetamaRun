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
	.file	"game.c"
	.text
	.align	2
	.global	initialize
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L2
	mov	r2, #115
	str	r2, [r3, #0]
	mov	r2, #5
	str	r2, [r3, #4]
	mov	r2, #37
	str	r2, [r3, #20]
	mov	r2, #29
	str	r2, [r3, #16]
	mov	r2, #20
	str	r2, [r3, #24]
	bx	lr
.L3:
	.align	2
.L2:
	.word	player
	.size	initialize, .-initialize
	.align	2
	.global	drawPlayer
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L5
	stmfd	sp!, {r4, lr}
	ldmia	r3, {r4, lr}	@ phole ldm
	ldr	ip, .L5+4
	mvn	lr, lr, asl #18
	mvn	lr, lr, lsr #18
	mvn	r4, r4, asl #17
	mvn	r4, r4, lsr #17
	strh	lr, [ip, #2]	@ movhi
	mov	lr, #0	@ movhi
	mov	r1, ip
	strh	r4, [ip, #0]	@ movhi
	strh	lr, [ip, #4]	@ movhi
	mov	r0, #3
	mov	r2, #117440512
	mov	r3, #512
	ldr	ip, .L5+8
	mov	lr, pc
	bx	ip
	ldmfd	sp!, {r4, lr}
	bx	lr
.L6:
	.align	2
.L5:
	.word	player
	.word	shadowOAM
	.word	DMANow
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	draw
	.type	draw, %function
draw:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	drawPlayer
	.size	draw, .-draw
	.align	2
	.global	updatePlayer
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r2, [r3, #48]
	tst	r2, #32
	bne	.L9
	ldr	r3, .L15
	ldr	r2, [r3, #16]
	add	r0, r2, r2, lsr #31
	ldr	r1, [r3, #4]
	mov	r0, r0, asr #1
	rsb	r0, r0, #119
	cmp	r0, r1
	bge	.L14
.L10:
	cmp	r1, #1
	bxle	lr
	rsb	r2, r2, #508
	add	r2, r2, #3
	cmp	r2, r1
	subgt	r1, r1, #1
	strgt	r1, [r3, #4]
	bx	lr
.L9:
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bxne	lr
	ldr	r3, .L15
	ldr	r1, [r3, #16]
	add	r0, r1, r1, lsr #31
	ldr	r2, [r3, #4]
	mov	r0, r0, asr #1
	rsb	r0, r0, #120
	cmp	r2, r0
	ble	.L12
	ldr	r0, .L15+4
	ldr	ip, [r0, #0]
	cmp	ip, #272
	addlt	ip, ip, #1
	strlt	ip, [r0, #0]
	bxlt	lr
.L12:
	cmp	r2, #0
	bxle	lr
	ldr	r0, .L15+4
	ldr	r0, [r0, #0]
	rsb	r1, r1, #512
	rsb	r1, r0, r1
	sub	r1, r1, #1
	cmp	r2, r1
	addlt	r2, r2, #1
	strlt	r2, [r3, #4]
	bx	lr
.L14:
	ldr	r0, .L15+4
	ldr	ip, [r0, #0]
	cmp	ip, #0
	subgt	ip, ip, #1
	strgt	ip, [r0, #0]
	bxgt	lr
	b	.L10
.L16:
	.align	2
.L15:
	.word	player
	.word	hOff
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	update
	.type	update, %function
update:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	updatePlayer
	.size	update, .-update
	.align	2
	.global	hideSprites
	.type	hideSprites, %function
hideSprites:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L21
	mov	r3, #0
.L19:
	mov	r1, #512	@ movhi
	strh	r1, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L19
	bx	lr
.L22:
	.align	2
.L21:
	.word	shadowOAM
	.size	hideSprites, .-hideSprites
	.comm	shadowOAM,1024,4
	.comm	gamesLost,4,4
	.comm	player,28,4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
