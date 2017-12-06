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
	stmfd	sp!, {r3, lr}
	ldr	r3, .L9
	mov	r2, #0
	str	r2, [r3, #0]
	bl	splashBG
	ldr	r3, .L9+4
	mov	lr, pc
	bx	r3
	mov	r1, #199680
	mov	r2, #11008
	add	r2, r2, #17
	mov	r3, #1
	ldr	r0, .L9+8
	add	r1, r1, #77
	ldr	ip, .L9+12
	mov	lr, pc
	bx	ip
	ldr	r2, .L9+16
	ldr	r3, .L9+20
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, lr}
	bx	lr
.L10:
	.align	2
.L9:
	.word	instructionsInt
	.word	waitForVBlank
	.word	splashMusic
	.word	playSoundA
	.word	splash
	.word	state
	.size	goToSplash, .-goToSplash
	.align	2
	.global	lose
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L14
	stmfd	sp!, {r4, lr}
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L11
	ldr	r3, .L14+4
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L13
.L11:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L13:
	ldr	r3, .L14+8
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r4, lr}
	b	goToSplash
.L15:
	.align	2
.L14:
	.word	oldButtons
	.word	buttons
	.word	initialize
	.size	lose, .-lose
	.align	2
	.global	win
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L19
	stmfd	sp!, {r4, lr}
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L16
	ldr	r3, .L19+4
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L18
.L16:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L18:
	ldr	r3, .L19+8
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r4, lr}
	b	goToSplash
.L20:
	.align	2
