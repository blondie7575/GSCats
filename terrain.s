;
;  terrain
;
;  Created by Quinn Dunki on 7/29/17
;


TERRAINWIDTH = 320		; In pixels
MAXTERRAINHEIGHT = 80	; In pixels

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

	lda terrainData,y
	and #$00ff
	tax
	inx		; Prevent x from going negative upon entry to loop

renderTerrainColumnLoop:
	dex
	beq renderTerrainColumnDone
	lda #$1111

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



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; renderTerrainColumns
;
; This is not fast- probably only useful for debugging
;

renderTerrainColumns:
	LOADPARAM24 $e1e1,$9c60
	ldy #0

renderTerrainColumnsLoop:
	jsr renderTerrainColumn
	iny
	cpy #TERRAINWIDTH/4
	beq renderTerrainColumnsDone
	inc PARAM24
	inc PARAM24
	bra renderTerrainColumnsLoop

renderTerrainColumnsDone:
	rts


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


; Terrain data, stored as height values 4 pixels wide

terrainData:
	.repeat TERRAINWIDTH/4
	.byte 0
	.endrepeat
