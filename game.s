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
	mov	ip, #3
	mov	r4, #63
	str	r5, [r1, #16]
	mov	r5, #7
	str	r0, [r1, #8]
	str	r4, [r1, #20]
	str	r5, [r1, #28]
	str	r0, [r1, #24]
	str	ip, [r1, #36]
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
	str	r1, [r2, #28]
	str	r0, [r2, #24]
	str	ip, [r2, #36]
	mov	r2, #47
	str	r2, [r3, #0]
	mov	r2, #205
	str	r2, [r3, #4]
	mov	r2, #39
	str	r2, [r3, #16]
	mov	r2, #9
	str	r0, [r3, #8]
	str	r4, [r3, #20]
	str	r2, [r3, #28]
	str	r0, [r3, #24]
	str	ip, [r3, #36]
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
	mov	r1, #5
	mov	ip, #23
	str	r1, [r3, #12]
	str	ip, [r3, #28]
	str	r1, [r3, #48]
	mov	ip, #19
	mvn	r1, #0
	mov	r2, #0
	mov	r0, #125
	str	ip, [r3, #24]
	str	r1, [r3, #32]
	mov	ip, #20
	mov	r1, #2048
	str	r0, [r3, #8]
	str	ip, [r3, #52]
	str	r0, [r3, #44]
	str	r2, [r3, #56]
	str	r2, [r3, #16]
	str	r1, [r3, #36]
	str	r2, [r3, #60]
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
	ldr	r3, .L8
	mov	r1, #1
	str	r4, [sp, #-4]!
	mov	r2, #0
	mov	r4, #6
	mov	ip, #8
	mvn	r0, #7
	str	r1, [r3, #12]
	str	r1, [r3, #24]
	str	r1, [r3, #48]
	mov	r1, #2
	str	r4, [r3, #20]
	str	ip, [r3, #16]
	str	r2, [r3, #0]
	stmib	r3, {r0, r2}	@ phole stm
	str	r2, [r3, #28]
	str	r2, [r3, #32]
	str	r4, [r3, #56]
	str	ip, [r3, #52]
	str	r2, [r3, #36]
	str	r0, [r3, #40]
	str	r2, [r3, #44]
	str	r2, [r3, #64]
	str	r1, [r3, #60]
	str	r2, [r3, #68]
	ldmfd	sp!, {r4}
	bx	lr
.L9:
	.align	2
.L8:
	.word	bullets
	.size	initializeBullets, .-initializeBullets
	.align	2
	.global	drawPlayer
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L15
	ldr	r2, [r3, #60]
	cmp	r2, #0
	bne	.L14
	ldr	r2, [r3, #56]
	mov	r1, r2, lsr #31
	add	r2, r2, r1
	ldr	r0, [r3, #12]
	and	ip, r2, #1
	mvn	r0, r0, asl #17
	ldr	r2, .L15+4
	rsb	r1, r1, ip
	ldrh	r3, [r3, #8]
	mvn	r0, r0, lsr #17
	mov	r1, r1, asl #7
	strh	r0, [r2, #2]	@ movhi
	strh	r1, [r2, #4]	@ movhi
	strh	r3, [r2, #0]	@ movhi
	bx	lr
.L14:
	ldr	r1, [r3, #56]
	mov	r2, r1, lsr #31
	add	r1, r1, r2
	ldr	r0, [r3, #12]
	and	r1, r1, #1
	rsb	r1, r2, r1
	mvn	r0, r0, asl #17
	ldr	r2, .L15+4
	mov	r1, r1, asl #7
	ldrh	r3, [r3, #8]
	mvn	r0, r0, lsr #17
	add	r1, r1, #16
	strh	r3, [r2, #0]	@ movhi
	strh	r0, [r2, #2]	@ movhi
	strh	r1, [r2, #4]	@ movhi
	bx	lr
.L16:
	.align	2
.L15:
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
	beq	.L18
	ldr	r3, [r0, #32]
	cmp	r3, #0
	beq	.L21
	sub	r3, r3, #1
	cmp	r3, #2
	bxhi	lr
	ldr	r2, [r0, #24]
	ldrh	ip, [r0, #0]
	ldr	r1, .L22
	mov	r2, r2, asl #3
	ldrh	r0, [r0, #4]
	add	r3, r1, r2
	strh	ip, [r1, r2]	@ movhi
	mov	r1, #36	@ movhi
	strh	r0, [r3, #2]	@ movhi
	strh	r1, [r3, #4]	@ movhi
	bx	lr
.L18:
	ldr	r3, [r0, #24]
	ldr	r2, .L22
	mov	r3, r3, asl #3
	mov	ip, #512	@ movhi
	strh	ip, [r2, r3]	@ movhi
	bx	lr
.L21:
	ldr	r2, [r0, #24]
	ldrh	ip, [r0, #0]
	ldr	r1, .L22
	mov	r2, r2, asl #3
	ldrh	r0, [r0, #4]
	add	r3, r1, r2
	strh	ip, [r1, r2]	@ movhi
	mov	r1, #4	@ movhi
	strh	r0, [r3, #2]	@ movhi
	strh	r1, [r3, #4]	@ movhi
	bx	lr
.L23:
	.align	2
.L22:
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
	ldr	r3, .L28
	ldr	r2, [r3, #24]
	cmp	r2, #0
	beq	.L25
	ldr	r1, [r3, #28]
	ldr	ip, [r3, #4]
	ldr	r0, .L28+4
	ldrh	r3, [r3, #0]
	mov	r1, r1, asl #3
	mvn	ip, ip, asl #18
	add	r2, r0, r1
	mvn	ip, ip, lsr #18
	strh	r3, [r0, r1]	@ movhi
	mov	r3, #5	@ movhi
	strh	ip, [r2, #2]	@ movhi
	strh	r3, [r2, #4]	@ movhi
.L25:
	ldr	r3, .L28+8
	ldr	r2, [r3, #24]
	cmp	r2, #0
	beq	.L26
	ldr	ip, [r3, #0]
	ldr	r0, [r3, #4]
	ldr	r2, [r3, #28]
	ldr	r1, .L28+4
	mvn	ip, ip, asl #17
	mov	r2, r2, asl #3
	mvn	r0, r0, asl #18
	mvn	ip, ip, lsr #17
	add	r3, r1, r2
	mvn	r0, r0, lsr #18
	strh	ip, [r1, r2]	@ movhi
	mov	r2, #256	@ movhi
	strh	r0, [r3, #2]	@ movhi
	strh	r2, [r3, #4]	@ movhi
.L26:
	ldr	r3, .L28+12
	ldr	r2, [r3, #24]
	cmp	r2, #0
	bxeq	lr
	ldr	ip, [r3, #0]
	ldr	r0, [r3, #4]
	ldr	r2, [r3, #28]
	ldr	r1, .L28+4
	mvn	ip, ip, asl #17
	mov	r2, r2, asl #3
	mvn	r0, r0, asl #18
	mvn	ip, ip, lsr #17
	add	r3, r1, r2
	mvn	r0, r0, lsr #18
	strh	ip, [r1, r2]	@ movhi
	mov	r2, #512	@ movhi
	strh	r0, [r3, #2]	@ movhi
	strh	r2, [r3, #4]	@ movhi
	bx	lr
.L29:
	.align	2
.L28:
	.word	ladel
	.word	shadowOAM
	.word	spatula
	.word	mitt
	.size	drawEnemies, .-drawEnemies
	.align	2
	.global	updateBullet
	.type	updateBullet, %function
updateBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, lr}
	sub	sp, sp, #20
	ldr	r3, [r0, #28]
	cmp	r3, #0
	mov	r4, r0
	beq	.L30
	ldr	r0, [r0, #0]
	ldr	r2, [r4, #20]
	add	r3, r2, r0
	cmp	r3, #0
	ble	.L32
	ldr	r3, .L38
	ldr	ip, [r4, #12]
	ldr	r1, [r4, #4]
	ldr	r3, [r3, #24]
	add	r1, ip, r1
	cmp	r3, r1
	bgt	.L32
	rsb	r3, r3, #504
	cmp	r1, r3
	blt	.L35
.L32:
	ldr	r3, [r4, #32]
.L34:
	sub	r3, r3, #1
	cmp	r3, #2
	bhi	.L36
	ldr	ip, [r4, #4]
	ldr	r1, [r4, #12]
	add	r3, r1, ip
	cmp	r3, #4
	bgt	.L37
.L36:
	mov	r3, #0
	str	r3, [r4, #28]
.L30:
	add	sp, sp, #20
	ldmfd	sp!, {r4, r5, r6, r7, lr}
	bx	lr
.L35:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	bne	.L34
	ldr	r3, [r4, #8]
	add	r0, r3, r0
	stmia	r4, {r0, r1}	@ phole stm
	b	.L30
.L37:
	ldr	lr, [r4, #8]
	ldr	r5, .L38
	rsb	r0, lr, r0
	ldr	r7, [r5, #8]
	ldr	r6, [r5, #12]
	ldr	lr, [r5, #28]
	rsb	r1, r1, ip
	ldr	ip, [r5, #24]
	ldr	r3, [r4, #16]
	stmia	r4, {r0, r1}	@ phole stm
	str	ip, [sp, #12]
	str	r7, [sp, #0]
	stmib	sp, {r6, lr}	@ phole stm
	ldr	ip, .L38+4
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L30
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L30
	ldr	r3, [r5, #60]
	cmp	r3, #0
	bne	.L30
	ldr	r2, .L38+8
	ldr	r1, [r2, #0]
	sub	r1, r1, #1
	str	r3, [r4, #28]
	str	r1, [r2, #0]
	b	.L30
.L39:
	.align	2
.L38:
	.word	player
	.word	collision
	.word	lives
	.size	updateBullet, .-updateBullet
	.align	2
	.global	fireBullet
	.type	fireBullet, %function
fireBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L45
	stmfd	sp!, {r4, r5}
	ldr	r2, [r3, #28]
	cmp	r2, #0
	beq	.L41
	ldr	r2, [r3, #64]
	cmp	r2, #0
	beq	.L44
.L40:
	ldmfd	sp!, {r4, r5}
	bx	lr
.L44:
	mov	r2, #1
.L41:
	ldr	r1, .L45+4
	ldr	r0, [r1, #28]
	ldr	r5, [r1, #8]
	ldr	r4, [r1, #24]
	ldr	ip, [r1, #12]
	add	r0, r0, r0, lsr #31
	add	r2, r2, r2, asl #3
	add	r0, r5, r0, asr #1
	add	r1, r3, r2, asl #2
	add	ip, r4, ip
	str	r0, [r3, r2, asl #2]
	mov	r3, #1
	str	ip, [r1, #4]
	str	r3, [r1, #28]
	b	.L40
.L46:
	.align	2
.L45:
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
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	r4, .L92
	sub	sp, sp, #20
	ldr	r3, [r4, #56]
	cmp	r3, #17
	movgt	r3, #14
	strgt	r3, [r4, #56]
	ldr	sl, .L92+4
	mov	r3, #67108864
	add	r3, r3, #256
	ldr	r2, [sl, #0]
	ldrh	r1, [r3, #48]
	add	r2, r2, #1
	tst	r1, #32
	str	r2, [sl, #0]
	bne	.L49
	ldr	r3, [r4, #24]
	add	r1, r3, r3, lsr #31
	mov	r1, r1, asr #1
	ldr	r2, [r4, #8]
	rsb	r1, r1, #119
	cmp	r1, r2
	ldrlt	r8, .L92+8
	bge	.L86
.L50:
	ldr	r2, [r4, #12]
	cmp	r2, #1
	ble	.L51
	rsb	r3, r3, #508
	add	r3, r3, #3
	cmp	r3, r2
	ldrgt	r3, .L92
	subgt	r2, r2, #1
	strgt	r2, [r3, #12]
.L51:
	ldr	r3, [r4, #56]
	ldr	r9, .L92+12
	add	r3, r3, #1
	str	r3, [r4, #56]
	ldrh	r2, [r9, #0]
	ldr	r5, .L92+16
	ldr	r6, .L92+20
	ldr	r7, .L92+24
.L52:
	tst	r2, #4
	beq	.L56
	ldr	r3, .L92+28
	ldrh	r3, [r3, #0]
	ands	r1, r3, #4
	bne	.L56
	ldr	r3, [r4, #60]
	ldr	ip, .L92
	cmp	r3, #0
	strne	r1, [ip, #60]
	beq	.L87
.L56:
	tst	r2, #2
	beq	.L85
	ldr	r3, .L92+28
	ldrh	r3, [r3, #0]
	tst	r3, #2
	bne	.L85
	ldr	ip, [r4, #8]
	ldr	r3, .L92
	cmp	ip, #125
	ldreq	r2, [r3, #32]
	addeq	r2, r2, #9
	rsbeq	ip, r2, #125
	streq	r2, [r3, #16]
	streq	ip, [r3, #8]
.L59:
	cmp	ip, #124
	bgt	.L61
	ldr	r3, [sl, #0]
	ldr	r2, .L92+32
	smull	r1, r2, r3, r2
	sub	r2, r2, r3, asr #31
	add	r2, r2, r2, asl #1
	cmp	r3, r2
	bne	.L61
	ldr	r3, [r4, #16]
	ldr	r2, [r4, #32]
	add	r3, r2, r3
	rsb	ip, r3, ip
	str	r3, [r4, #16]
	str	ip, [r4, #8]
.L61:
	ldr	sl, [r4, #24]
	ldr	r2, [r8, #0]
	rsb	r3, sl, #436
	ldr	lr, [r4, #12]
	add	r3, r3, #3
	rsb	r3, r2, r3
	ldr	fp, .L92
	cmp	lr, r3
	ldrle	r9, [fp, #28]
	ble	.L63
	ldr	r9, [fp, #28]
	add	r3, ip, r9
	cmp	r3, #121
	bgt	.L63
	ldr	r3, [fp, #16]
	cmp	r3, #2
	bgt	.L88
.L63:
	ldmia	r5, {r0, r1}	@ phole ldm
	ldr	r2, [r5, #20]
	ldr	r3, [r5, #16]
	ldr	r5, .L92+36
	stmia	sp, {ip, lr}	@ phole stm
	str	r9, [sp, #8]
	str	sl, [sp, #12]
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L64
	ldr	r3, .L92+16
	ldr	r3, [r3, #24]
	cmp	r3, #0
	bne	.L89
.L64:
	ldmia	r6, {r0, r1}	@ phole ldm
	ldr	r2, [r6, #20]
	ldr	r3, [r6, #16]
	ldr	lr, [r4, #8]
	ldr	ip, [r4, #12]
	ldr	r6, [r4, #28]
	ldr	sl, [r4, #24]
	str	lr, [sp, #0]
	str	ip, [sp, #4]
	str	r6, [sp, #8]
	str	sl, [sp, #12]
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L65
	ldr	r3, .L92+20
	ldr	r3, [r3, #24]
	cmp	r3, #0
	bne	.L90
.L65:
	ldmia	r7, {r0, r1}	@ phole ldm
	ldr	r2, [r7, #20]
	ldr	r3, [r7, #16]
	add	r6, r4, #8
	ldmia	r6, {r6, lr}	@ phole ldm
	add	r7, r4, #24
	ldmia	r7, {r7, ip}	@ phole ldm
	stmia	sp, {r6, lr}	@ phole stm
	str	ip, [sp, #8]
	str	r7, [sp, #12]
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L66
	ldr	r3, .L92+24
	ldr	r3, [r3, #24]
	cmp	r3, #0
	ldrne	r3, .L92+40
	movne	lr, pc
	bxne	r3
.L66:
	ldr	r3, [r4, #52]
	ldr	r0, [r4, #12]
	ldr	r2, [r8, #0]
	ldr	r1, [r4, #8]
	rsb	r2, r2, r0
	add	r3, r3, #1
	stmia	r4, {r1, r2}	@ phole stm
	str	r3, [r4, #52]
	add	sp, sp, #20
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L49:
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L53
	ldr	r2, [r4, #24]
	add	r1, r2, r2, lsr #31
	ldr	r3, [r4, #12]
	mov	r1, r1, asr #1
	rsb	r1, r1, #120
	cmp	r3, r1
	bgt	.L76
	ldr	r8, .L92+8
	ldr	r5, .L92+16
	ldr	r6, .L92+20
	ldr	r7, .L92+24
.L54:
	cmp	r3, #0
	ble	.L55
	ldr	r1, [r8, #0]
	rsb	r2, r2, #504
	rsb	r2, r1, r2
	cmp	r3, r2
	addlt	r3, r3, #1
	strlt	r3, [r4, #12]
.L55:
	ldr	r3, [r4, #56]
	ldr	r9, .L92+12
	add	r3, r3, #1
	str	r3, [r4, #56]
	ldrh	r2, [r9, #0]
	b	.L52
.L53:
	ldr	r9, .L92+12
	ldrh	r2, [r9, #0]
	tst	r2, #1
	beq	.L84
	ldr	r3, .L92+28
	ldrh	r5, [r3, #0]
	ands	r5, r5, #1
	bne	.L84
	ldr	r3, [r4, #52]
	cmp	r3, #15
	bgt	.L82
.L84:
	ldr	r8, .L92+8
	ldr	r5, .L92+16
	ldr	r6, .L92+20
	ldr	r7, .L92+24
	b	.L52
.L86:
	ldr	r8, .L92+8
	ldr	r2, [r8, #0]
	cmp	r2, #4
	subgt	r2, r2, #1
	strgt	r2, [r8, #0]
	bgt	.L51
	b	.L50
.L85:
	ldr	ip, [r4, #8]
	b	.L59
.L76:
	ldr	r8, .L92+8
	ldr	r1, [r8, #0]
	cmp	r1, #272
	blt	.L77
	ldr	r5, .L92+16
	ldr	r6, .L92+20
	ldr	r7, .L92+24
	b	.L54
.L87:
	mov	lr, #1
	mov	r1, #16064
	mov	r2, #11008
	add	r2, r2, #17
	str	lr, [ip, #60]
	ldr	r0, .L92+44
	add	r1, r1, #42
	ldr	ip, .L92+48
	mov	lr, pc
	bx	ip
	ldrh	r2, [r9, #0]
	b	.L56
.L88:
	ldr	r3, .L92+52
	mov	lr, pc
	bx	r3
	add	ip, fp, #8
	ldmia	ip, {ip, lr}	@ phole ldm
	ldr	r9, [fp, #28]
	ldr	sl, [fp, #24]
	b	.L63
.L89:
	ldr	r3, .L92+40
	mov	lr, pc
	bx	r3
	b	.L64
.L90:
	ldr	r3, .L92+40
	mov	lr, pc
	bx	r3
	b	.L65
.L77:
	ldr	r5, .L92+16
	ldr	r0, [r5, #24]
	cmp	r0, #0
	bne	.L91
	ldr	r6, .L92+20
	ldr	r0, [r6, #24]
	cmp	r0, #0
	ldrne	r7, .L92+24
	bne	.L54
	ldr	r7, .L92+24
	ldr	r0, [r7, #24]
	cmp	r0, #0
	addeq	r1, r1, #1
	streq	r1, [r8, #0]
	beq	.L55
	b	.L54
.L91:
	ldr	r6, .L92+20
	ldr	r7, .L92+24
	b	.L54
.L82:
	bl	fireBullet
	mov	r1, #2288
	mov	r2, #11008
	mov	r3, r5
	add	r2, r2, #17
	ldr	r0, .L92+56
	add	r1, r1, #11
	ldr	ip, .L92+48
	mov	lr, pc
	bx	ip
	ldr	r3, .L92
	ldr	r8, .L92+8
	str	r5, [r3, #52]
	ldrh	r2, [r9, #0]
	ldr	r5, .L92+16
	ldr	r6, .L92+20
	ldr	r7, .L92+24
	b	.L52
.L93:
	.align	2
.L92:
	.word	player
	.word	gravCount
	.word	hOff
	.word	oldButtons
	.word	ladel
	.word	spatula
	.word	mitt
	.word	buttons
	.word	1431655766
	.word	collision
	.word	goToLose
	.word	gudetama
	.word	playSoundB
	.word	goToWin
	.word	shoot
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	fireEnemyBullet
	.type	fireEnemyBullet, %function
fireEnemyBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	str	r4, [sp, #-4]!
	ldr	r3, [r0, #28]
	cmp	r3, #0
	bne	.L94
	ldr	r3, [r0, #32]
	cmp	r3, #1
	beq	.L100
	cmp	r3, #2
	beq	.L97
	cmp	r3, #3
	beq	.L98
.L94:
	ldmfd	sp!, {r4}
	bx	lr
.L98:
	ldr	r3, .L101
.L99:
	ldr	ip, [r3, #0]
	ldr	r2, [r3, #20]
	ldr	r1, [r3, #4]
	ldr	r3, [r0, #16]
	add	r2, ip, r2
	ldr	ip, [r0, #20]
	rsb	r3, r3, r1
	sub	r2, r2, #10
	rsb	r2, ip, r2
	str	r3, [r0, #4]
	mov	r3, #1
	str	r2, [r0, #0]
	str	r3, [r0, #28]
	b	.L94
.L100:
	ldr	r2, .L101+4
	ldr	r1, [r2, #20]
	ldmia	r2, {r4, ip}	@ phole ldm
	add	r4, r4, r1
	ldr	r2, [r0, #16]
	ldr	r1, [r0, #20]
	sub	r4, r4, #10
	rsb	r1, r1, r4
	rsb	r2, r2, ip
	stmia	r0, {r1, r2}	@ phole stm
	str	r3, [r0, #28]
	b	.L94
.L97:
	ldr	r3, .L101+8
	b	.L99
.L102:
	.align	2
.L101:
	.word	mitt
	.word	ladel
	.word	spatula
	.size	fireEnemyBullet, .-fireEnemyBullet
	.align	2
	.global	updateEnemies
	.type	updateEnemies, %function
updateEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	r5, .L133
	ldr	r6, .L133+4
	sub	sp, sp, #28
	ldr	r4, [r6, #8]
	ldr	ip, [r6, #0]
	ldr	r1, [r5, #24]
	ldr	r7, .L133+8
	add	ip, r4, ip
	cmp	r1, #0
	ldr	r8, [r7, #8]
	str	ip, [r6, #0]
	ldr	r3, [r7, #0]
	ldreq	ip, [r5, #28]
	ldreq	r4, .L133+12
	moveq	ip, ip, asl #3
	add	r3, r8, r3
	moveq	r8, #512	@ movhi
	ldr	r2, [r5, #0]
	streqh	r8, [r4, ip]	@ movhi
	ldr	r0, [r5, #8]
	ldr	ip, [r7, #24]
	add	r2, r0, r2
	cmp	ip, #0
	str	r2, [r5, #0]
	str	r3, [r7, #0]
	bne	.L105
	ldr	ip, .L133+8
	ldr	ip, [ip, #28]
	ldr	r4, .L133+12
	mov	ip, ip, asl #3
	mov	r8, #512	@ movhi
	strh	r8, [r4, ip]	@ movhi
.L105:
	ldr	ip, [r6, #24]
	cmp	ip, #0
	bne	.L106
	ldr	ip, .L133+4
	ldr	ip, [ip, #28]
	ldr	r4, .L133+12
	mov	ip, ip, asl #3
	mov	r8, #512	@ movhi
	strh	r8, [r4, ip]	@ movhi
.L106:
	ldr	ip, [r5, #20]
	rsb	ip, ip, #156
	cmp	r2, ip
	bgt	.L107
	cmp	r2, #45
	ble	.L107
.L108:
	ldr	r2, [r7, #20]
	rsb	r2, r2, #156
	cmp	r2, r3
	blt	.L109
	cmp	r3, #43
	ble	.L109
.L110:
	ldr	r2, [r6, #20]
	ldr	r3, [r6, #0]
	rsb	r2, r2, #156
	cmp	r3, r2
	bgt	.L111
	cmp	r3, #45
	ble	.L111
.L112:
	ldr	r4, .L133+16
	ldr	sl, .L133
	ldr	r9, .L133+8
	ldr	fp, .L133+4
	sub	r8, r4, #28
.L126:
	ldr	r3, [r8, #28]
	cmp	r3, #0
	beq	.L121
	ldr	r3, [r5, #24]
	cmp	r3, #0
	bne	.L130
	ldr	r3, [r7, #24]
	cmp	r3, #0
	bne	.L131
.L119:
	ldr	r3, [r6, #24]
	cmp	r3, #0
	bne	.L132
.L121:
	ldr	r1, .L133+20
	add	r4, r4, #36
	cmp	r4, r1
	add	r8, r8, #36
	bne	.L126
	add	sp, sp, #28
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L111:
	ldr	r3, [r6, #8]
	ldr	r2, [r5, #24]
	rsb	r3, r3, #0
	cmp	r2, #0
	str	r3, [r6, #8]
	bne	.L112
	ldr	r3, [r7, #24]
	cmp	r3, #0
	bne	.L112
	ldr	r3, .L133+4
	ldr	r3, [r3, #24]
	cmp	r3, #0
	beq	.L112
	ldr	r0, .L133+24
	bl	fireEnemyBullet
	b	.L112
.L109:
	ldr	r3, [r7, #8]
	ldr	r2, [r5, #24]
	rsb	r3, r3, #0
	cmp	r2, #0
	str	r3, [r7, #8]
	bne	.L110
	ldr	r3, .L133+8
	ldr	r3, [r3, #24]
	cmp	r3, #0
	beq	.L110
	ldr	r0, .L133+28
	bl	fireEnemyBullet
	b	.L110
.L107:
	rsb	r0, r0, #0
	cmp	r1, #0
	str	r0, [r5, #8]
	beq	.L108
	ldr	r0, .L133+32
	bl	fireEnemyBullet
	ldr	r3, [r7, #0]
	b	.L108
.L130:
	ldr	ip, [r4, #-28]
	str	ip, [sp, #0]
	ldr	ip, [r4, #-24]
	str	ip, [sp, #4]
	ldr	lr, [r4, #-8]
	str	lr, [sp, #8]
	ldr	ip, [r4, #-12]
	ldr	r0, [sl, #0]
	str	ip, [sp, #12]
	ldr	r1, [sl, #4]
	ldr	r2, [sl, #20]
	ldr	r3, [sl, #16]
	ldr	ip, .L133+36
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	bne	.L115
	ldr	r3, [r8, #28]
	cmp	r3, #0
	beq	.L121
	ldr	r3, [r7, #24]
	cmp	r3, #0
	beq	.L119
.L131:
	ldr	lr, [r4, #-28]
	str	lr, [sp, #0]
	ldr	lr, [r4, #-24]
	str	lr, [sp, #4]
	ldr	ip, [r4, #-8]
	str	ip, [sp, #8]
	ldr	lr, [r4, #-12]
	ldmia	r9, {r0, r1}	@ phole ldm
	ldr	r2, [r9, #20]
	ldr	r3, [r9, #16]
	str	lr, [sp, #12]
	ldr	ip, .L133+36
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	bne	.L120
	ldr	r3, [r8, #28]
	cmp	r3, #0
	beq	.L121
	ldr	r3, [r6, #24]
	cmp	r3, #0
	beq	.L121
.L132:
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
	ldr	ip, .L133+36
	str	lr, [sp, #12]
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L121
	mov	r1, #2064
	mov	r2, #11008
	add	r1, r1, #4
	add	r2, r2, #17
	mov	r3, #0
	ldr	ip, .L133+40
	ldr	r0, .L133+44
	mov	lr, pc
	bx	ip
	ldr	r1, .L133+48
	ldr	ip, .L133+52
	ldr	r3, [r1, #0]
	ldr	r2, [ip, #60]
	add	r3, r3, #10
	cmp	r2, #0
	str	r3, [r1, #0]
	ldreq	r3, [fp, #36]
	ldrne	r3, [fp, #36]
	mov	r2, #0
	subeq	r3, r3, #1
	subne	r3, r3, #3
	streq	r3, [fp, #36]
	strne	r3, [fp, #36]
	cmp	r3, r2
	str	r2, [r8, #28]
	strle	r2, [r6, #24]
	b	.L121
.L120:
	mov	r1, #2064
	mov	r2, #11008
	add	r1, r1, #4
	add	r2, r2, #17
	mov	r3, #0
	ldr	ip, .L133+40
	ldr	r0, .L133+44
	mov	lr, pc
	bx	ip
	ldr	r1, .L133+48
	ldr	ip, .L133+52
	ldr	r3, [r1, #0]
	ldr	r2, [ip, #60]
	add	r3, r3, #10
	cmp	r2, #0
	str	r3, [r1, #0]
	ldreq	r3, [r9, #36]
	ldrne	r3, [r9, #36]
	mov	r2, #0
	subeq	r3, r3, #1
	subne	r3, r3, #3
	streq	r3, [r9, #36]
	strne	r3, [r9, #36]
	cmp	r3, r2
	str	r2, [r8, #28]
	strle	r2, [r7, #24]
	b	.L121
.L115:
	mov	r1, #2064
	mov	r2, #11008
	add	r1, r1, #4
	add	r2, r2, #17
	mov	r3, #0
	ldr	ip, .L133+40
	ldr	r0, .L133+44
	mov	lr, pc
	bx	ip
	ldr	r1, .L133+48
	ldr	ip, .L133+52
	ldr	r3, [r1, #0]
	ldr	r2, [ip, #60]
	add	r3, r3, #10
	cmp	r2, #0
	str	r3, [r1, #0]
	ldreq	r3, [sl, #36]
	ldrne	r3, [sl, #36]
	mov	r2, #0
	subeq	r3, r3, #1
	subne	r3, r3, #3
	streq	r3, [sl, #36]
	strne	r3, [sl, #36]
	cmp	r3, r2
	str	r2, [r8, #28]
	strle	r2, [r5, #24]
	b	.L121
.L134:
	.align	2
.L133:
	.word	ladel
	.word	mitt
	.word	spatula
	.word	shadowOAM
	.word	bullets+28
	.word	bullets+100
	.word	bullet3
	.word	bullet2
	.word	bullet1
	.word	collision
	.word	playSoundB
	.word	hit
	.word	score
	.word	player
	.size	updateEnemies, .-updateEnemies
	.align	2
	.global	update
	.type	update, %function
update:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	bl	updatePlayer
	ldr	r0, .L137
	bl	updateBullet
	ldr	r0, .L137+4
	bl	updateBullet
	ldr	r0, .L137+8
	bl	updateBullet
	ldr	r0, .L137+12
	bl	updateBullet
	ldr	r0, .L137+16
	bl	updateBullet
	bl	updateEnemies
	ldr	r3, .L137+20
	ldr	r3, [r3, #0]
	cmp	r3, #0
	ldreq	r3, .L137+24
	moveq	lr, pc
	bxeq	r3
.L135:
	ldmfd	sp!, {r3, lr}
	bx	lr
.L138:
	.align	2
.L137:
	.word	bullets
	.word	bullets+36
	.word	bullet1
	.word	bullet2
	.word	bullet3
	.word	lives
	.word	goToLose
	.size	update, .-update
	.align	2
	.global	initializeEnemyBullets
	.type	initializeEnemyBullets, %function
initializeEnemyBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L140
	stmfd	sp!, {r4, r5, r6, r7, r8, sl}
	ldr	sl, [r3, #4]
	ldr	r3, .L140+4
	ldr	r8, [r3, #4]
	ldr	r3, .L140+8
	ldr	r0, .L140+12
	ldr	r1, .L140+16
	ldr	r7, [r3, #4]
	sub	sl, sl, #8
	ldr	r3, .L140+20
	mov	r2, #0
	mov	ip, #3
	mov	r4, #8
	mov	r6, #1
	str	sl, [r0, #4]
	mov	sl, #10
	mov	r5, #2
	str	r2, [r0, #0]
	str	r2, [r0, #8]
	str	r2, [r0, #28]
	sub	r8, r8, #8
	sub	r7, r7, #8
	str	ip, [r0, #20]
	str	r4, [r0, #16]
	str	r6, [r0, #12]
	str	sl, [r0, #24]
	str	r6, [r0, #32]
	str	r2, [r1, #0]
	str	r2, [r1, #8]
	str	r2, [r1, #28]
	mov	r0, #11
	str	r2, [r3, #0]
	str	r2, [r3, #8]
	str	r2, [r3, #28]
	mov	r2, #12
	str	ip, [r1, #20]
	str	r4, [r1, #16]
	str	r8, [r1, #4]
	str	r5, [r1, #12]
	str	r0, [r1, #24]
	str	r5, [r1, #32]
	str	ip, [r3, #20]
	str	r4, [r3, #16]
	str	r7, [r3, #4]
	str	ip, [r3, #12]
	str	r2, [r3, #24]
	str	ip, [r3, #32]
	ldmfd	sp!, {r4, r5, r6, r7, r8, sl}
	bx	lr
.L141:
	.align	2
.L140:
	.word	ladel
	.word	spatula
	.word	mitt
	.word	bullet1
	.word	bullet2
	.word	bullet3
	.size	initializeEnemyBullets, .-initializeEnemyBullets
	.align	2
	.global	initialize
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L143
	mov	r3, #0
	stmfd	sp!, {r4, lr}
	str	r3, [r2, #0]
	ldr	r2, .L143+4
	str	r3, [r2, #0]
	ldr	r2, .L143+8
	mov	r1, #3
	str	r1, [r2, #0]
	ldr	r2, .L143+12
	str	r3, [r2, #0]
	bl	initializePlayer
	bl	initializeBullets
	bl	initializeEnemies
	ldmfd	sp!, {r4, lr}
	b	initializeEnemyBullets
.L144:
	.align	2
.L143:
	.word	hOff
	.word	score
	.word	lives
	.word	gravCount
	.size	initialize, .-initialize
	.align	2
	.global	hideSprites
	.type	hideSprites, %function
hideSprites:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L148
	mov	r3, #0
.L146:
	mov	r1, #512	@ movhi
	strh	r1, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L146
	bx	lr
.L149:
	.align	2
.L148:
	.word	shadowOAM
	.size	hideSprites, .-hideSprites
	.align	2
	.global	drawNumber
	.type	drawNumber, %function
drawNumber:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r2, #9
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
	mov	r4, r2
	mov	r8, r0
	mov	r6, r1
	mov	r7, r3
	ble	.L162
	ldr	sl, .L175
.L164:
	smull	r3, r5, sl, r4
	mov	r3, r4, asr #31
	rsb	r5, r3, r5, asr #2
	mov	r2, r5
	add	r5, r5, r5, asl #2
	mov	r1, r6
	mov	r3, r7
	mov	r0, r8
	sub	r4, r4, r5, asl #1
	bl	drawNumber
	cmp	r4, #9
	add	r6, r6, #8
	add	r7, r7, #1
	bgt	.L164
.L162:
	cmp	r4, #0
	beq	.L166
	cmp	r4, #1
	beq	.L167
	cmp	r4, #2
	beq	.L168
	cmp	r4, #3
	beq	.L169
	cmp	r4, #4
	beq	.L170
	cmp	r4, #5
	beq	.L171
	cmp	r4, #6
	beq	.L172
	cmp	r4, #7
	beq	.L173
	cmp	r4, #8
	beq	.L174
	cmp	r4, #9
	bne	.L150
	ldr	r1, .L175+4
	mov	r7, r7, asl #3
	mov	r3, #396
	b	.L165
.L166:
	ldr	r1, .L175+4
	mov	r7, r7, asl #3
	mov	r3, #324
.L165:
	add	r2, r1, r7
	orr	r6, r6, #16384
	add	r3, r3, #2
	strh	r8, [r1, r7]	@ movhi
	strh	r6, [r2, #2]	@ movhi
	strh	r3, [r2, #4]	@ movhi
.L150:
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
	bx	lr
.L167:
	ldr	r2, .L175+4
	mov	r7, r7, asl #3
	add	r3, r2, r7
	orr	r6, r6, #16384
	strh	r8, [r2, r7]	@ movhi
	mov	r2, #328	@ movhi
	strh	r6, [r3, #2]	@ movhi
	strh	r2, [r3, #4]	@ movhi
	b	.L150
.L168:
	ldr	r1, .L175+4
	mov	r7, r7, asl #3
	mov	r3, #328
	add	r2, r1, r7
	orr	r6, r6, #16384
	add	r3, r3, #2
	strh	r8, [r1, r7]	@ movhi
	strh	r6, [r2, r4]	@ movhi
	strh	r3, [r2, #4]	@ movhi
	b	.L150
.L169:
	ldr	r2, .L175+4
	mov	r7, r7, asl #3
	add	r3, r2, r7
	orr	r6, r6, #16384
	strh	r8, [r2, r7]	@ movhi
	mov	r2, #332	@ movhi
	strh	r6, [r3, #2]	@ movhi
	strh	r2, [r3, #4]	@ movhi
	b	.L150
.L170:
	ldr	r1, .L175+4
	mov	r7, r7, asl #3
	mov	r3, #332
	add	r2, r1, r7
	orr	r6, r6, #16384
	add	r3, r3, #2
	strh	r8, [r1, r7]	@ movhi
	strh	r6, [r2, #2]	@ movhi
	strh	r3, [r2, r4]	@ movhi
	b	.L150
.L171:
	ldr	r1, .L175+4
	mov	r7, r7, asl #3
	mov	r3, #388
	b	.L165
.L172:
	ldr	r2, .L175+4
	mov	r7, r7, asl #3
	add	r3, r2, r7
	orr	r6, r6, #16384
	strh	r8, [r2, r7]	@ movhi
	mov	r2, #392	@ movhi
	strh	r6, [r3, #2]	@ movhi
	strh	r2, [r3, #4]	@ movhi
	b	.L150
.L173:
	ldr	r1, .L175+4
	mov	r7, r7, asl #3
	mov	r3, #392
	b	.L165
.L174:
	ldr	r2, .L175+4
	mov	r7, r7, asl #3
	add	r3, r2, r7
	orr	r6, r6, #16384
	strh	r8, [r2, r7]	@ movhi
	mov	r2, #396	@ movhi
	strh	r6, [r3, #2]	@ movhi
	strh	r2, [r3, #4]	@ movhi
	b	.L150
.L176:
	.align	2
.L175:
	.word	1717986919
	.word	shadowOAM
	.size	drawNumber, .-drawNumber
	.align	2
	.global	draw
	.type	draw, %function
draw:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L178
	bl	drawPlayer
	mov	r0, r4
	bl	drawBullet
	add	r0, r4, #36
	bl	drawBullet
	ldr	r0, .L178+4
	bl	drawBullet
	ldr	r0, .L178+8
	bl	drawBullet
	ldr	r0, .L178+12
	bl	drawBullet
	bl	drawEnemies
	ldr	r3, .L178+16
	mov	r0, #0
	ldr	r2, [r3, #0]
	mov	r1, #40
	mov	r3, #50
	bl	drawNumber
	ldr	r3, .L178+20
	mov	r0, #0
	ldr	r2, [r3, #0]
	mov	r1, #175
	mov	r3, #51
	bl	drawNumber
	mov	r0, #3
	ldr	r1, .L178+24
	mov	r2, #117440512
	mov	r3, #512
	ldr	ip, .L178+28
	mov	lr, pc
	bx	ip
	ldmfd	sp!, {r4, lr}
	bx	lr
.L179:
	.align	2
.L178:
	.word	bullets
	.word	bullet1
	.word	bullet2
	.word	bullet3
	.word	lives
	.word	score
	.word	shadowOAM
	.word	DMANow
	.size	draw, .-draw
	.comm	shadowOAM,1024,4
	.comm	gamesLost,4,4
	.comm	player,64,4
	.comm	bullets,72,4
	.comm	knives,160,4
	.comm	ladel,40,4
	.comm	spatula,40,4
	.comm	mitt,40,4
	.comm	lives,4,4
	.comm	score,4,4
	.comm	bullet1,36,4
	.comm	bullet2,36,4
	.comm	bullet3,36,4
	.comm	gravCount,4,4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
