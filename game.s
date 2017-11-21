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
	ldr	r3, .L5
	mov	r1, #115
	stmfd	sp!, {r4, r5}
	str	r1, [r3, #0]
	mov	r1, #5
	str	r1, [r3, #4]
	mov	r1, #37
	str	r1, [r3, #20]
	mov	r1, #29
	str	r1, [r3, #16]
	mov	r1, #20
	str	r1, [r3, #24]
	mov	r2, #0
	ldr	r3, .L5+4
	mov	r5, #6
	mov	r4, #8
	mov	r1, r2
	mvn	ip, #7
	mov	r0, #1
.L2:
	add	r2, r2, #1
	cmp	r2, #5
	str	r5, [r3, #20]
	str	r4, [r3, #16]
	stmia	r3, {r1, ip}	@ phole stm
	str	r1, [r3, #8]
	str	r0, [r3, #12]
	str	r1, [r3, #28]
	str	r2, [r3, #24]
	add	r3, r3, #32
	bne	.L2
	ldmfd	sp!, {r4, r5}
	bx	lr
.L6:
	.align	2
.L5:
	.word	player
	.word	bullets
	.size	initialize, .-initialize
	.align	2
	.global	drawPlayer
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L8
	stmfd	sp!, {r4, lr}
	ldmia	r3, {r4, lr}	@ phole ldm
	ldr	ip, .L8+4
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
	ldr	ip, .L8+8
	mov	lr, pc
	bx	ip
	ldmfd	sp!, {r4, lr}
	bx	lr
.L9:
	.align	2
.L8:
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
	stmfd	sp!, {r4, lr}
	bl	drawPlayer
	ldr	r3, .L15
	ldr	r1, .L15+4
	add	ip, r3, #160
.L13:
	ldr	r2, [r3, #28]
	cmp	r2, #0
	beq	.L11
	ldr	r0, [r3, #24]
	ldrh	r4, [r3, #0]
	mov	r0, r0, asl #3
	add	r2, r1, r0
	strh	r4, [r1, r0]	@ movhi
	ldrh	r0, [r3, #4]
	mov	r4, #4	@ movhi
	strh	r0, [r2, #2]	@ movhi
	strh	r4, [r2, #4]	@ movhi
.L12:
	add	r3, r3, #32
	cmp	r3, ip
	bne	.L13
	ldmfd	sp!, {r4, lr}
	bx	lr
.L11:
	ldr	r2, [r3, #24]
	mov	r0, #512	@ movhi
	mov	r2, r2, asl #3
	strh	r0, [r1, r2]	@ movhi
	b	.L12
.L16:
	.align	2
.L15:
	.word	bullets
	.word	shadowOAM
	.size	draw, .-draw
	.align	2
	.global	drawBullet
	.type	drawBullet, %function
drawBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #28]
	cmp	r3, #0
	bne	.L20
	ldr	r3, [r0, #24]
	ldr	r2, .L21
	mov	r3, r3, asl #3
	mov	ip, #512	@ movhi
	strh	ip, [r2, r3]	@ movhi
	bx	lr
.L20:
	ldr	r2, [r0, #24]
	ldrh	ip, [r0, #0]
	ldr	r1, .L21
	mov	r2, r2, asl #3
	ldrh	r0, [r0, #4]
	add	r3, r1, r2
	strh	ip, [r1, r2]	@ movhi
	mov	r1, #4	@ movhi
	strh	r0, [r3, #2]	@ movhi
	strh	r1, [r3, #4]	@ movhi
	bx	lr
.L22:
	.align	2
.L21:
	.word	shadowOAM
	.size	drawBullet, .-drawBullet
	.align	2
	.global	updateBullet
	.type	updateBullet, %function
updateBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #28]
	cmp	r3, #0
	bxeq	lr
	ldr	r3, [r0, #0]
	ldr	r2, [r0, #20]
	add	r2, r3, r2
	cmp	r2, #0
	ble	.L25
	ldr	r1, .L27
	ldr	ip, [r0, #12]
	ldr	r2, [r0, #4]
	ldr	r1, [r1, #16]
	add	r2, ip, r2
	cmp	r1, r2
	bgt	.L25
	rsb	r1, r1, #508
	add	r1, r1, #3
	cmp	r1, r2
	bgt	.L26
.L25:
	mov	r3, #0
	str	r3, [r0, #28]
	bx	lr
.L26:
	ldr	r1, [r0, #8]
	add	r3, r1, r3
	str	r3, [r0, #0]
	str	r2, [r0, #4]
	bx	lr
.L28:
	.align	2
.L27:
	.word	player
	.size	updateBullet, .-updateBullet
	.align	2
	.global	fireBullet
	.type	fireBullet, %function
fireBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5}
	ldr	r0, .L35
	mov	r3, #0
	mov	r2, r0
.L32:
	ldr	r1, [r2, #28]
	cmp	r1, #0
	beq	.L34
	add	r3, r3, #1
	cmp	r3, #5
	add	r2, r2, #32
	bne	.L32
.L29:
	ldmfd	sp!, {r4, r5}
	bx	lr
.L34:
	ldr	r2, .L35+4
	ldr	r1, [r2, #20]
	ldmia	r2, {r5, ip}	@ phole ldm
	ldr	r4, [r2, #16]
	add	r1, r1, r1, lsr #31
	add	r1, r5, r1, asr #1
	add	r2, r0, r3, asl #5
	add	ip, r4, ip
	str	r1, [r0, r3, asl #5]
	mov	r3, #1
	str	ip, [r2, #4]
	str	r3, [r2, #28]
	b	.L29
.L36:
	.align	2
.L35:
	.word	bullets
	.word	player
	.size	fireBullet, .-fireBullet
	.align	2
	.global	updatePlayer
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	add	r3, r3, #256
	stmfd	sp!, {r4, lr}
	ldrh	r2, [r3, #48]
	tst	r2, #32
	bne	.L38
	ldr	r4, .L56
	ldr	r3, [r4, #16]
	add	r1, r3, r3, lsr #31
	ldr	r2, [r4, #4]
	mov	r1, r1, asr #1
	rsb	r1, r1, #119
	cmp	r1, r2
	bge	.L54
.L39:
	cmp	r2, #1
	ble	.L53
	rsb	r3, r3, #508
	add	r3, r3, #3
	cmp	r3, r2
	bgt	.L42
.L53:
	ldr	r3, [r4, #24]
	add	r3, r3, #1
.L40:
	str	r3, [r4, #24]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L38:
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L43
	ldr	r4, .L56
	ldr	r3, [r4, #16]
	add	r1, r3, r3, lsr #31
	ldr	r2, [r4, #4]
	mov	r1, r1, asr #1
	rsb	r1, r1, #120
	cmp	r2, r1
	ble	.L44
	ldr	r1, .L56+4
	ldr	r0, [r1, #0]
	cmp	r0, #272
	blt	.L55
.L44:
	cmp	r2, #0
	ble	.L51
	ldr	r1, .L56+4
	ldr	r1, [r1, #0]
	rsb	r3, r3, #512
	rsb	r3, r1, r3
	sub	r3, r3, #1
	cmp	r2, r3
	bge	.L53
	ldr	r3, [r4, #24]
	add	r2, r2, #1
	str	r2, [r4, #4]
	add	r3, r3, #1
	b	.L40
.L54:
	ldr	r1, .L56+4
	ldr	r0, [r1, #0]
	cmp	r0, #0
	ble	.L39
	ldr	r3, [r4, #24]
	sub	r0, r0, #1
	str	r0, [r1, #0]
	add	r3, r3, #1
	b	.L40
.L43:
	ldr	r3, .L56+8
	ldrh	r3, [r3, #0]
	tst	r3, #1
	beq	.L50
	ldr	r3, .L56+12
	ldrh	r3, [r3, #0]
	tst	r3, #1
	bne	.L50
	ldr	r4, .L56
	ldr	r3, [r4, #24]
	cmp	r3, #15
	bgt	.L49
	add	r3, r3, #1
	b	.L40
.L42:
	ldr	r3, [r4, #24]
	sub	r2, r2, #1
	str	r2, [r4, #4]
	add	r3, r3, #1
	b	.L40
.L50:
	ldr	r4, .L56
.L51:
	ldr	r3, [r4, #24]
	add	r3, r3, #1
	b	.L40
.L55:
	ldr	r3, [r4, #24]
	add	r0, r0, #1
	str	r0, [r1, #0]
	add	r3, r3, #1
	b	.L40
.L49:
	bl	fireBullet
	mov	r3, #1
	b	.L40
.L57:
	.align	2
.L56:
	.word	player
	.word	hOff
	.word	oldButtons
	.word	buttons
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	update
	.type	update, %function
update:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	bl	updatePlayer
	ldr	r5, .L61
	mov	r4, #0
.L59:
	add	r0, r5, r4, asl #5
	add	r4, r4, #1
	bl	updateBullet
	cmp	r4, #5
	bne	.L59
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L62:
	.align	2
.L61:
	.word	bullets
	.size	update, .-update
	.align	2
	.global	hideSprites
	.type	hideSprites, %function
hideSprites:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L66
	mov	r3, #0
.L64:
	mov	r1, #512	@ movhi
	strh	r1, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L64
	bx	lr
.L67:
	.align	2
.L66:
	.word	shadowOAM
	.size	hideSprites, .-hideSprites
	.comm	shadowOAM,1024,4
	.comm	gamesLost,4,4
	.comm	player,28,4
	.comm	bullets,160,4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
