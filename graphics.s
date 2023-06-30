;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; colorFill
; Fills the screen with a color (or two). Pretty fast, but not fastest possible
; X = 4:4:4:4 = Palette entries to fill
; Y = Scanline count (fills backwards to 0)
;
; Trashes A,Y,PARAML0,PARAML1

colorFill:

	; Calculate end of VRAM we're going to touch
	sty PARAML0
	lda #160		; Bytes per row in VRAM
	sta PARAML1
	phx
	jsr mult16
	clc
	adc #$2000
	dec				; A now holds address of highest byte we'll touch (e.g. $9d00-1 for full screen fill)
	sta PARAML0		; Cache values for highspeed zone
	sty PARAML1
	plx

	FASTGRAPHICS
	lda PARAML0
	tcs
	ldy PARAML1	

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
; setScanlinePalette
; Set the palette for a given scan line
;
; PARAML0 = Palette index
; X = Start scan line
; Y = Count

setScanlinePalette:
	pha

setScanlinePaletteLoop:
	lda $e19d00,x
	ora PARAML0
	sta $e19d00,x
	inx
	dey
	bne setScanlinePaletteLoop

	pla
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; enableFillMode
; Enables fill mode for a given scanline
;
; X = Scan line
;
enableFillMode:
	SAVE_AXY
	BITS8
	lda $e19d00,x
	ora #%00100000
	sta $e19d00,x
	BITS16
	RESTORE_AXY
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; disableFillMode
; Disables fill mode for a given scanline
;
; X = Scan line
;
; Trashes A

disableFillMode:
	SAVE_AXY
	BITS8
	lda $e19d00,x
	and #%11011111
	sta $e19d00,x
	BITS16
	RESTORE_AXY
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
; drawSpriteBankSafe
;
; A slightly slower version of Mr Sprite's DrawSpriteBank that
; preserves all registers and requires no secret flag clearing
;
; Y = VRAM position at which to draw
; A = Sprite Index
;
drawSpriteBankSafe:
	SAVE_AXY
	clc
	jsr DrawSpriteBank
	RESTORE_AXY
	rts


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
	;sei
	BITS8
syncVBL0:
	ldaA $C02f
    asl         ; VA is now in the Carry flag
	ldaA $C02e
    rol         ; Roll Carry into bit 0
	cmp #200	; A now contains line number
	blt syncVBL0
	BITS16
	;cli
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
