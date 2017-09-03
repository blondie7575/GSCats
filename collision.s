;
;  collision
;
;  Created by Quinn Dunki on 9/2/17
;


rectParams:
	.word 0		; x
	.word 0		; y	0=terrain bottom, +y=up
	.word 0		; w
	.word 0		; h

rectParams2:
	.word 0		; x
	.word 0		; y	0=terrain bottom, +y=up
	.word 0		; w
	.word 0		; h


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; intersectRectTerrain
;
; A => non zero if rectangle is intersecting terrain
;
intersectRectTerrain:
	phy

	; Convert X to words and compute horizontal extent
	; Note that X counts from right terrain edge
	lda rectParams
	clc
	adc rectParams+4	; Reverse rect horizontally
	lsr					; Convert X to bytes
	and #$fffe			; Force even
	sta rectParams

	lda #TERRAINWIDTH/2	; Reverse X coordinate system
	sec
	sbc rectParams
	sta rectParams
	tay					; We'll need this later as an index into height data words

	lsr rectParams+4	; Convert width to bytes
	sec
	sbc rectParams+4	; Convert width to extent
	sta rectParams+4

	; Convert height to vertical extent
	lda rectParams+2
	sec
	sbc rectParams+6
	sta rectParams+6

	; Check Y bottom
intersectRectTerrainBottomLoop:
	lda terrainData,y
	cmp rectParams+6
	bpl intersectRectTerrainYep
	dey
	dey
	cpy rectParams+4
	bpl intersectRectTerrainBottomLoop

	lda #0
	ply
	rts

intersectRectTerrainYep:
	lda #1
	ply
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; intersectRectRect
;
; A => non zero if rectangle is intersecting rectangle2
;
intersectRectRect:
	lda rectParams+0	; Convert widths to extents
	clc
	adc rectParams+4
	sta	rectParams+4

	lda rectParams2+0
	clc
	adc rectParams2+4
	sta	rectParams2+4

	lda rectParams+2	; Convert heights to extents
	sec
	sbc rectParams+6
	sta	rectParams+6

	lda rectParams2+2
	sec
	sbc rectParams2+6
	sta	rectParams2+6

	lda rectParams+0	; Past their right edge?
	cmp rectParams2+4
	bpl intersectRectRectNope

	lda rectParams+4	; Before their left edge?
	cmp rectParams2+0
	bmi intersectRectRectNope

	lda rectParams+2	; Past their bottom edge?
	cmp rectParams2+6
	bmi intersectRectRectNope

	lda rectParams+6	; Before their top edge?
	cmp rectParams2+2
	bpl intersectRectRectNope

	lda #1
	rts

intersectRectRectNope:
	lda #0
	rts
