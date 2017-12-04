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
	mov	r1, #199680
	mov	r2, #11008
	ldr	ip, .L2+4
	add	r1, r1, #77
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
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r3, .L13
	mov	lr, pc
	bx	r3
	mov	r1, #139264
	mov	r2, #11008
	add	r1, r1, #260
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
	mov	r6, #67108864
	mov	ip, #4864	@ movhi
	mov	r5, #100663296
	strh	ip, [r6, #0]	@ movhi
	mov	r3, #6528
	mov	ip, #24064	@ movhi
	ldr	r4, .L13+20
	strh	ip, [r6, #10]	@ movhi
	mov	r0, #3
	ldr	r1, .L13+24
	mov	r2, r5
	add	r3, r3, #32
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L13+28
	add	r2, r5, #61440
	mov	r3, #2048
	mov	lr, pc
	bx	r4
	mov	ip, #7168
	add	ip, ip, #4
	strh	ip, [r6, #8]	@ movhi
	mov	r0, #3
	ldr	r1, .L13+32
	add	r2, r5, #16384
	mov	r3, #336
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L13+36
	add	r2, r5, #57344
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L13+40
	add	r2, r5, #65536
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	mov	r2, #83886080
	add	r2, r2, #512
	mov	r3, #256
	mov	r0, #3
	ldr	r1, .L13+44
	mov	lr, pc
	bx	r4
	ldr	r3, .L13+48
	mov	r2, #2
	str	r2, [r3, #0]
	ldmfd	sp!, {r4, r5, r6, lr}
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
	.word	bg2Tiles
	.word	bg2Map
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
	mov	r1, #118784
	mov	r2, #11008
	ldr	r0, .L23+24
	add	r1, r1, #217
	add	r2, r2, #17
	mov	r3, #1
	ldr	ip, .L23+28
	mov	lr, pc
	bx	ip
	mov	r3, #67108864
	mov	r1, #7936	@ movhi
	strh	r1, [r3, #8]	@ movhi
	ldr	r1, .L23+32
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
	.word	winMusic
	.word	playSoundA
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
	stmfd	sp!, {r3, lr}
	ldr	r3, .L34
	mov	lr, pc
	bx	r3
	ldr	r2, .L34+4
	ldr	r1, [r2, #0]
	mov	r3, #1024
	add	r1, r1, #1
	str	r1, [r2, #0]
	add	r3, r3, #3
	mov	r2, #67108864
	cmp	r1, #2
	strh	r3, [r2, #0]	@ movhi
	bgt	.L33
	ldr	r0, .L34+8
	ldr	r3, .L34+12
	mov	lr, pc
	bx	r3
.L32:
	mov	r1, #67584
	mov	r2, #11008
	add	r2, r2, #17
	mov	r3, #1
	ldr	r0, .L34+16
	add	r1, r1, #26
	ldr	ip, .L34+20
	mov	lr, pc
	bx	ip
	ldr	r3, .L34+24
	mov	r2, #4
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, lr}
	bx	lr
.L33:
	ldr	r0, .L34+28
	ldr	r3, .L34+12
	mov	lr, pc
	bx	r3
	b	.L32
.L35:
	.align	2
.L34:
	.word	waitForVBlank
	.word	gamesLost
	.word	loseBitmap
	.word	drawFullscreenImage3
	.word	loseMusic
	.word	playSoundA
	.word	state
	.word	lose2Bitmap
	.size	goToLose, .-goToLose
	.align	2
	.global	lose
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L39
	stmfd	sp!, {r4, lr}
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L36
	ldr	r3, .L39+4
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L38
.L36:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L38:
	ldr	r3, .L39+8
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r4, lr}
	b	goToSplash
.L40:
	.align	2
.L39:
	.word	oldButtons
	.word	buttons
	.word	initialize
	.size	lose, .-lose
	.align	2
	.global	goToPause
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r3, .L42
	mov	lr, pc
	bx	r3
	ldr	r0, .L42+4
	ldr	r3, .L42+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L42+12
	mov	r0, #3
	ldr	r1, .L42+16
	mov	r2, #100663296
	mov	r3, #3856
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L42+20
	add	r2, r2, #63488
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r1, #199680
	add	r1, r1, #520
	mov	r2, #11008
	ldr	r0, .L42+24
	add	r1, r1, #1
	add	r2, r2, #17
	mov	r3, #1
	ldr	ip, .L42+28
	mov	lr, pc
	bx	ip
	mov	r3, #67108864
	mov	r1, #7936	@ movhi
	strh	r1, [r3, #8]	@ movhi
	ldr	r1, .L42+32
	mov	r2, #0
	mov	r0, #5
	str	r0, [r1, #0]
	strh	r2, [r3, #16]	@ movhi
	strh	r2, [r3, #18]	@ movhi
	mov	r2, #256	@ movhi
	strh	r2, [r3, #0]	@ movhi
	ldmfd	sp!, {r4, lr}
	bx	lr
.L43:
	.align	2
.L42:
	.word	waitForVBlank
	.word	pausePal
	.word	loadPalette
	.word	DMANow
	.word	pauseTiles
	.word	pauseMap
	.word	pauseMusic
	.word	playSoundA
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	game
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L47
	ldr	r1, .L47+4
	stmfd	sp!, {r4, lr}
	ldr	r2, [r3, #0]
	ldrh	r0, [r1, #0]
	add	r2, r2, #1
	mov	r1, #67108864
	strh	r0, [r1, #20]	@ movhi
	str	r2, [r3, #0]
	ldr	r3, .L47+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L47+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L47+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L47+20
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L44
	ldr	r3, .L47+24
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L46
.L44:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L46:
	ldmfd	sp!, {r4, lr}
	b	goToPause
.L48:
	.align	2
.L47:
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
	ldr	r3, .L54
	stmfd	sp!, {r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L54+4
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L50
	ldr	r2, .L54+8
	ldrh	r2, [r2, #0]
	tst	r2, #8
	beq	.L52
.L50:
	tst	r3, #4
	beq	.L49
	ldr	r3, .L54+8
	ldrh	r3, [r3, #0]
	tst	r3, #4
	beq	.L53
.L49:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L53:
	ldr	r3, .L54+12
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r4, lr}
	b	goToSplash
.L52:
	ldmfd	sp!, {r4, lr}
	b	goToGame
.L55:
	.align	2
.L54:
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
	ldr	r3, .L69
	mov	lr, pc
	bx	r3
	bl	goToSplash
	ldr	r3, .L69+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L69+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L69+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L69+16
	mov	r2, #0
	mov	r5, #67108864
	str	r2, [r3, #0]
	ldr	r4, .L69+20
	ldr	r7, .L69+24
	ldr	r6, .L69+28
	add	r5, r5, #256
.L68:
	ldrh	r3, [r4, #0]
	ldr	r2, [r7, #0]
.L58:
	strh	r3, [r6, #0]	@ movhi
	ldrh	r3, [r5, #48]
	strh	r3, [r4, #0]	@ movhi
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L58
.L65:
	.word	.L59
	.word	.L60
	.word	.L61
	.word	.L62
	.word	.L63
	.word	.L64
.L64:
	bl	pause
	b	.L68
.L63:
	bl	lose
	b	.L68
.L62:
	bl	win
	b	.L68
.L61:
	bl	game
	b	.L68
.L60:
	bl	instructions
	b	.L68
.L59:
	bl	splash
	b	.L68
.L70:
	.align	2
.L69:
	.word	hideSprites
	.word	initialize
	.word	setupSounds
	.word	setupInterrupts
	.word	gamesLost
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
