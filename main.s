	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Raining Gold\000"
	.align	2
.LC1:
	.ascii	"Press Start to Play\000"
	.text
	.align	2
	.global	goToStart
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r2, #83886080
	sub	sp, sp, #24
	ldr	r1, .L4
	mov	r3, #256
	mov	r0, #3
	ldr	r4, .L4+4
	mov	lr, pc
	bx	r4
	ldr	r0, .L4+8
	ldr	r3, .L4+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+16
	mov	lr, pc
	bx	r3
	ldr	r4, .L4+20
	mov	r3, #255
	mov	r1, #72
	mov	r0, #80
	ldr	r2, .L4+24
	mov	lr, pc
	bx	r4
	mov	r3, #255
	mov	r1, #100
	mov	r0, #70
	ldr	r2, .L4+28
	mov	lr, pc
	bx	r4
	add	r2, sp, #4
	mov	r1, #120
	mov	r0, #80
	mov	r3, #255
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+32
	mov	lr, pc
	bx	r3
	mov	r2, #0
	ldr	r3, .L4+36
	strb	r2, [r3]
	add	sp, sp, #24
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	startscreenPal
	.word	DMANow
	.word	startscreenBitmap
	.word	drawFullscreenImage4
	.word	waitForVBlank
	.word	drawString4
	.word	.LC0
	.word	.LC1
	.word	flipPages
	.word	state
	.size	goToStart, .-goToStart
	.section	.rodata.str1.4
	.align	2