.L19:
	.word	oldButtons
	.word	buttons
	.word	initialize
	.size	win, .-win
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	ldr	r3, .L23
	mov	lr, pc
	bx	r3
	bl	goToSplash
	ldr	r3, .L23+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L23+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L23+12
	mov	lr, pc
	bx	r3
	ldr	r2, .L23+16
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r2, .L23+20
	mov	r5, #67108864
	str	r3, [r2, #0]
	ldr	r7, .L23+24
	ldr	r4, .L23+28
	ldr	r6, .L23+32
	add	r5, r5, #256
.L22:
	ldrh	r3, [r4, #0]
	strh	r3, [r7, #0]	@ movhi
	ldrh	r3, [r5, #48]
	strh	r3, [r4, #0]	@ movhi
	ldr	ip, [r6, #0]
	mov	lr, pc
	bx	ip
	b	.L22
.L24:
	.align	2
.L23:
	.word	hideSprites
	.word	initialize
	.word	setupSounds
	.word	setupInterrupts
	.word	gamesLost
	.word	restart
	.word	oldButtons
	.word	buttons
	.word	state
	.size	main, .-main
	.align	2
	.global	goToInstructions
	.type	goToInstructions, %function
goToInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	ldr	r3, .L26
	mov	lr, pc
	bx	r3
	mov	r3, #1024
	mov	r2, #67108864
	add	r3, r3, #3
	strh	r3, [r2, #0]	@ movhi
	ldr	r0, .L26+4
	ldr	r3, .L26+8
	mov	lr, pc
	bx	r3
	ldr	r2, .L26+12
	ldr	r3, .L26+16
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, lr}
	bx	lr
.L27:
	.align	2
.L26:
	.word	waitForVBlank
	.word	instructionsBitmap
	.word	drawFullscreenImage3
	.word	instructions
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
	ldr	r3, .L29
	mov	lr, pc
	bx	r3
	mov	r1, #139264
	mov	r2, #11008
	add	r1, r1, #260
	add	r2, r2, #17
	ldr	ip, .L29+4
	mov	r3, #1
	ldr	r0, .L29+8
	mov	lr, pc
	bx	ip
	ldr	r0, .L29+12
	ldr	r3, .L29+16
	mov	lr, pc
	bx	r3
	mov	r6, #67108864
	mov	ip, #4864	@ movhi
	mov	r5, #100663296
	strh	ip, [r6, #0]	@ movhi
	mov	r3, #6528
	mov	ip, #24064	@ movhi
	ldr	r4, .L29+20
	strh	ip, [r6, #10]	@ movhi
	mov	r0, #3
	ldr	r1, .L29+24
	mov	r2, r5
	add	r3, r3, #32
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L29+28
	add	r2, r5, #61440
	mov	r3, #2048
	mov	lr, pc
	bx	r4
	mov	ip, #7168
	add	ip, ip, #4
	strh	ip, [r6, #8]	@ movhi
	mov	r0, #3
	ldr	r1, .L29+32
	add	r2, r5, #16384
	mov	r3, #288
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L29+36
	add	r2, r5, #57344
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L29+40
	add	r2, r5, #65536
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	mov	r2, #83886080
	add	r2, r2, #512
	mov	r3, #256
	mov	r0, #3
	ldr	r1, .L29+44
	mov	lr, pc
	bx	r4
	ldr	r2, .L29+48
	ldr	r3, .L29+52
	str	r2, [r3, #0]
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L30:
	.align	2
.L29:
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
	.word	game
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	instructions
	.type	instructions, %function
instructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L36
	stmfd	sp!, {r4, lr}
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L32
	ldr	r2, .L36+4
	ldrh	r2, [r2, #0]
	tst	r2, #8
	beq	.L34
.L32:
	tst	r3, #4
	beq	.L31
	ldr	r3, .L36+4
	ldrh	r3, [r3, #0]
	tst	r3, #4
	beq	.L35
.L31:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L35:
	ldr	r3, .L36+8
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r4, lr}
	b	goToSplash
.L34:
	ldmfd	sp!, {r4, lr}
	b	goToGame
.L37:
	.align	2
.L36:
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
	ldr	r5, .L50
	ldrh	r3, [r5, #0]
	tst	r3, #128
	beq	.L47
	ldr	r2, .L50+4
	ldrh	r2, [r2, #0]
	tst	r2, #128
	beq	.L46
.L47:
	ldr	r4, .L50+8
.L39:
	tst	r3, #64
	beq	.L40
	ldr	r2, .L50+4
	ldrh	r2, [r2, #0]
	ands	r2, r2, #64
	beq	.L48
.L40:
	ldr	r2, [r4, #0]
	cmp	r2, #0
	beq	.L41
	tst	r3, #8
	beq	.L38
	ldr	r3, .L50+4
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L49
.L38:
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L41:
	tst	r3, #8
	beq	.L38
	ldr	r3, .L50+4
	ldrh	r3, [r3, #0]
	tst	r3, #8
	bne	.L38
	ldmfd	sp!, {r4, r5, r6, lr}
	b	goToGame
.L48:
	str	r2, [r4, #0]
	bl	splashBG
	ldrh	r3, [r5, #0]
	b	.L40
.L46:
	ldr	r4, .L50+8
	mov	r3, #1
	str	r3, [r4, #0]
	bl	splashBG
	ldrh	r3, [r5, #0]
	b	.L39
.L49:
	ldmfd	sp!, {r4, r5, r6, lr}
	b	goToInstructions
.L51:
	.align	2
.L50:
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
	ldr	r3, .L53
	mov	lr, pc
	bx	r3
	mov	r3, #1024
	mov	r2, #67108864
	add	r3, r3, #3
	strh	r3, [r2, #0]	@ movhi
	ldr	r0, .L53+4
	ldr	r3, .L53+8
	mov	lr, pc
	bx	r3
	mov	r1, #118784
	mov	r2, #11008
	ldr	r0, .L53+12
	add	r1, r1, #217
	add	r2, r2, #17
	mov	r3, #1
	ldr	ip, .L53+16
	mov	lr, pc
	bx	ip
	mov	r3, #7808
	ldr	r2, .L53+20
	add	r3, r3, #62
	mov	r0, #92
	mov	r1, #110
	ldr	ip, .L53+24
	mov	lr, pc
	bx	ip
	ldr	r2, .L53+28
	ldr	r3, .L53+32
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, lr}
	bx	lr
.L54:
	.align	2
.L53:
	.word	waitForVBlank
	.word	winBitmap
	.word	drawFullscreenImage3
	.word	winMusic
	.word	playSoundA
	.word	buffer
	.word	drawString
	.word	win
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	goToLose
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	ldr	r3, .L59
	mov	lr, pc
	bx	r3
	ldr	r2, .L59+4
	ldr	r1, [r2, #0]
	mov	r3, #1024
	add	r1, r1, #1
	str	r1, [r2, #0]
	add	r3, r3, #3
	mov	r2, #67108864
	cmp	r1, #2
	strh	r3, [r2, #0]	@ movhi
	bgt	.L58
	ldr	r0, .L59+8
	ldr	r3, .L59+12
	mov	lr, pc
	bx	r3
.L57:
	mov	r3, #7808
	mov	r0, #92
	mov	r1, #110
	ldr	r2, .L59+16
	add	r3, r3, #62
	ldr	ip, .L59+20
	mov	lr, pc
	bx	ip
	mov	r1, #67584
	mov	r2, #11008
	add	r2, r2, #17
	mov	r3, #1
	ldr	r0, .L59+24
	add	r1, r1, #26
	ldr	ip, .L59+28
	mov	lr, pc
	bx	ip
	ldr	r2, .L59+32
	ldr	r3, .L59+36
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, lr}
	bx	lr
.L58:
	ldr	r0, .L59+40
	ldr	r3, .L59+12
	mov	lr, pc
	bx	r3
	b	.L57
.L60:
	.align	2
.L59:
	.word	waitForVBlank
	.word	gamesLost
	.word	loseBitmap
	.word	drawFullscreenImage3
	.word	buffer
	.word	drawString
	.word	loseMusic
	.word	playSoundA
	.word	lose
	.word	state
	.word	lose2Bitmap
	.size	goToLose, .-goToLose
	.align	2
	.global	pauseBG
	.type	pauseBG, %function
pauseBG:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	ldr	r3, .L65
	ldr	r2, [r3, #0]
	mov	r3, #1024
	add	r3, r3, #3
	cmp	r2, #0
	mov	r2, #67108864
	strh	r3, [r2, #0]	@ movhi
	bne	.L64
	ldr	r0, .L65+4
	ldr	r3, .L65+8
	mov	lr, pc
	bx	r3
.L61:
	ldmfd	sp!, {r3, lr}
	bx	lr
.L64:
	ldr	r0, .L65+12
	ldr	r3, .L65+8
	mov	lr, pc
	bx	r3
	b	.L61
.L66:
	.align	2
.L65:
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
	ldr	r5, .L79
	ldrh	r3, [r5, #0]
	tst	r3, #128
	beq	.L76
	ldr	r2, .L79+4
	ldrh	r2, [r2, #0]
	tst	r2, #128
	beq	.L75
.L76:
	ldr	r4, .L79+8
.L68:
	tst	r3, #64
	beq	.L69
	ldr	r2, .L79+4
	ldrh	r2, [r2, #0]
	ands	r2, r2, #64
	beq	.L77
.L69:
	ldr	r2, [r4, #0]
	cmp	r2, #0
	beq	.L70
	tst	r3, #8
	beq	.L67
	ldr	r3, .L79+4
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L78
.L67:
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L70:
	tst	r3, #8
	beq	.L67
	ldr	r3, .L79+4
	ldrh	r3, [r3, #0]
	tst	r3, #8
	bne	.L67
	ldmfd	sp!, {r4, r5, r6, lr}
	b	goToGame
.L77:
	str	r2, [r4, #0]
	bl	pauseBG
	ldrh	r3, [r5, #0]
	b	.L69
.L75:
	ldr	r4, .L79+8
	mov	r3, #1
	str	r3, [r4, #0]
	bl	pauseBG
	ldrh	r3, [r5, #0]
	b	.L68
.L78:
	ldr	r3, .L79+12
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r4, r5, r6, lr}
	b	goToSplash
.L80:
	.align	2
.L79:
	.word	oldButtons
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
	mov	r1, #185344
	mov	r2, #11008
	stmfd	sp!, {r3, lr}
	ldr	r0, .L82
	add	r1, r1, #225
	ldr	ip, .L82+4
	add	r2, r2, #17
	mov	r3, #1
	mov	lr, pc
	bx	ip
	ldr	r3, .L82+8
	mov	r2, #0
	str	r2, [r3, #0]
	ldr	r3, .L82+12
	mov	lr, pc
	bx	r3
	bl	pauseBG
	ldr	r2, .L82+16
	ldr	r3, .L82+20
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, lr}
	bx	lr
.L83:
	.align	2
.L82:
	.word	pauseMusic
	.word	playSoundA
	.word	restart
	.word	waitForVBlank
	.word	pause
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	game
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L87
	stmfd	sp!, {r4, lr}
	ldr	r0, .L87+4
	ldr	r2, [r3, #0]
	ldr	r1, .L87+8
	ldr	r3, .L87+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L87+16
	ldr	r1, .L87+20
	ldr	r2, [r3, #0]
	ldrh	r0, [r1, #0]
	add	r2, r2, #1
	mov	r1, #67108864
	strh	r0, [r1, #20]	@ movhi
	str	r2, [r3, #0]
	ldr	r3, .L87+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L87+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L87+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L87+36
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L84
	ldr	r3, .L87+40
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L86
.L84:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L86:
	ldmfd	sp!, {r4, lr}
	b	goToPause
.L88:
	.align	2
.L87:
	.word	score
	.word	buffer
	.word	.LC0
	.word	sprintf
	.word	.LANCHOR0
	.word	hOff
	.word	waitForVBlank
	.word	update
	.word	draw
	.word	oldButtons
	.word	buttons
	.size	game, .-game
	.global	timer
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.comm	gamesLost,4,4
	.comm	score,4,4
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
