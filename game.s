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
	ldr	r2, .L14
	mov	r1, #0
	stmfd	sp!, {r4, lr}
	str	r1, [r2, #0]
	ldr	r2, .L14+4
	ldr	r3, .L14+8
	mov	r1, #3
	str	r1, [r2, #0]
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
	bl	initializeBullets
	ldmfd	sp!, {r4, lr}
	b	initializeEnemies
.L15:
	.align	2
.L14:
	.word	hOff
	.word	enemiesRemaining
	.word	player
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
	ldr	r6, .L68
	sub	sp, sp, #28
	ldr	r5, [r6, #24]
	cmp	r5, #0
	ldreq	r5, [r6, #28]
	ldr	r7, .L68+4
	ldr	r8, .L68+8
	ldreq	sl, .L68+12
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
	ldr	r5, .L68+4
	ldr	r5, [r5, #28]
	ldr	sl, .L68+12
	mov	r5, r5, asl #3
	mov	r9, #512	@ movhi
	strh	r9, [sl, r5]	@ movhi
.L46:
	ldr	r5, [r8, #24]
	cmp	r5, #0
	bne	.L47
	ldr	r5, .L68+8
	ldr	r5, [r5, #28]
	ldr	sl, .L68+12
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
.L65:
	cmp	r3, #45
	ble	.L52
.L53:
	ldr	r4, .L68+16
	ldr	sl, .L68
	ldr	r9, .L68+4
	ldr	fp, .L68+8
	sub	r5, r4, #28
.L60:
	ldr	r3, [r5, #28]
	cmp	r3, #0
	beq	.L59
	ldr	r3, [r6, #24]
	cmp	r3, #0
	bne	.L62
.L55:
	ldr	r3, [r7, #24]
	cmp	r3, #0
	bne	.L63
.L57:
	ldr	r3, [r8, #24]
	cmp	r3, #0
	bne	.L64
.L59:
	ldr	r2, .L68+20
	add	r4, r4, #32
	cmp	r4, r2
	add	r5, r5, #32
	bne	.L60
	add	sp, sp, #28
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L50:
	ldr	r2, [r8, #20]
	rsb	r2, r2, #159
	rsb	ip, ip, #0
	cmp	r3, r2
	str	ip, [r7, #8]
	ble	.L65
.L52:
	rsb	r0, r0, #0
	str	r0, [r8, #8]
	b	.L53
.L48:
	rsb	r4, r4, #0
	str	r4, [r6, #8]
	b	.L49
.L64:
	ldr	lr, [r4, #-28]
	ldmia	fp, {r0, r1}	@ phole ldm
	ldr	r2, [fp, #20]
	ldr	r3, [fp, #16]
	str	lr, [sp, #0]
	ldr	lr, [r4, #-24]
	str	lr, [sp, #4]
	ldr	ip, [r4, #-8]
	str	ip, [sp, #8]
	ldr	lr, [r4, #-12]
	ldr	ip, .L68+24
	str	lr, [sp, #12]
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L59
	ldr	r2, .L68+28
	ldr	r3, [r2, #0]
	mov	ip, #0
	sub	r3, r3, #1
	str	ip, [fp, #24]
	str	ip, [r5, #28]
	str	r3, [r2, #0]
	b	.L59
.L63:
	ldr	lr, [r4, #-28]
	ldmia	r9, {r0, r1}	@ phole ldm
	ldr	r2, [r9, #20]
	ldr	r3, [r9, #16]
	str	lr, [sp, #0]
	ldr	lr, [r4, #-24]
	str	lr, [sp, #4]
	ldr	ip, [r4, #-8]
	str	ip, [sp, #8]
	ldr	lr, [r4, #-12]
	ldr	ip, .L68+24
	str	lr, [sp, #12]
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L66
	ldr	r2, .L68+28
	ldr	r3, [r2, #0]
	mov	ip, #0
	sub	r3, r3, #1
	str	ip, [r9, #24]
	str	ip, [r5, #28]
	str	r3, [r2, #0]
	b	.L59
.L62:
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
	ldr	ip, .L68+24
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L67
	ldr	r2, .L68+28
	ldr	r3, [r2, #0]
	mov	ip, #0
	sub	r3, r3, #1
	str	ip, [sl, #24]
	str	ip, [r5, #28]
	str	r3, [r2, #0]
	b	.L59
.L67:
	ldr	r3, [r5, #28]
	cmp	r3, #0
	bne	.L55
	b	.L59
.L66:
	ldr	r3, [r5, #28]
	cmp	r3, #0
	bne	.L57
	b	.L59
.L69:
	.align	2
.L68:
	.word	ladel
	.word	spatula
	.word	mitt
	.word	shadowOAM
	.word	bullets+28
	.word	bullets+188
	.word	collision
	.word	enemiesRemaining
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
	ldr	r0, .L76
	mov	r3, #0
	mov	r2, r0
.L73:
	ldr	r1, [r2, #28]
	cmp	r1, #0
	beq	.L75
	add	r3, r3, #1
	cmp	r3, #5
	add	r2, r2, #32
	bne	.L73
.L70:
	ldmfd	sp!, {r4, r5}
	bx	lr
.L75:
	ldr	r2, .L76+4
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
	b	.L70
.L77:
	.align	2
.L76:
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
	bne	.L79
	ldr	r4, .L109
	ldr	lr, [r4, #16]
	add	r3, lr, lr, lsr #31
	ldr	ip, [r4, #4]
	mov	r3, r3, asr #1
	rsb	r3, r3, #119
	cmp	r3, ip
	ldrlt	r1, .L109+4
	bge	.L106
.L80:
	cmp	ip, #1
	ble	.L104
	rsb	r2, lr, #508
	add	r3, r2, #3
	cmp	ip, r3
	sublt	ip, ip, #1
	strlt	ip, [r4, #4]
	ldr	r3, [r1, #0]
.L81:
	rsb	r3, r3, r2
	cmp	ip, r3
	bgt	.L107
.L91:
	ldr	r5, .L109+8
	ldr	r7, [r4, #0]
	ldr	r8, [r4, #20]
	ldmia	r5, {r0, r1}	@ phole ldm
	ldr	r2, [r5, #20]
	ldr	r3, [r5, #16]
	ldr	r6, .L109+12
	stmia	sp, {r7, ip}	@ phole stm
	str	r8, [sp, #8]
	str	lr, [sp, #12]
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L93
	ldr	r3, [r5, #24]
	cmp	r3, #0
	bne	.L94
.L93:
	ldr	r7, .L109+16
	ldr	lr, [r4, #0]
	ldr	ip, [r4, #4]
	ldr	r8, [r4, #20]
	ldr	sl, [r4, #16]
	ldmia	r7, {r0, r1}	@ phole ldm
	ldr	r2, [r7, #20]
	ldr	r3, [r7, #16]
	str	lr, [sp, #0]
	str	ip, [sp, #4]
	str	r8, [sp, #8]
	str	sl, [sp, #12]
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L95
	ldr	r3, [r7, #24]
	cmp	r3, #0
	beq	.L95
.L94:
	ldr	r3, .L109+20
	mov	lr, pc
	bx	r3
.L92:
	ldr	r3, [r4, #24]
	add	r3, r3, #1
	str	r3, [r4, #24]
	add	sp, sp, #20
	ldmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
	bx	lr
.L79:
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L84
	ldr	r4, .L109
	ldr	lr, [r4, #16]
	add	r3, lr, lr, lsr #31
	ldr	ip, [r4, #4]
	mov	r3, r3, asr #1
	rsb	r3, r3, #120
	cmp	ip, r3
	bgt	.L108
	ldr	r1, .L109+4
	ldr	r3, [r1, #0]
.L86:
	cmp	ip, #0
	ble	.L104
	rsb	r2, lr, #512
	sub	r2, r2, #1
	rsb	r2, r3, r2
	cmp	ip, r2
	addlt	ip, ip, #1
	strlt	ip, [r4, #4]
	rsblt	r2, lr, #508
	rsbge	r2, lr, #508
	b	.L81
.L84:
	ldr	r3, .L109+24
	ldrh	r3, [r3, #0]
	tst	r3, #1
	beq	.L100
	ldr	r3, .L109+28
	ldrh	r5, [r3, #0]
	ands	r5, r5, #1
	bne	.L100
	ldr	r4, .L109
	ldr	r3, [r4, #24]
	cmp	r3, #15
	ble	.L101
	bl	fireBullet
	ldr	lr, [r4, #16]
	ldr	r3, .L109+4
	str	r5, [r4, #24]
	ldr	ip, [r4, #4]
	ldr	r3, [r3, #0]
	rsb	r2, lr, #508
	b	.L81
.L106:
	ldr	r1, .L109+4
	ldr	r3, [r1, #0]
	cmp	r3, #0
	subgt	r3, r3, #1
	strgt	r3, [r1, #0]
	rsbgt	r2, lr, #508
	ble	.L80
	rsb	r3, r3, r2
	cmp	ip, r3
	ble	.L91
.L107:
	ldr	r3, .L109+32
	mov	lr, pc
	bx	r3
	b	.L92
.L95:
	ldmia	r5, {r0, r1}	@ phole ldm
	ldr	r2, [r5, #20]
	ldr	r3, [r5, #16]
	ldr	r7, [r4, #0]
	ldr	r5, [r4, #4]
	add	ip, r4, #16
	ldmia	ip, {ip, lr}	@ phole ldm
	str	r7, [sp, #0]
	stmib	sp, {r5, lr}	@ phole stm
	str	ip, [sp, #12]
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L92
	ldr	r3, .L109+36
	ldr	r3, [r3, #24]
	cmp	r3, #0
	bne	.L94
	b	.L92
.L100:
	ldr	r4, .L109
.L101:
	ldr	lr, [r4, #16]
	ldr	r3, .L109+4
	ldr	ip, [r4, #4]
	ldr	r3, [r3, #0]
	rsb	r2, lr, #508
	b	.L81
.L108:
	ldr	r1, .L109+4
	ldr	r3, [r1, #0]
	cmp	r3, #272
	addlt	r3, r3, #1
	strlt	r3, [r1, #0]
	rsblt	r2, lr, #508
	blt	.L81
	b	.L86
.L104:
	ldr	r3, [r1, #0]
	rsb	r2, lr, #508
	b	.L81
.L110:
	.align	2
.L109:
	.word	player
	.word	hOff
	.word	ladel
	.word	collision
	.word	spatula
	.word	goToLose
	.word	oldButtons
	.word	buttons
	.word	goToWin
	.word	mitt
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
	ldr	r5, .L114
	mov	r4, #0
.L112:
	add	r0, r5, r4, asl #5
	add	r4, r4, #1
	bl	updateBullet
	cmp	r4, #5
	bne	.L112
	ldmfd	sp!, {r4, r5, r6, lr}
	b	updateEnemies
.L115:
	.align	2
.L114:
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
	ldr	r2, .L119
	mov	r3, #0
.L117:
	mov	r1, #512	@ movhi
	strh	r1, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L117
	bx	lr
.L120:
	.align	2
.L119:
	.word	shadowOAM
	.size	hideSprites, .-hideSprites
	.comm	shadowOAM,1024,4
	.comm	gamesLost,4,4
	.comm	player,28,4
	.comm	bullets,160,4
	.comm	ladel,36,4
	.comm	spatula,36,4
	.comm	mitt,36,4
	.comm	enemiesRemaining,4,4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