.LC2:
	.ascii	"%d\000"
	.text
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	push	{r4, lr}
	mov	r4, #0
	ldr	r1, .L8
	ldr	r3, .L8+4
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+8
	ldr	r2, .L8+12
	ldrh	ip, [r3, #48]
	ldr	r1, .L8+16
	mov	r0, r4
	ldr	r3, .L8+20
	strh	r4, [r2]	@ movhi
	strh	ip, [r1]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+28
	mov	r2, r4
	str	r4, [r3]
	ldr	r1, .L8+32
	ldr	r0, .L8+36
	ldr	r3, .L8+40
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToStart
.L9:
	.align	2
.L8:
	.word	1044
	.word	initSound
	.word	67109120
	.word	oldButtons
	.word	buttons
	.word	time
	.word	srand
	.word	score
	.word	.LC2
	.word	scoreBuffer
	.word	sprintf
	.size	initialize, .-initialize
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateScoreboard.part.0, %function
updateScoreboard.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L14
	ldrh	r3, [r3]
	push	{r4, lr}
	ands	r4, r3, #8
	beq	.L13
	pop	{r4, lr}
	bx	lr
.L13:
	bl	goToStart
	ldr	r3, .L14+4
	strb	r4, [r3]
	pop	{r4, lr}
	bx	lr
.L15:
	.align	2
.L14:
	.word	buttons
	.word	state
	.size	updateScoreboard.part.0, .-updateScoreboard.part.0
	.align	2
	.global	goToPlay
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPlay, %function
goToPlay:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r2, #83886080
	ldr	r1, .L18
	mov	r3, #256
	mov	r0, #3
	ldr	r4, .L18+4
	mov	lr, pc
	bx	r4
	mov	r0, #255
	ldr	r3, .L18+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L18+12
	ldr	r2, .L18+16
	mov	r1, #1
	mov	r0, #220
	mov	r3, #255
	mov	lr, pc
	bx	r4
	ldr	r3, .L18+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L18+24
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L18+28
	strb	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L19:
	.align	2
.L18:
	.word	startscreenPal
	.word	DMANow
	.word	fillScreen4
	.word	drawString4
	.word	scoreBuffer
	.word	waitForVBlank
	.word	flipPages
	.word	state
	.size	goToPlay, .-goToPlay
	.section	.rodata.str1.4
	.align	2
.LC3:
	.ascii	"Paused\000"
	.align	2
.LC4:
	.ascii	"Press Select to Resume\000"
	.align	2
.LC5:
	.ascii	"Press Start for Scoreboard\000"
	.text
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r2, #83886080
	ldr	r1, .L22
	mov	r3, #256
	mov	r0, #3
	ldr	r4, .L22+4
	mov	lr, pc
	bx	r4
	mov	r0, #255
	ldr	r3, .L22+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L22+12
	mov	r3, #31
	mov	r1, #100
	mov	r0, #80
	ldr	r2, .L22+16
	mov	lr, pc
	bx	r4
	mov	r3, #31
	mov	r1, #120
	mov	r0, #60
	ldr	r2, .L22+20
	mov	lr, pc
	bx	r4
	ldr	r2, .L22+24
	mov	r1, #130
	mov	r0, #60
	mov	r3, #31
	mov	lr, pc
	bx	r4
	ldr	r3, .L22+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L22+32
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L22+36
	strb	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L23:
	.align	2
.L22:
	.word	startscreenPal
	.word	DMANow
	.word	fillScreen4
	.word	drawString4
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.word	waitForVBlank
	.word	flipPages
	.word	state
	.size	goToPause, .-goToPause
	.section	.rodata.str1.4
	.align	2
.LC6:
	.ascii	"Congrats, you collected 100 gold!\000"
	.align	2
.LC7:
	.ascii	"Press Start to Play Again\000"
	.text
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r2, #83886080
	ldr	r1, .L27
	mov	r3, #256
	mov	r0, #3
	ldr	r4, .L27+4
	mov	lr, pc
	bx	r4
	mov	r0, #255
	ldr	r3, .L27+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L27+12
	ldr	r2, .L27+16
	ldr	r1, [r3]
	ldr	r2, [r2]
	cmp	r2, r1
	strgt	r2, [r3]
	ldr	r4, .L27+20
	mov	r3, #31
	mov	r1, #100
	mov	r0, #40
	ldr	r2, .L27+24
	mov	lr, pc
	bx	r4
	ldr	r2, .L27+28
	mov	r1, #120
	mov	r3, #31
	mov	r0, #80
	mov	lr, pc
	bx	r4
	mov	r0, #16
	ldr	r3, .L27+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L27+36
	mov	lr, pc
	bx	r3
	ldr	r3, .L27+40
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L27+44
	strb	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L28:
	.align	2
.L27:
	.word	startscreenPal
	.word	DMANow
	.word	fillScreen4
	.word	.LANCHOR0
	.word	score
	.word	drawString4
	.word	.LC6
	.word	.LC7
	.word	playAnalogSound
	.word	waitForVBlank
	.word	flipPages
	.word	state
	.size	goToWin, .-goToWin
	.section	.rodata.str1.4
	.align	2
.LC8:
	.ascii	"Score:\000"
	.text
	.align	2
	.global	play
	.syntax unified
	.arm
	.fpu softvfp
	.type	play, %function
play:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L45
	mov	lr, pc
	bx	r3
	ldr	r4, .L45+4
	ldr	r3, .L45+8
	mov	lr, pc
	bx	r3
	ldr	r5, .L45+12
	mov	r3, #255
	mov	r1, #1
	mov	r0, #180
	ldr	r2, .L45+16
	mov	lr, pc
	bx	r5
	ldr	r2, [r4]
	ldr	r1, .L45+20
	ldr	r3, .L45+24
	ldr	r0, .L45+28
	mov	lr, pc
	bx	r3
	mov	r3, #255
	mov	r1, #1
	mov	r0, #220
	ldr	r2, .L45+28
	mov	lr, pc
	bx	r5
	ldr	r3, [r4]
	cmp	r3, #99
	bgt	.L41
.L30:
	ldr	r5, .L45+32
	ldrh	r3, [r5]
	tst	r3, #1
	beq	.L31
	ldr	r3, .L45+36
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L42
.L31:
	ldr	r3, .L45+40
	mov	lr, pc
	bx	r3
	ldr	r3, .L45+44
	mov	lr, pc
	bx	r3
	ldrh	r3, [r5]
	tst	r3, #4
	beq	.L32
	ldr	r3, .L45+36
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L43
.L32:
	ldr	r3, [r4]
	cmp	r3, #99
	bgt	.L44
	pop	{r4, r5, r6, lr}
	bx	lr
.L41:
	bl	goToWin
	b	.L30
.L44:
	pop	{r4, r5, r6, lr}
	b	goToWin
.L43:
	bl	goToPause
	mov	r0, #17
	ldr	r3, .L45+48
	mov	lr, pc
	bx	r3
	b	.L32
.L42:
	ldr	r3, .L45+52
	mov	lr, pc
	bx	r3
	mov	r0, #1
	ldr	r3, .L45+48
	mov	lr, pc
	bx	r3
	b	.L31
.L46:
	.align	2
.L45:
	.word	updateGame
	.word	score
	.word	drawGame
	.word	drawString4
	.word	.LC8
	.word	.LC2
	.word	sprintf
	.word	scoreBuffer
	.word	oldButtons
	.word	buttons
	.word	waitForVBlank
	.word	flipPages
	.word	playAnalogSound
	.word	fireBullet
	.size	play, .-play
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L52
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L52+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToStart
.L53:
	.align	2
.L52:
	.word	oldButtons
	.word	buttons
	.size	win, .-win
	.section	.rodata.str1.4
	.align	2
.LC9:
	.ascii	"Top Scores\000"
	.align	2
.LC10:
	.ascii	"Top Score: %d\000"
	.align	2
.LC11:
	.ascii	"Press Start to Return\000"
	.text
	.align	2
	.global	goToScoreboard
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToScoreboard, %function
goToScoreboard:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r3, .L57
	ldr	r5, .L57+4
	ldr	r3, [r3]
	ldr	r2, [r5]
	cmp	r3, r2
	sub	sp, sp, #36
	strgt	r3, [r5]
	mov	r0, #255
	ldr	r3, .L57+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L57+12
	mov	r3, #31
	mov	r1, #50
	mov	r0, #80
	ldr	r2, .L57+16
	mov	lr, pc
	bx	r4
	ldr	r2, [r5]
	mov	r0, sp
	ldr	r1, .L57+20
	ldr	r3, .L57+24
	mov	lr, pc
	bx	r3
	mov	r1, #80
	mov	r2, sp
	mov	r0, r1
	mov	r3, #31
	mov	lr, pc
	bx	r4
	mov	r1, #120
	mov	r0, #80
	ldr	r2, .L57+28
	mov	r3, #31
	mov	lr, pc
	bx	r4
	ldr	r3, .L57+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L57+36
	mov	lr, pc
	bx	r3
	mov	r2, #4
	ldr	r3, .L57+40
	strb	r2, [r3]
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L58:
	.align	2
.L57:
	.word	score
	.word	.LANCHOR0
	.word	fillScreen4
	.word	drawString4
	.word	.LC9
	.word	.LC10
	.word	sprintf
	.word	.LC11
	.word	waitForVBlank
	.word	flipPages
	.word	state
	.size	goToScoreboard, .-goToScoreboard
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L71
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L71+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L60
	ldr	r2, .L71+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L69
.L60:
	tst	r3, #4
	beq	.L59
	ldr	r3, .L71+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L70
.L59:
	pop	{r4, lr}
	bx	lr
.L69:
	bl	goToPlay
	ldr	r3, .L71+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L70:
	pop	{r4, lr}
	b	goToScoreboard
.L72:
	.align	2
.L71:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	initGame
	.size	start, .-start
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L87
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L74
	ldr	r2, .L87+4
	ldrh	r2, [r2]
	tst	r2, #4
	beq	.L86
.L74:
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L87+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	push	{r4, lr}
	bl	goToScoreboard
	mov	r2, #4
	ldr	r3, .L87+8
	strb	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L86:
	b	goToPlay
.L88:
	.align	2
.L87:
	.word	oldButtons
	.word	buttons
	.word	state
	.size	pause, .-pause
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r7, fp, lr}
	ldr	r6, .L105
	ldr	fp, .L105+4
	ldr	r3, .L105+8
	mov	lr, pc
	bx	r3
	ldr	r5, .L105+12
	ldrb	r2, [r6]	@ zero_extendqisi2
	ldrh	r0, [fp]
	ldr	r7, .L105+16
	ldr	r10, .L105+20
	ldr	r9, .L105+24
	ldr	r8, .L105+28
	ldr	r4, .L105+32
