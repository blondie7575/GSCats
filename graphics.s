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

.if 0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; TEST OF MR. SPRITE
;
Spr_000:
	FASTGRAPHICS		; 16x16, 464 bytes, 722 cycles
	clc	
	tya		; Y = Sprite Target Screen Address (upper left corner)
	tcs		; New Stack address
	ldx	#$1111	; Pattern #1 : 14
	ldy	#$4444	; Pattern #2 : 12
	lda	#$3333	; Pattern #3 : 6
	tcd	
;--		
	sep	#$20	
	.a8
	lda	$A0,S
	and	#$0F
	ora	#$10
	sta	$A0,S
	lda	$A7,S
	and	#$F0
	ora	#$01
	sta	$A7,S
	rep	#$30	
	.a16
	tsc	
	adc	#$0007
	tcs	
	phx	
	phx	
	phx	
	phx	
	tsc		; Line 2
	adc	#$0141
	tcs	
	lda	$00,S
	and	#$000F
	ora	#$3310
	sta	$00,S
	lda	$06,S
	and	#$F000
	ora	#$0133
	sta	$06,S
	lda	$A0,S
	and	#$0F0F
	ora	#$3010
	sta	$A0,S
	lda	$A6,S
	and	#$F0F0
	ora	#$0103
	sta	$A6,S
	tsc	
	adc	#$0005
	tcs	
	phd	
	phd	
	tsc		; Line 4
	adc	#$013F
	tcs	
	lda	$00,S
	and	#$000F
	ora	#$3410
	sta	$00,S
	lda	$06,S
	and	#$F000
	ora	#$0143
	sta	$06,S
	lda	$A0,S
	and	#$000F
	ora	#$3410
	sta	$A0,S
	lda	$A6,S
	and	#$F000
	ora	#$0143
	sta	$A6,S
	tsc	
	adc	#$0005
	tcs	
	phy	
	phy	
	tsc		; Line 5
	adc	#$00A4
	tcs	
	lda	$9B,S
	and	#$0F0F
	ora	#$3010
	sta	$9B,S
	lda	$A1,S
	and	#$F0F0
	ora	#$0103
	sta	$A1,S
	phy	
	phy	
	tsc		; Line 7
	adc	#$013F
	tcs	
	lda	$00,S
	and	#$000F
	ora	#$3310
	sta	$00,S
	lda	$06,S
	and	#$F000
	ora	#$0133
	sta	$06,S
	lda	$A0,S
	and	#$000F
	ora	#$2210
	sta	$A0,S
	lda	$A6,S
	and	#$F000
	ora	#$0122
	sta	$A6,S
	tsc	
	adc	#$0005
	tcs	
	phd	
	phd	
	tsc		; Line 8
	adc	#$00A4
	tcs	
	lda	$9B,S
	and	#$0F0F
	ora	#$2010
	sta	$9B,S
	lda	$A1,S
	and	#$F0F0
	ora	#$0102
	sta	$A1,S
	pea	$2222
	pea	$2222
	tsc		; Line 10
	adc	#$013F
	tcs	
	lda	$00,S
	and	#$000F
	ora	#$2410
	sta	$00,S
	lda	$06,S
	and	#$F000
	ora	#$0142
	sta	$06,S
	lda	$A0,S
	and	#$000F
	ora	#$2410
	sta	$A0,S
	lda	$A6,S
	and	#$F000
	ora	#$0142
	sta	$A6,S
	tsc	
	adc	#$0005
	tcs	
	phy	
	phy	
	tsc		; Line 11
	adc	#$00A4
	tcs	
	lda	$9B,S
	and	#$0F0F
	ora	#$2010
	sta	$9B,S
	lda	$A1,S
	and	#$F0F0
	ora	#$0102
	sta	$A1,S
	phy	
	phy	
	tsc		; Line 13
	adc	#$013F
	tcs	
	lda	$00,S
	and	#$000F
	ora	#$2210
	sta	$00,S
	lda	$06,S
	and	#$F000
	ora	#$0122
	sta	$06,S
	sep	#$20	
	.a8
	lda	$A0,S
	and	#$0F
	ora	#$10
	sta	$A0,S
	lda	$A7,S
	and	#$F0
	ora	#$01
	sta	$A7,S
	rep	#$30	
	.a16
	tsc	
	adc	#$0005
	tcs	
	pea	$2222
	pea	$2222
	tsc		; Line 15
	adc	#$0146
	tcs	
	phx	
	phx	
	phx	
	phx	
;--		
SLOWGRAPHICS		
	rts	
		
;------------------------------		
.endif


; caches
shadowRegister:
.byte 0
stackRegister:
.byte 0
stackPtr:
.word 0

.include "cat.s"
.include "block.s"
.include "block1.s"
