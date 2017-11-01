;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; colorFill
; Fills the screen with a color (or two). Pretty fast, but not fastest possible
; A 4:4:4:4 = Palette entries
; X = Color to fill (doubled)
;
; Trashes Y

colorFill:
	FASTGRAPHICS

	lda #$9d00-1	; Point stack to end of VRAM
	tcs

	ldy #200

colorFillLoop:
	; 80 PHXs, for 1 line
	; We could do the entire screen with PHXs, but this is a
	; balance between speed and code size
	.byte $da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da
	.byte $da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da
	.byte $da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da
	.byte $da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da

	dey
	bne colorFillLoop

	SLOWGRAPHICS
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; bottomFill
; Fills the bottom of the screen with a color (or two). Pretty fast, but not fastest possible
; A 4:4:4:4 = Palette entries
; X = Color to fill (doubled)
;
; Trashes Y

bottomFill:
	FASTGRAPHICS

	lda #$9d00-1	; Point stack to end of VRAM
	tcs

	ldy #58

bottomFillLoop:
	; 80 PHXs, for 1 line
	; We could do the entire screen with PHXs, but this is a
	; balance between speed and super-verbose code
	.byte $da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da
	.byte $da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da
	.byte $da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da
	.byte $da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da

	dey
	bne bottomFillLoop

	SLOWGRAPHICS
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; initSCBs
; Initialize all scanline control bytes
;
; Trashes A,X

initSCBs:
	lda #0
	ldx #$0100	;set all $100 scbs to A

initSCBsLoop:
	dex
	dex
	sta $e19d00,x
	bne initSCBsLoop
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; setPaletteColor
; Set a single color in a palette
; PARAML0 = 0:Color index
; PARAML1 = 0:R:G:B
; A = Palette index
;
; Trashes X

setPaletteColor:
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
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; setPalette
; Set a single color in a palette
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
	tax
	ldy #0

setPaletteLoop:

	lda (PARAML0),y
	sta $e19e00,x
	iny
	iny
	inx
	inx
	cpx #32
	bne setPaletteLoop

	RESTORE_XY
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; drawNumber
;
; A = Number to render
; X = VRAM position to render at
;
; Trashes PARAML0
;
drawNumber:
	sta PARAML0
	jsr intToString
	lda #intToStringResult

	jsr DrawString
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; BORDER_COLOR
;
; Trashes A
;
.macro BORDER_COLOR color
	BITS8
	lda BORDERCOLOR
	and #$f0
	ora color
	sta BORDERCOLOR
	BITS16
.endmacro

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

; The Apple version, taken from GS Tech Note 039
;
syncVBL:
	BITS8
syncVBL0:
	lda $E0C02F
    asl         ; VA is now in the Carry flag
    lda $E0C02E
    rol         ; Roll Carry into bit 0
	cmp #200	; A now contains line number
	bne syncVBL0
	BITS16
	rts

; The old style //e version
;
vblSync:
	BITS8

waitVBLToFinish:
	lda $E0C019
	bmi waitVBLToFinish
waitVBLToStart:
	lda $E0C019
	bpl waitVBLToStart

	BITS16
	rts

.include "spritebank.s"
