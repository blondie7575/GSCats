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
	jsr setScanLineInterruptVector
	;jsr setVBLInterruptVector
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

;	jsr setBorderAtScanLine

	; Fade in
	lda #titlePalette
	sta PARAML2
	jsr paletteFade

	ldy #CAT0_VRAM			; Save a generic background to erase cats
	jsr protectAnimation16x16

titleScreenMainLoop:

	; Track animations
	;jsr syncOverscanBottom	; This looks awesome but makes interactivity terrible
	jsr syncVBL
	;BORDER_COLOR #$7

	lda titleAnimationCounter
	inc
	cmp TITLE_ANIMATION_FRAMES
	jsr titleScreenResetAnimation

	; Update current animation if needed
	lda animationState+AS_CURRENTFRAME
	bmi titleScreenIdle
	jsr tickAnimation
	bra titleScreenKeyboard

titleScreenIdle:

	; Time start of cat 0 animation
	lda animationDelay0
	dec
	bne titleScreenStillCat
	lda #CAT_DELAY
	sta animationDelay0

	; Start new cat 0 animation
	ldy #CAT0_VRAM
	jsr unrenderAnimation16x16

	lda #titleAnimationPos0
	sta PARAML0
	ldx #TITLE_ANIMATION_FRAMES
	ldy #30
	lda #ANIMATION_SIZE_16x32
	jsr startAnimation
	bra titleScreenNextCat

titleScreenStillCat:

	; Render idle cat 0
	sta animationDelay0
	ldy #CAT0_VRAM
	lda #29
	jsr drawSpriteBankSafe

titleScreenNextCat:

	; Time start of cat 1 animation
	lda animationDelay1
	dec
	bne titleScreenStillCat2
	lda #CAT_DELAY
	sta animationDelay1

	; Start new cat 1 animation
	ldy #CAT1_VRAM
	jsr unrenderAnimation16x16

	lda #titleAnimationPos1
	sta PARAML0
	ldx #TITLE_ANIMATION_FRAMES
	ldy #21
	lda #ANIMATION_SIZE_16x32
	jsr startAnimation
	bra titleScreenKeyboard

titleScreenStillCat2:

	; Render idle cat 1
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
	cmp #1
	beq titleScreenHelp
	cmp #2
	beq titleScreenQuit

titleScreenMainLoopEndFrame:
	stz menuActionRequested
	jmp titleScreenMainLoop

titleScreenBeginGame:
	; Transition to gameplay
	jsr titleScreenRemoveBorderEffect
	stz menuActionRequested
	lda #skyPalette
	sta PARAML2
	jsr paletteFade
	jmp beginGameplay

titleScreenQuit:
	jsr titleScreenRemoveBorderEffect
	jmp quitGame

titleScreenHelp:
	jsr titleScreenRemoveBorderEffect
	stz menuActionRequested

	; Fade out
	lda #skyPalette
	sta PARAML2
	jsr paletteFade
	jmp titleScreenRenderHelp

titleScreenRemoveBorderEffect:
	jsr unsetVBLInterruptVector
	jsr unsetScanLineInterruptVector
	rts


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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; titleScreenRenderHelp
;
; Render the help menu
;
titleScreenRenderHelp:
	SAVE_AXY

	; Clear screen
	ldx #0
	ldy #200
	jsr colorFill

	; Draw help text
	lda #helpText0
	sta PARAML0
	ldy #$2c8a
	lda #1
	jsl renderStringFar

	lda #helpText1
	sta PARAML0
	ldy #$32ca
	lda #1
	jsl renderStringFar

	lda #helpText2
	sta PARAML0
	ldy #$390a
	lda #1
	jsl renderStringFar

	lda #helpText3
	sta PARAML0
	ldy #$4bed
	lda #2
	jsl renderStringFar

	lda #helpText4
	sta PARAML0
	ldy #$572d
	lda #2
	jsl renderStringFar

	lda #helpText5
	sta PARAML0
	ldy #$6265
	lda #2
	jsl renderStringFar

	lda #helpText6
	sta PARAML0
	ldy #$6dad
	lda #2
	jsl renderStringFar

	lda #helpText7
	sta PARAML0
	ldy #$78ed
	lda #2
	jsl renderStringFar

	lda #helpText8
	sta PARAML0
	ldy #$8435
	lda #2
	jsl renderStringFar

	lda #helpText9
	sta PARAML0
	ldy #$90b7
	lda #1
	jsl renderStringFar

	; Fade in
	lda #titlePalette
	sta PARAML2
	jsr paletteFade

	jsr kbdWaitForAnyKey

	; Fade out
	lda #skyPalette
	sta PARAML2
	jsr paletteFade

	RESTORE_AXY
	jmp titleScreen

helpText0:
	pstring "SPROCKET AND TINKER DO NOT GET ALONG!"
helpText1:
	pstring "YOUR GOAL IS TO ANGER THE OTHER CAT"
helpText2:
	pstring "SO MUCH THAT SHE PEES."
helpText3:
	pstring "_^ AIM"
helpText4:
	pstring "\] POWER"
helpText5:
	pstring "`ab FIRE"
helpText6:
	pstring "ef WEAPON"
helpText7:
	pstring "cd SCROLL"
helpText8:
	pstring "g QUIT"
helpText9:
	pstring "PRESS ANY KEY"
