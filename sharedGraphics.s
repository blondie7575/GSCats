skyPalette:
	.word $06af,$06af,$06af,$06af,$06af,$06af,$06af,$06af,$06af,$06af,$06af,$06af,$06af,$06af,$06af,$06af

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; BORDER_COLOR
;
; Trashes A
;
.macro BORDER_COLOR color
	SAVE_AXY
	BITS8
	lda BORDERCOLOR
	and #$f0
	ora color
	sta BORDERCOLOR
	BITS16
	RESTORE_AXY
.endmacro


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; setPalette
; Set all colors in a palette from memory
; PARAML0 = Pointer to 32 color bytes
; A = Palette index
;
setPalette:
	SAVE_XY

	asl
	asl
	asl
	asl
	asl
	BITS8A
	sta setPaletteLoop_SMC+1
	BITS16
	ldx #0
	ldy #0

setPaletteLoop:
	lda (PARAML0),y
setPaletteLoop_SMC:
	sta $e19e00,x		; Self-modifying code!

	iny
	iny
	inx
	inx
	cpx #32
	bne setPaletteLoop

	RESTORE_XY
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; setPaletteColor
; Set a single color in a palette
; PARAML0 = 0:Color index
; PARAML1 = 0:R:G:B
; A = Palette index
;
setPaletteColor:
	phx
	asl
	asl
	asl
	asl
	asl
	sta SCRATCHL
	lda PARAML0
	asl
	clc
	adc SCRATCHL
	tax
	lda PARAML1
	sta $e19e00,x
	plx
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; getPaletteColor
; Reads a single color from a palette
; Y = Color index
; A = Palette index
; A => Color value 0:R:G:B
;
getPaletteColor:
	SAVE_XY
	asl
	asl
	asl
	asl
	asl
	sta SCRATCHL
	tya
	asl
	clc
	adc SCRATCHL
	tax
	lda $e19e00,x
	RESTORE_XY
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; paletteFade
;
; PARAML2 = targetPalette
;
paletteFade:
	ldx #$f

paletteFadeTimeLoop:
	ldy #$f

paletteFadeColorLoop:
	lda #0
	jsr getPaletteColor
	sta SCRATCHL2

	phy				; Find target red
	tya
	asl
	tay
	lda (PARAML2),y
	cmp SCRATCHL2
	beq paletteFadeColorLoopSkipColor	; Entire color already matches
	and #$0F00
	sta SCRATCHL
	ply

	lda SCRATCHL2	; Fade red channel
	and #$0F00
	cmp SCRATCHL
	beq paletteFadeColorLoopG
	bcs paletteFadeColorLoopDecR
	lda SCRATCHL2
	clc
	adc #$0100
	sta SCRATCHL2
	bra paletteFadeColorLoopG

paletteFadeColorLoopDecR:
	lda SCRATCHL2
	sec
	sbc #$0100
	sta SCRATCHL2

paletteFadeColorLoopG:
	phy				; Find target green
	tya
	asl
	tay
	lda (PARAML2),y
	and #$00F0
	sta SCRATCHL
	ply
	
	lda SCRATCHL2		; Fade green channel
	and #$00F0
	cmp SCRATCHL
	beq paletteFadeColorLoopB
	bcs paletteFadeColorLoopDecG
	lda SCRATCHL2
	clc
	adc #$0010
	sta SCRATCHL2
	bra paletteFadeColorLoopB

paletteFadeColorLoopDecG:
	lda SCRATCHL2
	sec
	sbc #$0010
	sta SCRATCHL2

paletteFadeColorLoopB:
	phy				; Find target blue
	tya
	asl
	tay
	lda (PARAML2),y
	and #$000F
	sta SCRATCHL
	ply

	lda SCRATCHL2		; Fade blue channel
	and #$000F
	cmp SCRATCHL
	beq paletteFadeColorLoopStore
	bcs paletteFadeColorLoopDecB
	inc SCRATCHL2
	bra paletteFadeColorLoopStore

paletteFadeColorLoopDecB:
	dec SCRATCHL2

paletteFadeColorLoopStore:
	sty PARAML0
	lda SCRATCHL2
	sta PARAML1
	lda #0
	jsr setPaletteColor
	bra paletteFadeColorLoopDone

paletteFadeColorLoopSkipColor:
	ply

paletteFadeColorLoopDone:
	dey
	bpl paletteFadeColorLoopNext
	jsr delayFade
	jsr delayFade
	jsr delayFade
	jsr delayFade
	jsr delayFade
	dex
	bpl paletteFadeTimeLoopNext

	rts

paletteFadeColorLoopNext:
	jmp paletteFadeColorLoop
paletteFadeTimeLoopNext:
	jmp paletteFadeTimeLoop


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Vertical blank checkers
;

; The Brutal Deluxe version, taken from LemminGS
;
nextVBL:
	lda #75
	pha
nextVBL0:
	lda $e0c02e
	and #$7f
	cmp 1,s
	blt nextVBL0
	cmp #100
	bge nextVBL0
	pla
waitVBL:
	lda $e0c018
	bpl waitVBL
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; delayFade
; Sleeps for a teeny bit
;
delayFade:
	SAVE_AXY

	ldy		#$01	; Loop a bit
delayFadeOuter:
	ldx		#$ff
delayFadeInner:
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	dex
	bne		delayFadeInner
	dey
	bne		delayFadeOuter

	RESTORE_AXY
	rts

