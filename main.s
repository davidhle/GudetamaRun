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
	.global	splashBG
	.type	splashBG, %function
splashBG:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	ldr	r3, .L6
	ldr	r2, [r3, #0]
	mov	r3, #1024
	add	r3, r3, #3
	cmp	r2, #0
	mov	r2, #67108864
	strh	r3, [r2, #0]	@ movhi
	bne	.L5
	ldr	r0, .L6+4
	ldr	r3, .L6+8
	mov	lr, pc
	bx	r3
.L1:
	ldmfd	sp!, {r3, lr}
	bx	lr
.L5:
	ldr	r0, .L6+12
	ldr	r3, .L6+8
	mov	lr, pc
	bx	r3
	b	.L1
.L7:
	.align	2
.L6:
	.word	instructionsInt
	.word	splashBitmap
	.word	drawFullscreenImage3
	.word	splash2Bitmap
	.size	splashBG, .-splashBG
	.align	2
	.global	goToSplash
	.type	goToSplash, %function
goToSplash:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L9
	stmfd	sp!, {r4, lr}
	mov	r4, #0
	str	r4, [r3, #0]
	bl	splashBG
	ldr	r3, .L9+4
	mov	lr, pc
	bx	r3
	mov	r1, #199680
	mov	r2, #11008
	mov	r3, #1
	ldr	r0, .L9+8
	add	r1, r1, #77
	add	r2, r2, #17
	ldr	ip, .L9+12
	mov	lr, pc
	bx	ip
	ldr	r3, .L9+16
	str	r4, [r3, #0]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L10:
	.align	2
.L9:
	.word	instructionsInt
	.word	waitForVBlank
	.word	splashMusic
	.word	playSoundA
	.word	state
	.size	goToSplash, .-goToSplash
	.align	2
	.global	goToInstructions
	.type	goToInstructions, %function
goToInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	ldr	r3, .L12
	mov	lr, pc
	bx	r3
	mov	r3, #1024
	mov	r2, #67108864
	add	r3, r3, #3
	strh	r3, [r2, #0]	@ movhi
	ldr	r0, .L12+4
	ldr	r3, .L12+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L12+12
	mov	r2, #1
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	waitForVBlank
	.word	instructionsBitmap
	.word	drawFullscreenImage3
	.word	state
	.size	goToInstructions, .-goToInstructions
	.align	2
	.global	goToGame
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r3, .L15
	mov	lr, pc
	bx	r3
	mov	r1, #139264
	mov	r2, #11008
	add	r1, r1, #260
	add	r2, r2, #17
	ldr	ip, .L15+4
	mov	r3, #1
	ldr	r0, .L15+8
	mov	lr, pc
	bx	ip
	ldr	r0, .L15+12
	ldr	r3, .L15+16
	mov	lr, pc
	bx	r3
	mov	r6, #67108864
	mov	ip, #4864	@ movhi
	mov	r5, #100663296
	strh	ip, [r6, #0]	@ movhi
	mov	r3, #6528
	mov	ip, #24064	@ movhi
	ldr	r4, .L15+20
	strh	ip, [r6, #10]	@ movhi
	mov	r0, #3
	ldr	r1, .L15+24
	mov	r2, r5
	add	r3, r3, #32
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L15+28
	add	r2, r5, #61440
	mov	r3, #2048
	mov	lr, pc
	bx	r4
	mov	ip, #7168
	add	ip, ip, #4
	strh	ip, [r6, #8]	@ movhi
	mov	r0, #3
	ldr	r1, .L15+32
	add	r2, r5, #16384
	mov	r3, #288
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L15+36
	add	r2, r5, #57344
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L15+40
	add	r2, r5, #65536
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	mov	r2, #83886080
	add	r2, r2, #512
	mov	r3, #256
	mov	r0, #3
	ldr	r1, .L15+44
	mov	lr, pc
	bx	r4
	ldr	r3, .L15+48
	mov	r2, #2
	str	r2, [r3, #0]
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L16:
	.align	2
.L15:
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
	ldr	r3, .L22
	stmfd	sp!, {r4, lr}
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L18
	ldr	r2, .L22+4
	ldrh	r2, [r2, #0]
	tst	r2, #8
	beq	.L20
.L18:
	tst	r3, #4
	beq	.L17
	ldr	r3, .L22+4
	ldrh	r3, [r3, #0]
	tst	r3, #4
	beq	.L21
.L17:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L21:
	ldr	r3, .L22+8
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r4, lr}
	b	goToSplash
.L20:
	ldmfd	sp!, {r4, lr}
	b	goToGame
.L23:
	.align	2
.L22:
	.word	oldButtons
	.word	buttons
	.word	initialize
	.size	instructions, .-instructions
	.align	2
	.global	splash
	.type	splash, %function
splash:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r5, .L36
	ldrh	r3, [r5, #0]
	tst	r3, #128
	beq	.L33
	ldr	r2, .L36+4
	ldrh	r2, [r2, #0]
	tst	r2, #128
	beq	.L32
.L33:
	ldr	r4, .L36+8
.L25:
	tst	r3, #64
	beq	.L26
	ldr	r2, .L36+4
	ldrh	r2, [r2, #0]
	ands	r2, r2, #64
	beq	.L34
.L26:
	ldr	r2, [r4, #0]
	cmp	r2, #0
	beq	.L27
	tst	r3, #8
	beq	.L24
	ldr	r3, .L36+4
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L35
.L24:
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L27:
	tst	r3, #8
	beq	.L24
	ldr	r3, .L36+4
	ldrh	r3, [r3, #0]
	tst	r3, #8
	bne	.L24
	ldmfd	sp!, {r4, r5, r6, lr}
	b	goToGame
.L34:
	str	r2, [r4, #0]
	bl	splashBG
	ldrh	r3, [r5, #0]
	b	.L26
.L32:
	ldr	r4, .L36+8
	mov	r3, #1
	str	r3, [r4, #0]
	bl	splashBG
	ldrh	r3, [r5, #0]
	b	.L25
.L35:
	ldmfd	sp!, {r4, r5, r6, lr}
	b	goToInstructions
.L37:
	.align	2
.L36:
	.word	oldButtons
	.word	buttons
	.word	instructionsInt
	.size	splash, .-splash
	.align	2
	.global	goToWin
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	ldr	r3, .L39
	mov	lr, pc
	bx	r3
	mov	r3, #1024
	mov	r2, #67108864
	add	r3, r3, #3
	strh	r3, [r2, #0]	@ movhi
	ldr	r0, .L39+4
	ldr	r3, .L39+8
	mov	lr, pc
	bx	r3
	mov	r1, #118784
	mov	r2, #11008
	ldr	r0, .L39+12
	add	r1, r1, #217
	add	r2, r2, #17
	mov	r3, #1
	ldr	ip, .L39+16
	mov	lr, pc
	bx	ip
	mov	r3, #7808
	ldr	r2, .L39+20
	add	r3, r3, #62
	mov	r0, #92
	mov	r1, #110
	ldr	ip, .L39+24
	mov	lr, pc
	bx	ip
	ldr	r3, .L39+28
	mov	r2, #3
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, lr}
	bx	lr
.L40:
	.align	2
.L39:
	.word	waitForVBlank
	.word	winBitmap
	.word	drawFullscreenImage3
	.word	winMusic
	.word	playSoundA
	.word	buffer
	.word	drawString
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	win
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L44
	stmfd	sp!, {r4, lr}
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L41
	ldr	r3, .L44+4
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L43
.L41:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L43:
	ldr	r3, .L44+8
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r4, lr}
	b	goToSplash
.L45:
	.align	2
.L44:
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
	ldr	r3, .L50
	mov	lr, pc
	bx	r3
	ldr	r2, .L50+4
	ldr	r1, [r2, #0]
	mov	r3, #1024
	add	r1, r1, #1
	str	r1, [r2, #0]
	add	r3, r3, #3
	mov	r2, #67108864
	cmp	r1, #2
	strh	r3, [r2, #0]	@ movhi
	bgt	.L49
	ldr	r0, .L50+8
	ldr	r3, .L50+12
	mov	lr, pc
	bx	r3
.L48:
	mov	r3, #7808
	mov	r0, #92
	mov	r1, #110
	ldr	r2, .L50+16
	add	r3, r3, #62
	ldr	ip, .L50+20
	mov	lr, pc
	bx	ip
	mov	r1, #67584
	mov	r2, #11008
	add	r2, r2, #17
	mov	r3, #1
	ldr	r0, .L50+24
	add	r1, r1, #26
	ldr	ip, .L50+28
	mov	lr, pc
	bx	ip
	ldr	r3, .L50+32
	mov	r2, #4
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, lr}
	bx	lr
.L49:
	ldr	r0, .L50+36
	ldr	r3, .L50+12
	mov	lr, pc
	bx	r3
	b	.L48
.L51:
	.align	2
.L50:
	.word	waitForVBlank
	.word	gamesLost
	.word	loseBitmap
	.word	drawFullscreenImage3
	.word	buffer
	.word	drawString
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
	ldr	r3, .L55
	stmfd	sp!, {r4, lr}
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L52
	ldr	r3, .L55+4
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L54
.L52:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L54:
	ldr	r3, .L55+8
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r4, lr}
	b	goToSplash
.L56:
	.align	2
.L55:
	.word	oldButtons
	.word	buttons
	.word	initialize
	.size	lose, .-lose
	.align	2
	.global	pauseBG
	.type	pauseBG, %function
pauseBG:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	ldr	r3, .L61
	ldr	r2, [r3, #0]
	mov	r3, #1024
	add	r3, r3, #3
	cmp	r2, #0
	mov	r2, #67108864
	strh	r3, [r2, #0]	@ movhi
	bne	.L60
	ldr	r0, .L61+4
	ldr	r3, .L61+8
	mov	lr, pc
	bx	r3
.L57:
	ldmfd	sp!, {r3, lr}
	bx	lr
.L60:
	ldr	r0, .L61+12
	ldr	r3, .L61+8
	mov	lr, pc
	bx	r3
	b	.L57
.L62:
	.align	2
.L61:
	.word	restart
	.word	pauseBitmap
	.word	drawFullscreenImage3
	.word	pause2Bitmap
	.size	pauseBG, .-pauseBG
	.align	2
	.global	pause
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r5, .L75
	ldr	r3, .L75+4
	mov	lr, pc
	bx	r3
	ldrh	r3, [r5, #0]
	tst	r3, #128
	beq	.L72
	ldr	r2, .L75+8
	ldrh	r2, [r2, #0]
	tst	r2, #128
	beq	.L71
.L72:
	ldr	r4, .L75+12
.L64:
	tst	r3, #64
	beq	.L65
	ldr	r2, .L75+8
	ldrh	r2, [r2, #0]
	ands	r2, r2, #64
	beq	.L73
.L65:
	ldr	r2, [r4, #0]
	cmp	r2, #0
	beq	.L66
	tst	r3, #8
	beq	.L63
	ldr	r3, .L75+8
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L74
.L63:
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L66:
	tst	r3, #8
	beq	.L63
	ldr	r3, .L75+8
	ldrh	r3, [r3, #0]
	tst	r3, #8
	bne	.L63
	ldmfd	sp!, {r4, r5, r6, lr}
	b	goToGame
.L73:
	str	r2, [r4, #0]
	bl	pauseBG
	ldrh	r3, [r5, #0]
	b	.L65
.L71:
	ldr	r4, .L75+12
	mov	r3, #1
	str	r3, [r4, #0]
	bl	pauseBG
	ldrh	r3, [r5, #0]
	b	.L64
.L74:
	ldr	r3, .L75+16
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r4, r5, r6, lr}
	b	goToSplash
.L76:
	.align	2
.L75:
	.word	oldButtons
	.word	waitForVBlank
	.word	buttons
	.word	restart
	.word	initialize
	.size	pause, .-pause
	.align	2
	.global	goToPause
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	ldr	r3, .L78
	mov	lr, pc
	bx	r3
	bl	pauseBG
	mov	r1, #199680
	add	r1, r1, #520
	mov	r2, #11008
	add	r2, r2, #17
	mov	r3, #1
	ldr	r0, .L78+4
	add	r1, r1, #1
	ldr	ip, .L78+8
	mov	lr, pc
	bx	ip
	ldr	r3, .L78+12
	mov	r2, #5
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, lr}
	bx	lr
.L79:
	.align	2
.L78:
	.word	waitForVBlank
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
	ldr	r3, .L83
	stmfd	sp!, {r4, lr}
	ldr	r1, .L83+4
	ldr	r2, [r3, #0]
	ldr	r0, .L83+8
	ldr	r3, .L83+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L83+16
	ldr	r1, .L83+20
	ldr	r2, [r3, #0]
	ldrh	r0, [r1, #0]
	add	r2, r2, #1
	mov	r1, #67108864
	strh	r0, [r1, #20]	@ movhi
	str	r2, [r3, #0]
	ldr	r3, .L83+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L83+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L83+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L83+36
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L80
	ldr	r3, .L83+40
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L82
.L80:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L82:
	ldmfd	sp!, {r4, lr}
	b	goToPause
.L84:
	.align	2
.L83:
	.word	score
	.word	.LC0
	.word	buffer
	.word	sprintf
	.word	.LANCHOR0
	.word	hOff
	.word	waitForVBlank
	.word	update
	.word	draw
	.word	oldButtons
	.word	buttons
	.size	game, .-game
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	ldr	r3, .L98
	mov	lr, pc
	bx	r3
	bl	goToSplash
	ldr	r3, .L98+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L98+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L98+12
	mov	lr, pc
	bx	r3
	ldr	r2, .L98+16
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r2, .L98+20
	mov	r5, #67108864
	str	r3, [r2, #0]
	ldr	r4, .L98+24
	ldr	r7, .L98+28
	ldr	r6, .L98+32
	add	r5, r5, #256
.L97:
	ldrh	r3, [r4, #0]
	ldr	r2, [r7, #0]
.L87:
	strh	r3, [r6, #0]	@ movhi
	ldrh	r3, [r5, #48]
	strh	r3, [r4, #0]	@ movhi
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L87
.L94:
	.word	.L88
	.word	.L89
	.word	.L90
	.word	.L91
	.word	.L92
	.word	.L93
.L93:
	bl	pause
	b	.L97
.L92:
	bl	lose
	b	.L97
.L91:
	bl	win
	b	.L97
.L90:
	bl	game
	b	.L97
.L89:
	bl	instructions
	b	.L97
.L88:
	bl	splash
	b	.L97
.L99:
	.align	2
.L98:
	.word	hideSprites
	.word	initialize
	.word	setupSounds
	.word	setupInterrupts
	.word	gamesLost
	.word	restart
	.word	buttons
	.word	state
	.word	oldButtons
	.size	main, .-main
	.global	timer
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	gamesLost,4,4
	.comm	score,4,4
	.comm	state,4,4
	.comm	hOff,4,4
	.comm	instructionsInt,4,4
	.comm	restart,4,4
	.comm	buffer,41,4
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"%d\000"
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	timer, %object
	.size	timer, 4
timer:
	.space	4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
