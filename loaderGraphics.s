;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; slowColorFill
; Fills the screen with a color (or two). Slow because it has to run from
; bank 0 on the slow graphics path
;
; A = 4:4:4:4 = Palette entries to fill
;
; Trashes X,Y

slowColorFill:
	ldy #200
	ldx #$2000
	
slowColorFillLoop:
	; 80 STAs, for 1 line
	; sta VRAMBANK,x	inx		inx
	.byte $9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8
	.byte $9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8
	.byte $9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8
	.byte $9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8
	.byte $9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8
	.byte $9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8
	.byte $9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8
	.byte $9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8
	.byte $9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8
	.byte $9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8

	dey
	beq slowColorFillLoopDone
	jmp slowColorFillLoop

slowColorFillLoopDone:
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
