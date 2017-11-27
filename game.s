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
	.global	initializeEnemies
	.type	initializeEnemies, %function
initializeEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L2
	stmfd	sp!, {r4, r5}
	mov	r5, #46
	str	r5, [r1, #0]
	mov	r5, #121
	str	r5, [r1, #4]
	mov	r5, #36
	ldr	r2, .L2+4
	mov	r0, #1
	mov	ip, #20
	mov	r4, #63
	str	r5, [r1, #16]
	mov	r5, #7
	str	r0, [r1, #8]
	str	r4, [r1, #20]
	str	ip, [r1, #32]
	str	r5, [r1, #28]
	str	r0, [r1, #24]
	mov	r1, #44
	str	r1, [r2, #0]
	mov	r1, #164
	str	r1, [r2, #4]
	mov	r1, #58
	str	r1, [r2, #20]
	mov	r1, #27
	ldr	r3, .L2+8
	str	r1, [r2, #16]
	mov	r1, #8
	str	r0, [r2, #8]
	str	ip, [r2, #32]
	str	r1, [r2, #28]
	str	r0, [r2, #24]
	mov	r2, #47
	str	r2, [r3, #0]
	mov	r2, #205
	str	r2, [r3, #4]
	mov	r2, #39
	str	r2, [r3, #16]
	mov	r2, #9
	str	r0, [r3, #8]
	str	r4, [r3, #20]
	str	ip, [r3, #32]
	str	r2, [r3, #28]
	str	r0, [r3, #24]
	ldmfd	sp!, {r4, r5}
	bx	lr
.L3:
	.align	2
.L2:
	.word	ladel
	.word	spatula
	.word	mitt
	.size	initializeEnemies, .-initializeEnemies
	.align	2
	.global	initializePlayer
	.type	initializePlayer, %function
initializePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L5
	mov	r2, #5
	mov	r0, #37
	str	r2, [r3, #4]
	str	r2, [r3, #40]
	mov	r2, #0
	str	r0, [r3, #20]
	str	r2, [r3, #8]
	mov	r0, #29
	mov	r2, #30
	mov	r1, #115
	str	r0, [r3, #16]
	str	r2, [r3, #24]
	mov	r0, #20
	mov	r2, #2048
	str	r1, [r3, #0]
	str	r0, [r3, #44]
	str	r1, [r3, #36]
	str	r2, [r3, #28]
	bx	lr
.L6:
	.align	2
.L5:
	.word	player
	.size	initializePlayer, .-initializePlayer
	.align	2
	.global	initializeBullets
	.type	initializeBullets, %function
initializeBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	ldr	r3, .L11
	stmfd	sp!, {r4, r5}
	mov	r1, r2
	mov	r5, #6
	mov	r4, #8
	mvn	ip, #7
	mov	r0, #1
.L8:
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
	bne	.L8
	ldmfd	sp!, {r4, r5}
	bx	lr
.L12:
	.align	2
.L11:
	.word	bullets
	.size	initializeBullets, .-initializeBullets
	.align	2
	.global	initialize
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L14
	mov	r2, #0
	stmfd	sp!, {r4, lr}
	str	r2, [r3, #0]
	bl	initializePlayer
	bl	initializeBullets
	ldmfd	sp!, {r4, lr}
	b	initializeEnemies
.L15:
	.align	2
.L14:
	.word	hOff
	.size	initialize, .-initialize
	.align	2
	.global	drawPlayer
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L17
	ldmia	r3, {r1, r2}	@ phole ldm
	mvn	r2, r2, asl #18
	ldr	r3, .L17+4
	mvn	r2, r2, lsr #18
	mvn	r1, r1, asl #17
	mvn	r1, r1, lsr #17
	strh	r2, [r3, #2]	@ movhi
	mov	r2, #0	@ movhi
	strh	r1, [r3, #0]	@ movhi
	strh	r2, [r3, #4]	@ movhi
	bx	lr
.L18:
	.align	2
.L17:
	.word	player
	.word	shadowOAM
	.size	drawPlayer, .-drawPlayer
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
	bne	.L22
	ldr	r3, [r0, #24]
	ldr	r2, .L23
	mov	r3, r3, asl #3
	mov	ip, #512	@ movhi
	strh	ip, [r2, r3]	@ movhi
	bx	lr
.L22:
	ldr	r2, [r0, #24]
	ldrh	ip, [r0, #0]
	ldr	r1, .L23
	mov	r2, r2, asl #3
	ldrh	r0, [r0, #4]
	add	r3, r1, r2
	strh	ip, [r1, r2]	@ movhi
	mov	r1, #4	@ movhi
	strh	r0, [r3, #2]	@ movhi
	strh	r1, [r3, #4]	@ movhi
	bx	lr
.L24:
	.align	2
.L23:
	.word	shadowOAM
	.size	drawBullet, .-drawBullet
	.align	2
	.global	drawEnemies
	.type	drawEnemies, %function
drawEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L29
	ldr	r2, [r3, #24]
	cmp	r2, #0
	beq	.L26
	ldr	r1, [r3, #28]
	ldr	ip, [r3, #4]
	ldr	r0, .L29+4
	ldrh	r3, [r3, #0]
	mov	r1, r1, asl #3
	mvn	ip, ip, asl #18
	add	r2, r0, r1
	mvn	ip, ip, lsr #18
	strh	r3, [r0, r1]	@ movhi
	mov	r3, #5	@ movhi
	strh	ip, [r2, #2]	@ movhi
	strh	r3, [r2, #4]	@ movhi
.L26:
	ldr	r3, .L29+8
	ldr	r2, [r3, #24]
	cmp	r2, #0
	beq	.L27
	ldr	ip, [r3, #0]
	ldr	r0, [r3, #4]
	ldr	r2, [r3, #28]
	ldr	r1, .L29+4
	mvn	ip, ip, asl #17
	mov	r2, r2, asl #3
	mvn	r0, r0, asl #18
	mvn	ip, ip, lsr #17
	add	r3, r1, r2
	mvn	r0, r0, lsr #18
	strh	ip, [r1, r2]	@ movhi
	mov	r2, #192	@ movhi
	strh	r0, [r3, #2]	@ movhi
	strh	r2, [r3, #4]	@ movhi
.L27:
	ldr	r3, .L29+12
	ldr	r2, [r3, #24]
	cmp	r2, #0
	bxeq	lr
	ldr	ip, [r3, #0]
	ldr	r0, [r3, #4]
	ldr	r2, [r3, #28]
	ldr	r1, .L29+4
	mvn	ip, ip, asl #17
	mov	r2, r2, asl #3
	mvn	r0, r0, asl #18
	mvn	ip, ip, lsr #17
	add	r3, r1, r2
	mvn	r0, r0, lsr #18
	strh	ip, [r1, r2]	@ movhi
	mov	r2, #448	@ movhi
	strh	r0, [r3, #2]	@ movhi
	strh	r2, [r3, #4]	@ movhi
	bx	lr
.L30:
	.align	2
.L29:
	.word	ladel
	.word	shadowOAM
	.word	spatula
	.word	mitt
	.size	drawEnemies, .-drawEnemies
	.align	2
	.global	draw
	.type	draw, %function
draw:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	ldr	r3, .L36
	ldmia	r3, {r0, r1}	@ phole ldm
	ldr	r2, .L36+4
	mvn	r0, r0, asl #17
	mvn	r0, r0, lsr #17
	mvn	r1, r1, asl #18
	mvn	r1, r1, lsr #18
	ldr	r3, .L36+8
	strh	r0, [r2, #0]	@ movhi
	mov	r0, #0	@ movhi
	strh	r1, [r2, #2]	@ movhi
	strh	r0, [r2, #4]	@ movhi
	add	ip, r3, #160
.L34:
	ldr	r1, [r3, #28]
	cmp	r1, #0
	beq	.L32
	ldr	r0, [r3, #24]
	ldrh	lr, [r3, #0]
	mov	r0, r0, asl #3
	add	r1, r2, r0
	strh	lr, [r2, r0]	@ movhi
	ldrh	r0, [r3, #4]
	mov	lr, #4	@ movhi
	strh	r0, [r1, #2]	@ movhi
	strh	lr, [r1, #4]	@ movhi
.L33:
	add	r3, r3, #32
	cmp	r3, ip
	bne	.L34
	bl	drawEnemies
	mov	r0, #3
	ldr	r1, .L36+4
	mov	r2, #117440512
	mov	r3, #512
	ldr	ip, .L36+12
	mov	lr, pc
	bx	ip
	ldmfd	sp!, {r3, lr}
	bx	lr
.L32:
	ldr	r1, [r3, #24]
	mov	r0, #512	@ movhi
	mov	r1, r1, asl #3
	strh	r0, [r2, r1]	@ movhi
	b	.L33
.L37:
	.align	2
.L36:
	.word	player
	.word	shadowOAM
	.word	bullets
	.word	DMANow
	.size	draw, .-draw
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
	ble	.L40
	ldr	r1, .L42
	ldr	ip, [r0, #12]
	ldr	r2, [r0, #4]
	ldr	r1, [r1, #16]
	add	r2, ip, r2
	cmp	r1, r2
	bgt	.L40
	rsb	r1, r1, #508
	add	r1, r1, #3
	cmp	r1, r2
	bgt	.L41
.L40:
	mov	r3, #0
	str	r3, [r0, #28]
	bx	lr
.L41:
	ldr	r1, [r0, #8]
	add	r3, r1, r3
	str	r3, [r0, #0]
	str	r2, [r0, #4]
	bx	lr
.L43:
	.align	2
.L42:
	.word	player
	.size	updateBullet, .-updateBullet
	.align	2
	.global	updateEnemies
	.type	updateEnemies, %function
updateEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	r6, .L69
	sub	sp, sp, #28
	ldr	r5, [r6, #24]
	cmp	r5, #0
	ldreq	r5, [r6, #28]
	ldr	r7, .L69+4
	ldr	r8, .L69+8
	ldreq	sl, .L69+12
	moveq	r5, r5, asl #3
	moveq	r9, #512	@ movhi
	ldr	r1, [r6, #0]
	ldr	r2, [r7, #0]
	ldr	r3, [r8, #0]
	streqh	r9, [sl, r5]	@ movhi
	ldr	r4, [r6, #8]
	ldr	ip, [r7, #8]
	ldr	r0, [r8, #8]
	ldr	r5, [r7, #24]
	add	r1, r4, r1
	add	r2, ip, r2
	add	r3, r0, r3
	cmp	r5, #0
	str	r1, [r6, #0]
	str	r2, [r7, #0]
	str	r3, [r8, #0]
	bne	.L46
	ldr	r5, .L69+4
	ldr	r5, [r5, #28]
	ldr	sl, .L69+12
	mov	r5, r5, asl #3
	mov	r9, #512	@ movhi
	strh	r9, [sl, r5]	@ movhi
.L46:
	ldr	r5, [r8, #24]
	cmp	r5, #0
	bne	.L47
	ldr	r5, .L69+8
	ldr	r5, [r5, #28]
	ldr	sl, .L69+12
	mov	r5, r5, asl #3
	mov	r9, #512	@ movhi
	strh	r9, [sl, r5]	@ movhi
.L47:
	ldr	r5, [r6, #20]
	rsb	r5, r5, #159
	cmp	r1, r5
	bgt	.L48
	cmp	r1, #45
	ble	.L48
.L49:
	ldr	r1, [r7, #20]
	rsb	r1, r1, #159
	cmp	r2, r1
	bgt	.L50
	cmp	r2, #43
	ble	.L50
	ldr	r2, [r8, #20]
	rsb	r2, r2, #159
	cmp	r3, r2
	bgt	.L52
.L66:
	cmp	r3, #45
	ble	.L52
.L53:
	ldr	r4, .L69+16
	ldr	sl, .L69
	ldr	r9, .L69+4
	ldr	fp, .L69+8
	sub	r5, r4, #28
.L61:
	ldr	r3, [r5, #28]
	cmp	r3, #0
	beq	.L60
	ldr	r3, [r6, #24]
	cmp	r3, #0
	bne	.L63
.L55:
	ldr	r3, [r7, #24]
	cmp	r3, #0
	bne	.L64
.L58:
	ldr	r3, [r8, #24]
	cmp	r3, #0
	bne	.L65
.L60:
	ldr	ip, .L69+20
	add	r4, r4, #32
	cmp	r4, ip
	add	r5, r5, #32
	bne	.L61
	add	sp, sp, #28
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L50:
	ldr	r2, [r8, #20]
	rsb	r2, r2, #159
	rsb	ip, ip, #0
	cmp	r3, r2
	str	ip, [r7, #8]
	ble	.L66
.L52:
	rsb	r0, r0, #0
	str	r0, [r8, #8]
	b	.L53
.L48:
	rsb	r4, r4, #0
	str	r4, [r6, #8]
	b	.L49
.L65:
	ldr	lr, [r4, #-28]
	ldmia	fp, {r0, r1}	@ phole ldm
	ldr	r2, [fp, #20]
	ldr	r3, [fp, #16]
	str	lr, [sp, #0]
	ldr	ip, [r4, #-24]
	str	ip, [sp, #4]
	ldr	lr, [r4, #-8]
	str	lr, [sp, #8]
	ldr	ip, [r4, #-12]
	str	ip, [sp, #12]
	ldr	ip, .L69+24
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L60
	mov	r1, #2064
	mov	r2, #11008
	mov	r3, #0
	ldr	r0, .L69+28
	add	r1, r1, #4
	add	r2, r2, #17
	ldr	ip, .L69+32
	mov	lr, pc
	bx	ip
	mov	r3, #0
	str	r3, [fp, #24]
	str	r3, [r5, #28]
	b	.L60
.L64:
	ldr	lr, [r4, #-28]
	ldmia	r9, {r0, r1}	@ phole ldm
	ldr	r2, [r9, #20]
	ldr	r3, [r9, #16]
	str	lr, [sp, #0]
	ldr	ip, [r4, #-24]
	str	ip, [sp, #4]
	ldr	lr, [r4, #-8]
	str	lr, [sp, #8]
	ldr	ip, [r4, #-12]
	str	ip, [sp, #12]
	ldr	ip, .L69+24
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	bne	.L67
	ldr	r3, [r5, #28]
	cmp	r3, #0
	bne	.L58
	b	.L60
.L63:
	ldr	ip, [r4, #-28]
	ldmia	sl, {r0, r1}	@ phole ldm
	ldr	r2, [sl, #20]
	ldr	r3, [sl, #16]
	str	ip, [sp, #0]
	ldr	ip, [r4, #-24]
	str	ip, [sp, #4]
	ldr	lr, [r4, #-8]
	str	lr, [sp, #8]
	ldr	ip, [r4, #-12]
	str	ip, [sp, #12]
	ldr	ip, .L69+24
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	bne	.L68
	ldr	r3, [r5, #28]
	cmp	r3, #0
	bne	.L55
	b	.L60
.L68:
	mov	r1, #2064
	mov	r2, #11008
	mov	r3, #0
	ldr	r0, .L69+28
	add	r1, r1, #4
	add	r2, r2, #17
	ldr	ip, .L69+32
	mov	lr, pc
	bx	ip
	mov	r3, #0
	str	r3, [sl, #24]
	str	r3, [r5, #28]
	b	.L60
.L67:
	mov	r1, #2064
	mov	r2, #11008
	mov	r3, #0
	ldr	r0, .L69+28
	add	r1, r1, #4
	add	r2, r2, #17
	ldr	ip, .L69+32
	mov	lr, pc
	bx	ip
	mov	r3, #0
	str	r3, [r9, #24]
	str	r3, [r5, #28]
	b	.L60
.L70:
	.align	2
.L69:
	.word	ladel
	.word	spatula
	.word	mitt
	.word	shadowOAM
	.word	bullets+28
	.word	bullets+188
	.word	collision
	.word	hit
	.word	playSoundB
	.size	updateEnemies, .-updateEnemies
	.align	2
	.global	fireBullet
	.type	fireBullet, %function
fireBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5}
	ldr	r0, .L77
	mov	r3, #0
	mov	r2, r0
.L74:
	ldr	r1, [r2, #28]
	cmp	r1, #0
	beq	.L76
	add	r3, r3, #1
	cmp	r3, #5
	add	r2, r2, #32
	bne	.L74
.L71:
	ldmfd	sp!, {r4, r5}
	bx	lr
.L76:
	ldr	r2, .L77+4
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
	b	.L71
.L78:
	.align	2
.L77:
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
	stmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
	mov	r3, #67108864
	add	r3, r3, #256
	sub	sp, sp, #20
	ldrh	r2, [r3, #48]
	tst	r2, #32
	bne	.L80
	ldr	r4, .L119
	ldr	r2, [r4, #16]
	add	r3, r2, r2, lsr #31
	ldr	r1, [r4, #4]
	mov	r3, r3, asr #1
	rsb	r3, r3, #119
	cmp	r3, r1
	ldrlt	r3, .L119+4
	bge	.L114
.L81:
	cmp	r1, #1
	ble	.L113
	rsb	r2, r2, #508
	add	r2, r2, #3
	cmp	r2, r1
	subgt	r1, r1, #1
	strgt	r1, [r4, #4]
	ble	.L113
.L110:
	ldr	r2, .L119+8
	ldr	r7, .L119+12
	ldrh	r2, [r2, #0]
	ldr	r5, .L119+16
	ldr	r6, .L119+20
.L82:
	tst	r2, #4
	beq	.L89
	ldr	r2, .L119+24
	ldrh	r2, [r2, #0]
	ands	r2, r2, #4
	streq	r2, [r7, #24]
	streq	r2, [r5, #24]
	streq	r2, [r6, #24]
.L89:
	ldr	ip, [r4, #16]
	ldr	r3, [r3, #0]
	ldr	lr, [r4, #4]
	rsb	r2, ip, #508
	rsb	r3, r3, r2
	cmp	lr, r3
	ldr	r8, .L119
	bgt	.L115
.L90:
	ldr	r8, [r4, #0]
	ldr	sl, [r4, #20]
	ldmia	r7, {r0, r1}	@ phole ldm
	ldr	r2, [r7, #20]
	ldr	r3, [r7, #16]
	ldr	r7, .L119+28
	stmia	sp, {r8, lr}	@ phole stm
	str	sl, [sp, #8]
	str	ip, [sp, #12]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L91
	ldr	r3, .L119+12
	ldr	r3, [r3, #24]
	cmp	r3, #0
	bne	.L116
.L91:
	ldmia	r5, {r0, r1}	@ phole ldm
	ldr	r2, [r5, #20]
	ldr	r3, [r5, #16]
	ldmia	r4, {r5, lr}	@ phole ldm
	add	r8, r4, #16
	ldmia	r8, {r8, ip}	@ phole ldm
	stmia	sp, {r5, lr}	@ phole stm
	str	ip, [sp, #8]
	str	r8, [sp, #12]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L92
	ldr	r3, .L119+16
	ldr	r3, [r3, #24]
	cmp	r3, #0
	bne	.L117
.L92:
	ldmia	r6, {r0, r1}	@ phole ldm
	ldr	r2, [r6, #20]
	ldr	r3, [r6, #16]
	ldr	r5, [r4, #4]
	ldr	r6, [r4, #0]
	add	ip, r4, #16
	ldmia	ip, {ip, lr}	@ phole ldm
	str	r6, [sp, #0]
	stmib	sp, {r5, lr}	@ phole stm
	str	ip, [sp, #12]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L93
	ldr	r3, .L119+20
	ldr	r3, [r3, #24]
	cmp	r3, #0
	ldrne	r3, .L119+32
	movne	lr, pc
	bxne	r3
.L93:
	ldr	r3, [r4, #44]
	add	r3, r3, #1
	str	r3, [r4, #44]
	add	sp, sp, #20
	ldmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
	bx	lr
.L80:
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L85
	ldr	r4, .L119
	ldr	r1, [r4, #16]
	add	r3, r1, r1, lsr #31
	ldr	r2, [r4, #4]
	mov	r3, r3, asr #1
	rsb	r3, r3, #120
	cmp	r2, r3
	bgt	.L103
	ldr	r3, .L119+4
	ldr	r7, .L119+12
	ldr	r5, .L119+16
	ldr	r6, .L119+20
.L86:
	cmp	r2, #0
	ble	.L112
	ldr	r0, [r3, #0]
	rsb	r1, r1, #512
	rsb	r1, r0, r1
	sub	r1, r1, #1
	cmp	r2, r1
	addlt	r2, r2, #1
	strlt	r2, [r4, #4]
.L112:
	ldr	r2, .L119+8
	ldrh	r2, [r2, #0]
	b	.L82
.L85:
	ldr	r5, .L119+8
	ldrh	r2, [r5, #0]
	tst	r2, #1
	beq	.L111
	ldr	r3, .L119+24
	ldrh	r6, [r3, #0]
	ands	r6, r6, #1
	bne	.L111
	ldr	r4, .L119
	ldr	r3, [r4, #44]
	cmp	r3, #15
	bgt	.L109
	ldr	r3, .L119+4
	ldr	r7, .L119+12
	ldr	r5, .L119+16
	ldr	r6, .L119+20
	b	.L82
.L114:
	ldr	r3, .L119+4
	ldr	r0, [r3, #0]
	cmp	r0, #0
	subgt	r0, r0, #1
	strgt	r0, [r3, #0]
	bgt	.L110
	b	.L81
.L113:
	ldr	r2, .L119+8
	ldr	r7, .L119+12
	ldrh	r2, [r2, #0]
	ldr	r5, .L119+16
	ldr	r6, .L119+20
	b	.L82
.L115:
	ldr	r3, .L119+36
	mov	lr, pc
	bx	r3
	ldr	lr, [r8, #4]
	ldr	ip, [r8, #16]
	b	.L90
.L111:
	ldr	r4, .L119
	ldr	r3, .L119+4
	ldr	r7, .L119+12
	ldr	r5, .L119+16
	ldr	r6, .L119+20
	b	.L82
.L103:
	ldr	r3, .L119+4
	ldr	r0, [r3, #0]
	cmp	r0, #272
	blt	.L104
	ldr	r7, .L119+12
	ldr	r5, .L119+16
	ldr	r6, .L119+20
	b	.L86
.L117:
	ldr	r3, .L119+32
	mov	lr, pc
	bx	r3
	b	.L92
.L116:
	ldr	r3, .L119+32
	mov	lr, pc
	bx	r3
	b	.L91
.L104:
	ldr	r7, .L119+12
	ldr	ip, [r7, #24]
	cmp	ip, #0
	bne	.L118
	ldr	r5, .L119+16
	ldr	ip, [r5, #24]
	cmp	ip, #0
	ldrne	r6, .L119+20
	bne	.L86
	ldr	r6, .L119+20
	ldr	ip, [r6, #24]
	cmp	ip, #0
	bne	.L86
	ldr	r2, .L119+8
	add	r0, r0, #1
	str	r0, [r3, #0]
	ldrh	r2, [r2, #0]
	b	.L82
.L118:
	ldr	r5, .L119+16
	ldr	r6, .L119+20
	b	.L86
.L109:
	bl	fireBullet
	mov	r1, #2288
	mov	r2, #11008
	mov	r3, r6
	add	r2, r2, #17
	ldr	r0, .L119+40
	add	r1, r1, #11
	ldr	ip, .L119+44
	mov	lr, pc
	bx	ip
	ldr	r7, .L119+12
	str	r6, [r4, #44]
	ldrh	r2, [r5, #0]
	ldr	r3, .L119+4
	ldr	r5, .L119+16
	ldr	r6, .L119+20
	b	.L82
.L120:
	.align	2
.L119:
	.word	player
	.word	hOff
	.word	oldButtons
	.word	ladel
	.word	spatula
	.word	mitt
	.word	buttons
	.word	collision
	.word	goToLose
	.word	goToWin
	.word	shoot
	.word	playSoundB
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	update
	.type	update, %function
update:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	bl	updatePlayer
	ldr	r5, .L124
	mov	r4, #0
.L122:
	add	r0, r5, r4, asl #5
	add	r4, r4, #1
	bl	updateBullet
	cmp	r4, #5
	bne	.L122
	ldmfd	sp!, {r4, r5, r6, lr}
	b	updateEnemies
.L125:
	.align	2
.L124:
	.word	bullets
	.size	update, .-update
	.align	2
	.global	drawEnemyBullet
	.type	drawEnemyBullet, %function
drawEnemyBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	drawEnemyBullet, .-drawEnemyBullet
	.align	2
	.global	updateEnemyBullet
	.type	updateEnemyBullet, %function
updateEnemyBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	updateEnemyBullet, .-updateEnemyBullet
	.align	2
	.global	fireEnemyBullet
	.type	fireEnemyBullet, %function
fireEnemyBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	fireEnemyBullet, .-fireEnemyBullet
	.align	2
	.global	initializeEnemyBullets
	.type	initializeEnemyBullets, %function
initializeEnemyBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	initializeEnemyBullets, .-initializeEnemyBullets
	.align	2
	.global	hideSprites
	.type	hideSprites, %function
hideSprites:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L133
	mov	r3, #0
.L131:
	mov	r1, #512	@ movhi
	strh	r1, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L131
	bx	lr
.L134:
	.align	2
.L133:
	.word	shadowOAM
	.size	hideSprites, .-hideSprites
	.comm	shadowOAM,1024,4
	.comm	gamesLost,4,4
	.comm	player,48,4
	.comm	bullets,160,4
	.comm	ladel,36,4
	.comm	spatula,36,4
	.comm	mitt,36,4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
