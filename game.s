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
	ldr	r4, .L100
	sub	sp, sp, #20
	ldr	r3, [r4, #56]
	cmp	r3, #17
	movgt	r3, #14
	strgt	r3, [r4, #56]
	ldr	r8, .L100+4
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r2, [r3, #48]
	ldr	r1, [r8, #0]
	tst	r2, #32
	add	r3, r1, #1
	str	r3, [r8, #0]
	bne	.L87
	ldr	r3, [r4, #12]
	cmp	r3, #4
	ldr	r2, .L100
	bgt	.L80
.L87:
	ldr	sl, .L100+8
.L49:
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L89
	ldr	r3, [r4, #12]
	ldr	r2, [r4, #24]
	ldr	r1, [sl, #0]
	add	ip, r2, r3
	rsb	r0, r1, #508
	cmp	ip, r0
	blt	.L83
.L89:
	ldr	r5, .L100+12
	ldr	r6, .L100+16
	ldr	r7, .L100+20
.L53:
	ldr	r9, .L100+24
	ldrh	r2, [r9, #0]
	tst	r2, #1
	beq	.L58
	ldr	r3, .L100+28
	ldrh	fp, [r3, #0]
	ands	fp, fp, #1
	beq	.L91
.L58:
	tst	r2, #4
	beq	.L59
	ldr	r3, .L100+28
	ldrh	r3, [r3, #0]
	ands	r1, r3, #4
	beq	.L92
.L59:
	tst	r2, #2
	beq	.L90
	ldr	r3, .L100+28
	ldrh	r3, [r3, #0]
	tst	r3, #2
	beq	.L63
.L90:
	ldr	ip, [r4, #8]
.L62:
	cmp	ip, #124
	bgt	.L64
	ldr	r3, [r8, #0]
	ldr	r2, .L100+32
	smull	r1, r2, r3, r2
	sub	r2, r2, r3, asr #31
	add	r2, r2, r2, asl #1
	cmp	r3, r2
	beq	.L93
.L64:
	ldr	r8, [r4, #24]
	ldr	r2, [sl, #0]
	rsb	r3, r8, #436
	ldr	lr, [r4, #12]
	add	r3, r3, #3
	rsb	r3, r2, r3
	ldr	fp, .L100
	cmp	lr, r3
	ldrle	r9, [fp, #28]
	ble	.L66
	ldr	r9, [fp, #28]
	add	r3, ip, r9
	cmp	r3, #121
	ble	.L94
.L66:
	ldmia	r5, {r0, r1}	@ phole ldm
	ldr	r2, [r5, #20]
	ldr	r3, [r5, #16]
	ldr	r5, .L100+36
	stmia	sp, {ip, lr}	@ phole stm
	str	r9, [sp, #8]
	str	r8, [sp, #12]
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L67
	ldr	r3, .L100+12
	ldr	r3, [r3, #24]
	cmp	r3, #0
	bne	.L95
.L67:
	ldmia	r6, {r0, r1}	@ phole ldm
	ldr	r2, [r6, #20]
	ldr	r3, [r6, #16]
	ldr	lr, [r4, #8]
	ldr	ip, [r4, #12]
	ldr	r6, [r4, #28]
	ldr	r8, [r4, #24]
	str	lr, [sp, #0]
	str	ip, [sp, #4]
	str	r6, [sp, #8]
	str	r8, [sp, #12]
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L68
	ldr	r3, .L100+16
	ldr	r3, [r3, #24]
	cmp	r3, #0
	bne	.L96
.L68:
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
	beq	.L69
	ldr	r3, .L100+20
	ldr	r3, [r3, #24]
	cmp	r3, #0
	bne	.L97
.L69:
	ldr	r3, [r4, #52]
	ldr	r0, [r4, #12]
	ldr	r2, [sl, #0]
	ldr	r1, [r4, #8]
	rsb	r2, r2, r0
	add	r3, r3, #1
	stmia	r4, {r1, r2}	@ phole stm
	str	r3, [r4, #52]
	add	sp, sp, #20
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L94:
	ldr	r3, [fp, #16]
	cmp	r3, #2
	ble	.L66
	ldr	r3, .L100+40
	mov	lr, pc
	bx	r3
	add	ip, fp, #8
	ldmia	ip, {ip, lr}	@ phole ldm
	add	r8, fp, #24
	ldmia	r8, {r8, r9}	@ phole ldm
	b	.L66
.L93:
	ldr	r3, [r4, #16]
	ldr	r2, [r4, #32]
	add	r3, r2, r3
	rsb	ip, r3, ip
	str	r3, [r4, #16]
	str	ip, [r4, #8]
	b	.L64
.L63:
	ldr	ip, [r4, #8]
	ldr	r3, .L100
	cmp	ip, #125
	ldreq	r2, [r3, #32]
	addeq	r2, r2, #9
	rsbeq	ip, r2, #125
	streq	r2, [r3, #16]
	streq	ip, [r3, #8]
	b	.L62
.L92:
	ldr	r3, [r4, #60]
	ldr	ip, .L100
	cmp	r3, #0
	strne	r1, [ip, #60]
	bne	.L59
	mov	lr, #1
	mov	r1, #16064
	mov	r2, #11008
	add	r2, r2, #17
	str	lr, [ip, #60]
	ldr	r0, .L100+44
	add	r1, r1, #42
	ldr	ip, .L100+48
	mov	lr, pc
	bx	ip
	ldrh	r2, [r9, #0]
	b	.L59
.L91:
	ldr	r3, [r4, #52]
	cmp	r3, #15
	ble	.L58
	bl	fireBullet
	mov	r1, #2288
	mov	r2, #11008
	add	r2, r2, #17
	mov	r3, fp
	ldr	r0, .L100+52
	add	r1, r1, #11
	ldr	ip, .L100+48
	mov	lr, pc
	bx	ip
	ldr	r3, .L100
	ldrh	r2, [r9, #0]
	str	fp, [r3, #52]
	b	.L58
.L83:
	rsb	r0, r2, #120
	cmp	r3, r0
	bge	.L98
.L54:
	add	r3, r3, #1
	str	r3, [r4, #12]
	ldr	r5, .L100+12
	ldr	r6, .L100+16
	ldr	r7, .L100+20
.L56:
	ldr	r3, [r4, #56]
	add	r3, r3, #1
	str	r3, [r4, #56]
	b	.L53
.L80:
	ldr	r1, [r2, #24]
	rsb	r0, r1, #120
	cmp	r3, r0
	ldrlt	sl, .L100+8
	blt	.L50
	ldr	sl, .L100+8
	ldr	r0, [sl, #0]
	rsb	ip, r1, #392
	add	lr, r0, r3
	cmp	lr, ip
	bge	.L50
	cmp	r0, #0
	bne	.L51
.L50:
	sub	r3, r3, #1
	str	r3, [r4, #12]
.L52:
	ldr	r3, [r4, #56]
	add	r3, r3, #1
	str	r3, [r4, #56]
	b	.L49
.L97:
	ldr	r3, .L100+56
	mov	lr, pc
	bx	r3
	b	.L69
.L96:
	ldr	r3, .L100+56
	mov	lr, pc
	bx	r3
	b	.L68
.L95:
	ldr	r3, .L100+56
	mov	lr, pc
	bx	r3
	b	.L67
.L98:
	rsb	r2, r2, #392
	add	ip, r1, r3
	cmp	ip, r2
	bge	.L54
	cmp	r3, r0
	ble	.L99
.L57:
	cmp	r1, #272
	bge	.L88
	ldr	r5, .L100+12
	ldr	r3, [r5, #24]
	cmp	r3, #0
	beq	.L85
	ldr	r6, .L100+16
	ldr	r7, .L100+20
	b	.L56
.L51:
	add	r1, r1, r1, lsr #31
	ldr	r3, [r2, #4]
	mov	r1, r1, asr #1
	rsb	r2, r1, #119
	cmp	r2, r3
	blt	.L52
	cmp	r0, #0
	subgt	r0, r0, #1
	strgt	r0, [sl, #0]
	b	.L52
.L99:
	cmp	r3, r2
	blt	.L57
.L88:
	ldr	r5, .L100+12
	ldr	r6, .L100+16
	ldr	r7, .L100+20
	b	.L56
.L85:
	ldr	r6, .L100+16
	ldr	r3, [r6, #24]
	cmp	r3, #0
	ldrne	r7, .L100+20
	bne	.L56
	ldr	r7, .L100+20
	ldr	r3, [r7, #24]
	cmp	r3, #0
	addeq	r1, r1, #1
	streq	r1, [sl, #0]
	b	.L56
.L101:
	.align	2
.L100:
	.word	player
	.word	gravCount
	.word	hOff
	.word	ladel
	.word	spatula
	.word	mitt
	.word	oldButtons
	.word	buttons
	.word	1431655766
	.word	collision
	.word	goToWin
	.word	gudetama
	.word	playSoundB
	.word	shoot
	.word	goToLose
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
	bne	.L102
	ldr	r3, [r0, #32]
	cmp	r3, #1
	beq	.L108
	cmp	r3, #2
	beq	.L105
	cmp	r3, #3
	beq	.L106
.L102:
	ldmfd	sp!, {r4}
	bx	lr
.L106:
	ldr	r3, .L109
.L107:
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
	b	.L102
.L108:
	ldr	r2, .L109+4
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
	b	.L102
.L105:
	ldr	r3, .L109+8
	b	.L107
.L110:
	.align	2
.L109:
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
	ldr	r5, .L141
	ldr	r6, .L141+4
	sub	sp, sp, #28
	ldr	r4, [r6, #8]
	ldr	ip, [r6, #0]
	ldr	r1, [r5, #24]
	ldr	r7, .L141+8
	add	ip, r4, ip
	cmp	r1, #0
	ldr	r8, [r7, #8]
	str	ip, [r6, #0]
	ldr	r3, [r7, #0]
	ldreq	ip, [r5, #28]
	ldreq	r4, .L141+12
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
	bne	.L113
	ldr	ip, .L141+8
	ldr	ip, [ip, #28]
	ldr	r4, .L141+12
	mov	ip, ip, asl #3
	mov	r8, #512	@ movhi
	strh	r8, [r4, ip]	@ movhi
.L113:
	ldr	ip, [r6, #24]
	cmp	ip, #0
	bne	.L114
	ldr	ip, .L141+4
	ldr	ip, [ip, #28]
	ldr	r4, .L141+12
	mov	ip, ip, asl #3
	mov	r8, #512	@ movhi
	strh	r8, [r4, ip]	@ movhi
.L114:
	ldr	ip, [r5, #20]
	rsb	ip, ip, #156
	cmp	r2, ip
	bgt	.L115
	cmp	r2, #45
	ble	.L115
.L116:
	ldr	r2, [r7, #20]
	rsb	r2, r2, #156
	cmp	r2, r3
	blt	.L117
	cmp	r3, #43
	ble	.L117
.L118:
	ldr	r2, [r6, #20]
	ldr	r3, [r6, #0]
	rsb	r2, r2, #156
	cmp	r3, r2
	bgt	.L119
	cmp	r3, #45
	ble	.L119
.L120:
	ldr	r4, .L141+16
	ldr	sl, .L141
	ldr	r9, .L141+8
	ldr	fp, .L141+4
	sub	r8, r4, #28
.L134:
	ldr	r3, [r8, #28]
	cmp	r3, #0
	beq	.L129
	ldr	r3, [r5, #24]
	cmp	r3, #0
	bne	.L138
	ldr	r3, [r7, #24]
	cmp	r3, #0
	bne	.L139
.L127:
	ldr	r3, [r6, #24]
	cmp	r3, #0
	bne	.L140
.L129:
	ldr	r1, .L141+20
	add	r4, r4, #36
	cmp	r4, r1
	add	r8, r8, #36
	bne	.L134
	add	sp, sp, #28
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L119:
	ldr	r3, [r6, #8]
	ldr	r2, [r5, #24]
	rsb	r3, r3, #0
	cmp	r2, #0
	str	r3, [r6, #8]
	bne	.L120
	ldr	r3, [r7, #24]
	cmp	r3, #0
	bne	.L120
	ldr	r3, .L141+4
	ldr	r3, [r3, #24]
	cmp	r3, #0
	beq	.L120
	ldr	r0, .L141+24
	bl	fireEnemyBullet
	b	.L120
.L117:
	ldr	r3, [r7, #8]
	ldr	r2, [r5, #24]
	rsb	r3, r3, #0
	cmp	r2, #0
	str	r3, [r7, #8]
	bne	.L118
	ldr	r3, .L141+8
	ldr	r3, [r3, #24]
	cmp	r3, #0
	beq	.L118
	ldr	r0, .L141+28
	bl	fireEnemyBullet
	b	.L118
.L115:
	rsb	r0, r0, #0
	cmp	r1, #0
	str	r0, [r5, #8]
	beq	.L116
	ldr	r0, .L141+32
	bl	fireEnemyBullet
	ldr	r3, [r7, #0]
	b	.L116
.L138:
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
	ldr	ip, .L141+36
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	bne	.L123
	ldr	r3, [r8, #28]
	cmp	r3, #0
	beq	.L129
	ldr	r3, [r7, #24]
	cmp	r3, #0
	beq	.L127
.L139:
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
	ldr	ip, .L141+36
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	bne	.L128
	ldr	r3, [r8, #28]
	cmp	r3, #0
	beq	.L129
	ldr	r3, [r6, #24]
	cmp	r3, #0
	beq	.L129
.L140:
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
	ldr	ip, .L141+36
	str	lr, [sp, #12]
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L129
	mov	r1, #2064
	mov	r2, #11008
	add	r1, r1, #4
	add	r2, r2, #17
	mov	r3, #0
	ldr	ip, .L141+40
	ldr	r0, .L141+44
	mov	lr, pc
	bx	ip
	ldr	r1, .L141+48
	ldr	ip, .L141+52
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
	b	.L129
.L128:
	mov	r1, #2064
	mov	r2, #11008
	add	r1, r1, #4
	add	r2, r2, #17
	mov	r3, #0
	ldr	ip, .L141+40
	ldr	r0, .L141+44
	mov	lr, pc
	bx	ip
	ldr	r1, .L141+48
	ldr	ip, .L141+52
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
	b	.L129
.L123:
	mov	r1, #2064
	mov	r2, #11008
	add	r1, r1, #4
	add	r2, r2, #17
	mov	r3, #0
	ldr	ip, .L141+40
	ldr	r0, .L141+44
	mov	lr, pc
	bx	ip
	ldr	r1, .L141+48
	ldr	ip, .L141+52
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
	b	.L129
.L142:
	.align	2
.L141:
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
	ldr	r0, .L145
	bl	updateBullet
	ldr	r0, .L145+4
	bl	updateBullet
	ldr	r0, .L145+8
	bl	updateBullet
	ldr	r0, .L145+12
	bl	updateBullet
	ldr	r0, .L145+16
	bl	updateBullet
	bl	updateEnemies
	ldr	r3, .L145+20
	ldr	r3, [r3, #0]
	cmp	r3, #0
	ldreq	r3, .L145+24
	moveq	lr, pc
	bxeq	r3
.L143:
	ldmfd	sp!, {r3, lr}
	bx	lr
.L146:
	.align	2
.L145:
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
	ldr	r3, .L148
	stmfd	sp!, {r4, r5, r6, r7, r8, sl}
	ldr	sl, [r3, #4]
	ldr	r3, .L148+4
	ldr	r8, [r3, #4]
	ldr	r3, .L148+8
	ldr	r0, .L148+12
	ldr	r1, .L148+16
	ldr	r7, [r3, #4]
	sub	sl, sl, #8
	ldr	r3, .L148+20
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
.L149:
	.align	2
.L148:
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
	ldr	r2, .L151
	mov	r3, #0
	stmfd	sp!, {r4, lr}
	str	r3, [r2, #0]
	ldr	r2, .L151+4
	str	r3, [r2, #0]
	ldr	r2, .L151+8
	mov	r1, #3
	str	r1, [r2, #0]
	ldr	r2, .L151+12
	str	r3, [r2, #0]
	bl	initializePlayer
	bl	initializeBullets
	bl	initializeEnemies
	ldmfd	sp!, {r4, lr}
	b	initializeEnemyBullets
.L152:
	.align	2
.L151:
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
	ldr	r2, .L156
	mov	r3, #0
.L154:
	mov	r1, #512	@ movhi
	strh	r1, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L154
	bx	lr
.L157:
	.align	2
.L156:
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
	ble	.L170
	ldr	sl, .L183
.L172:
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
	bgt	.L172
.L170:
	cmp	r4, #0
	beq	.L174
	cmp	r4, #1
	beq	.L175
	cmp	r4, #2
	beq	.L176
	cmp	r4, #3
	beq	.L177
	cmp	r4, #4
	beq	.L178
	cmp	r4, #5
	beq	.L179
	cmp	r4, #6
	beq	.L180
	cmp	r4, #7
	beq	.L181
	cmp	r4, #8
	beq	.L182
	cmp	r4, #9
	bne	.L158
	ldr	r1, .L183+4
	mov	r7, r7, asl #3
	mov	r3, #396
	b	.L173
.L174:
	ldr	r1, .L183+4
	mov	r7, r7, asl #3
	mov	r3, #324
.L173:
	add	r2, r1, r7
	orr	r6, r6, #16384
	add	r3, r3, #2
	strh	r8, [r1, r7]	@ movhi
	strh	r6, [r2, #2]	@ movhi
	strh	r3, [r2, #4]	@ movhi
.L158:
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
	bx	lr
.L175:
	ldr	r2, .L183+4
	mov	r7, r7, asl #3
	add	r3, r2, r7
	orr	r6, r6, #16384
	strh	r8, [r2, r7]	@ movhi
	mov	r2, #328	@ movhi
	strh	r6, [r3, #2]	@ movhi
	strh	r2, [r3, #4]	@ movhi
	b	.L158
.L176:
	ldr	r1, .L183+4
	mov	r7, r7, asl #3
	mov	r3, #328
	add	r2, r1, r7
	orr	r6, r6, #16384
	add	r3, r3, #2
	strh	r8, [r1, r7]	@ movhi
	strh	r6, [r2, r4]	@ movhi
	strh	r3, [r2, #4]	@ movhi
	b	.L158
.L177:
	ldr	r2, .L183+4
	mov	r7, r7, asl #3
	add	r3, r2, r7
	orr	r6, r6, #16384
	strh	r8, [r2, r7]	@ movhi
	mov	r2, #332	@ movhi
	strh	r6, [r3, #2]	@ movhi
	strh	r2, [r3, #4]	@ movhi
	b	.L158
.L178:
	ldr	r1, .L183+4
	mov	r7, r7, asl #3
	mov	r3, #332
	add	r2, r1, r7
	orr	r6, r6, #16384
	add	r3, r3, #2
	strh	r8, [r1, r7]	@ movhi
	strh	r6, [r2, #2]	@ movhi
	strh	r3, [r2, r4]	@ movhi
	b	.L158
.L179:
	ldr	r1, .L183+4
	mov	r7, r7, asl #3
	mov	r3, #388
	b	.L173
.L180:
	ldr	r2, .L183+4
	mov	r7, r7, asl #3
	add	r3, r2, r7
	orr	r6, r6, #16384
	strh	r8, [r2, r7]	@ movhi
	mov	r2, #392	@ movhi
	strh	r6, [r3, #2]	@ movhi
	strh	r2, [r3, #4]	@ movhi
	b	.L158
.L181:
	ldr	r1, .L183+4
	mov	r7, r7, asl #3
	mov	r3, #392
	b	.L173
.L182:
	ldr	r2, .L183+4
	mov	r7, r7, asl #3
	add	r3, r2, r7
	orr	r6, r6, #16384
	strh	r8, [r2, r7]	@ movhi
	mov	r2, #396	@ movhi
	strh	r6, [r3, #2]	@ movhi
	strh	r2, [r3, #4]	@ movhi
	b	.L158
.L184:
	.align	2
.L183:
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
	ldr	r4, .L186
	bl	drawPlayer
	mov	r0, r4
	bl	drawBullet
	add	r0, r4, #36
	bl	drawBullet
	ldr	r0, .L186+4
	bl	drawBullet
	ldr	r0, .L186+8
	bl	drawBullet
	ldr	r0, .L186+12
	bl	drawBullet
	bl	drawEnemies
	ldr	r3, .L186+16
	mov	r0, #0
	ldr	r2, [r3, #0]
	mov	r1, #40
	mov	r3, #50
	bl	drawNumber
	ldr	r3, .L186+20
	mov	r0, #0
	ldr	r2, [r3, #0]
	mov	r1, #175
	mov	r3, #51
	bl	drawNumber
	mov	r0, #3
	ldr	r1, .L186+24
	mov	r2, #117440512
	mov	r3, #512
	ldr	ip, .L186+28
	mov	lr, pc
	bx	ip
	ldmfd	sp!, {r4, lr}
	bx	lr
.L187:
	.align	2
.L186:
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
