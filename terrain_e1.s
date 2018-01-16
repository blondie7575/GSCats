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

UNRENDERCACHESTACK = $7ff

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
	lda #$0020		; First span is black
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
	lda #$0010		; First span is green
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


vramRowInvertedSpanLookup:
	.word $9d00,$9c60,$9bc0,$9b20,$9a80,$99e0,$9940,$98a0,$9800,$9760,$96c0,$9620,$9580,$94e0,$9440,$93a0,$9300,$9260,$91c0,$9120
	.word $9080,$8fe0,$8f40,$8ea0,$8e00,$8d60,$8cc0,$8c20,$8b80,$8ae0,$8a40,$89a0,$8900,$8860,$87c0,$8720,$8680,$85e0,$8540,$84a0
	.word $8400,$8360,$82c0,$8220,$8180,$80e0,$8040,$7fa0,$7f00,$7e60,$7dc0,$7d20,$7c80,$7be0,$7b40,$7aa0,$7a00,$7960,$78c0,$7820
	.word $7780,$76e0,$7640,$75a0,$7500,$7460,$73c0,$7320,$7280,$71e0,$7140,$70a0,$7000,$6f60,$6ec0,$6e20,$6d80,$6ce0,$6c40,$6ba0
	.word $6b00,$6a60,$69c0,$6920,$6880,$67e0,$6740,$66a0,$6600,$6560,$64c0,$6420,$6380,$62e0,$6240,$61a0,$6100,$6060,$5fc0,$5f20
	.word $5e80,$5de0,$5d40,$5ca0,$5c00,$5b60,$5ac0,$5a20,$5980,$58e0,$5840,$57a0,$5700,$5660,$55c0,$5520,$5480,$53e0,$5340,$52a0
	.word $5200,$5160,$50c0,$5020,$4f80,$4ee0,$4e40,$4da0,$4d00,$4c60,$4bc0,$4b20,$4a80,$49e0,$4940,$48a0,$4800,$4760,$46c0,$4620
	.word $4580,$44e0,$4440,$43a0,$4300,$4260,$41c0,$4120,$4080,$3fe0,$3f40,$3ea0,$3e00,$3d60,$3cc0,$3c20,$3b80,$3ae0,$3a40,$39a0
	.word $3900,$3860,$37c0,$3720,$3680,$35e0,$3540,$34a0,$3400,$3360,$32c0,$3220,$3180,$30e0,$3040,$2fa0,$2f00,$2e60,$2dc0,$2d20
	.word $2c80,$2be0,$2b40,$2aa0,$2a00,$2960,$28c0,$2820,$2780,$26e0,$2640,$25a0,$2500,$2460,$23c0,$2320,$2280,$21e0,$2140,$20a0




.export renderTerrainSpans
.export unrenderTerrainSpans
.export compileTerrainSpans


; Suppress some linker warnings - Must be the last thing in the file
.SEGMENT "ZPSAVE"
.SEGMENT "EXEHDR"
.SEGMENT "STARTUP"
.SEGMENT "INIT"
.SEGMENT "LOWCODE"
