;
;  terrain (in E1 bank)
;
;  Fill-mode terrain rendering code snippets
;  that live in bank E1 for maximum speed.
;
;  Created by Quinn Dunki on 7/29/17
;

.include "equates.s"
.include "macros.s"

UNRENDERCACHESTACK = $7ff	; Stack downwards from bottom of VRAM. Mirrored from $01 into $E1!

OP16

.org $800

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; renderTerrainSpans:
;
;
renderTerrainSpans:
	SAVE_AXY
	SAVE_DBR
	FASTGRAPHICS

	lda #UNRENDERCACHESTACK	; Prepare unrender cache
	tcs

	lda #MAXTERRAINHEIGHT-1
	sec
	sbc lastCompiledTerrainY

renderTerrainSpansLoop:
	sta PARAML1

	; Find row data
	lda PARAML1
	asl		; Shifts must match SPANROWBYTES
	asl
	asl
	asl
	asl
	tay
	lda terrainSpanData,y
	sta SCRATCHL			; Track span color

	; Find VRAM row
	lda PARAML1
	asl
	tax
	lda vramRowInvertedSpanLookup,x
	tax
	
	adc #160
	sta PARAML0				; Watch for end of VRAM row

	; Find span that intersects left logical edge
	lda #0
	clc

renderTerrainRowSpansFindLeftLoop:
	adc terrainSpanData+2,y
	cmp leftScreenEdge
	bpl renderTerrainRowSpansFoundLeft
	iny
	iny
	sta CACHEDATA
	lda SCRATCHL
	eor #%110000	; Toggle span color cache
	sta SCRATCHL
	lda CACHEDATA
	bra renderTerrainRowSpansFindLeftLoop

renderTerrainRowSpansFoundLeft:
	sec
	sbc leftScreenEdge	; A now holds remainder of leftmost span
						; and Y points to leftmost span

renderTerrainRowSpansLoop:
	sta SCRATCHL2

	; Set fill mode byte for this span
	lda SCRATCHL
	sta VRAMBANK,x

	; Cache the index we wrote to so we can erase later
	phx

	; Advance to end of span
	clc
	txa
	adc SCRATCHL2
	cmp PARAML0
	bpl renderTerrainRowSpansDone
	tax

	; Prepare for next span
	iny
	iny
	lda SCRATCHL
	eor #%110000	; Toggle span color cache
	sta SCRATCHL

	lda terrainSpanData+2,y
	bra renderTerrainRowSpansLoop

renderTerrainRowSpansDone:
	lda PARAML1
	dec
	bne renderTerrainSpansLoop

	pea 0		; Null-terminate the unrender cache
	SLOWGRAPHICS
	RESTORE_DBR
	RESTORE_AXY
	rtl


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; unrenderTerrainSpans:
;
;

unrenderTerrainSpans:
	SAVE_AXY
	SAVE_DBR
	phb
	pea $e1e1		; Work entirely in bank E1 for all local read/writes
	plb
	plb

	ldy #UNRENDERCACHESTACK-1

unrenderTerrainSpansLoop:
	lda 0,y
	beq unrenderTerrainSpansDone
	tax
	lda #0
	sta a:0,x
	dey
	dey
	bra unrenderTerrainSpansLoop

unrenderTerrainSpansDone:
	plb
	RESTORE_DBR
	RESTORE_AXY
	rtl


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; compileTerrainSpans:
;
;
compileTerrainSpans:
	pha
	SAVE_DBR
	lda #0

compileTerrainSpansLoop:
	sta PARAML1
	jsr compileTerrainSpansRow
	lda PARAML1
	inc
	cmp #MAXTERRAINHEIGHT
	bne compileTerrainSpansLoop

	RESTORE_DBR
	pla
	rtl


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; compileTerrainSpansRow:
;
; PARAML1 = Row index (bottom relative)
;
; Trashes SCRATCHL
;
compileTerrainSpansRow:
	SAVE_AXY

	lda PARAML1
	asl		; Shifts must match SPANROWBYTES
	asl
	asl
	asl
	asl
	clc
	adc #terrainSpanData
	sta SCRATCHL

	ldy #0
	ldx #TERRAINWIDTH-2

	lda terrainDataFar,x	; Figure out start value for row
	cmp PARAML1
	bcs compileTerrainSpansRowInitGreen

compileTerrainSpansRowInitBlack:
	lda #$0010		; First span is black
	sta (SCRATCHL)	; Initialize the row
	inc SCRATCHL
	inc SCRATCHL
	ldy #-1

compileTerrainSpansRowBlackStart:
	iny

compileTerrainSpansRowBlackLoop:
	lda terrainDataFar,x
	cmp PARAML1
	bcs compileTerrainSpansBlackEnd
	dex
	dex
	iny
	cpx #-2
	bne compileTerrainSpansRowBlackLoop

compileTerrainSpansBlackEnd:
	tya				; Store this span's length
	sta (SCRATCHL)
	inc SCRATCHL
	inc SCRATCHL

	dex				; Begin searching for next span
	dex
	cpx #0
	bmi compileTerrainSpansRowDone
	ldy #0
	bra compileTerrainSpansRowGreenStart

compileTerrainSpansRowDone:
	RESTORE_AXY
	rts

compileTerrainSpansRowInitGreen:
	lda #$0020		; First span is green
	sta (SCRATCHL)	; Initialize the row
	inc SCRATCHL
	inc SCRATCHL
	ldy #-1

compileTerrainSpansRowGreenStart:
	iny

compileTerrainSpansRowGreenLoop:
	lda terrainDataFar,x
	cmp PARAML1
	bcc compileTerrainSpansGreenEnd
	dex
	dex
	iny
	cpx #-2
	bne compileTerrainSpansRowGreenLoop

compileTerrainSpansGreenEnd:
	tya				; Store this span's length
	sta (SCRATCHL)
	inc SCRATCHL
	inc SCRATCHL

	dex				; Begin searching for next span
	dex
	cpx #0
	bmi compileTerrainSpansRowDone
	ldy #0
	bra compileTerrainSpansRowBlackStart

terrainSpanData:
	.repeat MAXTERRAINHEIGHT
		.word 0		; Start value (0=BG)
		.repeat MAXSPANSPERROW
		.word 0		; Length (in bytes)
		.endrepeat
	.endrepeat


vramRowInvertedSpanLookup = $16C0	; This table is copied to here by the loader


.export renderTerrainSpans
.export unrenderTerrainSpans
.export compileTerrainSpans


; Suppress some linker warnings - Must be the last thing in the file
.SEGMENT "ZPSAVE"
.SEGMENT "EXEHDR"
.SEGMENT "STARTUP"
.SEGMENT "INIT"
.SEGMENT "LOWCODE"
