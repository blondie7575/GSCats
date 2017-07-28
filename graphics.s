;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; colorFill
; Fills the screen with a color (or two). Not very fast.
; A 4:4:4:4 = Palette entries

colorFill:
	phx
	ldx #32000

colorFillLoop:
	sta $e11ffe,x
	dex
	dex
	bne colorFillLoop
	plx

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
	sta $e19cfe,x
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
	cmp #16
	bne setPaletteLoop

	RESTORE_XY
	rts