.L91:
	strh	r0, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [fp]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L99
.L93:
	.word	.L97
	.word	.L96
	.word	.L95
	.word	.L94
	.word	.L92
.L92:
	tst	r0, #8
	beq	.L99
	ldr	r3, .L105+36
	mov	lr, pc
	bx	r3
	ldrb	r2, [r6]	@ zero_extendqisi2
	ldrh	r0, [fp]
	b	.L91
.L94:
	tst	r0, #8
	beq	.L99
	tst	r3, #8
	beq	.L104
.L99:
	mov	r0, r3
	b	.L91
.L95:
	mov	lr, pc
	bx	r8
	ldrb	r2, [r6]	@ zero_extendqisi2
	ldrh	r0, [fp]
	b	.L91
.L97:
	mov	lr, pc
	bx	r7
	mov	lr, pc
	bx	r10
	ldrb	r2, [r6]	@ zero_extendqisi2
	ldrh	r0, [fp]
	b	.L91
.L96:
	mov	lr, pc
	bx	r9
	ldrb	r2, [r6]	@ zero_extendqisi2
	ldrh	r0, [fp]
	b	.L91
.L104:
	mov	lr, pc
	bx	r7
	ldrb	r2, [r6]	@ zero_extendqisi2
	ldrh	r0, [fp]
	b	.L91
.L106:
	.align	2
.L105:
	.word	state
	.word	buttons
	.word	initialize
	.word	oldButtons
	.word	goToStart
	.word	start
	.word	play
	.word	pause
	.word	67109120
	.word	updateScoreboard.part.0
	.size	main, .-main
	.text
	.align	2
	.global	updateScoreboard
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateScoreboard, %function
updateScoreboard:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L109
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	b	updateScoreboard.part.0
.L110:
	.align	2
.L109:
	.word	oldButtons
	.size	updateScoreboard, .-updateScoreboard
	.comm	scoreBuffer,41,4
	.global	topScore
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	NOTES,2,2
	.comm	state,1,1
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	topScore, %object
	.size	topScore, 4
topScore:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
