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
CAT0_VRAM = $5d79
CAT1_VRAM = $5da0


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; titleScreen
;
; Shows the title screen and main game menu
;
titleScreen:
	
	lda #%10000000		; Set all SCBs to 320, no interrupts, palette 0
	jsr initSCBs
	stz leftScreenEdge

	; Copy title screen art from where it was loaded in bank 6
	; This isn't fast, but doesn't need to be
	ldx #0

titleScreenCopyLoop:
	lda $060000,x
	sta SHADOWVRAM,x
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

	; Render menu text
	jsr titleScreenRenderMenu

	; Fade in
	lda #titlePalette
	sta PARAML2
	jsr paletteFade

	ldy #CAT0_VRAM			; Save a generic background to erase cats
	jsr protectAnimation16x16

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

	ldy #CAT0_VRAM
	jsr unrenderAnimation16x16

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
	ldy #CAT0_VRAM
	lda #29
	jsr drawSpriteBankSafe

titleScreenNextCat:
	lda animationDelay1
	dec
	bne titleScreenStillCat2
	lda #CAT_DELAY
	sta animationDelay1

	ldy #CAT1_VRAM
	jsr unrenderAnimation16x16

	lda #titleAnimationPos1
	sta PARAML0
	ldx #TITLE_ANIMATION_FRAMES
	ldy #21
	lda #ANIMATION_SIZE_16x32
	jsr renderAnimation
	bra titleScreenKeyboard

titleScreenStillCat2:
	sta animationDelay1
	ldy #CAT1_VRAM
	lda #20
	jsr drawSpriteBankSafe

titleScreenKeyboard:
	; Check for selection
	jsr kbdScanTitle
	jsr kbdScanDebug
	lda menuActionRequested
	beq titleScreenMainLoopEndFrame

	cmp #-1
	beq titleScreenKeyboardMenuUp
	cmp #1
	beq titleScreenKeyboardMenuDown
	cmp #2
	beq titleScreenKeyboardMenuGo
	bra titleScreenMainLoopEndFrame

titleScreenResetAnimation:
	stz titleAnimationCounter
	rts

titleScreenKeyboardMenuUp:
	lda menuSelection
	beq titleScreenMainLoopEndFrame
	dec
	sta menuSelection
	jsr titleScreenRenderMenu
	bra titleScreenMainLoopEndFrame

titleScreenKeyboardMenuDown:
	lda menuSelection
	cmp #2
	beq titleScreenMainLoopEndFrame
	inc
	sta menuSelection
	jsr titleScreenRenderMenu
	bra titleScreenMainLoopEndFrame

titleScreenKeyboardMenuGo:
	lda menuSelection
	beq titleScreenBeginGame
	cmp #2
	beq titleScreenQuit

titleScreenMainLoopEndFrame:
	stz menuActionRequested
	jmp titleScreenMainLoop

titleScreenBeginGame:
	; Transition to gameplay
	stz menuActionRequested
	lda #skyPalette
	sta PARAML2
	jsr paletteFade
	jmp beginGameplay

titleScreenQuit:
	jmp quitGame

titleAnimationCounter:
	.word 0
titleAnimationPos0:
	.word 114,120
titleAnimationPos1:
	.word 192,120
animationDelay0:
	.word CAT_DELAY/2
animationDelay1:
	.word CAT_DELAY
menuActionRequested:
	.word 0
selectionString:
	pstring "[[[[[[[[[[[[[[[["
unselectionString:
	pstring "\\\\\\\\\\\\\\\\"
startString:
	pstring "BEGIN GAME"
helpString:
	pstring "HOW TO PLAY"
quitString:
	pstring "QUIT"
menuSelection:
	.word 0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; titleScreenRenderMenu
;
; Render the game menu
;
; Trashes A
;
titleScreenRenderMenu:

	ldy #$78f0
	jsr titleScreenUnRenderSelection
	lda menuSelection
	bne titleScreenRenderMenuItem0
	ldy #$78f0
	jsr titleScreenRenderSelection

titleScreenRenderMenuItem0:
	lda #startString
	sta PARAML0
	lda #1
	ldy #$78fc
	jsl renderStringFar

	ldy #$7f30
	jsr titleScreenUnRenderSelection
	lda menuSelection
	cmp #1
	bne titleScreenRenderMenuItem1
	ldy #$7f30
	jsr titleScreenRenderSelection

titleScreenRenderMenuItem1:
	lda #helpString
	sta PARAML0
	lda #1
	ldy #$7f39
	jsl renderStringFar

	ldy #$8570
	jsr titleScreenUnRenderSelection
	lda menuSelection
	cmp #2
	bne titleScreenRenderMenuItem2
	ldy #$8570
	jsr titleScreenRenderSelection

titleScreenRenderMenuItem2:
	lda #quitString
	sta PARAML0
	lda #1
	ldy #$8588
	jsl renderStringFar

	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; titleScreenRenderSelection
;
; Render the menu selection bar
;
; Y = VRAM position of bar
;
titleScreenRenderSelection:
	lda #selectionString
	sta PARAML0
	lda #1
	jsl renderStringFar
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; titleScreenUnRenderSelection
;
; Unrender the menu selection bar
;
; Y = VRAM position of bar
;
titleScreenUnRenderSelection:
	lda #unselectionString
	sta PARAML0
	lda #1
	jsl renderStringFar
	rts
