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
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #-1224736768
	ldr	r2, .L4
	mov	r1, #67108864
	mov	r3, r3, asr #17
	mov	ip, #4352	@ movhi
	strh	r3, [r1, #8]	@ movhi
	ldr	r0, .L4+4
	ldr	r3, [r2, #0]
	strh	ip, [r1, #0]	@ movhi
.L2:
	str	r3, [r0, #0]
	ldr	r3, [r1, #304]
	str	r3, [r2, #0]
	b	.L2
.L5:
	.align	2
.L4:
	.word	buttons
	.word	oldButtons
	.size	main, .-main
	.global	timer
	.comm	oldButtons,4,4
	.comm	buttons,4,4
	.comm	state,4,4
	.bss
	.align	2
	.type	timer, %object
	.size	timer, 4
timer:
	.space	4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
