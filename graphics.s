;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; colorFill
; Fills the screen with a color (or two). Pretty fast, but not fastest possible
; A 4:4:4:4 = Palette entries
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
	; balance between speed and super-verbose code
	.byte $da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da
	.byte $da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da
	.byte $da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da
	.byte $da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da,$da

	dey
	bne colorFillLoop

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
; caches
shadowRegister:
	.byte 0
stackRegister:
	.byte 0
stackPtr:
	.word 0

