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
	.file	"game.c"
	.text
	.align	2
	.global	initGame
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L8
	ldr	r4, .L8+4
	mov	lr, pc
	bx	r4
	mov	r2, #32
	mov	lr, #120
	mov	ip, #140
	mov	r0, #2
	mov	r1, #2016
	mov	r5, #0
	mov	r9, #8
	ldr	r3, .L8+8
	ldr	r8, .L8+12
	str	lr, [r3]
	str	ip, [r3, #4]
	str	r0, [r3, #16]
	strh	r1, [r3, #20]	@ movhi
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	ldr	r4, .L8+16
	ldr	r7, .L8+20
	add	r6, r8, #160
.L2:
	str	r5, [r8, #28]
	str	r9, [r8, #8]
	str	r9, [r8, #12]
	mov	lr, pc
	bx	r4
	smull	r2, r3, r7, r0
	sub	r3, r3, r0, asr #31
	add	r3, r3, r3, lsl #1
	sub	r0, r0, r3
	add	r0, r0, #2
	str	r0, [r8, #16]
	add	r8, r8, #32
	cmp	r8, r6
	bne	.L2
	ldr	r3, .L8+24
	ldr	r8, .L8+28
	ldr	r7, .L8+32
	ldr	r6, .L8+36
	str	r5, [r3, #24]
	str	r5, [r3, #52]
	str	r5, [r3, #80]
	add	r5, r8, #400
.L3:
	mov	lr, pc
	bx	r4
	smull	r3, r2, r7, r0
	asr	r3, r0, #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #7
	rsb	r3, r3, r3, lsl #4
	sub	r0, r0, r3, lsl #4
	str	r0, [r8]
	mov	lr, pc
	bx	r4
	smull	r3, r2, r6, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #6
	add	r3, r3, r3, lsl #2
	sub	r0, r0, r3, lsl #5
	str	r0, [r8, #4]
	add	r8, r8, #8
	cmp	r5, r8
	bne	.L3
	mov	r2, #0
	ldr	r3, .L8+40
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	str	r2, [r3]
	bx	lr
.L9:
	.align	2
.L8:
	.word	startscreenPal
	.word	DMANow
	.word	player
	.word	enemies
	.word	rand
	.word	1431655766
	.word	bullets
	.word	stars
	.word	-2004318071
	.word	1717986919
	.word	.LANCHOR0
	.size	initGame, .-initGame
	.align	2
	.global	drawStars
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawStars, %function
drawStars:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r4, .L14
	ldr	r7, .L14+4
	ldr	r6, .L14+8
	add	r5, r4, #400
.L11:
	ldr	r1, [r4, #4]
	ldr	r0, [r4], #8
	mov	r2, r6
	mov	lr, pc
	bx	r7
	cmp	r4, r5
	bne	.L11
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L15:
	.align	2
.L14:
	.word	stars
	.word	setPixel4
	.word	65535
	.size	drawStars, .-drawStars
	.align	2
	.global	updateEnemies
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemies, %function
updateEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r10, #1
	ldr	r4, .L24
	ldr	r5, .L24+4
	ldr	r6, .L24+8
	ldr	r9, .L24+12
	ldr	r8, .L24+16
	add	fp, r4, #160
.L21:
	ldr	r7, [r4, #28]
	cmp	r7, #0
	beq	.L17
	ldr	r3, [r4, #4]
	ldr	r2, [r4, #16]
	add	r3, r3, r2
	cmp	r3, #160
	str	r3, [r4, #4]
	movgt	r3, #0
	strgt	r3, [r4, #28]
.L19:
	add	r4, r4, #32
	cmp	r4, fp
	bne	.L21
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L17:
	mov	lr, pc
	bx	r5
	smull	r3, r1, r6, r0
	asr	r3, r0, #31
	rsb	r3, r3, r1, asr #5
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3, lsl #2
	cmp	r3, #4
	bgt	.L19
	mov	lr, pc
	bx	r5
	mov	r1, #63488
	smull	r2, r3, r9, r0
	add	ip, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, ip, asr #7
	rsb	r3, r3, r3, lsl #4
	sub	r0, r0, r3, lsl #4
	strh	r1, [r4, #24]	@ movhi
	str	r7, [r4, #4]
	str	r10, [r4, #28]
	str	r0, [r4]
	mov	lr, pc
	bx	r5
	smull	r3, r2, r8, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #2
	add	r3, r3, r3, lsl #2
	sub	r0, r0, r3, lsl #1
	add	r0, r0, #5
	str	r0, [r4, #20]
	mov	lr, pc
	bx	r5
	ldr	r3, .L24+20
	smull	r2, r3, r0, r3
	sub	r3, r3, r0, asr #31
	add	r3, r3, r3, lsl #1
	sub	r0, r0, r3
	add	r0, r0, #2
	str	r0, [r4, #16]
	b	.L19
.L25:
	.align	2
.L24:
	.word	enemies
	.word	rand
	.word	1374389535
	.word	-2004318071
	.word	1717986919
	.word	1431655766
	.size	updateEnemies, .-updateEnemies
	.align	2
	.global	fireBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	fireBullet, %function
fireBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L37
	ldr	r2, [r3, #24]
	cmp	r2, #0
	beq	.L27
	ldr	r2, [r3, #52]
	cmp	r2, #0
	beq	.L29
	ldr	r2, [r3, #80]
	cmp	r2, #0
	moveq	r2, #2
	bxne	lr
.L27:
	push	{r4, r5, r6, lr}
	mov	r4, #3
	mov	lr, #1
	mov	r6, #2
	mov	r5, #5
	ldr	ip, .L37+4
	ldr	r1, [ip, #8]
	ldr	r0, [ip]
	add	r1, r1, r1, lsr #31
	rsb	r2, r2, r2, lsl r4
	add	r1, r0, r1, asr lr
	ldr	ip, [ip, #4]
	str	r1, [r3, r2, lsl #2]
	add	r3, r3, r2, lsl r6
	str	r6, [r3, #8]
	str	r5, [r3, #12]
	str	r4, [r3, #16]
	str	lr, [r3, #24]
	str	ip, [r3, #4]
	pop	{r4, r5, r6, lr}
	bx	lr
.L29:
	mov	r2, #1
	b	.L27
.L38:
	.align	2
.L37:
	.word	bullets
	.word	player
	.size	fireBullet, .-fireBullet
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L50
	ldrh	r3, [r4]
	tst	r3, #32
	bne	.L40
	ldr	r1, .L50+4
	ldr	r2, [r1]
	cmp	r2, #0
	ldrgt	r0, [r1, #16]
	subgt	r2, r2, r0
	strgt	r2, [r1]
.L40:
	tst	r3, #16
	bne	.L41
	ldr	r2, .L50+4
	ldr	r0, [r2]
	ldr	r1, [r2, #8]
	add	r1, r0, r1
	cmp	r1, #239
	ldrle	r1, [r2, #16]
	addle	r0, r1, r0
	strle	r0, [r2]
.L41:
	ldr	r2, .L50+8
	ldrh	r2, [r2]
	tst	r2, #1
	and	r3, r3, #1
	beq	.L42
	cmp	r3, #0
	beq	.L43
.L45:
	mov	r2, #0
	ldr	r3, .L50+12
	pop	{r4, lr}
	str	r2, [r3, #4]
	bx	lr
.L43:
	bl	fireBullet
	mov	r0, #1
	ldr	r2, .L50+12
	ldr	r3, .L50+16
	str	r0, [r2, #4]
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	and	r3, r3, #1
.L42:
	cmp	r3, #0
	bne	.L45
	pop	{r4, lr}
	bx	lr
.L51:
	.align	2
.L50:
	.word	buttons
	.word	player
	.word	oldButtons
	.word	.LANCHOR0
	.word	playAnalogSound
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	updateBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBullets, %function
updateBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, #0
	ldr	r3, .L59
	add	r1, r3, #84
.L56:
	ldr	r2, [r3, #24]
	cmp	r2, #0
	beq	.L54
	ldr	r2, [r3, #4]
	ldr	r0, [r3, #16]
	sub	r2, r2, r0
	cmp	r2, #0
	str	r2, [r3, #4]
	strlt	ip, [r3, #24]
.L54:
	add	r3, r3, #28
	cmp	r3, r1
	bne	.L56
	bx	lr
.L60:
	.align	2
.L59:
	.word	bullets
	.size	updateBullets, .-updateBullets
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	ip, .L63
	ldr	r0, .L63+4
	sub	sp, sp, #8
	ldm	r0, {r0, r1, r2, r3}
	ldr	r4, .L63+8
	str	ip, [sp]
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L64:
	.align	2
.L63:
	.word	goldcoinsBitmap
	.word	player
	.word	drawImage4
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	drawPixelatedCoin
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPixelatedCoin, %function
drawPixelatedCoin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r9, r0
	mov	r7, r1
	mov	fp, r3
	ldr	r6, .L73
	ldr	r8, .L73+4
	add	r10, r6, #256
.L66:
	mov	r5, r9
	sub	r4, r6, #32
	b	.L68
.L67:
	cmp	r4, r6
	add	r5, r5, #1
	beq	.L72
.L68:
	ldr	ip, [r4, #4]!
	cmp	ip, #1
	bne	.L67
	mov	r0, r5
	mov	r2, fp
	mov	r1, r7
	mov	lr, pc
	bx	r8
	cmp	r4, r6
	add	r5, r5, #1
	bne	.L68
.L72:
	add	r6, r4, #32
	cmp	r6, r10
	add	r7, r7, #1
	bne	.L66
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L74:
	.align	2
.L73:
	.word	.LANCHOR1+28
	.word	setPixel4
	.size	drawPixelatedCoin, .-drawPixelatedCoin
	.align	2
	.global	drawEnemies
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawEnemies, %function
drawEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L84
	ldr	r6, .L84+4
	add	r5, r4, #160
.L77:
	ldr	r2, [r4, #28]
	cmp	r2, #0
	bne	.L83
.L76:
	add	r4, r4, #32
	cmp	r4, r5
	bne	.L77
	pop	{r4, r5, r6, lr}
	bx	lr
.L83:
	mov	r3, r6
	ldm	r4, {r0, r1, r2}
	bl	drawPixelatedCoin
	b	.L76
.L85:
	.align	2
.L84:
	.word	enemies
	.word	65488
	.size	drawEnemies, .-drawEnemies
	.align	2
	.global	drawBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBullets, %function
drawBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	ldr	r4, .L95
	ldr	r7, .L95+4
	ldr	r6, .L95+8
	sub	sp, sp, #12
	add	r5, r4, #84
.L88:
	ldr	r3, [r4, #24]
	cmp	r3, #0
	bne	.L94
.L87:
	add	r4, r4, #28
	cmp	r4, r5
	bne	.L88
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L94:
	str	r7, [sp]
	ldm	r4, {r0, r1, r2, r3}
	mov	lr, pc
	bx	r6
	b	.L87
.L96:
	.align	2
.L95:
	.word	bullets
	.word	65504
	.word	drawRect4
	.size	drawBullets, .-drawBullets
	.align	2
	.global	drawLaser
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawLaser, %function
drawLaser:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #63488
	push	{r4, lr}
	ldr	r2, .L99
	ldr	r0, [r2, #8]
	ldr	r3, [r2]
	ldr	r1, [r2, #4]
	add	r0, r0, r0, lsr #31
	sub	sp, sp, #8
	add	r0, r3, r0, asr #1
	mov	r2, #2
	mov	r3, #5
	str	ip, [sp]
	ldr	r4, .L99+4
	sub	r1, r1, #5
	sub	r0, r0, #1
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L100:
	.align	2
.L99:
	.word	player
	.word	drawRect4
	.size	drawLaser, .-drawLaser
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Score:\000"
	.align	2
.LC1:
	.ascii	"YOU WIN!\000"
	.align	2
.LC2:
	.ascii	"Press Start to Play Again\000"
	.text
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L109
	mov	r0, #0
	mov	lr, pc
	bx	r3
	bl	drawStars
	ldr	r3, .L109+4
	ldrb	r4, [r3]	@ zero_extendqisi2
	cmp	r4, #1
	beq	.L107
	cmp	r4, #3
	beq	.L108
.L101:
	pop	{r4, r5, r6, lr}
	bx	lr
.L107:
	bl	drawPlayer
	ldr	r5, .L109+8
	bl	drawEnemies
	bl	drawBullets
	mov	r1, r4
	ldr	r3, .L109+12
	ldr	r2, .L109+16
	mov	r0, #180
	mov	lr, pc
	bx	r5
	ldr	r3, .L109+12
	mov	r1, r4
	mov	r0, #220
	ldr	r2, .L109+20
	mov	lr, pc
	bx	r5
	ldr	r3, .L109+24
	ldr	r3, [r3, #4]
	cmp	r3, #0
	beq	.L101
	pop	{r4, r5, r6, lr}
	b	drawLaser
.L108:
	ldr	r4, .L109+8
	mov	r1, #70
	ldr	r3, .L109+28
	ldr	r2, .L109+32
	mov	r0, #90
	mov	lr, pc
	bx	r4
	mov	r1, #90
	mov	r0, #60
	ldr	r3, .L109+36
	ldr	r2, .L109+40
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L110:
	.align	2
.L109:
	.word	fillScreen4
	.word	state
	.word	drawString4
	.word	63519
	.word	.LC0
	.word	scoreBuffer
	.word	.LANCHOR0
	.word	65504
	.word	.LC1
	.word	65535
	.word	.LC2
	.size	drawGame, .-drawGame
	.align	2
	.global	collision
	.syntax unified
	.arm
	.fpu softvfp
	.type	collision, %function
collision:
	@ Function supports interworking.
	@ args = 60, pretend = 16, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #16
	sub	ip, sp, #4
	stmib	ip, {r0, r1, r2, r3}
	ldr	r3, [sp, #28]
	ldr	r1, [sp, #48]
	ldr	r2, [sp]
	add	r0, r3, r1
	cmp	r0, r2
	ble	.L115
	ldr	r0, [sp, #8]
	sub	r3, r3, r1
	add	r2, r2, r0
	cmp	r2, r3
	bgt	.L117
.L115:
	mov	r0, #0
	add	sp, sp, #16
	bx	lr
.L117:
	ldr	r2, [sp, #32]
	ldr	r3, [sp, #4]
	add	r0, r2, r1
	cmp	r0, r3
	ble	.L115
	ldr	r0, [sp, #12]
	sub	r1, r2, r1
	add	r0, r3, r0
	cmp	r0, r1
	movle	r0, #0
	movgt	r0, #1
	add	sp, sp, #16
	bx	lr
	.size	collision, .-collision
	.section	.rodata.str1.4
	.align	2
.LC3:
	.ascii	"Score:%d\000"
	.text
	.align	2
	.global	checkCollisions
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkCollisions, %function
checkCollisions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r4, .L133
	ldr	r9, .L133+4
	ldr	r1, .L133+8
	ldr	fp, .L133+12
	ldr	r10, .L133+16
	add	r6, r4, #160
.L122:
	ldr	r3, [r4, #28]
	cmp	r3, #0
	bne	.L132
.L119:
	add	r4, r4, #32
	cmp	r4, r6
	bne	.L122
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L132:
	mov	r8, #0
	ldr	r5, .L133+20
	add	r7, r5, #84
.L121:
	ldr	r3, [r5, #24]
	cmp	r3, #0
	beq	.L120
	ldr	r2, [r4]
	ldr	r0, [r4, #20]
	ldr	r3, [r5]
	add	ip, r2, r0
	cmp	ip, r3
	sub	r2, r2, r0
	ble	.L120
	ldr	ip, [r5, #8]
	add	r3, r3, ip
	cmp	r3, r2
	ble	.L120
	ldr	r3, [r4, #4]
	ldr	r2, [r5, #4]
	add	ip, r3, r0
	cmp	ip, r2
	sub	r0, r3, r0
	ble	.L120
	ldr	r3, [r5, #12]
	add	r2, r2, r3
	cmp	r2, r0
	ble	.L120
	ldr	r2, [r9]
	mov	r0, fp
	add	r2, r2, #5
	str	r8, [r4, #28]
	str	r8, [r5, #24]
	str	r2, [r9]
	mov	lr, pc
	bx	r10
	ldr	r1, .L133+8
.L120:
	add	r5, r5, #28
	cmp	r5, r7
	bne	.L121
	b	.L119
.L134:
	.align	2
.L133:
	.word	enemies
	.word	.LANCHOR0
	.word	.LC3
	.word	scoreBuffer
	.word	sprintf
	.word	bullets
	.size	checkCollisions, .-checkCollisions
	.global	__aeabi_i2d
	.global	__aeabi_d2iz
	.align	2
	.global	collisionPlayerAsteroid
	.syntax unified
	.arm
	.fpu softvfp
	.type	collisionPlayerAsteroid, %function
collisionPlayerAsteroid:
	@ Function supports interworking.
	@ args = 56, pretend = 16, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	sub	sp, sp, #16
	push	{r4, lr}
	add	ip, sp, #4
	stmib	ip, {r0, r1, r2, r3}
	ldr	r3, [sp, #20]
	ldr	r2, [sp, #12]
	ldr	r0, [sp, #36]
	add	r3, r3, r3, lsr #31
	add	r3, r2, r3, asr #1
	sub	r0, r0, r3
	mov	r3, r0
	mul	r3, r0, r3
	mov	r0, r3
	ldr	r3, [sp, #16]
	ldr	r1, [sp, #8]
	add	r3, r3, r3, lsr #31
	ldr	r2, [sp, #32]
	add	r1, r1, r3, asr #1
	sub	r2, r2, r1
	mla	r0, r2, r2, r0
	ldr	r2, .L137
	asr	r4, r3, #1
	mov	lr, pc
	bx	r2
	ldr	r3, .L137+4
	mov	lr, pc
	bx	r3
	ldr	r3, [sp, #52]
	ldr	r2, .L137+8
	add	r4, r4, r3
	mov	lr, pc
	bx	r2
	cmp	r4, r0
	pop	{r4, lr}
	movle	r0, #0
	movgt	r0, #1
	add	sp, sp, #16
	bx	lr
.L138:
	.align	2
.L137:
	.word	__aeabi_i2d
	.word	sqrt
	.word	__aeabi_d2iz
	.size	collisionPlayerAsteroid, .-collisionPlayerAsteroid
	.section	.rodata.str1.4
	.align	2
.LC4:
	.ascii	"Score: %d\000"
	.text
	.align	2
	.global	checkPlayerCollision
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkPlayerCollision, %function
checkPlayerCollision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r8, .L151
	mov	r4, #0
	mov	r5, r8
	ldr	r6, .L151+4
	ldr	r9, .L151+8
	ldr	fp, .L151+12
	ldr	r10, .L151+16
	sub	sp, sp, #44
	add	r7, r6, #16
.L144:
	ldr	r3, [r5, #28]
	cmp	r3, #0
	bne	.L150
.L141:
	add	r4, r4, #1
	cmp	r4, #5
	add	r5, r5, #32
	bne	.L144
	add	sp, sp, #44
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L150:
	add	lr, r8, r4, lsl #5
	ldmia	lr!, {r0, r1, r2, r3}
	add	ip, sp, #8
	stmia	ip!, {r0, r1, r2, r3}
	ldm	lr, {r0, r1, r2, r3}
	stm	ip, {r0, r1, r2, r3}
	ldm	r7, {r0, r1}
	stm	sp, {r0, r1}
	ldm	r6, {r0, r1, r2, r3}
	bl	collisionPlayerAsteroid
	cmp	r0, #0
	beq	.L141
	mov	r3, #0
	mov	r0, #13
	str	r3, [r5, #28]
	ldr	r3, .L151+20
	mov	lr, pc
	bx	r3
	ldr	r2, [r9]
	add	r2, r2, #10
	cmp	r2, #99
	movgt	lr, #3
	ldrgt	ip, .L151+24
	mov	r1, fp
	mov	r0, r10
	ldr	r3, .L151+28
	str	r2, [r9]
	strbgt	lr, [ip]
	mov	lr, pc
	bx	r3
	b	.L141
.L152:
	.align	2
.L151:
	.word	enemies
	.word	player
	.word	.LANCHOR0
	.word	.LC4
	.word	scoreBuffer
	.word	playAnalogSound
	.word	state
	.word	sprintf
	.size	checkPlayerCollision, .-checkPlayerCollision
	.section	.rodata.str1.4
	.align	2
.LC5:
	.ascii	"%d\000"
	.text
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L164
	ldr	r5, .L164+4
	ldr	r3, .L164+8
	ldr	r2, [r4]
	ldr	r1, .L164+12
	ldr	r0, .L164+16
	mov	lr, pc
	bx	r3
	ldrb	r3, [r5]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L163
.L155:
	ldr	r3, .L164+20
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L163:
	bl	updatePlayer
	bl	updateEnemies
	mov	ip, #0
	ldr	r3, .L164+24
	add	r1, r3, #84
.L159:
	ldr	r2, [r3, #24]
	cmp	r2, #0
	beq	.L157
	ldr	r2, [r3, #4]
	ldr	r0, [r3, #16]
	sub	r2, r2, r0
	cmp	r2, #0
	str	r2, [r3, #4]
	strlt	ip, [r3, #24]
.L157:
	add	r3, r3, #28
	cmp	r3, r1
	bne	.L159
	bl	checkCollisions
	bl	checkPlayerCollision
	ldr	r3, [r4]
	cmp	r3, #99
	movgt	r3, #3
	strbgt	r3, [r5]
	b	.L155
.L165:
	.align	2
.L164:
	.word	.LANCHOR0
	.word	state
	.word	sprintf
	.word	.LC5
	.word	scoreBuffer
	.word	waitForVBlank
	.word	bullets
	.size	updateGame, .-updateGame
	.global	score
	.comm	scoreBuffer,20,4
	.global	laserActive
	.global	coinPixels
	.comm	bullets,84,4
	.comm	enemies,160,4
	.comm	player,24,4
	.comm	stars,400,4
	.comm	NOTES,2,2
	.comm	state,1,1
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	coinPixels, %object
	.size	coinPixels, 256
coinPixels:
	.word	0
	.word	1
	.word	1
	.word	1
	.word	1
	.word	1
	.word	1
	.word	0
	.word	1
	.word	1
	.word	0
	.word	0
	.word	1
	.word	0
	.word	1
	.word	1
	.word	1
	.word	1
	.word	1
	.word	1
	.word	1
	.word	1
	.word	1
	.word	1
	.word	1
	.word	1
	.word	1
	.word	1
	.word	1
	.word	1
	.word	1
	.word	1
	.word	1
	.word	0
	.word	1
	.word	1
	.word	1
	.word	1
	.word	0
	.word	1
	.word	1
	.word	1
	.word	0
	.word	1
	.word	1
	.word	0
	.word	1
	.word	1
	.word	0
	.word	1
	.word	1
	.word	0
	.word	0
	.word	1
	.word	1
	.word	0
	.word	1
	.word	0
	.word	1
	.word	1
	.word	1
	.word	1
	.word	0
	.word	1
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	score, %object
	.size	score, 4
score:
	.space	4
	.type	laserActive, %object
	.size	laserActive, 4
laserActive:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
