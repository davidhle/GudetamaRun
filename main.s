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
	.file	"main.c"
	.text
	.align	2
	.global	goToSplash
	.type	goToSplash, %function
goToSplash:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r3, .L2
	mov	lr, pc
	bx	r3
	ldr	r0, .L2+4
	ldr	r3, .L2+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L2+12
	mov	r0, #3
	ldr	r1, .L2+16
	mov	r2, #100663296
	mov	r3, #4800
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	ldr	r1, .L2+20
	add	r2, r2, #63488
	mov	r3, #1024
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r2, #7936	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ldr	r2, .L2+24
	mov	r1, #0
	str	r1, [r2, #0]
	mov	r2, #256	@ movhi
	strh	r2, [r3, #0]	@ movhi
	ldmfd	sp!, {r4, lr}
	bx	lr
.L3:
	.align	2
.L2:
	.word	waitForVBlank
	.word	splashPal
	.word	loadPalette
	.word	DMANow
	.word	splashTiles
	.word	splashMap
	.word	state
	.size	goToSplash, .-goToSplash
	.align	2
	.global	goToGame
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	ldr	r3, .L5
	mov	lr, pc
	bx	r3
	ldr	r3, .L5+4
	mov	r2, #1
	str	r2, [r3, #0]
	ldr	r0, .L5+8
	ldr	r3, .L5+12
	mov	lr, pc
	bx	r3
	mov	ip, #67108864
	mov	lr, #4608	@ movhi
	strh	lr, [ip, #0]	@ movhi
	mov	r2, #100663296
	mov	lr, #24064	@ movhi
	mov	r3, #4736
	ldr	r4, .L5+16
	mov	r5, r2
	strh	lr, [ip, #10]	@ movhi
	mov	r0, #3
	ldr	r1, .L5+20
	add	r3, r3, #16
	mov	lr, pc
	bx	r4
	add	r2, r5, #61440
	mov	r0, #3
	ldr	r1, .L5+24
	mov	r3, #2048
	mov	lr, pc
	bx	r4
	add	r2, r5, #65536
	mov	r0, #3
	ldr	r1, .L5+28
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L5+32
	add	r2, r2, #512
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L6:
	.align	2
.L5:
	.word	waitForVBlank
	.word	state
	.word	bgPal
	.word	loadPalette
	.word	DMANow
	.word	bgTiles
	.word	bgMap
	.word	spritesheetTiles
	.word	spritesheetPal
	.size	goToGame, .-goToGame
	.align	2
	.global	splash
	.type	splash, %function
splash:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L10
	ldrh	r3, [r3, #0]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L10+4
	ldrh	r3, [r3, #0]
	tst	r3, #8
	bxne	lr
	b	goToGame
.L11:
	.align	2
.L10:
	.word	oldButtons
	.word	buttons
	.size	splash, .-splash
	.align	2
	.global	goToWin
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	goToWin, .-goToWin
	.align	2
	.global	win
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	win, .-win
	.align	2
	.global	goToLose
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	goToLose, .-goToLose
	.align	2
	.global	lose
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	lose, .-lose
	.align	2
	.global	goToPause
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r3, .L17
	mov	lr, pc
	bx	r3
	ldr	r0, .L17+4
	ldr	r3, .L17+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L17+12
	mov	r0, #3
	ldr	r1, .L17+16
	mov	r2, #100663296
	mov	r3, #3488
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L17+20
	add	r2, r2, #63488
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r1, #7936	@ movhi
	strh	r1, [r3, #8]	@ movhi
	ldr	r1, .L17+24
	mov	r2, #0
	mov	r0, #4
	str	r0, [r1, #0]
	strh	r2, [r3, #16]	@ movhi
	strh	r2, [r3, #18]	@ movhi
	mov	r2, #256	@ movhi
	strh	r2, [r3, #0]	@ movhi
	ldmfd	sp!, {r4, lr}
	bx	lr
.L18:
	.align	2
.L17:
	.word	waitForVBlank
	.word	pausePal
	.word	loadPalette
	.word	DMANow
	.word	pauseTiles
	.word	pauseMap
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	game
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L22
	ldr	r1, .L22+4
	stmfd	sp!, {r4, lr}
	ldr	r2, [r3, #0]
	ldrh	r0, [r1, #0]
	add	r2, r2, #1
	mov	r1, #67108864
	strh	r0, [r1, #20]	@ movhi
	str	r2, [r3, #0]
	ldr	r3, .L22+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L22+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L22+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L22+20
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L19
	ldr	r3, .L22+24
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L21
.L19:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L21:
	ldmfd	sp!, {r4, lr}
	b	goToPause
.L23:
	.align	2
.L22:
	.word	.LANCHOR0
	.word	hOff
	.word	waitForVBlank
	.word	update
	.word	draw
	.word	oldButtons
	.word	buttons
	.size	game, .-game
	.align	2
	.global	pause
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L29
	stmfd	sp!, {r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L29+4
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L25
	ldr	r2, .L29+8
	ldrh	r2, [r2, #0]
	tst	r2, #8
	beq	.L27
.L25:
	tst	r3, #4
	beq	.L24
	ldr	r3, .L29+8
	ldrh	r3, [r3, #0]
	tst	r3, #4
	beq	.L28
.L24:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L28:
	ldmfd	sp!, {r4, lr}
	b	goToSplash
.L27:
	ldmfd	sp!, {r4, lr}
	b	goToGame
.L30:
	.align	2
.L29:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	pause, .-pause
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	ldr	r3, .L40
	mov	lr, pc
	bx	r3
	bl	goToSplash
	ldr	r3, .L40+4
	mov	lr, pc
	bx	r3
	mov	r5, #67108864
	ldr	r4, .L40+8
	ldr	r7, .L40+12
	ldr	r6, .L40+16
	add	r5, r5, #256
.L38:
	ldrh	r3, [r4, #0]
	ldr	r2, [r7, #0]
.L33:
	strh	r3, [r6, #0]	@ movhi
	ldrh	r3, [r5, #48]
	cmp	r2, #1
	strh	r3, [r4, #0]	@ movhi
	beq	.L35
.L39:
	cmp	r2, #4
	beq	.L36
	cmp	r2, #0
	bne	.L33
	bl	splash
	ldrh	r3, [r4, #0]
	strh	r3, [r6, #0]	@ movhi
	ldr	r2, [r7, #0]
	ldrh	r3, [r5, #48]
	cmp	r2, #1
	strh	r3, [r4, #0]	@ movhi
	bne	.L39
.L35:
	bl	game
	b	.L38
.L36:
	bl	pause
	b	.L38
.L41:
	.align	2
.L40:
	.word	hideSprites
	.word	initialize
	.word	buttons
	.word	state
	.word	oldButtons
	.size	main, .-main
	.global	timer
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	gamesLost,4,4
	.comm	state,4,4
	.comm	hOff,4,4
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	timer, %object
	.size	timer, 4
timer:
	.space	4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
