;
;  titleScreen
;  A friendly place to start the game
;
;  Created by Quinn Dunki on 7/23/23
;

.a16
.i16

titlePalette:
	.word $06af,$0072,$0072,$0861,$0c93,$0eb4,$0d66,$0f9a,$0777,$0d00,$0bbb,$ddd,$007b,$0a5b,$0000,$0fff

TITLE_ANIMATION_FRAMES = 5
CAT_DELAY = 300


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; titleScreen
;
; Shows the title screen and main game menu
;
titleScreen:
	
	lda #%10000000		; Set all SCBs to 320, no interrupts, palette 0
	jsr initSCBs

	; Copy title screen art from where it was loaded in bank 6
	; This isn't fast, but doesn't need to be
	ldx #0

titleScreenCopyLoop:
	lda $060000,x
	sta VRAM,x
	inx
	inx
	cpx #$7d00
	bne titleScreenCopyLoop

	; Set up sprite rendering
	BITS8
	lda #3
	sta SpriteBankBank00+3		; Tell compiled sprites what bank they are in
	BITS16
	
	; Set up audio
	jsr initSoundSystem

	; Fade in
	lda #titlePalette
	sta PARAML2
	jsr paletteFade

titleScreenMainLoop:

	; Track animations
	jsr nextVBL
	lda titleAnimationCounter
	inc
	cmp TITLE_ANIMATION_FRAMES
	jsr titleScreenResetAnimation

	; Time animations of cats
	lda animationDelay0
	dec
	bne titleScreenStillCat
	lda #CAT_DELAY
	sta animationDelay0

	; Render next frame of cats
	lda #titleAnimationPos0
	sta PARAML0
	ldx #TITLE_ANIMATION_FRAMES
	ldy #30
	lda #ANIMATION_SIZE_16x32
	jsr renderAnimation
	bra titleScreenNextCat

titleScreenStillCat:
	sta animationDelay0
	ldy #$5d79
	lda #29
	jsr drawSpriteBankSafe

titleScreenNextCat:
	lda animationDelay1
	dec
	bne titleScreenStillCat2
	lda #CAT_DELAY
	sta animationDelay1

	lda #titleAnimationPos1
	sta PARAML0
	ldx #TITLE_ANIMATION_FRAMES
	ldy #21
	lda #ANIMATION_SIZE_16x32
	jsr renderAnimation
	bra titleScreenKeyboard

titleScreenStillCat2:
	sta animationDelay1
	ldy #$5da0
	lda #20
	jsr drawSpriteBankSafe

titleScreenKeyboard:
	; Check for selection
	jsr kbdScanTitle
	lda menuActionRequested
	beq titleScreenMainLoop

	jmp beginGameplay

titleScreenResetAnimation:
	stz titleAnimationCounter
	rts

titleAnimationCounter:
	.word 0
titleAnimationPos0:
	.word 130,120
titleAnimationPos1:
	.word 208,120
animationDelay0:
	.word CAT_DELAY/2
animationDelay1:
	.word CAT_DELAY
menuActionRequested:
	.word 0
