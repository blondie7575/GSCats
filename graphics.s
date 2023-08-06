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
	ldx #200	;set all 200 scbs to A

initSCBsLoop:
	dex
	dex
	sta $e19d00,x
	bne initSCBsLoop

	jsr setScanLineInterruptVector
	jsr setVBLInterruptVector
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; setScanLineInterruptVector
;
; Install scanline interrupt handler
;
setScanLineInterruptVector:

	; Save current handler
	lda $e10029
	sta scanlineHandlerCache
	BITS8A
	lda $e1002b
	sta scanlineHandlerCache+2
	BITS16

	; Set our handler
	lda #scanLineInterruptHandler
	sta $e10029
	BITS8A
	lda #2		; This code bank
	sta $e1002b
	BITS16
	rts

scanlineHandlerCache:
	.byte 0,0,0


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; unsetScanLineInterruptVector
;
; Remove scanline interrupt handler
;
unsetScanLineInterruptVector:

	; Turn off scanline interrupts
	BITS8A
	lda $e0c023		; Disable scaline interrupts
	and #%11111101
	sta $e0c023
	BITS16

	; Restore saved handler
	lda scanlineHandlerCache
	sta $e10029
	BITS8A
	lda scanlineHandlerCache+2
	sta $e1002b
	BITS16

	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; setVBLInterruptVector
;
; Install VBL interrupt handler
;
setVBLInterruptVector:

	; Save current handler
	lda $e10031
	sta vblHandlerCache
	BITS8A
	lda $e10033
	sta vblHandlerCache+2
	BITS16

	; Set our handler
	lda #vblInterruptHandler
	sta $e10031
	BITS8A
	lda #2		; This code bank
	sta $e10033
	BITS16

	; Enable VBL interrupts
	lda $e0c041
	ora #%00001000
	sta $e0c041

	rts

vblHandlerCache:
	.byte 0,0,0


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; unsetVBLInterruptVector
;
; Remove VBL handler
;
unsetVBLInterruptVector:

	; Turn off VBL interrupts
	BITS8A
	lda $e0c041		; Disable VBL interrupts
	and #%11110111
	sta $e0c041
	BITS16

	; Restore saved handler
	lda vblHandlerCache
	sta $e10031
	BITS8A
	lda vblHandlerCache+2
	sta $e10033
	BITS16

	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; vblInterruptHandler
;
; Handler for IRQ.VBL (vector E1/0030-0033)
;
vblInterruptHandler:
	OP8
	lda #0		; Clear scanline interrupt source
	sta $e0c047

;	lda BORDERCOLOR
;	and #$f0
;	ora #$7			; Set to sky at bottom of screen
;	sta BORDERCOLOR

	clc
	rtl


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; setBorderAtScanLine
;
; Trashes A
;
setBorderAtScanLine:

	BITS8A
	lda $e19d92			; Enable interrupt on scanline 146
	ora #%01000000
	sta $e19d92

	lda $e19dc7			; Enable interrupt on scanline 199
	ora #%01000000
	sta $e19dc7

	lda $e0c023		; Enable scaline interrupts, if needed
	ora #%00000010
	sta $e0c023

	BITS16
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; scanLineInterruptHandler
;
; Handler for IRQ.SCAN (vector E1/0028-002B)
;
scanLineInterruptHandler:
	OP8
	lda $e0c032		; Clear scanline interrupt source
	and #%11011111
	sta $e0c032

	lda $e0C02f
    asl         ; VA is now in the Carry flag
	lda $e0C02e
    rol         ; Roll Carry into bit 0. A now contains line number
	cmp #155
	bcc scanLineInterruptHandler0

	lda BORDERCOLOR	; Set border color
	and #$f0
	ora #$7			; Set to sky at bottom of screen
	sta BORDERCOLOR
	bra scanLineInterruptHandlerDone

scanLineInterruptHandler0:
	lda BORDERCOLOR	; Set border color to grass at given scanline
	and #$f0
	ora #$4
	sta BORDERCOLOR

scanLineInterruptHandlerDone:
	clc
	rtl

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
; drawNumber
;
; A = Number to render
; X = VRAM position to render at
;
; Trashes PARAML0
;
drawNumber:
	SAVE_AXY

	sta PARAML0
	jsr intToString
	lda #intToStringResult
	sta PARAML0
	txy
	lda #1
	jsl renderStringFar

	RESTORE_AXY
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
; syncOverscanBottom
;
; Waits for the bottom edge of the overscan region (give or take)
syncOverscanBottom:
	BITS8
syncOverscanBottom0:
	ldaA $C02f
    asl         ; VA is now in the Carry flag
	ldaA $C02e
    rol         ; Roll Carry into bit 0
	cmp #215	; A now contains line number
	blt syncOverscanBottom0
	BITS16
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Alternate vertical blank checkers
;

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
