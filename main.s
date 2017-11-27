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
	mov	r1, #2015232
	mov	r2, #11008
	ldr	ip, .L2+4
	add	r1, r1, #2208
	add	r2, r2, #17
	mov	r3, #1
	ldr	r0, .L2+8
	mov	lr, pc
	bx	ip
	ldr	r0, .L2+12
	ldr	r3, .L2+16
	mov	lr, pc
	bx	r3
	ldr	r4, .L2+20
	mov	r0, #3
	ldr	r1, .L2+24
	mov	r2, #100663296
	mov	r3, #4800
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	ldr	r1, .L2+28
	add	r2, r2, #63488
	mov	r3, #1024
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r2, #7936	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ldr	r2, .L2+32
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
	.word	playSoundA
	.word	splashMusic
	.word	splashPal
	.word	loadPalette
	.word	DMANow
	.word	splashTiles
	.word	splashMap
	.word	state
	.size	goToSplash, .-goToSplash
	.align	2
	.global	goToInstructions
	.type	goToInstructions, %function
goToInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r3, .L5
	mov	lr, pc
	bx	r3
	ldr	r0, .L5+4
	ldr	r3, .L5+8
	mov	lr, pc
	bx	r3
	mov	r3, #4928
	mov	r0, #3
	ldr	r1, .L5+12
	mov	r2, #100663296
	add	r3, r3, #32
	ldr	r4, .L5+16
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	ldr	r1, .L5+20
	add	r2, r2, #63488
	mov	r3, #1024
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r2, #7936	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ldr	r2, .L5+24
	mov	r1, #1
	str	r1, [r2, #0]
	mov	r2, #256	@ movhi
	strh	r2, [r3, #0]	@ movhi
	ldmfd	sp!, {r4, lr}
	bx	lr
.L6:
	.align	2
.L5:
	.word	waitForVBlank
	.word	instructionsPal
	.word	loadPalette
	.word	instructionsTiles
	.word	DMANow
	.word	instructionsMap
	.word	state
	.size	goToInstructions, .-goToInstructions
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
	b	goToInstructions
.L11:
	.align	2
.L10:
	.word	oldButtons
	.word	buttons
	.size	splash, .-splash
	.align	2
	.global	goToGame
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	ldr	r3, .L13
	mov	lr, pc
	bx	r3
	mov	r1, #1933312
	add	r1, r1, #6912
	mov	r2, #11008
	add	r1, r1, #32
	add	r2, r2, #17
	ldr	ip, .L13+4
	mov	r3, #1
	ldr	r0, .L13+8
	mov	lr, pc
	bx	ip
	ldr	r0, .L13+12
	ldr	r3, .L13+16
	mov	lr, pc
	bx	r3
	mov	ip, #67108864
	mov	lr, #4608	@ movhi
	strh	lr, [ip, #0]	@ movhi
	mov	r2, #100663296
	mov	lr, #24064	@ movhi
	mov	r3, #4736
	ldr	r4, .L13+20
	strh	lr, [ip, #10]	@ movhi
	mov	r5, r2
	mov	r0, #3
	ldr	r1, .L13+24
	add	r3, r3, #16
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L13+28
	add	r2, r5, #61440
	mov	r3, #2048
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L13+32
	add	r2, r5, #65536
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	mov	r2, #83886080
	add	r2, r2, #512
	mov	r3, #256
	mov	r0, #3
	ldr	r1, .L13+36
	mov	lr, pc
	bx	r4
	ldr	r3, .L13+40
	mov	r2, #2
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L14:
	.align	2
.L13:
	.word	waitForVBlank
	.word	playSoundA
	.word	gameMusic
	.word	bgPal
	.word	loadPalette
	.word	DMANow
	.word	bgTiles
	.word	bgMap
	.word	spritesheetTiles
	.word	spritesheetPal
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	instructions
	.type	instructions, %function
instructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L20
	stmfd	sp!, {r4, lr}
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L16
	ldr	r2, .L20+4
	ldrh	r2, [r2, #0]
	tst	r2, #8
	beq	.L18
.L16:
	tst	r3, #4
	beq	.L15
	ldr	r3, .L20+4
	ldrh	r3, [r3, #0]
	tst	r3, #4
	beq	.L19
.L15:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L19:
	ldr	r3, .L20+8
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r4, lr}
	b	goToSplash
.L18:
	ldmfd	sp!, {r4, lr}
	b	goToGame
.L21:
	.align	2
.L20:
	.word	oldButtons
	.word	buttons
	.word	initialize
	.size	instructions, .-instructions
	.align	2
	.global	goToWin
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r3, .L23
	mov	lr, pc
	bx	r3
	ldr	r0, .L23+4
	ldr	r3, .L23+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L23+12
	mov	r0, #3
	ldr	r1, .L23+16
	mov	r2, #100663296
	mov	r3, #3776
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L23+20
	add	r2, r2, #63488
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r1, #7936	@ movhi
	strh	r1, [r3, #8]	@ movhi
	ldr	r1, .L23+24
	mov	r2, #0
	mov	r0, #3
	str	r0, [r1, #0]
	strh	r2, [r3, #16]	@ movhi
	strh	r2, [r3, #18]	@ movhi
	mov	r2, #256	@ movhi
	strh	r2, [r3, #0]	@ movhi
	ldmfd	sp!, {r4, lr}
	bx	lr
.L24:
	.align	2
.L23:
	.word	waitForVBlank
	.word	winPal
	.word	loadPalette
	.word	DMANow
	.word	winTiles
	.word	winMap
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	win
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L28
	stmfd	sp!, {r4, lr}
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L25
	ldr	r3, .L28+4
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L27
.L25:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L27:
	ldr	r3, .L28+8
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r4, lr}
	b	goToSplash
.L29:
	.align	2
.L28:
	.word	oldButtons
	.word	buttons
	.word	initialize
	.size	win, .-win
	.align	2
	.global	goToLose
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r3, .L31
	mov	lr, pc
	bx	r3
	ldr	r0, .L31+4
	ldr	r3, .L31+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L31+12
	mov	r0, #3
	ldr	r1, .L31+16
	mov	r2, #100663296
	mov	r3, #3392
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L31+20
	add	r2, r2, #63488
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	ip, #67108864
	mov	r4, #7936	@ movhi
	mov	r1, #274432
	strh	r4, [ip, #8]	@ movhi
	mov	lr, #0
	add	r1, r1, #3488
	mov	r2, #11008
	mov	r4, #256	@ movhi
	strh	lr, [ip, #16]	@ movhi
	add	r2, r2, #17
	mov	r3, #1
	strh	r4, [ip, #0]	@ movhi
	strh	lr, [ip, #18]	@ movhi
	ldr	r0, .L31+24
	add	r1, r1, #15
	ldr	ip, .L31+28
	mov	lr, pc
	bx	ip
	ldr	r3, .L31+32
	mov	r2, #4
	str	r2, [r3, #0]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L32:
	.align	2
.L31:
	.word	waitForVBlank
	.word	losePal
	.word	loadPalette
	.word	DMANow
	.word	loseTiles
	.word	loseMap
	.word	loseMusic
	.word	playSoundA
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	lose
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	ldr	r3, .L36
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L33
	ldr	r3, .L36+4
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L35
.L33:
	ldmfd	sp!, {r3, lr}
	bx	lr
.L35:
	ldr	r3, .L36+8
	mov	lr, pc
	bx	r3
	bl	goToSplash
	ldr	r3, .L36+12
	mov	lr, pc
	bx	r3
	b	.L33
.L37:
	.align	2
.L36:
	.word	oldButtons
	.word	buttons
	.word	initialize
	.word	stopSound
	.size	lose, .-lose
	.align	2
	.global	goToPause
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r3, .L39
	mov	lr, pc
	bx	r3
	ldr	r0, .L39+4
	ldr	r3, .L39+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L39+12
	mov	r0, #3
	ldr	r1, .L39+16
	mov	r2, #100663296
	mov	r3, #3856
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L39+20
	add	r2, r2, #63488
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r1, #7936	@ movhi
	strh	r1, [r3, #8]	@ movhi
	ldr	r1, .L39+24
	mov	r2, #0
	mov	r0, #5
	str	r0, [r1, #0]
	strh	r2, [r3, #16]	@ movhi
	strh	r2, [r3, #18]	@ movhi
	mov	r2, #256	@ movhi
	strh	r2, [r3, #0]	@ movhi
	ldmfd	sp!, {r4, lr}
	bx	lr
.L40:
	.align	2
.L39:
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
	ldr	r3, .L44
	ldr	r1, .L44+4
	stmfd	sp!, {r4, lr}
	ldr	r2, [r3, #0]
	ldrh	r0, [r1, #0]
	add	r2, r2, #1
	mov	r1, #67108864
	strh	r0, [r1, #20]	@ movhi
	str	r2, [r3, #0]
	ldr	r3, .L44+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L44+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L44+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L44+20
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L41
	ldr	r3, .L44+24
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L43
.L41:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L43:
	ldmfd	sp!, {r4, lr}
	b	goToPause
.L45:
	.align	2
.L44:
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
	ldr	r3, .L51
	stmfd	sp!, {r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L51+4
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L47
	ldr	r2, .L51+8
	ldrh	r2, [r2, #0]
	tst	r2, #8
	beq	.L49
.L47:
	tst	r3, #4
	beq	.L46
	ldr	r3, .L51+8
	ldrh	r3, [r3, #0]
	tst	r3, #4
	beq	.L50
.L46:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L50:
	ldr	r3, .L51+12
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r4, lr}
	b	goToSplash
.L49:
	ldmfd	sp!, {r4, lr}
	b	goToGame
.L52:
	.align	2
.L51:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	initialize
	.size	pause, .-pause
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	ldr	r3, .L66
	mov	lr, pc
	bx	r3
	bl	goToSplash
	ldr	r3, .L66+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L66+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L66+12
	mov	lr, pc
	bx	r3
	mov	r5, #67108864
	ldr	r4, .L66+16
	ldr	r7, .L66+20
	ldr	r6, .L66+24
	add	r5, r5, #256
.L65:
	ldrh	r3, [r4, #0]
	ldr	r2, [r7, #0]
.L55:
	strh	r3, [r6, #0]	@ movhi
	ldrh	r3, [r5, #48]
	strh	r3, [r4, #0]	@ movhi
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L55
.L62:
	.word	.L56
	.word	.L57
	.word	.L58
	.word	.L59
	.word	.L60
	.word	.L61
.L61:
	bl	pause
	b	.L65
.L60:
	bl	lose
	b	.L65
.L59:
	bl	win
	b	.L65
.L58:
	bl	game
	b	.L65
.L57:
	bl	instructions
	b	.L65
.L56:
	bl	splash
	b	.L65
.L67:
	.align	2
.L66:
	.word	hideSprites
	.word	initialize
	.word	setupSounds
	.word	setupInterrupts
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
