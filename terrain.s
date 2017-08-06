;
;  terrain
;
;  Created by Quinn Dunki on 7/29/17
;


TERRAINWIDTH = 640		; In pixels
MAXTERRAINHEIGHT = 128	; In pixels

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; renderTerrainColumn
;
; This is not fast- probably only useful for debugging
;
; Y = Index into height data
; PARAM24 = 24-bit pointer to bottom of column in VRAM
;
; Trashes A and X

renderTerrainColumn:
	phy
	BITS8
	lda PARAM24+2
	sta renderTerrainColumnSMC+3
	BITS16
	ply

	lda PARAM24
	sta renderTerrainColumnSMC+1
	pha		; Cache 16-bit VRAM pointer on the stack

	lda terrainData,y		; Cache terrain height on the stack
	and #$00ff
	sta renderTerrainColumnHeight
	ldx #0

renderTerrainColumnLoop:
	inx
	cpx #MAXTERRAINHEIGHT
	beq renderTerrainColumnDone
	cpx renderTerrainColumnHeight
	bpl renderTerrainColumnBlack

	lda #$1111
	bra renderTerrainColumnSMC

renderTerrainColumnBlack:
	lda #$0000

renderTerrainColumnSMC:
	sta $e19c60
	pla
	sec
	sbc #160
	sta renderTerrainColumnSMC+1
	pha
	bra renderTerrainColumnLoop

renderTerrainColumnDone:
	pla
	rts

renderTerrainColumnHeight:
	.word 0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; renderTerrainColumns
;
; This is not fast- probably only useful for debugging
;
; Y = Start column
;
; Trashes all registers
;

renderTerrainColumns:
	LOADPARAM24 $e1e1,$9c60
	tya
	clc
	adc #80
	sta SCRATCHL

renderTerrainColumnsLoop:
	jsr renderTerrainColumn
	iny
	cpy SCRATCHL
	beq renderTerrainColumnsDone

	inc PARAM24
	inc PARAM24
	bra renderTerrainColumnsLoop

renderTerrainColumnsDone:
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; renderTerrain
;
; No stack operations permitted here!
;
renderTerrain:
	sty <MAPSCROLLPOS
	FASTGRAPHICS

	lda #$9d00-1	; Point stack to end of VRAM
	tcs

	jmp renderClippedSpanChain

renderSpanChainComplete:

	SLOWGRAPHICS
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; renderSpanChain
;
; Trashes all registers
; No stack operations permitted here!
;

renderSpanChain:
	stz spanChainIndex

renderSpanChainLoop:
	ldx spanChainIndex
	ldy spanChain+2,x
	lda spanChain,x
	beq renderSpanChainComplete
	dec
	asl
	tax
	jmp (renderSpanJumpTable,x)

;renderSpanComplete:
	inc spanChainIndex
	inc spanChainIndex
	inc spanChainIndex
	inc spanChainIndex
	bra renderSpanChainLoop


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; renderClippedSpanChain
;
; No stack operations permitted here!
;
;
renderClippedSpanChain:

	; Prepare our state
	lda #80
	sta <XLEFT
	lda #$1111
	sta <CURRMAPPIXELS
	ldy #spanChainEnd-spanChain-2
	lda <MAPSCROLLPOS
	sta <RIGHTEDGE
	lda #renderClippedSpanChainRenderNext
	sta renderSpanComplete+1

	; Find right edge of screen within span chains
renderClippedSpanChainLoop:

	lda spanChain,y		; 5
	sec					; 2
	sbc <RIGHTEDGE		; 3
	bmi renderClippedSpanChainNextSpan	; 2/3
	beq renderClippedSpanChainNextSpan	; 2/3

renderClippedSpanChainLoop2:
	cmp <XLEFT			; 3
	bcs renderClippedSpanChainLastSpan	; 2/3

	; Render this span
	ldx spanColors,y	; 4
	stx <CURRMAPPIXELS	; 3

	asl					; 2
	tax					; 2
	jmp (renderSpanJumpTable,x)	; 6

renderSpanComplete:
	; This is modified to redirect return from the
	; unrolled span rendering blocks
	jmp renderClippedSpanChainRenderNext	; 3


renderClippedSpanChainRenderNext:

	; Track remaining words until left edge
	lsr					; 2
	eor #$ffff			; 2
	inc					; 2
	clc					; 2
	adc <XLEFT			; 3
	sta <XLEFT			; 3
	dey					; 2
	dey					; 2

	; For mid-stream spans, bypass the right-edge clipping code
	lda spanChain,y		; 5
	bra renderClippedSpanChainLoop2	; 3

renderClippedSpanChainNextSpan:
	; Track remaining distance from right edge and
	; continue searching for visible right edge
	eor #$ffff			; 2
	inc					; 2
	sta <RIGHTEDGE		; 3
	dey					; 2
	dey					; 2
	bra renderClippedSpanChainLoop	; 3

renderClippedSpanChainLastSpan:

	; Render visible portion of last visible span
	ldx spanColors,y	; 4
	stx <CURRMAPPIXELS	; 3

	lda <XLEFT			; 3
	asl					; 2
	tax					; 2

	lda #renderSpanChainComplete
	sta renderSpanComplete+1
	jmp (renderSpanJumpTable,x)	; 6



; Clipping state in zero page. All distances in words (4 px)
MAPSCROLLPOS	= $06	; Right edge of visible region
XLEFT			= $08	; Remaining horizontal distance to render
RIGHTEDGE		= $19	; Distance from right edge of terrain to right edge of visible region
CURRMAPPIXELS	= $67	; 4 pixels being rendered right now

spanChain:
	.word 20,40,10,5,5,5,5,10,40,20
spanChainEnd:
	
spanColors:
	.word $1111,$0000,$1111,$0000,$1111,$0000,$1111,$0000,$1111,$0000

spanChainIndex:
	.word 0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; generateTerrain
;
; Trashes A and Y
;

generateTerrain:
	ldy #0
	lda #terrainData
	sta SCRATCHL

generateTerrainLoop:

	phy
	tya		; Pull an interesting value out of the sine table
	and #$00ff
	tay
	lda sineTable,y
	and #$7f7f
	ply

	sta (SCRATCHL),y
	iny
	cpy #TERRAINWIDTH/4
	bne generateTerrainLoop

	rts


.include "spanRender.s"

; Terrain data, stored as height values 4 pixels wide

terrainData:
	.repeat TERRAINWIDTH/2
	.byte 0
	.endrepeat
