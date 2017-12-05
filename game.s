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
	.global	initializePlayer
	.type	initializePlayer, %function
initializePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L2
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
.L3:
	.align	2
.L2:
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
	ldr	r3, .L5
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
.L6:
	.align	2
.L5:
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
	ldr	r3, .L12
	ldr	r2, [r3, #60]
	cmp	r2, #0
	bne	.L11
	ldr	r2, [r3, #56]
	mov	r1, r2, lsr #31
	add	r2, r2, r1
	ldr	r0, [r3, #12]
	and	ip, r2, #1
	mvn	r0, r0, asl #17
	ldr	r2, .L12+4
	rsb	r1, r1, ip
	ldrh	r3, [r3, #8]
	mvn	r0, r0, lsr #17
	mov	r1, r1, asl #7
	strh	r0, [r2, #2]	@ movhi
	strh	r1, [r2, #4]	@ movhi
	strh	r3, [r2, #0]	@ movhi
	bx	lr
.L11:
	ldr	r1, [r3, #56]
	mov	r2, r1, lsr #31
	add	r1, r1, r2
	ldr	r0, [r3, #12]
	and	r1, r1, #1
	rsb	r1, r2, r1
	mvn	r0, r0, asl #17
	ldr	r2, .L12+4
	mov	r1, r1, asl #7
	ldrh	r3, [r3, #8]
	mvn	r0, r0, lsr #17
	add	r1, r1, #16
	strh	r3, [r2, #0]	@ movhi
	strh	r0, [r2, #2]	@ movhi
	strh	r1, [r2, #4]	@ movhi
	bx	lr
.L13:
	.align	2
.L12:
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
	beq	.L15
	ldr	r3, [r0, #32]
	cmp	r3, #0
	beq	.L18
	sub	r3, r3, #1
	cmp	r3, #2
	bxhi	lr
	ldr	r2, [r0, #24]
	ldrh	ip, [r0, #0]
	ldr	r1, .L19
	mov	r2, r2, asl #3
	ldrh	r0, [r0, #4]
	add	r3, r1, r2
	strh	ip, [r1, r2]	@ movhi
	mov	r1, #36	@ movhi
	strh	r0, [r3, #2]	@ movhi
	strh	r1, [r3, #4]	@ movhi
	bx	lr
.L15:
	ldr	r3, [r0, #24]
	ldr	r2, .L19
	mov	r3, r3, asl #3
	mov	ip, #512	@ movhi
	strh	ip, [r2, r3]	@ movhi
	bx	lr
.L18:
	ldr	r2, [r0, #24]
	ldrh	ip, [r0, #0]
	ldr	r1, .L19
	mov	r2, r2, asl #3
	ldrh	r0, [r0, #4]
	add	r3, r1, r2
	strh	ip, [r1, r2]	@ movhi
	mov	r1, #4	@ movhi
	strh	r0, [r3, #2]	@ movhi
	strh	r1, [r3, #4]	@ movhi
	bx	lr
.L20:
	.align	2
.L19:
	.word	shadowOAM
	.size	drawBullet, .-drawBullet
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
	beq	.L21
	ldr	r0, [r0, #0]
	ldr	r2, [r4, #20]
	add	r3, r2, r0
	cmp	r3, #0
	ble	.L23
	ldr	r3, .L29
	ldr	ip, [r4, #12]
	ldr	r1, [r4, #4]
	ldr	r3, [r3, #24]
	add	r1, ip, r1
	cmp	r3, r1
	bgt	.L23
	rsb	r3, r3, #504
	cmp	r1, r3
	blt	.L26
.L23:
	ldr	r3, [r4, #32]
.L25:
	sub	r3, r3, #1
	cmp	r3, #2
	bhi	.L27
	ldr	ip, [r4, #4]
	ldr	r1, [r4, #12]
	add	r3, r1, ip
	cmp	r3, #4
	bgt	.L28
.L27:
	mov	r3, #0
	str	r3, [r4, #28]
.L21:
	add	sp, sp, #20
	ldmfd	sp!, {r4, r5, r6, r7, lr}
	bx	lr
.L26:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	bne	.L25
	ldr	r3, [r4, #8]
	add	r0, r3, r0
	stmia	r4, {r0, r1}	@ phole stm
	b	.L21
.L28:
	ldr	lr, [r4, #8]
	ldr	r5, .L29
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
	ldr	ip, .L29+4
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L21
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L21
	ldr	r3, [r5, #60]
	cmp	r3, #0
	bne	.L21
	ldr	r1, .L29+8
	ldr	r2, .L29+12
	ldr	ip, [r1, #0]
	ldr	r0, [r2, #0]
	sub	ip, ip, #1
	sub	r0, r0, #1
	str	r3, [r4, #28]
	str	ip, [r1, #0]
	str	r0, [r2, #0]
	b	.L21
.L30:
	.align	2
.L29:
	.word	player
	.word	collision
	.word	lives
	.word	score
	.size	updateBullet, .-updateBullet
	.align	2
	.global	fireBullet
	.type	fireBullet, %function
fireBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L36
	stmfd	sp!, {r4, r5}
	ldr	r2, [r3, #28]
	cmp	r2, #0
	beq	.L32
	ldr	r2, [r3, #64]
	cmp	r2, #0
	beq	.L35
.L31:
	ldmfd	sp!, {r4, r5}
	bx	lr
.L35:
	mov	r2, #1
.L32:
	ldr	r1, .L36+4
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
	b	.L31
.L37:
	.align	2
.L36:
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
	ldr	r4, .L91
	sub	sp, sp, #20
	ldr	r3, [r4, #56]
	cmp	r3, #17
	movgt	r3, #14
	strgt	r3, [r4, #56]
	ldr	r8, .L91+4
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r2, [r3, #48]
	ldr	r1, [r8, #0]
	tst	r2, #32
	add	r3, r1, #1
	str	r3, [r8, #0]
	bne	.L78
	ldr	r3, [r4, #12]
	cmp	r3, #4
	ldr	r2, .L91
	bgt	.L71
.L78:
	ldr	sl, .L91+8
.L40:
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L80
	ldr	r3, [r4, #12]
	ldr	r2, [r4, #24]
	ldr	r1, [sl, #0]
	add	ip, r2, r3
	rsb	r0, r1, #508
	cmp	ip, r0
	blt	.L74
.L80:
	ldr	r5, .L91+12
	ldr	r6, .L91+16
	ldr	r7, .L91+20
.L44:
	ldr	r9, .L91+24
	ldrh	r2, [r9, #0]
	tst	r2, #1
	beq	.L49
	ldr	r3, .L91+28
	ldrh	fp, [r3, #0]
	ands	fp, fp, #1
	beq	.L82
.L49:
	tst	r2, #4
	beq	.L50
	ldr	r3, .L91+28
	ldrh	r3, [r3, #0]
	ands	r1, r3, #4
	beq	.L83
.L50:
	tst	r2, #2
	beq	.L81
	ldr	r3, .L91+28
	ldrh	r3, [r3, #0]
	tst	r3, #2
	beq	.L54
.L81:
	ldr	ip, [r4, #8]
.L53:
	cmp	ip, #124
	bgt	.L55
	ldr	r3, [r8, #0]
	ldr	r2, .L91+32
	smull	r1, r2, r3, r2
	sub	r2, r2, r3, asr #31
	add	r2, r2, r2, asl #1
	cmp	r3, r2
	beq	.L84
.L55:
	ldr	r8, [r4, #24]
	ldr	r2, [sl, #0]
	rsb	r3, r8, #436
	ldr	lr, [r4, #12]
	add	r3, r3, #3
	rsb	r3, r2, r3
	ldr	fp, .L91
	cmp	lr, r3
	ldrle	r9, [fp, #28]
	ble	.L57
	ldr	r9, [fp, #28]
	add	r3, ip, r9
	cmp	r3, #121
	ble	.L85
.L57:
	add	r0, r5, #8
	ldmia	r0, {r0, r1}	@ phole ldm
	ldr	r2, [r5, #28]
	ldr	r3, [r5, #24]
	ldr	r5, .L91+36
	stmia	sp, {ip, lr}	@ phole stm
	str	r9, [sp, #8]
	str	r8, [sp, #12]
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L58
	ldr	r3, .L91+12
	ldr	r3, [r3, #32]
	cmp	r3, #0
	bne	.L86
.L58:
	add	r0, r6, #8
	ldmia	r0, {r0, r1}	@ phole ldm
	ldr	r2, [r6, #28]
	ldr	r3, [r6, #24]
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
	beq	.L59
	ldr	r3, .L91+16
	ldr	r3, [r3, #32]
	cmp	r3, #0
	bne	.L87
.L59:
	add	r0, r7, #8
	ldmia	r0, {r0, r1}	@ phole ldm
	ldr	r2, [r7, #28]
	ldr	r3, [r7, #24]
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
	beq	.L60
	ldr	r3, .L91+20
	ldr	r3, [r3, #32]
	cmp	r3, #0
	bne	.L88
.L60:
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
.L85:
	ldr	r3, [fp, #16]
	cmp	r3, #2
	ble	.L57
	ldr	r3, .L91+40
	mov	lr, pc
	bx	r3
	add	ip, fp, #8
	ldmia	ip, {ip, lr}	@ phole ldm
	add	r8, fp, #24
	ldmia	r8, {r8, r9}	@ phole ldm
	b	.L57
.L84:
	ldr	r3, [r4, #16]
	ldr	r2, [r4, #32]
	add	r3, r2, r3
	rsb	ip, r3, ip
	str	r3, [r4, #16]
	str	ip, [r4, #8]
	b	.L55
.L54:
	ldr	ip, [r4, #8]
	ldr	r3, .L91
	cmp	ip, #125
	ldreq	r2, [r3, #32]
	addeq	r2, r2, #9
	rsbeq	ip, r2, #125
	streq	r2, [r3, #16]
	streq	ip, [r3, #8]
	b	.L53
.L83:
	ldr	r3, [r4, #60]
	ldr	ip, .L91
	cmp	r3, #0
	strne	r1, [ip, #60]
	bne	.L50
	mov	lr, #1
	mov	r1, #16064
	mov	r2, #11008
	add	r2, r2, #17
	str	lr, [ip, #60]
	ldr	r0, .L91+44
	add	r1, r1, #42
	ldr	ip, .L91+48
	mov	lr, pc
	bx	ip
	ldrh	r2, [r9, #0]
	b	.L50
.L82:
	ldr	r3, [r4, #52]
	cmp	r3, #15
	ble	.L49
	bl	fireBullet
	mov	r1, #2288
	mov	r2, #11008
	add	r2, r2, #17
	mov	r3, fp
	ldr	r0, .L91+52
	add	r1, r1, #11
	ldr	ip, .L91+48
	mov	lr, pc
	bx	ip
	ldr	r3, .L91
	ldrh	r2, [r9, #0]
	str	fp, [r3, #52]
	b	.L49
.L74:
	rsb	r0, r2, #120
	cmp	r3, r0
	bge	.L89
.L45:
	add	r3, r3, #1
	str	r3, [r4, #12]
	ldr	r5, .L91+12
	ldr	r6, .L91+16
	ldr	r7, .L91+20
.L47:
	ldr	r3, [r4, #56]
	add	r3, r3, #1
	str	r3, [r4, #56]
	b	.L44
.L71:
	ldr	r1, [r2, #24]
	rsb	r0, r1, #120
	cmp	r3, r0
	ldrlt	sl, .L91+8
	blt	.L41
	ldr	sl, .L91+8
	ldr	r0, [sl, #0]
	rsb	ip, r1, #392
	add	lr, r0, r3
	cmp	lr, ip
	bge	.L41
	cmp	r0, #0
	bne	.L42
.L41:
	sub	r3, r3, #1
	str	r3, [r4, #12]
.L43:
	ldr	r3, [r4, #56]
	add	r3, r3, #1
	str	r3, [r4, #56]
	b	.L40
.L88:
	ldr	r3, .L91+56
	mov	lr, pc
	bx	r3
	b	.L60
.L87:
	ldr	r3, .L91+56
	mov	lr, pc
	bx	r3
	b	.L59
.L86:
	ldr	r3, .L91+56
	mov	lr, pc
	bx	r3
	b	.L58
.L89:
	rsb	r2, r2, #392
	add	ip, r1, r3
	cmp	ip, r2
	bge	.L45
	cmp	r3, r0
	ble	.L90
.L48:
	cmp	r1, #272
	bge	.L79
	ldr	r5, .L91+12
	ldr	r3, [r5, #32]
	cmp	r3, #0
	beq	.L76
	ldr	r6, .L91+16
	ldr	r7, .L91+20
	b	.L47
.L42:
	add	r1, r1, r1, lsr #31
	ldr	r3, [r2, #4]
	mov	r1, r1, asr #1
	rsb	r2, r1, #119
	cmp	r2, r3
	blt	.L43
	cmp	r0, #0
	subgt	r0, r0, #1
	strgt	r0, [sl, #0]
	b	.L43
.L90:
	cmp	r3, r2
	blt	.L48
.L79:
	ldr	r5, .L91+12
	ldr	r6, .L91+16
	ldr	r7, .L91+20
	b	.L47
.L76:
	ldr	r6, .L91+16
	ldr	r3, [r6, #32]
	cmp	r3, #0
	ldrne	r7, .L91+20
	bne	.L47
	ldr	r7, .L91+20
	ldr	r3, [r7, #32]
	cmp	r3, #0
	addeq	r1, r1, #1
	streq	r1, [sl, #0]
	b	.L47
.L92:
	.align	2
.L91:
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
	bne	.L93
	ldr	r3, [r0, #32]
	cmp	r3, #1
	beq	.L99
	cmp	r3, #2
	beq	.L96
	cmp	r3, #3
	beq	.L97
.L93:
	ldmfd	sp!, {r4}
	bx	lr
.L97:
	ldr	r3, .L100
.L98:
	ldr	ip, [r3, #8]
	ldr	r2, [r3, #28]
	ldr	r1, [r3, #12]
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
	b	.L93
.L99:
	ldr	r2, .L100+4
	ldr	r1, [r2, #28]
	add	r4, r2, #8
	ldmia	r4, {r4, ip}	@ phole ldm
	add	r4, r4, r1
	ldr	r2, [r0, #16]
	ldr	r1, [r0, #20]
	sub	r4, r4, #10
	rsb	r1, r1, r4
	rsb	r2, r2, ip
	stmia	r0, {r1, r2}	@ phole stm
	str	r3, [r0, #28]
	b	.L93
.L96:
	ldr	r3, .L100+8
	b	.L98
.L101:
	.align	2
.L100:
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
	ldr	r4, .L132
	ldr	r5, .L132+4
	sub	sp, sp, #28
	ldr	r6, [r5, #16]
	ldr	ip, [r5, #8]
	ldr	r1, [r4, #32]
	ldr	r7, .L132+8
	add	ip, r6, ip
	cmp	r1, #0
	ldr	r8, [r7, #16]
	str	ip, [r5, #8]
	ldr	r3, [r7, #8]
	ldreq	ip, [r4, #36]
	ldreq	r6, .L132+12
	moveq	ip, ip, asl #3
	add	r3, r8, r3
	moveq	r8, #512	@ movhi
	ldr	r2, [r4, #8]
	streqh	r8, [r6, ip]	@ movhi
	ldr	r0, [r4, #16]
	ldr	ip, [r7, #32]
	add	r2, r0, r2
	cmp	ip, #0
	str	r2, [r4, #8]
	str	r3, [r7, #8]
	bne	.L104
	ldr	ip, .L132+8
	ldr	ip, [ip, #36]
	ldr	r6, .L132+12
	mov	ip, ip, asl #3
	mov	r8, #512	@ movhi
	strh	r8, [r6, ip]	@ movhi
.L104:
	ldr	ip, [r5, #32]
	cmp	ip, #0
	bne	.L105
	ldr	ip, .L132+4
	ldr	ip, [ip, #36]
	ldr	r6, .L132+12
	mov	ip, ip, asl #3
	mov	r8, #512	@ movhi
	strh	r8, [r6, ip]	@ movhi
.L105:
	ldr	ip, [r4, #28]
	rsb	ip, ip, #156
	cmp	r2, ip
	bgt	.L106
	cmp	r2, #45
	ble	.L106
.L107:
	ldr	r2, [r7, #28]
	rsb	r2, r2, #156
	cmp	r2, r3
	blt	.L108
	cmp	r3, #43
	ble	.L108
.L109:
	ldr	r2, [r5, #28]
	ldr	r3, [r5, #8]
	rsb	r2, r2, #156
	cmp	r3, r2
	bgt	.L110
	cmp	r3, #45
	ble	.L110
.L111:
	ldr	r6, .L132+16
	ldr	sl, .L132
	ldr	r9, .L132+8
	ldr	fp, .L132+4
	sub	r8, r6, #28
.L125:
	ldr	r3, [r8, #28]
	cmp	r3, #0
	beq	.L120
	ldr	r3, [r4, #32]
	cmp	r3, #0
	bne	.L129
	ldr	r3, [r7, #32]
	cmp	r3, #0
	bne	.L130
.L118:
	ldr	r3, [r5, #32]
	cmp	r3, #0
	bne	.L131
.L120:
	ldr	r1, .L132+20
	add	r6, r6, #36
	cmp	r6, r1
	add	r8, r8, #36
	bne	.L125
	ldr	r3, .L132+24
	ldr	r1, [r4, #12]
	ldr	r3, [r3, #0]
	ldr	r2, [r4, #8]
	rsb	r3, r3, r1
	stmia	r4, {r2, r3}	@ phole stm
	stmia	r7, {r2, r3}	@ phole stm
	stmia	r5, {r2, r3}	@ phole stm
	add	sp, sp, #28
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L110:
	ldr	r3, [r5, #16]
	ldr	r2, [r4, #32]
	rsb	r3, r3, #0
	cmp	r2, #0
	str	r3, [r5, #16]
	bne	.L111
	ldr	r3, [r7, #32]
	cmp	r3, #0
	bne	.L111
	ldr	r3, .L132+4
	ldr	r3, [r3, #32]
	cmp	r3, #0
	beq	.L111
	ldr	r0, .L132+28
	bl	fireEnemyBullet
	b	.L111
.L108:
	ldr	r3, [r7, #16]
	ldr	r2, [r4, #32]
	rsb	r3, r3, #0
	cmp	r2, #0
	str	r3, [r7, #16]
	bne	.L109
	ldr	r3, .L132+8
	ldr	r3, [r3, #32]
	cmp	r3, #0
	beq	.L109
	ldr	r0, .L132+32
	bl	fireEnemyBullet
	b	.L109
.L106:
	rsb	r0, r0, #0
	cmp	r1, #0
	str	r0, [r4, #16]
	beq	.L107
	ldr	r0, .L132+36
	bl	fireEnemyBullet
	ldr	r3, [r7, #8]
	b	.L107
.L129:
	ldr	ip, [r6, #-28]
	str	ip, [sp, #0]
	ldr	ip, [r6, #-24]
	str	ip, [sp, #4]
	ldr	lr, [r6, #-8]
	str	lr, [sp, #8]
	ldr	ip, [r6, #-12]
	ldr	r0, [sl, #8]
	str	ip, [sp, #12]
	ldr	r1, [sl, #12]
	ldr	r2, [sl, #28]
	ldr	r3, [sl, #24]
	ldr	ip, .L132+40
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	bne	.L114
	ldr	r3, [r8, #28]
	cmp	r3, #0
	beq	.L120
	ldr	r3, [r7, #32]
	cmp	r3, #0
	beq	.L118
.L130:
	ldr	lr, [r6, #-28]
	str	lr, [sp, #0]
	ldr	lr, [r6, #-24]
	str	lr, [sp, #4]
	ldr	ip, [r6, #-8]
	str	ip, [sp, #8]
	ldr	lr, [r6, #-12]
	add	r0, r9, #8
	ldmia	r0, {r0, r1}	@ phole ldm
	ldr	r2, [r9, #28]
	ldr	r3, [r9, #24]
	str	lr, [sp, #12]
	ldr	ip, .L132+40
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	bne	.L119
	ldr	r3, [r8, #28]
	cmp	r3, #0
	beq	.L120
	ldr	r3, [r5, #32]
	cmp	r3, #0
	beq	.L120
.L131:
	ldr	lr, [r6, #-28]
	add	r0, fp, #8
	ldmia	r0, {r0, r1}	@ phole ldm
	ldr	r2, [fp, #28]
	ldr	r3, [fp, #24]
	str	lr, [sp, #0]
	ldr	lr, [r6, #-24]
	str	lr, [sp, #4]
	ldr	ip, [r6, #-8]
	str	ip, [sp, #8]
	ldr	lr, [r6, #-12]
	ldr	ip, .L132+40
	str	lr, [sp, #12]
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L120
	mov	r1, #2064
	mov	r2, #11008
	add	r1, r1, #4
	add	r2, r2, #17
	mov	r3, #0
	ldr	ip, .L132+44
	ldr	r0, .L132+48
	mov	lr, pc
	bx	ip
	ldr	r1, .L132+52
	ldr	ip, .L132+56
	ldr	r3, [r1, #0]
	ldr	r2, [ip, #60]
	add	r3, r3, #10
	cmp	r2, #0
	str	r3, [r1, #0]
	ldreq	r3, [fp, #44]
	ldrne	r3, [fp, #44]
	mov	r2, #0
	subeq	r3, r3, #1
	subne	r3, r3, #3
	streq	r3, [fp, #44]
	strne	r3, [fp, #44]
	cmp	r3, r2
	str	r2, [r8, #28]
	strle	r2, [r5, #32]
	b	.L120
.L119:
	mov	r1, #2064
	mov	r2, #11008
	add	r1, r1, #4
	add	r2, r2, #17
	mov	r3, #0
	ldr	ip, .L132+44
	ldr	r0, .L132+48
	mov	lr, pc
	bx	ip
	ldr	r1, .L132+52
	ldr	ip, .L132+56
	ldr	r3, [r1, #0]
	ldr	r2, [ip, #60]
	add	r3, r3, #10
	cmp	r2, #0
	str	r3, [r1, #0]
	ldreq	r3, [r9, #44]
	ldrne	r3, [r9, #44]
	mov	r2, #0
	subeq	r3, r3, #1
	subne	r3, r3, #3
	streq	r3, [r9, #44]
	strne	r3, [r9, #44]
	cmp	r3, r2
	str	r2, [r8, #28]
	strle	r2, [r7, #32]
	b	.L120
.L114:
	mov	r1, #2064
	mov	r2, #11008
	add	r1, r1, #4
	add	r2, r2, #17
	mov	r3, #0
	ldr	ip, .L132+44
	ldr	r0, .L132+48
	mov	lr, pc
	bx	ip
	ldr	r1, .L132+52
	ldr	ip, .L132+56
	ldr	r3, [r1, #0]
	ldr	r2, [ip, #60]
	add	r3, r3, #10
	cmp	r2, #0
	str	r3, [r1, #0]
	ldreq	r3, [sl, #44]
	ldrne	r3, [sl, #44]
	mov	r2, #0
	subeq	r3, r3, #1
	subne	r3, r3, #3
	streq	r3, [sl, #44]
	strne	r3, [sl, #44]
	cmp	r3, r2
	str	r2, [r8, #28]
	strle	r2, [r4, #32]
	b	.L120
.L133:
	.align	2
.L132:
	.word	ladel
	.word	mitt
	.word	spatula
	.word	shadowOAM
	.word	bullets+28
	.word	bullets+100
	.word	hOff
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
	.global	initializeEnemyBullets
	.type	initializeEnemyBullets, %function
initializeEnemyBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L135
	stmfd	sp!, {r4, r5, r6, r7, r8}
	ldr	r8, [r3, #12]
	ldr	r3, .L135+4
	ldr	r0, .L135+8
	ldr	r7, [r3, #12]
	sub	r8, r8, #8
	ldr	r3, .L135+12
	str	r8, [r0, #4]
	mov	r8, #10
	ldr	r1, .L135+16
	mov	r2, #0
	mov	ip, #3
	ldr	r6, [r3, #12]
	mov	r4, #8
	ldr	r3, .L135+20
	mov	r5, #2
	str	r8, [r0, #24]
	mov	r8, #1
	str	r2, [r0, #0]
	str	r2, [r0, #8]
	str	r2, [r0, #28]
	sub	r7, r7, #8
	str	ip, [r0, #20]
	str	r4, [r0, #16]
	str	r5, [r0, #12]
	str	r8, [r0, #32]
	mov	r0, #11
	str	r2, [r1, #0]
	str	r2, [r1, #8]
	str	r2, [r1, #28]
	sub	r6, r6, #8
	str	ip, [r1, #20]
	str	r4, [r1, #16]
	str	r7, [r1, #4]
	str	ip, [r1, #12]
	str	r0, [r1, #24]
	str	r5, [r1, #32]
	str	r2, [r3, #0]
	str	r2, [r3, #8]
	mov	r1, #4
	str	r2, [r3, #28]
	mov	r2, #12
	str	ip, [r3, #20]
	str	r4, [r3, #16]
	str	r6, [r3, #4]
	str	r1, [r3, #12]
	str	r2, [r3, #24]
	str	ip, [r3, #32]
	ldmfd	sp!, {r4, r5, r6, r7, r8}
	bx	lr
.L136:
	.align	2
.L135:
	.word	ladel
	.word	spatula
	.word	bullet1
	.word	mitt
	.word	bullet2
	.word	bullet3
	.size	initializeEnemyBullets, .-initializeEnemyBullets
	.align	2
	.global	hideSprites
	.type	hideSprites, %function
hideSprites:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L140
	mov	r3, #0
.L138:
	mov	r1, #512	@ movhi
	strh	r1, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L138
	bx	lr
.L141:
	.align	2
.L140:
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
	mov	r7, r1
	mov	r6, r3
	ble	.L154
	ldr	sl, .L165
.L156:
	smull	r3, r5, sl, r4
	mov	r3, r4, asr #31
	rsb	r5, r3, r5, asr #2
	mov	r2, r5
	add	r5, r5, r5, asl #2
	mov	r1, r7
	mov	r3, r6
	mov	r0, r8
	sub	r4, r4, r5, asl #1
	bl	drawNumber
	cmp	r4, #9
	add	r7, r7, #8
	add	r6, r6, #1
	bgt	.L156
.L154:
	ldr	r3, .L165+4
	cmp	r4, #0
	add	r2, r3, r6, asl #3
	mov	r1, #512	@ movhi
	strh	r1, [r2, #8]	@ movhi
	moveq	r6, r6, asl #3
	moveq	r2, #324
	beq	.L157
	cmp	r4, #1
	beq	.L158
	cmp	r4, #2
	beq	.L159
	cmp	r4, #3
	beq	.L160
	cmp	r4, #4
	beq	.L161
	cmp	r4, #5
	beq	.L162
	cmp	r4, #6
	beq	.L163
	cmp	r4, #7
	moveq	r6, r6, asl #3
	moveq	r2, #392
	beq	.L157
	cmp	r4, #8
	beq	.L164
	cmp	r4, #9
	moveq	r6, r6, asl #3
	moveq	r2, #396
	bne	.L142
.L157:
	add	r1, r3, r6
	orr	r7, r7, #16384
	add	r2, r2, #2
	strh	r8, [r3, r6]	@ movhi
	strh	r7, [r1, #2]	@ movhi
	strh	r2, [r1, #4]	@ movhi
.L142:
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
	bx	lr
.L158:
	mov	r6, r6, asl #3
	add	r2, r3, r6
	orr	r7, r7, #16384
	strh	r8, [r3, r6]	@ movhi
	mov	r3, #328	@ movhi
	strh	r7, [r2, #2]	@ movhi
	strh	r3, [r2, #4]	@ movhi
	b	.L142
.L159:
	mov	r6, r6, asl #3
	mov	r2, #328
	add	r1, r3, r6
	orr	r7, r7, #16384
	add	r2, r2, #2
	strh	r8, [r3, r6]	@ movhi
	strh	r7, [r1, r4]	@ movhi
	strh	r2, [r1, #4]	@ movhi
	b	.L142
.L160:
	mov	r6, r6, asl #3
	add	r2, r3, r6
	orr	r7, r7, #16384
	mov	r1, #332	@ movhi
	strh	r8, [r3, r6]	@ movhi
	strh	r7, [r2, #2]	@ movhi
	strh	r1, [r2, #4]	@ movhi
	b	.L142
.L161:
	mov	r6, r6, asl #3
	mov	r2, #332
	add	r1, r3, r6
	orr	r7, r7, #16384
	add	r2, r2, #2
	strh	r8, [r3, r6]	@ movhi
	strh	r7, [r1, #2]	@ movhi
	strh	r2, [r1, r4]	@ movhi
	b	.L142
.L162:
	mov	r6, r6, asl #3
	mov	r2, #388
	b	.L157
.L163:
	mov	r6, r6, asl #3
	add	r2, r3, r6
	orr	r7, r7, #16384
	strh	r8, [r3, r6]	@ movhi
	mov	r3, #392	@ movhi
	strh	r7, [r2, #2]	@ movhi
	strh	r3, [r2, #4]	@ movhi
	b	.L142
.L164:
	mov	r6, r6, asl #3
	add	r2, r3, r6
	orr	r7, r7, #16384
	mov	r1, #396	@ movhi
	strh	r8, [r3, r6]	@ movhi
	strh	r7, [r2, #2]	@ movhi
	strh	r1, [r2, #4]	@ movhi
	b	.L142
.L166:
	.align	2
.L165:
	.word	1717986919
	.word	shadowOAM
	.size	drawNumber, .-drawNumber
	.align	2
	.global	initKnives
	.type	initKnives, %function
initKnives:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	mov	r7, #-2113929216
	mov	r6, #264
	mov	r5, #0
	add	r7, r7, #532480
	ldr	r4, .L172
	ldr	fp, .L172+4
	add	r6, r6, #1
	add	r7, r7, #131
	mov	r9, #32
	mov	sl, #5
	mov	r8, r5
.L170:
	str	r6, [r4, #12]
	mov	lr, pc
	bx	fp
	smull	r3, r2, r7, r0
	mov	r3, r0, asr #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #5
	rsb	r3, r3, r3, asl #6
	tst	r5, #1
	rsb	r0, r3, r0
	movne	r3, #3
	mvneq	r3, #2
	strne	r3, [r4, #16]
	streq	r3, [r4, #16]
	add	r3, r5, #13
	add	r5, r5, #1
	add	r0, r0, #16
	cmp	r5, #4
	str	r0, [r4, #8]
	str	r9, [r4, #28]
	str	sl, [r4, #24]
	str	r3, [r4, #36]
	str	r8, [r4, #32]
	add	r6, r6, #45
	add	r4, r4, #48
	bne	.L170
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L173:
	.align	2
.L172:
	.word	knives
	.word	rand
	.size	initKnives, .-initKnives
	.align	2
	.global	initializeEnemies
	.type	initializeEnemies, %function
initializeEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L175
	stmfd	sp!, {r4, r5}
	mov	r5, #46
	str	r5, [r1, #8]
	mov	r5, #121
	str	r5, [r1, #12]
	mov	r5, #36
	ldr	r2, .L175+4
	mov	r0, #1
	mov	ip, #3
	mov	r4, #63
	str	r5, [r1, #24]
	mov	r5, #7
	str	r0, [r1, #16]
	str	r4, [r1, #28]
	str	r5, [r1, #36]
	str	r0, [r1, #32]
	str	ip, [r1, #44]
	mov	r1, #44
	str	r1, [r2, #8]
	mov	r1, #164
	str	r1, [r2, #12]
	mov	r1, #58
	str	r1, [r2, #28]
	mov	r1, #27
	ldr	r3, .L175+8
	str	r1, [r2, #24]
	mov	r1, #8
	str	r0, [r2, #16]
	str	r1, [r2, #36]
	str	r0, [r2, #32]
	str	ip, [r2, #44]
	mov	r2, #47
	str	r2, [r3, #8]
	mov	r2, #205
	str	r2, [r3, #12]
	mov	r2, #39
	str	r2, [r3, #24]
	mov	r2, #9
	str	r0, [r3, #16]
	str	r4, [r3, #28]
	str	r2, [r3, #36]
	str	r0, [r3, #32]
	str	ip, [r3, #44]
	ldmfd	sp!, {r4, r5}
	b	initKnives
.L176:
	.align	2
.L175:
	.word	ladel
	.word	spatula
	.word	mitt
	.size	initializeEnemies, .-initializeEnemies
	.align	2
	.global	initialize
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L178
	mov	r3, #0
	stmfd	sp!, {r4, lr}
	str	r3, [r2, #0]
	ldr	r2, .L178+4
	str	r3, [r2, #0]
	ldr	r2, .L178+8
	mov	r1, #3
	str	r1, [r2, #0]
	ldr	r2, .L178+12
	str	r3, [r2, #0]
	bl	initializePlayer
	bl	initializeBullets
	bl	initializeEnemies
	ldmfd	sp!, {r4, lr}
	b	initializeEnemyBullets
.L179:
	.align	2
.L178:
	.word	hOff
	.word	score
	.word	lives
	.word	gravCount
	.size	initialize, .-initialize
	.align	2
	.global	updateKnives
	.type	updateKnives, %function
updateKnives:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	r4, .L189
	ldr	r6, .L189+4
	ldr	r8, .L189+8
	ldr	r7, .L189+12
	ldr	sl, .L189+16
	ldr	r9, .L189+20
	ldr	fp, .L189+24
	sub	sp, sp, #20
	add	r5, r4, #192
.L185:
	ldr	r3, [r4, #0]
	cmp	r3, #0
	ldreq	r3, [r4, #4]
	moveq	r2, #512	@ movhi
	moveq	r3, r3, asl #3
	streqh	r2, [r8, r3]	@ movhi
	ldr	r1, [r4, #-16]
	ldr	r3, [r4, #-24]
	add	r3, r1, r3
	cmp	r3, #15
	str	r3, [r4, #-24]
	ble	.L182
	ldr	r2, [r4, #-4]
	rsb	r0, r2, #159
	cmp	r3, r0
	ble	.L183
.L182:
	rsb	r1, r1, #0
	str	r1, [r4, #-16]
.L184:
	ldr	r1, [r4, #-20]
	ldr	r2, [r6, #0]
	rsb	r2, r2, r1
	str	r3, [r4, #-32]
	str	r2, [r4, #-28]
	add	r4, r4, #48
	cmp	r4, r5
	bne	.L185
	add	sp, sp, #20
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L183:
	ldr	ip, [r7, #8]
	str	ip, [sp, #0]
	ldr	ip, [r7, #12]
	ldr	lr, [r7, #28]
	str	ip, [sp, #4]
	ldr	ip, [r7, #24]
	ldr	r3, [r4, #-8]
	sub	r0, r4, #32
	ldmia	r0, {r0, r1}	@ phole ldm
	str	lr, [sp, #8]
	str	ip, [sp, #12]
	mov	lr, pc
	bx	sl
	cmp	r0, #0
	ldreq	r3, [r4, #-24]
	beq	.L184
	ldr	r3, [r4, #-24]
	ldr	r2, [r4, #-16]
	ldr	r1, [r7, #60]
	sub	r3, r3, #6
	rsb	r2, r2, #0
	cmp	r1, #0
	str	r3, [r4, #-24]
	str	r2, [r4, #-16]
	bne	.L184
	ldr	r1, [r9, #0]
	ldr	r2, [fp, #0]
	sub	r1, r1, #1
	sub	r2, r2, #5
	str	r1, [r9, #0]
	str	r2, [fp, #0]
	b	.L184
.L190:
	.align	2
.L189:
	.word	knives+32
	.word	hOff
	.word	shadowOAM
	.word	player
	.word	collision
	.word	lives
	.word	score
	.size	updateKnives, .-updateKnives
	.align	2
	.global	update
	.type	update, %function
update:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	bl	updatePlayer
	bl	updateKnives
	ldr	r0, .L193
	bl	updateBullet
	ldr	r0, .L193+4
	bl	updateBullet
	ldr	r0, .L193+8
	bl	updateBullet
	ldr	r0, .L193+12
	bl	updateBullet
	ldr	r0, .L193+16
	bl	updateBullet
	bl	updateEnemies
	ldr	r3, .L193+20
	ldr	r3, [r3, #0]
	cmp	r3, #0
	ldreq	r3, .L193+24
	moveq	lr, pc
	bxeq	r3
.L191:
	ldmfd	sp!, {r3, lr}
	bx	lr
.L194:
	.align	2
.L193:
	.word	bullets
	.word	bullets+36
	.word	bullet1
	.word	bullet2
	.word	bullet3
	.word	lives
	.word	goToLose
	.size	update, .-update
	.align	2
	.global	drawKnives
	.type	drawKnives, %function
drawKnives:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L201
	stmfd	sp!, {r4, r5, r6, r7}
	ldr	r3, [r3, #0]
	cmp	r3, #0
	ble	.L195
	ldr	r3, .L201+4
	ldr	r0, .L201+8
	add	r7, r3, #192
	mov	r6, #1
.L199:
	ldr	ip, [r3, #-12]
	ldrb	r4, [r3, #-16]	@ zero_extendqisi2
	ldr	r2, [r3, #20]
	ldr	r5, [r3, #0]
	mov	ip, ip, asl #23
	mvn	r4, r4, asl #17
	mov	r2, r2, asl #3
	cmp	r5, #0
	mov	ip, ip, lsr #23
	mvn	r4, r4, lsr #17
	add	r1, r0, r2
	orr	ip, ip, #16384
	strh	r4, [r0, r2]	@ movhi
	movlt	r2, #20	@ movhi
	str	r6, [r3, #16]
	strh	ip, [r1, #2]	@ movhi
	strlth	r2, [r1, #4]	@ movhi
	blt	.L198
	movne	r2, #148	@ movhi
	strneh	r2, [r1, #4]	@ movhi
.L198:
	add	r3, r3, #48
	cmp	r3, r7
	bne	.L199
.L195:
	ldmfd	sp!, {r4, r5, r6, r7}
	bx	lr
.L202:
	.align	2
.L201:
	.word	hOff
	.word	knives+16
	.word	shadowOAM
	.size	drawKnives, .-drawKnives
	.align	2
	.global	drawEnemies
	.type	drawEnemies, %function
drawEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L207
	ldr	r2, [r3, #32]
	cmp	r2, #0
	beq	.L204
	ldr	r1, [r3, #36]
	ldr	ip, [r3, #12]
	ldr	r0, .L207+4
	ldrh	r3, [r3, #8]
	mov	r1, r1, asl #3
	mvn	ip, ip, asl #18
	add	r2, r0, r1
	mvn	ip, ip, lsr #18
	strh	r3, [r0, r1]	@ movhi
	mov	r3, #768	@ movhi
	strh	ip, [r2, #2]	@ movhi
	strh	r3, [r2, #4]	@ movhi
.L204:
	ldr	r3, .L207+8
	ldr	r2, [r3, #32]
	cmp	r2, #0
	beq	.L205
	ldr	ip, [r3, #8]
	ldr	r2, [r3, #36]
	ldr	r0, [r3, #12]
	ldr	r1, .L207+4
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
.L205:
	ldr	r3, .L207+12
	ldr	r2, [r3, #32]
	cmp	r2, #0
	beq	.L206
	ldr	ip, [r3, #8]
	ldr	r2, [r3, #36]
	ldr	r0, [r3, #12]
	ldr	r1, .L207+4
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
.L206:
	b	drawKnives
.L208:
	.align	2
.L207:
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
	stmfd	sp!, {r4, lr}
	ldr	r4, .L210
	bl	drawPlayer
	mov	r0, r4
	bl	drawBullet
	add	r0, r4, #36
	bl	drawBullet
	ldr	r0, .L210+4
	bl	drawBullet
	ldr	r0, .L210+8
	bl	drawBullet
	ldr	r0, .L210+12
	bl	drawBullet
	bl	drawEnemies
	ldr	r3, .L210+16
	mov	r0, #0
	ldr	r2, [r3, #0]
	mov	r1, #40
	mov	r3, #50
	bl	drawNumber
	ldr	r3, .L210+20
	mov	r0, #0
	ldr	r2, [r3, #0]
	mov	r1, #175
	mov	r3, #51
	bl	drawNumber
	mov	r0, #3
	ldr	r1, .L210+24
	mov	r2, #117440512
	mov	r3, #512
	ldr	ip, .L210+28
	mov	lr, pc
	bx	ip
	ldmfd	sp!, {r4, lr}
	bx	lr
.L211:
	.align	2
.L210:
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
	.comm	knives,192,4
	.comm	ladel,48,4
	.comm	spatula,48,4
	.comm	mitt,48,4
	.comm	lives,4,4
	.comm	bullet1,36,4
	.comm	bullet2,36,4
	.comm	bullet3,36,4
	.comm	gravCount,4,4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
